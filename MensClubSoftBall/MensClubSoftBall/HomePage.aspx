<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="HomePage.aspx.vb" Inherits="MensClubSoftBall.HomePage" %>
<%@ Register src="MainMenu.ascx" tagname="MainMenu" tagprefix="MainMenu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css" media="screen">
        .scoreStyle
        {
            height: 200px;
            border-bottom-width: thick;
            border-bottom-style: dotted;
            border-bottom-color: Green;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <MainMenu:MainMenu ID="MainMenu1" runat="server" Visible="true"/>
    <br />
    <br />
    <br />
    <div width="366px;">
        <div id="WeekID" style="height: 431px; width: 366px; background-image: url('images/scoreboardBG.gif');
            background-repeat: no-repeat; font-family: Verdana; font-size: small; color: #800000;
            font-weight: lighter;">
            <br />
            <br />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span id="weekNotifier" style="top: -3px; position: relative;">
                <asp:Label ID="lblWeekNotifier" runat="server" Text="This week-" ForeColor="Black"></asp:Label></span>
            &nbsp;&nbsp; <span id="scoreboard" style="left: 20px; position: relative;">
                <asp:Repeater ID="rptrScoreBoard" runat="server">
                    <HeaderTemplate>
                        <table border="0" width="90%">
                            <tr>
                                <td>
                                    <b></b>
                                </td>
                                <td>
                                    <b></b>
                                </td>
                                <td>
                                    <b></b>
                                </td>
                                <td>
                                    <b></b>
                                </td>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:Label ID="lblWinnerName" runat="server" Text='<%# Bind("TeamName") %>' Font-Bold="true"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblWinnerScore" runat="server" Text='<%# Bind("OwnScore") %>' Font-Bold="true"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblLooserName" runat="server" Text='<%# Bind("OpponentTeamName") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblLooserScore" runat="server" Text='<%# Bind("OpponentScore") %>'></asp:Label>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </span><span style="top: 490px; position: fixed;"><span style="left: 25px; position: relative;">
                <asp:Label ID="lblWeekChange" runat="server" Text="Jump to Week"></asp:Label>
            </span><span style="left: 20px; position: relative;">
                <asp:DropDownList ID="drpWeekBefore" runat="server" AutoPostBack="True">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>13</asp:ListItem>
                    <asp:ListItem>14</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>16</asp:ListItem>
                    <asp:ListItem>17</asp:ListItem>
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem>19</asp:ListItem>
                </asp:DropDownList>
            </span>
            </span>
        </div>
    </div>
    </form>
</body>
</html>
