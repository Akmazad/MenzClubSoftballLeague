<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Scores.aspx.vb" Inherits="MensClubSoftBall.Scores" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div style="width: 00px; text-align: center; font-family: verdana; font-weight: bold;
            color: #990000;">
            Score</div>
        <br />
        <span style="left: 20px; position: relative; font-family: verdana; font-size: small;
            color: #990000;">
            <asp:Label ID="lblWeekChange" runat="server" Text="Select a Week"></asp:Label>
            <asp:DropDownList ID="drpWeekBefore" runat="server" AutoPostBack="True">
                    <asp:ListItem>Week 1</asp:ListItem>
                    <asp:ListItem>Week 2</asp:ListItem>
                    <asp:ListItem>Week 3</asp:ListItem>
                    <asp:ListItem>Week 4</asp:ListItem>
                    <asp:ListItem>Week 5</asp:ListItem>
                    <asp:ListItem>Week 6</asp:ListItem>
                    <asp:ListItem>Week 7</asp:ListItem>
                    <asp:ListItem>Week 8</asp:ListItem>
                    <asp:ListItem>Week 9</asp:ListItem>
                    <asp:ListItem>Week 10</asp:ListItem>
                    <asp:ListItem>Week 11</asp:ListItem>
                    <asp:ListItem>Week 12</asp:ListItem>
                    <asp:ListItem>Week 13</asp:ListItem>
                    <asp:ListItem>Week 14</asp:ListItem>
                    <asp:ListItem>Week 15</asp:ListItem>
                    <asp:ListItem>Week 16</asp:ListItem>
                    <asp:ListItem>Week 17</asp:ListItem>
                    <asp:ListItem>Week 18</asp:ListItem>
                    <asp:ListItem>Week 19</asp:ListItem>
            </asp:DropDownList>
        </span>
        <br />
        <br />
        <div style="width: 500px;">
            <span style="left: 200px; position: relative; font-family: verdana; font-size: small;
                text-align: center;">
                <asp:Label ID="lblWeekNotifier" runat="server" ForeColor="#990000"></asp:Label>
            </span>
            <br />
            <span id="scoreboard" style="left: 200px; position: relative; font-family: verdana;
                font-size: small;">
                <table>
                    <tr>
                        <td>
                        <asp:Repeater ID="rptrScoreBoard" runat="server">
                    <HeaderTemplate>
                        <table width="100%">
                            <tr>
                                <td>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table width="100%" style="border: thin groove Black;" frame="box">
                            <tr style="border: thin groove #000000; text-align: center;">
                                <td style="width: 100%; text-align: center; font-size: small; color: #990000; font-family: verdana;">
                                    A League
                                </td>
                            </tr>
                            <tr style="border: thin groove #000000;">
                                <td>
                                    <asp:Label ID="lblWinnerName" runat="server" Text='<%# Bind("TeamName") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblWinnerScore" runat="server" Text='<%# Bind("OwnScore") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr style="border: thin groove #000000;">
                                <td>
                                    <asp:Label ID="lblLooserName" runat="server" Text='<%# Bind("OpponentTeamName") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblLooserScore" runat="server" Text='<%# Bind("OpponentScore") %>'></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                    </ItemTemplate>
                    <FooterTemplate>
                        </td> </tr> </table>
                    </FooterTemplate>
                </asp:Repeater>
                        </td>
                        <td>
                        <asp:Repeater ID="rptrScoreBboard" runat="server">
                        <HeaderTemplate>
                        <table width="100%">
                            <tr>
                                <td>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table width="100%" style="border: thin groove Black;" frame="box">
                            <tr style="border: thin groove #000000; text-align: center;">
                                <td style="width: 100%; text-align: center; font-size: small; color: #990000; font-family: verdana;">
                                    B League
                                </td>
                            </tr>
                            <tr style="border: thin groove #000000;">
                                <td>
                                    <asp:Label ID="lblWinnerName" runat="server" Text='<%# Bind("TeamName") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblWinnerScore" runat="server" Text='<%# Bind("OwnScore") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr style="border: thin groove #000000;">
                                <td>
                                    <asp:Label ID="lblLooserName" runat="server" Text='<%# Bind("OpponentTeamName") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblLooserScore" runat="server" Text='<%# Bind("OpponentScore") %>'></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                    </ItemTemplate>
                    <FooterTemplate>
                        </td> </tr> </table>
                    </FooterTemplate>
                        </asp:Repeater>
                        </td>
                    </tr>
                </table>
                
            </span>
        </div>
    </div>
    </form>
</body>
</html>
