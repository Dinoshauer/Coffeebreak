<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add-user.aspx.cs" Inherits="add_user" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tilføj bruger til systemet</title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Label ID="Label_Fejl" runat="server" Text=""></asp:Label>
        <h3>
            <asp:Label ID="LabelHeading" runat="server" Text="Label"></asp:Label>
        </h3>
        <div class="controlgroup">
            <label>Creation date:</label>
            <div class="controls">
                <asp:Label ID="creationDateLabel" runat="server" Text="Label"></asp:Label>
            </div>
        </div>
        <div class="controlgroup">
            <label>Creation date:</label>
            <div class="controls">
                <asp:Label ID="lastLoginDateLabel" runat="server" Text="Label"></asp:Label>
            </div>
        </div>
        <div class="controlgroup">
            <label for="TB_email">Email:</label>
            <div class="controls">
                <asp:TextBox ID="TB_email" ValidationGroup="addUser" runat="server" required="required"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="TB_email" ErrorMessage="Du skal indtaste en gyldig email adresse" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ValidationGroup="addUser"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="controlgroup">
            <label for="TB_password">Kodeord:</label>
            <div class="controls">
                <asp:TextBox ID="TB_password" type="password" ValidationGroup="addUser" runat="server" required="required"></asp:TextBox>
            </div>
        </div>
        <div class="controls">
            <label for="TB_password_again" runat="server" id="password_again">Kodeord igen:</label>
            <div class="controls">
                <asp:TextBox ID="TB_password_again" type="password" ValidationGroup="addUser" runat="server" required="required"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="TB_password" ControlToValidate="TB_password_again" 
                    ErrorMessage="Begge kodeord skal være ens" ValidationGroup="addUser"></asp:CompareValidator>
            </div>
        </div>
        <div class="controlgroup">
            <label for="TB_name">Fornavn:</label>
            <div class="controls">
                <asp:TextBox ID="TB_name" ValidationGroup="addUser" runat="server" required="required"></asp:TextBox>
            </div>
        </div>
        <div class="controlgroup">
            <label for="TB_lastname">Efternavn:</label>
            <div class="controls">
                <asp:TextBox ID="TB_lastname" ValidationGroup="addUser" runat="server" required="required"></asp:TextBox>
            </div>
        </div>
        <div class="controlgroup">
            <label for="TB_phone">Telefon:</label>
            <div class="controls">
                <asp:TextBox ID="TB_phone" ValidationGroup="addUser" runat="server" required="required"></asp:TextBox>
            </div>
        </div>
        <div class="controlgroup">
            <label for="TB_company">Firma:</label>
            <div class="controls">
                <asp:TextBox ID="TB_company" ValidationGroup="addUser" runat="server" required="required"></asp:TextBox>
            </div>
        </div>

        <div class="controlgroup">
            <label for="Select_Level">Rolle:</label>
            <div class="controls">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT * FROM [user_levels]"></asp:SqlDataSource>
                <asp:DropDownList ID="DropDownList_Level" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="user_level_name" 
                    DataValueField="user_level_id">
                </asp:DropDownList>
            </div>
        </div>
        <div class="controlgroup">
            <label for="Select_Team">Gruppe:</label>
            <div class="controls">
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT * FROM [user_team]"></asp:SqlDataSource>
                <asp:CheckBoxList ID="CheckBoxList_Team" runat="server" 
                    DataSourceID="SqlDataSource2" DataTextField="user_team_name" 
                    DataValueField="user_team_id">
                </asp:CheckBoxList>
            </div>
        </div>
        <div class="controlgroup">
            <div class="controls">
                <asp:Button ID="Button_Submit" runat="server" Text="Opret" onclick="Button_Submit_Click" ValidationGroup="addUser" />
                <asp:Button ID="Button_SubmitEdit" runat="server" Text="Færdig" 
                    onclick="Button_SubmitEdit_Click" />
            </div>
        </div>

    </form>
</body>
</html>
