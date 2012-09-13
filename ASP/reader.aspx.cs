using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class reader : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CKEditor1.config.toolbar = new object[]
        {
            new object[] { "Format", "Font", "FontSize" },
            new object[] { "Bold", "Italic", "Underline", "Strike", "-", "Subscript", "Superscript" },
            new object[] { "JustifyLeft", "JustifyCenter", "JustifyRight", "JustifyBlock" },
            new object[] { "Blockquote" },
            new object[] { "TextColor", "BGColor" },
            new object[] { "BidiLtr", "BidiRtl" }
        };
        if (Request.QueryString["create"] == "new")
        {
            Title = "Create new message";
        }
        else if (Request.QueryString["ReplyTo"] != null)
        {
            Title = "Reply to message";

        }
        else if (Request.QueryString["Forward"] != null)
        {
            Title = "Forward message";
        }
    }
}