<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Schedules.aspx.vb" Inherits="MensClubSoftBall.Schedules" %>
<%@ Register src="MainMenu.ascx" tagname="MainMenu" tagprefix="MainMenu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Schedules</title>
</head>
<body>
    <form id="form1" runat="server">
    <MainMenu:MainMenu ID="MainMenu1" runat="server" Visible="true"/>
    <br />
    <br />
    <br />
    <div id="test" style="font-family: Verdana; left: 400px; position: relative; font-size: large;
        color: #590000; width: 100px;">
        <asp:Label ID="lblSchedule" runat="server" Text="Schedule"></asp:Label>
    </div>
    
    <br />
    <span id="scoreboard" style="left: 200px; position: relative; font-family: verdana;
        font-size: small;">
        <asp:Label ID="lblref" runat="server" Text="Click on a Team Name To See Schedule By Team"
            Font-Names="verdana" Font-Size="Small"></asp:Label>
        <asp:DataList ID="rptrScoreBoard" RepeatColumns="6" RepeatLayout="Table" BorderWidth="2"
            BorderStyle="Solid" BorderColor="Black" GridLines="Both" RepeatDirection="Horizontal"
            runat="server">
            <ItemTemplate>
                <center>
                    <asp:LinkButton ID="lblTeamName2" runat="server" Text='<%# Bind("TeamName") %>' PostBackUrl='<%# MakeUrl(Eval("TeamName")) %>'
                        ForeColor="#990000" Font-Size="Medium"></asp:LinkButton>
                </center>
            </ItemTemplate>
        </asp:DataList>
        <%--<asp:Repeater ID="repeat" runat="server">
            <HeaderTemplate>
                <table style="border: 1px solid #000000; ">
                    <tr>
                        <td>
            </HeaderTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="lblTeamName2" runat="server" Text='<%# Bind("TeamName") %>' PostBackUrl='<%# MakeUrl(Eval("TeamName")) %>'></asp:LinkButton>
            </ItemTemplate>
            <FooterTemplate>
                </td> </tr> </table>
            </FooterTemplate>
        </asp:Repeater>--%>
    </span>
    <br />
    <br />
    <table style="border: 1px solid #000000; left: 200px; position: relative;">
        <tr>
            <td align="center" style="border: 1px solid #000000;">
                <asp:Label ID="lblcurrentTeam" runat="server" Font-Names="Verdana" Font-Size="Small"
                    ForeColor="#990000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="false" AllowSorting="True"
                    AutoGenerateColumns="False" DataKeyNames="id" GridLines="Both" Font-Names="verdana"
                    Font-Size="Small" BorderColor="Black" BorderWidth="1px">
                    <Columns>
                        <asp:TemplateField HeaderText="ScheduleId" SortExpression="id" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblID" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--this is date Field--%>
                        <asp:TemplateField HeaderText="Date">
                            <ItemTemplate>
                                <asp:Label ID="GlblDate" runat="server" Text='<%# Bind("FormatedDates") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--SelectedValue='<%# Bind("TeamName") %>' --%>
                        <%--this is is Current Team--%>
                        <%--SelectedValue='<%# Bind("TeamName") %>' --%>
                        <%--this is Opponent --%>
                        <asp:TemplateField HeaderText="Opponent" Visible="true">
                            <ItemTemplate>
                                <asp:Label ID="GlblOpponent" runat="server" Text='<%# Bind("OpponentTeamName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--this is Field names--%>
                        <asp:TemplateField HeaderText="Fields" Visible="true">
                            <ItemTemplate>
                                <asp:Label ID="GlblField" runat="server" Text='<%# Bind("FieldName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--this is Time--%>
                        <asp:TemplateField HeaderText="Times">
                            <ItemTemplate>
                                <asp:Label ID="GlblTime" runat="server" Text='<%# Bind("Time") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--this is Home/Away--%>
                        <asp:TemplateField HeaderText="Home/Away">
                            <ItemTemplate>
                                <asp:Label ID="GlblHA" runat="server" Text='<%# Bind("HomeOrAway") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
    <br />
    <br />
    
    </form>
</body>
</html>
