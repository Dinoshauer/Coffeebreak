<%@ Page Language="C#" AutoEventWireup="true" CodeFile="reader.aspx.cs" Inherits="reader" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
    </title>
    <link href="style/dashboardStyles.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ckeditor.com/apps/ckeditor/3.5.3/ckeditor.js?1302526282"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="header">
                <h3>
                    <asp:Label ID="LabelHeading" runat="server" Text=""></asp:Label>
                </h3>
                <i>
                    <asp:Label ID="LabelDescr" runat="server" Text=""></asp:Label>
                </i>
            </div>
            <CKEditor:CKEditorControl ID="CKEditor1" BasePath="/add-ins/CKEditor/CKEditor.NET" runat="server">
            </CKEditor:CKEditorControl>
            <div class="control-group">
                <div class="controls">
                    <asp:LinkButton ID="LinkButton_Submit" runat="server">Send message</asp:LinkButton>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
