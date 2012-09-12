<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="edit.aspx.cs" Inherits="edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <asp:Label ID="Label_Heading" runat="server" Text="Something went wrong with the request. Please go back and try again."></asp:Label>
    <asp:Panel ID="Panel_UserEdit" runat="server">
        <div class="control-group">
            <label for="TextBox_CreationDate">Creation date</label>
            <div class="controls">
                <asp:TextBox ID="TextBox_CreationDate" runat="server" Enabled="false"></asp:TextBox>
            </div>
        </div>
        <div class="control-group">
            <label for="TextBox_LastLoginDate">Last login date</label>
            <div class="controls">
                <asp:TextBox ID="TextBox_LastLoginDate" runat="server" Enabled="false"></asp:TextBox>
            </div>
        </div>
        <div class="control-group">
            <label for="TextBox_Email">Email</label>
            <div class="controls">
                <asp:TextBox ID="TextBox_Email" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="control-group">
            <label for="TextBox_Password">Password</label>
            <div class="controls">
                <asp:TextBox ID="TextBox_Password" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="control-group">
            <label for="TextBox_FirstName">Name</label>
            <div class="controls">
                <asp:TextBox ID="TextBox_FirstName" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="control-group">
            <label for="TextBox_Lastname">Lastname</label>
            <div class="controls">
                <asp:TextBox ID="TextBox_Lastname" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="control-group">
            <label for="TextBox_Phone">Phone</label>
            <div class="controls">
                <asp:TextBox ID="TextBox_Phone" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="control-group">
            <label for="TextBox_Company">Company</label>
            <div class="controls">
                <asp:TextBox ID="TextBox_Company" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="control-group">
            <label for="DropDownList_Role">Role</label>
            <div class="controls">
                <asp:DropDownList ID="DropDownList_Role" runat="server" 
                    DataSourceID="SqlDataSource_Role" DataTextField="user_level_name" 
                    DataValueField="user_level_id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource_Role" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
                    SelectCommand="SELECT [user_level_name], [user_level_id] FROM [user_levels]"></asp:SqlDataSource>
            </div>
        </div>
        <div class="control-group">
            <label>Teams</label>
            <div class="controls">
                <asp:CheckBoxList ID="CheckBoxList_Teams" runat="server" 
                    DataSourceID="SqlDataSource_Teams" DataTextField="user_team_name" 
                    DataValueField="user_team_id">
                </asp:CheckBoxList>
                <asp:SqlDataSource ID="SqlDataSource_Teams" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
                    SelectCommand="SELECT [user_team_id], [user_team_name] FROM [user_team]">
                </asp:SqlDataSource>
            </div>
        </div>
        <div class="control-group">
            <div class="controls">
                <asp:LinkButton ID="LinkButton_User_Submit" runat="server" 
                    onclick="LinkButton_User_Submit_Click">Done</asp:LinkButton>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="Panel_TeamRoleEdit" runat="server">
        <div class="control-group">
            <label for="TextBox_TeamRoleName">Name</label>
            <div class="controls">
                <asp:TextBox ID="TextBox_TeamRoleName" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="control-group">
            <label for="TextBox_Descr">Description</label>
            <div class="controls">
                <asp:TextBox ID="TextBox_Descr" runat="server" TextMode="MultiLine"></asp:TextBox>
            </div>
        </div>
        <div class="control-group">
            <div class="controls">
                <asp:LinkButton ID="LinkButton_TeamRole_Submit" runat="server" 
                    onclick="LinkButton_TeamRole_Submit_Click">Done</asp:LinkButton>
            </div>
        </div>
    </asp:Panel>
</asp:Content>

