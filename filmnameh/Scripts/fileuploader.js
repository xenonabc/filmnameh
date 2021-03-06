﻿function $$$(element) { return document.getElementById(element); };


var fup = fup || {};


fup.extend = function (first, second) {
    for (var prop in second) {
        first[prop] = second[prop];
    }
};

/**
 * Searches for a given element in the array, returns -1 if it is not present.
 * @param {Number} [from] The index at which to begin the search
 */
fup.indexOf = function (arr, elt, from) {
    if (arr.indexOf) return arr.indexOf(elt, from);

    from = from || 0;
    var len = arr.length;

    if (from < 0) from += len;

    for (; from < len; from++) {
        if (from in arr && arr[from] === elt) {
            return from;
        }
    }
    return -1;
};

fup.getUniqueId = (function () {
    var id = 0;
    return function () { return id++; };
})();

//
// Events

fup.attach = function (element, type, fn) {
    if (element.addEventListener) {
        element.addEventListener(type, fn, false);
    } else if (element.attachEvent) {
        element.attachEvent('on' + type, fn);
    }
};
fup.detach = function (element, type, fn) {
    if (element.removeEventListener) {
        element.removeEventListener(type, fn, false);
    } else if (element.attachEvent) {
        element.detachEvent('on' + type, fn);
    }
};

fup.preventDefault = function (e) {
    if (e.preventDefault) {
        e.preventDefault();
    } else {
        e.returnValue = false;
    }
};

//
// Node manipulations

/**
 * Insert node a before node b.
 */
fup.insertBefore = function (a, b) {
    b.parentNode.insertBefore(a, b);
};
fup.remove = function (element) {
    element.parentNode.removeChild(element);
};

fup.contains = function (parent, descendant) {
    // compareposition returns false in this case
    if (parent == descendant) return true;

    if (parent.contains) {
        return parent.contains(descendant);
    } else {
        return !!(descendant.compareDocumentPosition(parent) & 8);
    }
};

/**
 * Creates and returns element from html string
 * Uses innerHTML to create an element
 */
fup.toElement = (function () {
    var div = document.createElement('div');
    return function (html) {
        div.innerHTML = html;
        var element = div.firstChild;
        div.removeChild(element);
        return element;
    };
})();

//
// Node properties and attributes

/**
 * Sets styles for an element.
 * Fixes opacity in IE6-8.
 */
fup.css = function (element, styles) {
    if (styles.opacity != null) {
        if (typeof element.style.opacity != 'string' && typeof (element.filters) != 'undefined') {
            styles.filter = 'alpha(opacity=' + Math.round(100 * styles.opacity) + ')';
        }
    }
    fup.extend(element.style, styles);
};
fup.hasClass = function (element, name) {
    var re = new RegExp('(^| )' + name + '( |$)');
    return re.test(element.className);
};
fup.addClass = function (element, name) {
    if (!fup.hasClass(element, name)) {
        element.className += ' ' + name;
    }
};
fup.removeClass = function (element, name) {
    var re = new RegExp('(^| )' + name + '( |$)');
    element.className = element.className.replace(re, ' ').replace(/^\s+|\s+$/g, "");
};
fup.setText = function (element, text) {
    element.innerText = text;
    element.textContent = text;
};

//
// Selecting elements

fup.children = function (element) {
    var children = [],
    child = element.firstChild;

    while (child) {
        if (child.nodeType == 1) {
            children.push(child);
        }
        child = child.nextSibling;
    }

    return children;
};

fup.getByClass = function (element, className) {
    if (element.querySelectorAll) {
        return element.querySelectorAll('.' + className);
    }

    var result = [];
    var candidates = element.getElementsByTagName("*");
    var len = candidates.length;

    for (var i = 0; i < len; i++) {
        if (fup.hasClass(candidates[i], className)) {
            result.push(candidates[i]);
        }
    }
    return result;
};

/**
 * obj2url() takes a json-object as argument and generates
 * a querystring. pretty much like jQuery.param()
 * 
 * how to use:
 *
 *    `fup.obj2url({a:'b',c:'d'},'http://any.url/upload?otherParam=value');`
 *
 * will result in:
 *
 *    `http://any.url/upload?otherParam=value&a=b&c=d`
 *
 * @param  Object JSON-Object
 * @param  String current querystring-part
 * @return String encoded querystring
 */
fup.obj2url = function (obj, temp, prefixDone) {
    var uristrings = [],
        prefix = '&',
        add = function (nextObj, i) {
            var nextTemp = temp
                ? (/\[\]$/.test(temp)) // prevent double-encoding
                   ? temp
                   : temp + '[' + i + ']'
                : i;
            if ((nextTemp != 'undefined') && (i != 'undefined')) {
                uristrings.push(
                    (typeof nextObj === 'object')
                        ? fup.obj2url(nextObj, nextTemp, true)
                        : (Object.prototype.toString.call(nextObj) === '[object Function]')
                            ? encodeURIComponent(nextTemp) + '=' + encodeURIComponent(nextObj())
                            : encodeURIComponent(nextTemp) + '=' + encodeURIComponent(nextObj)
                );
            }
        };

    if (!prefixDone && temp) {
        prefix = (/\?/.test(temp)) ? (/\?$/.test(temp)) ? '' : '&' : '?';
        uristrings.push(temp);
        uristrings.push(fup.obj2url(obj));
    } else if ((Object.prototype.toString.call(obj) === '[object Array]') && (typeof obj != 'undefined')) {
        // we wont use a for-in-loop on an array (performance)
        for (var i = 0, len = obj.length; i < len; ++i) {
            add(obj[i], i);
        }
    } else if ((typeof obj != 'undefined') && (obj !== null) && (typeof obj === "object")) {
        // for anything else but a scalar, we will use for-in-loop
        for (var i in obj) {
            add(obj[i], i);
        }
    } else {
        uristrings.push(encodeURIComponent(temp) + '=' + encodeURIComponent(obj));
    }
    
    return uristrings.join(prefix)
                     .replace(/^&/, '')
                     .replace(/%20/g, '+');
};

//
//
// Uploader Classes
//
//

var fup = fup || {};

/**
 * Creates upload button, validates upload, but doesn't create file list or dd. 
 */
fup.FileUploaderBasic = function (o) {
    this._options = {
        // set to true to see the server response
        debug: false,
        action: '/Script/uploader',
        params: {},
        button: null,
        multiple: false,
        maxConnections: 3,
        // validation        
        allowedExtensions: ['jpg', 'jpeg', 'png', 'gif', 'doc', 'docx', 'pdf', 'mp3', 'wav'],
        sizeLimit: 102400000,
        minSizeLimit: 0,
        // events
        // return false to cancel submit
        onSubmit: function (id, fileName) {
            var uploadNo = $$$('ulUPF').getElementsByTagName('li').length;
            if (uploadNo > 4) {
                alert('You can upload up to 5 files at one time.');
                return false;
            };
        },
        onProgress: function (id, fileName, loaded, total) { },
        onComplete: function (id, fileName, responseJSON) { },
        onCancel: function (id, fileName) { },
        // messages                
        messages: {
            typeError: "{file} has invalid extension. Only {extensions} are allowed.",
            sizeError: "{file} is too large, maximum file size is {sizeLimit}.",
            minSizeError: "{file} is too small, minimum file size is {minSizeLimit}.",
            emptyError: "{file} is empty, please select files again without it.",
            onLeave: "The files are being uploaded, if you leave now the upload will be cancelled."
        },
        showMessage: function (message) {
            alert(message);
        }
    };
    fup.extend(this._options, o);

    // number of files being uploaded
    this._filesInProgress = 0;
    this._handler = this._createUploadHandler();

    if (this._options.button) {
        this._button = this._createUploadButton(this._options.button);
    }

    this._preventLeaveInProgress();
};

fup.FileUploaderBasic.prototype = {
    setParams: function (params) {
        this._options.params = params;
    },
    getInProgress: function () {
        return this._filesInProgress;
    },
    _createUploadButton: function (element) {
        var self = this;

        return new fup.UploadButton({
            element: element,
            multiple: this._options.multiple && fup.UploadHandlerXhr.isSupported(),
            onChange: function (input) {
                self._onInputChange(input);
            }
        });
    },
    _createUploadHandler: function () {
        var self = this, handlerClass;

        if (fup.UploadHandlerXhr.isSupported()) {
            handlerClass = 'UploadHandlerXhr';
        } else {
            handlerClass = 'UploadHandlerForm';
        }

        var handler = new fup[handlerClass]({
            debug: this._options.debug,
            action: this._options.action,
            maxConnections: this._options.maxConnections,
            onProgress: function (id, fileName, loaded, total) {
                self._onProgress(id, fileName, loaded, total);
                self._options.onProgress(id, fileName, loaded, total);
            },
            onComplete: function (id, fileName, result) {
                self._onComplete(id, fileName, result);
                self._options.onComplete(id, fileName, result);
            },
            onCancel: function (id, fileName) {
                self._onCancel(id, fileName);
                self._options.onCancel(id, fileName);
            }
        });
        return handler;
    },
    _preventLeaveInProgress: function () {
        var self = this;

        fup.attach(window, 'beforeunload', function (e) {
            if (!self._filesInProgress) { return; }

            var e = e || window.event;
            // for ie, ff
            e.returnValue = self._options.messages.onLeave;
            // for webkit
            return self._options.messages.onLeave;
        });
    },
    _onSubmit: function (id, fileName) {
        this._filesInProgress++;
    },
    _onProgress: function (id, fileName, loaded, total) {
    },
    _onComplete: function (id, fileName, result) {
        this._filesInProgress--;
        if (result.error) {
            this._options.showMessage(result.error);
        }
    },
    _onCancel: function (id, fileName) {
        this._filesInProgress--;
    },
    _onInputChange: function (input) {
        if (this._handler instanceof fup.UploadHandlerXhr) {
            this._uploadFileList(input.files);
        } else {
            if (this._validateFile(input)) {
                this._uploadFile(input);
            }
        }
        this._button.reset();
    },
    _uploadFileList: function (files) {
        for (var i = 0; i < files.length; i++) {
            if (!this._validateFile(files[i])) {
                return;
            }
        }

        for (var i = 0; i < files.length; i++) {
            this._uploadFile(files[i]);
        }
    },
    _uploadFile: function (fileContainer) {
        var id = this._handler.add(fileContainer);
        var fileName = this._handler.getName(id);

        if (this._options.onSubmit(id, fileName) !== false) {
            this._onSubmit(id, fileName);
            this._handler.upload(id, this._options.params);
        }
    },
    _validateFile: function (file) {
        var name, size;

        if (file.value) {
            // it is a file input            
            // get input value and remove path to normalize
            name = file.value.replace(/.*(\/|\\)/, "");
        } else {
            // fix missing properties in Safari
            name = file.fileName != null ? file.fileName : file.name;
            size = file.fileSize != null ? file.fileSize : file.size;
        }

        if (!this._isAllowedExtension(name)) {
            this._error('typeError', name);
            return false;

        } else if (size === 0) {
            this._error('emptyError', name);
            return false;

        } else if (size && this._options.sizeLimit && size > this._options.sizeLimit) {
            this._error('sizeError', name);
            return false;

        } else if (size && size < this._options.minSizeLimit) {
            this._error('minSizeError', name);
            return false;
        }

        return true;
    },
    _error: function (code, fileName) {
        var message = this._options.messages[code];
        function r(name, replacement) { message = message.replace(name, replacement); }

        r('{file}', this._formatFileName(fileName));
        r('{extensions}', this._options.allowedExtensions.join(', '));
        r('{sizeLimit}', this._formatSize(this._options.sizeLimit));
        r('{minSizeLimit}', this._formatSize(this._options.minSizeLimit));

        this._options.showMessage(message);
    },
    _formatFileName: function (name) {
        if (name.length > 33) {
            name = name.slice(0, 19) + '...' + name.slice(-13);
        }
        return name;
    },
    _isAllowedExtension: function (fileName) {
        var ext = (-1 !== fileName.indexOf('.')) ? fileName.replace(/.*[.]/, '').toLowerCase() : '';
        var allowed = this._options.allowedExtensions;

        if (!allowed.length) { return true; }

        for (var i = 0; i < allowed.length; i++) {
            if (allowed[i].toLowerCase() == ext) { return true; }
        }

        return false;
    },
    _formatSize: function (bytes) {
        var i = -1;
        do {
            bytes = bytes / 1024;
            i++;
        } while (bytes > 99);

        return Math.max(bytes, 0.1).toFixed(1) + ['kB', 'MB', 'GB', 'TB', 'PB', 'EB'][i];
    }
};


/**
 * Class that creates upload widget with drag-and-drop and file list
 * @inherits fup.FileUploaderBasic
 */
fup.FileUploader = function (o) {
    // call parent constructor
    fup.FileUploaderBasic.apply(this, arguments);

    // additional options    
    fup.extend(this._options, {
        element: null,
        // if set, will be used instead of fup-upload-list in template
        listElement: null,

        template: '<div class="fup-uploader">' +
                '<div class="fup-upload-drop-area"><span>Drop files here to upload</span></div>' +
                '<div class="fup-upload-button">فایل را انتخاب کنید</div>' +
                '<div class="col-md-10"><ul id="ulUPF" class="fup-upload-list"></ul></div>' +
             '</div>',

        // template for one item in file list
        fileTemplate: '<li>' +
                '<span class="fup-upload-file"></span>' +
                '<span class="fup-upload-spinner"></span>' +
                '<span class="fup-upload-size"></span>' +
                '<a class="fup-upload-cancel" href="#">Cancel</a>' +
                '<span class="fup-upload-failed-text">Failed</span>' +
            '</li>',

        classes: {
            // used to get elements from templates
            button: 'fup-upload-button',
            drop: 'fup-upload-drop-area',
            dropActive: 'fup-upload-drop-area-active',
            list: 'fup-upload-list',

            file: 'fup-upload-file',
            spinner: 'fup-upload-spinner',
            size: 'fup-upload-size',
            cancel: 'fup-upload-cancel',

            // added to list item when upload completes
            // used in css to hide progress spinner
            success: 'fup-upload-success',
            fail: 'fup-upload-fail'
        }
    });
    // overwrite options with user supplied    
    fup.extend(this._options, o);

    this._element = this._options.element;
    this._element.innerHTML = this._options.template;
    this._listElement = this._options.listElement || this._find(this._element, 'list');

    this._classes = this._options.classes;

    this._button = this._createUploadButton(this._find(this._element, 'button'));

    this._bindCancelEvent();
    this._setupDragDrop();
};

// inherit from Basic Uploader
fup.extend(fup.FileUploader.prototype, fup.FileUploaderBasic.prototype);

fup.extend(fup.FileUploader.prototype, {
    /**
    * Gets one of the elements listed in this._options.classes
    **/
    _find: function (parent, type) {
        var element = fup.getByClass(parent, this._options.classes[type])[0];
        if (!element) {
            throw new Error('element not found ' + type);
        }

        return element;
    },
    _setupDragDrop: function () {
        var self = this,
            dropArea = this._find(this._element, 'drop');

        var dz = new fup.UploadDropZone({
            element: dropArea,
            onEnter: function (e) {
                fup.addClass(dropArea, self._classes.dropActive);
                e.stopPropagation();
            },
            onLeave: function (e) {
                e.stopPropagation();
            },
            onLeaveNotDescendants: function (e) {
                fup.removeClass(dropArea, self._classes.dropActive);
            },
            onDrop: function (e) {
                dropArea.style.display = 'none';
                fup.removeClass(dropArea, self._classes.dropActive);
                self._uploadFileList(e.dataTransfer.files);
            }
        });

        dropArea.style.display = 'none';

        fup.attach(document, 'dragenter', function (e) {
            if (!dz._isValidFileDrag(e)) return;

            dropArea.style.display = 'block';
        });
        fup.attach(document, 'dragleave', function (e) {
            if (!dz._isValidFileDrag(e)) return;

            var relatedTarget = document.elementFromPoint(e.clientX, e.clientY);
            // only fire when leaving document out
            if (!relatedTarget || relatedTarget.nodeName == "HTML") {
                dropArea.style.display = 'none';
            }
        });
    },
    _onSubmit: function (id, fileName) {
        fup.FileUploaderBasic.prototype._onSubmit.apply(this, arguments);
        this._addToList(id, fileName);
    },
    _onProgress: function (id, fileName, loaded, total) {
        fup.FileUploaderBasic.prototype._onProgress.apply(this, arguments);

        var item = this._getItemByFileId(id);
        var size = this._find(item, 'size');
        size.style.display = 'inline';

        var text;
        if (loaded != total) {
            text = Math.round(loaded / total * 100) + '% from ' + this._formatSize(total);
        } else {
            text = this._formatSize(total);
        }

        fup.setText(size, text);
    },
    _onComplete: function (id, fileName, result) {
        fup.FileUploaderBasic.prototype._onComplete.apply(this, arguments);
        // mark completed
        var item = this._getItemByFileId(id);
        fup.remove(this._find(item, 'cancel'));
        fup.remove(this._find(item, 'spinner'));

        if (result.success) {
            fup.addClass(item, this._classes.success);
            document.getElementById('MainContent_txtFiles').value += result.fileName + ";";
        } else {
            fup.addClass(item, this._classes.fail);
            document.getElementById('txtFailed').value += result.fileName + ";";
        }
    },
    _addToList: function (id, fileName) {
        var item = fup.toElement(this._options.fileTemplate);
        item.fupFileId = id;

        var fileElement = this._find(item, 'file');
        fup.setText(fileElement, this._formatFileName(fileName));
        this._find(item, 'size').style.display = 'none';

        this._listElement.appendChild(item);
    },
    _getItemByFileId: function (id) {
        var item = this._listElement.firstChild;

        // there can't be txt nodes in dynamically created list
        // and we can  use nextSibling
        while (item) {
            if (item.fupFileId == id) return item;
            item = item.nextSibling;
        }
    },
    /**
    * delegate click event for cancel link 
    **/
    _bindCancelEvent: function () {
        var self = this,
            list = this._listElement;

        fup.attach(list, 'click', function (e) {
            e = e || window.event;
            var target = e.target || e.srcElement;

            if (fup.hasClass(target, self._classes.cancel)) {
                fup.preventDefault(e);

                var item = target.parentNode;
                self._handler.cancel(item.fupFileId);
                fup.remove(item);
            }
        });
    }
});

fup.UploadDropZone = function (o) {
    this._options = {
        element: null,
        onEnter: function (e) { },
        onLeave: function (e) { },
        // is not fired when leaving element by hovering descendants   
        onLeaveNotDescendants: function (e) { },
        onDrop: function (e) { }
    };
    fup.extend(this._options, o);

    this._element = this._options.element;

    this._disableDropOutside();
    this._attachEvents();
};

fup.UploadDropZone.prototype = {
    _disableDropOutside: function (e) {
        // run only once for all instances
        if (!fup.UploadDropZone.dropOutsideDisabled) {

            fup.attach(document, 'dragover', function (e) {
                if (e.dataTransfer) {
                    e.dataTransfer.dropEffect = 'none';
                    e.preventDefault();
                }
            });

            fup.UploadDropZone.dropOutsideDisabled = true;
        }
    },
    _attachEvents: function () {
        var self = this;

        fup.attach(self._element, 'dragover', function (e) {
            if (!self._isValidFileDrag(e)) return;

            var effect = e.dataTransfer.effectAllowed;
            if (effect == 'move' || effect == 'linkMove') {
                e.dataTransfer.dropEffect = 'move'; // for FF (only move allowed)    
            } else {
                e.dataTransfer.dropEffect = 'copy'; // for Chrome
            }

            e.stopPropagation();
            e.preventDefault();
        });

        fup.attach(self._element, 'dragenter', function (e) {
            if (!self._isValidFileDrag(e)) return;

            self._options.onEnter(e);
        });

        fup.attach(self._element, 'dragleave', function (e) {
            if (!self._isValidFileDrag(e)) return;

            self._options.onLeave(e);

            var relatedTarget = document.elementFromPoint(e.clientX, e.clientY);
            // do not fire when moving a mouse over a descendant
            if (fup.contains(this, relatedTarget)) return;

            self._options.onLeaveNotDescendants(e);
        });

        fup.attach(self._element, 'drop', function (e) {
            if (!self._isValidFileDrag(e)) return;

            e.preventDefault();
            self._options.onDrop(e);
        });
    },
    _isValidFileDrag: function (e) {
        var dt = e.dataTransfer,
            // do not check dt.types.contains in webkit, because it crashes safari 4            
            isWebkit = navigator.userAgent.indexOf("AppleWebKit") > -1;

        // dt.effectAllowed is none in Safari 5
        // dt.types.contains check is for firefox            
        return dt && dt.effectAllowed != 'none' &&
            (dt.files || (!isWebkit && dt.types.contains && dt.types.contains('Files')));

    }
};

fup.UploadButton = function (o) {
    this._options = {
        element: null,
        // if set to true adds multiple attribute to file input      
        multiple: false,
        // name attribute of file input
        name: 'file',
        onChange: function (input) { },
        hoverClass: 'fup-upload-button-hover',
        focusClass: 'fup-upload-button-focus'
    };

    fup.extend(this._options, o);

    this._element = this._options.element;

    // make button suitable container for input
    fup.css(this._element, {
        position: 'relative',
        overflow: 'hidden',
        // Make sure browse button is in the right side
        // in Internet Explorer
        direction: 'ltr'
    });

    this._input = this._createInput();
};

fup.UploadButton.prototype = {
    /* returns file input element */
    getInput: function () {
        return this._input;
    },
    /* cleans/recreates the file input */
    reset: function () {
        if (this._input.parentNode) {
            fup.remove(this._input);
        }

        fup.removeClass(this._element, this._options.focusClass);
        this._input = this._createInput();
    },
    _createInput: function () {
        var input = document.createElement("input");

        if (this._options.multiple) {
            input.setAttribute("multiple", "multiple");
        }

        input.setAttribute("type", "file");
        input.setAttribute("name", this._options.name);

        fup.css(input, {
            position: 'absolute',
            // in Opera only 'browse' button
            // is clickable and it is located at
            // the right side of the input
            right: 0,
            top: 0,
            fontFamily: 'Arial',
            // 4 persons reported this, the max values that worked for them were 243, 236, 236, 118
            fontSize: '118px',
            margin: 0,
            padding: 0,
            cursor: 'pointer',
            opacity: 0
        });

        this._element.appendChild(input);

        var self = this;
        fup.attach(input, 'change', function () {
            self._options.onChange(input);
        });

        fup.attach(input, 'mouseover', function () {
            fup.addClass(self._element, self._options.hoverClass);
        });
        fup.attach(input, 'mouseout', function () {
            fup.removeClass(self._element, self._options.hoverClass);
        });
        fup.attach(input, 'focus', function () {
            fup.addClass(self._element, self._options.focusClass);
        });
        fup.attach(input, 'blur', function () {
            fup.removeClass(self._element, self._options.focusClass);
        });

        // IE and Opera, unfortunately have 2 tab stops on file input
        // which is unacceptable in our case, disable keyboard access
        if (window.attachEvent) {
            // it is IE or Opera
            input.setAttribute('tabIndex', "-1");
        }

        return input;
    }
};

/**
 * Class for uploading files, uploading itself is handled by child classes
 */
fup.UploadHandlerAbstract = function (o) {
    this._options = {
        debug: false,
        action: '/upload.php',
        // maximum number of concurrent uploads        
        maxConnections: 999,
        onProgress: function (id, fileName, loaded, total) { },
        onComplete: function (id, fileName, response) { },
        onCancel: function (id, fileName) { }
    };
    fup.extend(this._options, o);

    this._queue = [];
    // params for files in queue
    this._params = [];
};
fup.UploadHandlerAbstract.prototype = {
    log: function (str) {
        if (this._options.debug && window.console) console.log('[uploader] ' + str);
    },
    /**
    * Adds file or file input to the queue
    * @returns id
    **/
    add: function (file) { },
    /**
    * Sends the file identified by id and additional query params to the server
    */
    upload: function (id, params) {
        var len = this._queue.push(id);
        var copy = {};
        fup.extend(copy, params);
        this._params[id] = copy;

        // if too many active uploads, wait...
        if (len <= this._options.maxConnections) {
            this._upload(id, this._params[id]);
        }
    },
    /**
    * Cancels file upload by id
    */
    cancel: function (id) {
        this._cancel(id);
        this._dequeue(id);
    },
    /**
    * Cancells all uploads
    */
    cancelAll: function () {
        for (var i = 0; i < this._queue.length; i++) {
            this._cancel(this._queue[i]);
        }
        this._queue = [];
    },
    /**
    * Returns name of the file identified by id
    */
    getName: function (id) { },
    /**
    * Returns size of the file identified by id
    */
    getSize: function (id) { },
    /**
    * Returns id of files being uploaded or
    * waiting for their turn
    */
    getQueue: function () {
        return this._queue;
    },
    /**
    * Actual upload method
    */
    _upload: function (id) { },
    /**
    * Actual cancel method
    */
    _cancel: function (id) { },
    /**
    * Removes element from queue, starts upload of next
    */
    _dequeue: function (id) {
        var i = fup.indexOf(this._queue, id);
        this._queue.splice(i, 1);

        var max = this._options.maxConnections;

        if (this._queue.length >= max) {
            var nextId = this._queue[max - 1];
            this._upload(nextId, this._params[nextId]);
        }
    }
};

/**
 * Class for uploading files using form and iframe
 * @inherits fup.UploadHandlerAbstract
 */
fup.UploadHandlerForm = function (o) {
    fup.UploadHandlerAbstract.apply(this, arguments);

    this._inputs = {};
};
// @inherits fup.UploadHandlerAbstract
fup.extend(fup.UploadHandlerForm.prototype, fup.UploadHandlerAbstract.prototype);

fup.extend(fup.UploadHandlerForm.prototype, {
    add: function (fileInput) {
        fileInput.setAttribute('name', 'fupfile');
        var id = 'fup-upload-handler-iframe' + fup.getUniqueId();

        this._inputs[id] = fileInput;

        // remove file input from DOM
        if (fileInput.parentNode) {
            fup.remove(fileInput);
        }

        return id;
    },
    getName: function (id) {
        // get input value and remove path to normalize
        return this._inputs[id].value.replace(/.*(\/|\\)/, "");
    },
    _cancel: function (id) {
        this._options.onCancel(id, this.getName(id));

        delete this._inputs[id];

        var iframe = document.getElementById(id);
        if (iframe) {
            // to cancel request set src to something else
            // we use src="javascript:false;" because it doesn't
            // trigger ie6 prompt on https
            iframe.setAttribute('src', 'javascript:false;');

            fup.remove(iframe);
        }
    },
    _upload: function (id, params) {
        var input = this._inputs[id];

        if (!input) {
            throw new Error('file with passed id was not added, or already uploaded or cancelled');
        }

        var fileName = this.getName(id);

        var iframe = this._createIframe(id);
        var form = this._createForm(iframe, params);
        form.appendChild(input);

        var self = this;
        this._attachLoadEvent(iframe, function () {
            self.log('iframe loaded');

            var response = self._getIframeContentJSON(iframe);

            self._options.onComplete(id, fileName, response);
            self._dequeue(id);

            delete self._inputs[id];
            // timeout added to fix busy state in FF3.6
            setTimeout(function () {
                fup.remove(iframe);
            }, 1);
        });

        form.submit();
        fup.remove(form);

        return id;
    },
    _attachLoadEvent: function (iframe, callback) {
        fup.attach(iframe, 'load', function () {
            // when we remove iframe from dom
            // the request stops, but in IE load
            // event fires
            if (!iframe.parentNode) {
                return;
            }

            // fixing Opera 10.53
            if (iframe.contentDocument &&
                iframe.contentDocument.body &&
                iframe.contentDocument.body.innerHTML == "false") {
                // In Opera event is fired second time
                // when body.innerHTML changed from false
                // to server response approx. after 1 sec
                // when we upload file with iframe
                return;
            }

            callback();
        });
    },
    /**
    * Returns json object received by iframe from server.
    */
    _getIframeContentJSON: function (iframe) {
        // iframe.contentWindow.document - for IE<7
        var doc = iframe.contentDocument ? iframe.contentDocument : iframe.contentWindow.document,
            response;

        this.log("converting iframe's innerHTML to JSON");
        this.log("innerHTML = " + doc.body.innerHTML);

        try {
            response = eval("(" + doc.body.innerHTML + ")");
        } catch (err) {
            response = {};
        }

        return response;
    },
    /**
    * Creates iframe with unique name
    */
    _createIframe: function (id) {
        // We can't use following code as the name attribute
        // won't be properly registered in IE6, and new window
        // on form submit will open
        // var iframe = document.createElement('iframe');
        // iframe.setAttribute('name', id);

        var iframe = fup.toElement('<iframe src="javascript:false;" name="' + id + '" />');
        // src="javascript:false;" removes ie6 prompt on https

        iframe.setAttribute('id', id);

        iframe.style.display = 'none';
        document.body.appendChild(iframe);

        return iframe;
    },
    /**
    * Creates form, that will be submitted to iframe
    */
    _createForm: function (iframe, params) {
        // We can't use the following code in IE6
        // var form = document.createElement('form');
        // form.setAttribute('method', 'post');
        // form.setAttribute('enctype', 'multipart/form-data');
        // Because in this case file won't be attached to request
        var form = fup.toElement('<form method="post" enctype="multipart/form-data"></form>');
        var queryString = fup.obj2url(params, this._options.action);
        form.setAttribute('action', queryString);
        form.setAttribute('target', iframe.name);
        form.style.display = 'none';
        document.body.appendChild(form);

        return form;
    }
});

/**
 * Class for uploading files using xhr
 * @inherits fup.UploadHandlerAbstract
 */
fup.UploadHandlerXhr = function (o) {
    fup.UploadHandlerAbstract.apply(this, arguments);

    this._files = [];
    this._xhrs = [];

    // current loaded size in bytes for each file 
    this._loaded = [];
};

// static method
fup.UploadHandlerXhr.isSupported = function () {
    var input = document.createElement('input');
    input.type = 'file';

    return (
        'multiple' in input &&
        typeof File != "undefined" &&
        typeof (new XMLHttpRequest()).upload != "undefined");
};

// @inherits fup.UploadHandlerAbstract
fup.extend(fup.UploadHandlerXhr.prototype, fup.UploadHandlerAbstract.prototype)

fup.extend(fup.UploadHandlerXhr.prototype, {
    /**
    * Adds file to the queue
    * Returns id to use with upload, cancel
    **/
    add: function (file) {
        if (!(file instanceof File)) {
            throw new Error('Passed obj in not a File (in fup.UploadHandlerXhr)');
        }

        return this._files.push(file) - 1;
    },
    getName: function (id) {
        var file = this._files[id];
        // fix missing name in Safari 4
        return file.fileName != null ? file.fileName : file.name;
    },
    getSize: function (id) {
        var file = this._files[id];
        return file.fileSize != null ? file.fileSize : file.size;
    },
    /**
    * Returns uploaded bytes for file identified by id 
    */
    getLoaded: function (id) {
        return this._loaded[id] || 0;
    },
    /**
    * Sends the file identified by id and additional query params to the server
    * @param {Object} params name-value string pairs
    */
    _upload: function (id, params) {
        var file = this._files[id],
            name = this.getName(id),
            size = this.getSize(id);

        this._loaded[id] = 0;

        var xhr = this._xhrs[id] = new XMLHttpRequest();
        var self = this;

        xhr.upload.onprogress = function (e) {
            if (e.lengthComputable) {
                self._loaded[id] = e.loaded;
                self._options.onProgress(id, name, e.loaded, e.total);
            }
        };

        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4) {
                self._onComplete(id, xhr);
            }
        };

        // build query string
        params = params || {};
        params['fupfile'] = name;
        var queryString = fup.obj2url(params, this._options.action);
        
        xhr.open("POST", queryString, true);
        /*
        xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
        xhr.setRequestHeader("X-File-Name", encodeURIComponent(name));
        xhr.setRequestHeader("Content-Type", "application/octet-stream");
        */
        xhr.send(file);
        
    },
    _onComplete: function (id, xhr) {
        // the request was aborted/cancelled
        if (!this._files[id]) return;

        var name = this.getName(id);
        var size = this.getSize(id);

        this._options.onProgress(id, name, size, size);

        if (xhr.status == 200) {
            this.log("xhr - server response received");
            this.log("responseText = " + xhr.responseText);

            var response;

            try {
                response = eval("(" + xhr.responseText + ")");
            } catch (err) {
                response = {};
            }

            this._options.onComplete(id, name, response);

        } else {
            this._options.onComplete(id, name, {});
        }

        this._files[id] = null;
        this._xhrs[id] = null;
        this._dequeue(id);
    },
    _cancel: function (id) {
        this._options.onCancel(id, this.getName(id));

        this._files[id] = null;

        if (this._xhrs[id]) {
            this._xhrs[id].abort();
            this._xhrs[id] = null;
        }
    }
});