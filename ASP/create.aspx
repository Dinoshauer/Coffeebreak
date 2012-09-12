<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="create.aspx.cs" Inherits="create" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
        <div class="header">
            <h3>
                <asp:Label ID="LabelHeading" runat="server" Text="Label"></asp:Label>
            </h3>
            <i>
                <asp:Label ID="LabelDescr" runat="server" Text="Label"></asp:Label>
            </i>
        </div>
    <asp:Panel ID="Panel_CreateUser" runat="server">
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
                <asp:Button ID="Button_Submit_CreateUser" runat="server" Text="Submit" onclick="Button_Submit_CreateUser_Click" ValidationGroup="addUser" />
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="Panel_CreateRoleTeam" runat="server">
        <div class="control-group">
            <label for="TextBox_RoleTeamName">Name</label>
            <div class="controls">
                <asp:TextBox ID="TextBox_RoleTeamName" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="control-group">
            <label for="TextBox_RoleTeamDescr">Description</label>
            <div class="controls">
                <asp:TextBox ID="TextBox_RoleTeamDescr" runat="server" TextMode="MultiLine"></asp:TextBox>
            </div>
        </div>
        <div class="control-group">
            <div class="controls">
                <asp:Button ID="Button_Submit_CreateRoleTeam" runat="server" Text="Submit" 
                    onclick="Button_Submit_CreateRoleTeam_Click" />
            </div>
        </div>
    </asp:Panel>
</asp:Content>

