<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <h2 style="margin-bottom:10px;">Dashboard</h2>
	<div class="header">
		<h3 class="left">This weeks due</h3>
		<i class="left">Click on an item to see details</i>
	</div>
	<div class="app-calendar app-calendar span span2 left">
		<h2>Monday</h2>
		<ul class="calendar">
			<h4>Coffee break</h4>
			<li>Backend design.</li>
			<li>Developer meeting</li>
		</ul>
		<ul class="calendar">
			<h4>Nike</h4>
			<li>Office Meeting
   				(project managers)</li>
		</ul>
	</div>
	<div class="app-calendar span span2 left">
		<h2>Tuesday</h2>
		<ul class="calendar">
			<h4>Coffee break</h4>
			<li>Backend Development (.NET dev team)</li>
		</ul>
	</div>
	<div class="app-calendar span span2 left">
		<h2>Wednesday</h2>
		<ul class="calendar">
			<h4>Coffee break</h4>
			<li>Backend Development
   				(.NET dev team)</li>
		</ul>
		<ul class="calendar">
			<h4>Disney</h4>
			<li>Design meeting
   				(Design staff)</li>
		</ul>
	</div>
	<div class="app-calendar span span2 left">
		<h2>Thursday</h2>
		<ul class="calendar">
			<h4>Holidays</h4>
			<li>No works :D (Project manager, Design staff, Developers)</li>
		</ul>
	</div>
	<div class="app-calendar span span2 left">
		<h2>Friday</h2>
		<ul class="calendar">
			<h4>Holidays</h4>
			<li>No works :D (Project manager, Design staff, Developers)</li>
		</ul>
	</div>
	<div class="clear"></div>
	<div class="span span7 left" style="margin-left:0;">
		<div class="header">
			<h3>Project deadlines</h3>
			<i class="left">Overhanging project milestones, or delayed</i>
		</div>
        <h4>
            <asp:Label ID="Label_Deadline" runat="server" Text="DEADLINE 10-09-2012 (OVERDUE)"></asp:Label>
        </h4>
        <ul>
            <li><h4>Coffee break</h4></li>
            <li>Front end design draft</li>
            <li>Customer approval</li>
        </ul>
        <h4>
            <asp:Label ID="Label_Deadline2" runat="server" Text="DEADLINE 29-09-2012"></asp:Label>
        </h4>
        <ul>
            <li><h4>Nike</h4></li>
            <li>New brand manual and logo</li>
        </ul>
	</div>

	<div class="span span3 right">
		<div class="header">
			<h3>Inbox</h3>
			<i class="left">Click to view full message</i>
		</div>
        <h4>
            <abbr title="SQL COUNT TOP(5)">
                <asp:Label ID="Label_Inbox" runat="server" Text="5 new messages"></asp:Label>
            </abbr>
        </h4>
            <abbr title="asp:repeater!">
            <table>
                <thead>
                    <tr>
                        <td>From</td>
                        <td>Subject</td>
                        <td>Date</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Bossman</td>
                        <td>New deadline!</td>
                        <td>13-09-2012</td>
                    </tr>
                    <tr>
                        <td>Secretary</td>
                        <td>Password?</td>
                        <td>13-09-2012</td>
                    </tr>
                    <tr>
                        <td>Jones</td>
                        <td>Re: Beer after work?</td>
                        <td>13-09-2012</td>
                    </tr>
                    <tr>
                        <td>Henry</td>
                        <td>Designs?</td>
                        <td>13-09-2012</td>
                    </tr>
                    <tr>
                        <td>Marc</td>
                        <td>Re: All done!</td>
                        <td>13-09-2012</td>
                    </tr>
                </tbody>
            </table>
            </abbr>
	</div>	
    <div class="clear"></div>
    <div class="header">
        <h3>Monthly income</h3>
        <i>See generated sales</i>
    </div>
    <div class="span span5">
        <img src="http://www.placehold.it/885x450&text=885x450+Graph" />
        <h4 class="right">Approx. income: $5.530.0</h4>
    </div>
</asp:Content>

