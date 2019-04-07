<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Standings.aspx.vb" Inherits="MensClubSoftBall.Standings" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Standings</title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="test" style="font-family: Verdana; left: 400px; position: relative; font-size: large;
        color: #590000; width: 100px;">
        <asp:Label ID="lblSchedule" runat="server" Text="Standing"></asp:Label>
    </div>
    <br />
    <br />
    <div style="left:200px; position: relative;">
    <table style="border: 1px solid #000000;">
        <tr>
            <td align="center">
                <asp:Label ID="lbldivisionA" runat="server" Text="Division A" Font-Names="verdana" Font-Size="Small"></asp:Label>
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
                        <asp:TemplateField HeaderText="Team">
                            <ItemTemplate>
                                <asp:Label ID="GlblDate" runat="server" Text='<%# Bind("TeamName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--SelectedValue='<%# Bind("TeamName") %>' --%>
                        <%--this is is Current Team--%>
                        <asp:TemplateField HeaderText="Record" Visible="true">
                            <ItemTemplate>
                                <asp:Label ID="GlblTeam" runat="server" Text='<%# Bind("Record") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--SelectedValue='<%# Bind("TeamName") %>' --%>
                        <%--this is Opponent --%>
                        <asp:TemplateField HeaderText="GMs Back" Visible="true">
                            <ItemTemplate>
                                <asp:Label ID="GlblOpponent" runat="server" Text='<%# Bind("GMsBack") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--this is Field names--%>
                        <asp:TemplateField HeaderText="Streak" Visible="true">
                            <ItemTemplate>
                                <asp:Label ID="GlblField" runat="server" Text='<%# Bind("Streak") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--this is Time--%>
                        <asp:TemplateField HeaderText="Run For">
                            <ItemTemplate>
                                <asp:Label ID="GlblTime" runat="server" Text='<%# Bind("RunFor") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--this is Home/Away--%>
                        <asp:TemplateField HeaderText="Run Against">
                            <ItemTemplate>
                                <asp:Label ID="GlblHA" runat="server" Text='<%# Bind("RunAgainst") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
    
    <br />
    <br />
    <table style="border: 1px solid #000000;">
        <tr>
            <td align="center">
                <asp:Label ID="LabeldivisionB" runat="server" Text="Division B" Font-Names="verdana" Font-Size="Small"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView2" runat="server" AllowPaging="false" AllowSorting="True"
                    AutoGenerateColumns="False" DataKeyNames="id" GridLines="Both" Font-Names="verdana"
                    Font-Size="Small" BorderColor="Black" BorderWidth="1px">
                    <Columns>
                        <asp:TemplateField HeaderText="ScheduleId" SortExpression="id" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblID" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--this is date Field--%>
                        <asp:TemplateField HeaderText="Team">
                            <ItemTemplate>
                                <asp:Label ID="GlblDate" runat="server" Text='<%# Bind("TeamName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--SelectedValue='<%# Bind("TeamName") %>' --%>
                        <%--this is is Current Team--%>
                        <asp:TemplateField HeaderText="Record" Visible="true">
                            <ItemTemplate>
                                <asp:Label ID="GlblTeam" runat="server" Text='<%# Bind("Record") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--SelectedValue='<%# Bind("TeamName") %>' --%>
                        <%--this is Opponent --%>
                        <asp:TemplateField HeaderText="GMs Back" Visible="true">
                            <ItemTemplate>
                                <asp:Label ID="GlblOpponent" runat="server" Text='<%# Bind("GMsBack") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--this is Field names--%>
                        <asp:TemplateField HeaderText="Streak" Visible="true">
                            <ItemTemplate>
                                <asp:Label ID="GlblField" runat="server" Text='<%# Bind("Streak") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--this is Time--%>
                        <asp:TemplateField HeaderText="Run For">
                            <ItemTemplate>
                                <asp:Label ID="GlblTime" runat="server" Text='<%# Bind("RunFor") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--this is Home/Away--%>
                        <asp:TemplateField HeaderText="Run Against">
                            <ItemTemplate>
                                <asp:Label ID="GlblHA" runat="server" Text='<%# Bind("RunAgainst") %>'></asp:Label>
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
