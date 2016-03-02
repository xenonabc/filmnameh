$(function () {
    function stringCounter(textarea, countlabel, maxlength) {
        var len = maxlength - textarea.val().length;
        if (len < 0) {
            countlabel.val(0);
        } else {
            countlabel.val(len);
        }
        if (textarea.val().length > maxlength) {
            var content = textarea.val().substr(0, maxlength);
            textarea.val(content);
        }
    }

    $("#MainContent_ScriptText").on('keyup', function (e) {
        var $label = $("#MainContent_labelCo");
        stringCounter($(this), $label, 600);
    });
    $("#MainContent_Opinion").on('keyup', function (e) {
        var $label = $("#MainContent_labelCo2");
        stringCounter($(this), $label, 300);
    });


    $(".icon-doc").on('click', function (e) {
        if (confirm('آیا مطمئن هستید می خواهید این فایل را حذف کنید؟')) {
        $(this).parent().css('display', 'none');
        var removed = $(this).parent().text().toString()+';';
        var files = $("#MainContent_txtFiles").val().toString();
        files = files.replace(removed, '');
        $("#MainContent_txtFiles").val(files);
        }
    });

    $('[data-toggle="tooltip"]').tooltip();

});