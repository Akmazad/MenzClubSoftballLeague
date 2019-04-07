<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SchedulesByWeek.aspx.vb" Inherits="MensClubSoftBall.SchedulesByWeek" %>
<%@ Register TagPrefix="rjs" Namespace="RJS.Web.WebControl" Assembly="RJS.Web.WebControl.PopCalendar" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Schedules By Week</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
        <tr>
            <td>
                <asp:Label ID="lbl" runat="server" Text="Select Schedule:" Font-Bold="True" Font-Names="Verdana"
                    Font-Size="Medium" ForeColor="#990000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtStartDate" runat="server" ReadOnly="true"></asp:TextBox>
                <rjs:PopCalendar ID="popCalenderStartDate" runat="server" 
                    Control="txtStartDate" Format="mm dd yyyy" />
            </td>
            <td>
                <asp:TextBox ID="txtEndDate" ReadOnly="true" runat="server"></asp:TextBox>
                <rjs:PopCalendar ID="popCalenderEndtDate" runat="server" Control="txtEndDate" 
                    Format="mm dd yyyy" />
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Show Schedule" />
    <table id="tblGrid" runat="server" style="border: 1px solid #000000; left: 200px; position: relative;" visible="false">
        <tr>
            <td align="center" style="border: 1px solid #000000;">
                <asp:Label ID="lblDateSchedule" runat="server" Font-Names="Verdana" Font-Size="Small"
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
    </div>
    </form>
</body>
</html>
