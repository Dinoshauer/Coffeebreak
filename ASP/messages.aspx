<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="messages.aspx.cs" Inherits="messages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <script type="text/javascript">
        function genericPopup(href, width, height, scrollbars) {
            var param = "width=" + width + ", height=" + height + ", scrollbars=" + scrollbars + ", resizable, status";

            return window.open(href, "", param);
        }
    </script>
    <h2 style="margin-bottom:10px;">Message center</h2>
    <div class="header">
        <h3>Messages</h3>
        <i>- Don't forget to read your messages!</i>
        <asp:HyperLink ID="HyperLink_Create" runat="server" class="right btn-primary">Create message</asp:HyperLink>
    </div>
    <asp:SqlDataSource ID="MessageSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
        SelectCommand="SELECT * FROM [internal_messages]"></asp:SqlDataSource>
    <asp:Repeater ID="MessageOverviewRepeater" runat="server" 
        DataSourceID="MessageSqlDataSource" 
        onitemcommand="MessageOverviewRepeater_ItemCommand">
        <HeaderTemplate>
            <table class="table table-hover">
	            <thead>
                    <tr>
                        <td><h2>Sender</h2></td>
                        <td><h2>Subject</h2></td>
                        <td><h2>Date</h2></td>
                    </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
        <FooterTemplate>
                </tbody>
	        </table>
        </FooterTemplate>
        <ItemTemplate>
                <tr class='<%# Eval("internal_message_read") %>'>
                    <td>
                        <asp:HyperLink ID="HyperLink_ToMsg1" runat="server">
                            <asp:Label ID="internal_messages_senderLabel" runat="server" Text='<%# Eval("internal_message_sender_id") %>' />
                        </asp:HyperLink>
                    </td>
                    <td>
                        <asp:HyperLink ID="HyperLink_ToMsg2" runat="server">
                            <asp:Label ID="internal_messages_headerLabel" runat="server" Text='<%# Eval("internal_message_header") %>' />
                        </asp:HyperLink>
                    </td>
                    <td>
                        <asp:HyperLink ID="HyperLink_ToMsg3" runat="server">
                            <asp:Label ID="internal_messages_dateLabel" runat="server" Text='<%# Eval("internal_message_date") %>' />
                        </asp:HyperLink>
                    </td>
                    <td>
                        a link:<a href='reader.aspx?ReplyTo=<%# Eval("internal_message_id") %>' OnClientClick="genericPopup(this.href,300,300,no)">Reply</a>
                    </td>
                    <td>
                        <asp:LinkButton class="tips" ID="ReplyButton" runat="server" CausesValidation="True" CommandName="ReplyMsg" CommandArgument='<%# Eval("internal_message_id") %>' Text="<i class='icon-comment'></i>" ToolTip="Reply to this message" OnClientClick="genericPopup(this.href,300,300,no)" />
                    </td>
                    <td>
                        <asp:LinkButton class="tips" ID="ForwardButton" runat="server" CausesValidation="True" CommandName="ForwardMsg" CommandArgument='<%# Eval("internal_message_id") %>' Text="<i class='icon-share-alt'></i>" ToolTip="Forward this message" OnClientClick="genericPopup(this.href,300,300,no)" />
                    </td>
                    <td>
                        <asp:LinkButton ID="DelButton"  class="tips" CommandName="DelMsg" CommandArgument='<%# Eval("internal_message_id") %>' runat="server" Text="<i class='icon-trash'></i>" ToolTip="Delete message" OnClientClick="return confirm('Are you sure?');" />
                    </td>
                </tr>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>