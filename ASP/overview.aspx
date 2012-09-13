<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="overview.aspx.cs" Inherits="overview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <h2 style="margin-bottom:10px;">Users & groups</h2>
    <div class="header"><h3><asp:Label ID="Label_Heading" runat="server" Text=""></asp:Label></h3><i>
        <asp:Label ID="Label_Descr" runat="server" Text="Label"></asp:Label></i><asp:HyperLink ID="HyperLink_Create" runat="server" class="right btn-primary">Create</asp:HyperLink></div>
    
    <!--            -->
    <!--    USERS   -->
    <!--            -->
    <asp:SqlDataSource ID="UserOverviewSqlDataSource" runat="server" ConnectionString="<%$ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT * FROM users INNER JOIN user_levels ON users.fk_user_level = user_levels.user_level_id INNER JOIN user_team ON users.fk_user_team = user_team.user_team_id"></asp:SqlDataSource>
    <asp:Repeater ID="UserOverviewRepeater" runat="server" DataSourceID="UserOverviewSqlDataSource" 
    onitemcommand="UserOverviewRepeater_ItemCommand">
        <HeaderTemplate>
            <table class="table table-hover">
	            <thead>
                    <tr>
                        <td><h2>Username</h2></td>
                        <td><h2>Lastname</h2></td>
                        <td><h2>Name</h2></td>
                        <td><h2>Telephone</h2></td>
                        <td><h2>Company</h2></td>
                        <td><h2>Role</h2></td>
                        <td><h2>Team</h2></td>
                    </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
        <FooterTemplate>
                </tbody>
	        </table>
        </FooterTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:Label ID="user_usernameLabel" runat="server" Text='<%# Bind("user_username") %>' />
                </td>
                <td>
                    <asp:Label ID="user_lastnameLabel" runat="server" Text='<%# Eval("user_lastname") %>' />
                </td>
                <td>
                    <asp:Label ID="user_nameLabel" runat="server" Text='<%# Eval("user_name") %>' />
                </td>
                <td>
                    <asp:Label ID="user_phoneLabel" runat="server" Text='<%# Eval("user_phone") %>' />
                </td>
                <td>
                    <asp:Label ID="user_companyLabel" runat="server" Text='<%# Eval("user_company") %>' />
                </td>
                <td>
                    <asp:Label ID="user_levelLabel" runat="server" Text='<%# Eval("user_level_name") %>' />
                </td>
                <td>
                    <asp:Label ID="user_teamLabel" runat="server" Text='<%# Eval("user_team_name") %>' />
                </td>
                <td><asp:LinkButton class="tips" ID="EditButton" runat="server" CausesValidation="True" CommandName="EditUser" CommandArgument='<%# Eval("user_id") %>' Text="<i class='icon-edit'></i>" ToolTip="Edit user" /></td>
                <td><asp:LinkButton ID="DelButton"  class="tips" CommandName="DelUser" CommandArgument='<%# Eval("user_id") %>' runat="server" Text="<i class='icon-trash'></i>" ToolTip="Delete user" OnClientClick="return confirm('Are you sure?');" /></td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>

    <!--            -->
    <!--    GROUPS  -->
    <!--            -->
    <asp:SqlDataSource ID="UserGroupSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
        SelectCommand="SELECT * FROM [user_levels]"></asp:SqlDataSource>
    <asp:Repeater ID="UserGroupRepeater" runat="server" onitemcommand="UserGroupRepeater_ItemCommand" DataSourceID="UserGroupSqlDataSource">
        <HeaderTemplate>
            <table class="table table-hover">
	            <thead>
                    <tr>
                        <td><h2>Role name</h2></td>
                        <td><h2>Description</h2></td>
                    </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
        <FooterTemplate>
                </tbody>
	        </table>
        </FooterTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:Label ID="userLevelNameLabel" runat="server" Text='<%# Bind("user_level_name") %>' />
                </td>
                <td>
                    <asp:Label ID="userLevelDescriptionLabel" runat="server" Text='<%# Eval("user_level_description") %>' />
                </td>
                <td><asp:LinkButton class="tips" ID="EditButton" runat="server" CausesValidation="True" CommandName="EditLevel" CommandArgument='<%# Eval("user_level_id") %>' Text="<i class='icon-edit'></i>" ToolTip="Edit role" /></td>
                <td><asp:LinkButton ID="DelButton"  class="tips" CommandName="DelLevel" CommandArgument='<%# Eval("user_level_id") %>' runat="server" Text="<i class='icon-trash'></i>" OnClientClick="return confirm('Are you sure?');" ToolTip="Delete role" /></td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="TeamsSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
        SelectCommand="SELECT * FROM [user_team]"></asp:SqlDataSource>
    <asp:Repeater ID="UserTeamRepeater" runat="server" 
    DataSourceID="TeamsSqlDataSource" onitemcommand="UserTeamRepeater_ItemCommand">
    <HeaderTemplate>
            <table class="table table-hover">
	            <thead>
                    <tr>
                        <td><h2>Team name</h2></td>
                        <td><h2>Description</h2></td>
                    </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
        <FooterTemplate>
                </tbody>
	        </table>
        </FooterTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:Label ID="userLevelNameLabel" runat="server" Text='<%# Bind("user_team_name") %>' />
                </td>
                <td>
                    <asp:Label ID="userLevelDescriptionLabel" runat="server" Text='<%# Eval("user_team_description") %>' />
                </td>
                <td><asp:LinkButton class="tips" ID="EditButton" runat="server" CausesValidation="True" CommandName="EditTeam" CommandArgument='<%# Eval("user_team_id") %>' Text="<i class='icon-edit'></i>" ToolTip="Edit role" /></td>
                <td><asp:LinkButton ID="DelButton"  class="tips" CommandName="DelTeam" CommandArgument='<%# Eval("user_team_id") %>' runat="server" Text="<i class='icon-trash'></i>" OnClientClick="return confirm('Are you sure?');" ToolTip="Delete role" /></td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>