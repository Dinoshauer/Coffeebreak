<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="teams.aspx.cs" Inherits="teams" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <!--            -->
    <!--    GROUPS  -->
    <!--            -->
    <asp:SqlDataSource ID="UserGroupSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
        SelectCommand="SELECT * FROM [user_team]"></asp:SqlDataSource>
    <asp:Repeater ID="UserGroupRepeater" runat="server"  DataSourceID="UserGroupSqlDataSource">
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
                    <asp:Label ID="userTeamNameLabel" runat="server" Text='<%# Bind("user_team_name") %>' />
                </td>
                <td>
                    <asp:Label ID="userTeamDescriptionLabel" runat="server" Text='<%# Eval("user_team_description") %>' />
                </td>
                <td><asp:LinkButton class="tips" ID="EditButton" runat="server" CausesValidation="True" CommandName="EditLevel" CommandArgument='<%# Eval("user_team_id") %>' Text="<i class='icon-edit'></i>" ToolTip="Edit role" /></td>
                <td><asp:LinkButton ID="DelButton"  class="tips" CommandName="DelLevel" CommandArgument='<%# Eval("user_team_id") %>' runat="server" Text="<i class='icon-trash'></i>" OnClientClick="return confirm('Are you sure?');" ToolTip="Delete role" /></td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>

