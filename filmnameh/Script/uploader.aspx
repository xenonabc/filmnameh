<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        //string uniqeID = DateTime.Now.ToString("yyMMddHHmmssffff") + Session.SessionID;
        string uniqeID = DateTime.Now.ToString("yyyyMMdd");
        string result = "{\"success\":true";
        string path = Server.MapPath("\\upload\\" + DateTime.Now.ToString("yyyyMMdd"));
        string saveLocation = string.Empty;
        string fileName = string.Empty;
        
        int length = 4096;
        int bytesRead = 0;
        Byte[] buffer = new Byte[length];

        if (Request.Params["fupfile"] != null)//This works with Chrome/FF/Safari
        {
            try
            {
                fileName = uniqeID + "_" + Request.Params["fupfile"];
                //saveLocation = Server.MapPath(path) + "\\" + fileName;
		if (!System.IO.Directory.Exists(path))
                    System.IO.Directory.CreateDirectory(path);
		saveLocation = path + "\\" + fileName;

                using (System.IO.FileStream fileStream = new System.IO.FileStream(saveLocation, System.IO.FileMode.Create))
                {
                    do
                    {
                        bytesRead = Request.InputStream.Read(buffer, 0, length);
                        fileStream.Write(buffer, 0, bytesRead);
                    }
                    while (bytesRead > 0);
                }
            }
            catch (UnauthorizedAccessException ex)
            {
                // log error hinting to set the write permission of ASPNET or the identity accessing the code
                result = result.Replace("true", "false, \"error\":" + ex.Message + " " + ex.InnerException);
            }
        }
        else//IE
        {
            try
            {
                if (Request.Files[0].ContentLength < 102400000)
                {
                    fileName = uniqeID + System.IO.Path.GetFileName(Request.Files[0].FileName);
                    //saveLocation = Server.MapPath(path) + "\\" + fileName;
    		    if (!System.IO.Directory.Exists(path))
                        System.IO.Directory.CreateDirectory(path);
		    saveLocation = path + "\\" + fileName;

                    using (System.IO.FileStream fileStream = new System.IO.FileStream(saveLocation, System.IO.FileMode.Create))
                    {
                        do
                        {
                            bytesRead = Request.Files[0].InputStream.Read(buffer, 0, length);
                            fileStream.Write(buffer, 0, bytesRead);
                        }
                        while (bytesRead > 0);
                    }
                }
                else
                    result = result.Replace("true", "false, \"error\":File size");
            }
            catch (Exception ex)
            {
                // log error hinting to set the write permission of ASPNET or the identity accessing the code
                result = result.Replace("true", "false, \"error\":\"" + ex.Message + " " + ex.InnerException + "\"");
            }
        }

        result += ", \"fileName\": \"" + fileName + "\"}";

        string ip = Request.UserHostAddress;

        Response.Write(result);
    }

</script>
