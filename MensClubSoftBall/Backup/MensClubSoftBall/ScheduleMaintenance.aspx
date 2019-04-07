<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="Site.Master" CodeBehind="ScheduleMaintenance.aspx.vb"
    Inherits="MensClubSoftBall.ScheduleMaintenance" Title="Schedule Maintenance"
    MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h2>
            ScheduleMaintenance</h2>
        <h1>
            New Schedule</h1>
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblDate" runat="server" Text="Date: "></asp:Label>
                </td>
                <td>
                    <asp:Calendar ID="clndrDate" runat="server"></asp:Calendar>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblTeamName" runat="server" Text="Team Name:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="drpTeamName" runat="server" DataSourceID="OBJDataOpponent"
                        DataTextField="TeamName" DataValueField="id">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblOpponent" runat="server" Text="Opponent:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="drpOpponent" runat="server" DataSourceID="OBJDataOpponent"
                        DataTextField="TeamName" DataValueField="id">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblField" runat="server" Text="Field:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="drpField" runat="server">
                        <asp:ListItem Enabled="true">Memorial (Bergenfield)</asp:ListItem>
                        <asp:ListItem Enabled="true">Roy Brown (Bergnfield)</asp:ListItem>
                        <asp:ListItem Enabled="true">Hickory (Bergnfield)</asp:ListItem>
                        <asp:ListItem Enabled="true">Mackay (Englewood)</asp:ListItem>
                        <asp:ListItem Enabled="true">Tryon 1 & 2 (Englewood)</asp:ListItem>
                        <asp:ListItem Enabled="true">Sagamore (Teaneck)</asp:ListItem>
                        <asp:ListItem Enabled="true">Terhune (Teaneck)</asp:ListItem>
                        <asp:ListItem Enabled="true">Ben Franklin (Teaneck)</asp:ListItem>
                        <asp:ListItem Enabled="true">Thomas Jefferson (Teaneck)</asp:ListItem>
                        <asp:ListItem Enabled="true">Votee - Middle (Teaneck)</asp:ListItem>
                        <asp:ListItem Enabled="true">Votee - New (Teaneck)</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblTime" runat="server" Text="Time: "></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="drpTime" runat="server">
                        <asp:ListItem Value="1">8:00 am</asp:ListItem>
                        <asp:ListItem Value="2">10:00 am</asp:ListItem>
                        <asp:ListItem Value="3">6:00 pm</asp:ListItem>
                        <asp:ListItem Value="4">8:00 pm</asp:ListItem>
                        <asp:ListItem Value="5">Bye</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblHA" runat="server" Text="Home/Away"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="drpHA" runat="server">
                        <asp:ListItem Enabled="true">Home</asp:ListItem>
                        <asp:ListItem Enabled="true">Away</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <asp:Button ID="btnAdd" runat="server" Text="Add Schedule" />
        <br />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="false" AllowSorting="True"
            AutoGenerateColumns="False" DataSourceID="ObjectDataSource2" DataKeyNames="id"
            BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px"
            CellPadding="3" GridLines="Horizontal" Width="100%">
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <Columns>
                <asp:TemplateField HeaderText="ScheduleId" SortExpression="id" Visible="false">
                    <ItemTemplate>
                        <center>
                            <asp:Label ID="lblID" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                        </center>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--this is date Field--%>
                <asp:TemplateField HeaderText="Date">
                    <EditItemTemplate>
                        <center>
                            <asp:Calendar ID="GclndrDate" runat="server" SelectedDate='<%# Bind("Dates") %>'>
                            </asp:Calendar>
                        </center>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <center>
                            <asp:Label ID="GlblDate" runat="server" Text='<%# Bind("FormatedDates") %>'></asp:Label>
                        </center>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--SelectedValue='<%# Bind("TeamName") %>' --%>
                <%--this is is Current Team--%>
                <asp:TemplateField HeaderText="Team" Visible="true">
                    <EditItemTemplate>
                        <center>
                            <asp:DropDownList ID="GdrpTeam" runat="server" DataSourceID="OBJDataOpponent" DataTextField="TeamName"
                                DataValueField="id" SelectedValue='<%# Bind("TeamId") %>'>
                            </asp:DropDownList>
                        </center>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <center>
                            <asp:Label ID="GlblTeam" runat="server" Text='<%# Bind("TeamName") %>'></asp:Label>
                        </center>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--SelectedValue='<%# Bind("TeamName") %>' --%>
                <%--this is Opponent --%>
                <asp:TemplateField HeaderText="Opponent" Visible="true">
                    <EditItemTemplate>
                        <center>
                            <asp:DropDownList ID="GdrpOpponent" runat="server" DataSourceID="OBJDataOpponent"
                                DataTextField="TeamName" DataValueField="id" SelectedValue='<%# Bind("OpponentTeamId") %>'>
                            </asp:DropDownList>
                        </center>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <center>
                            <asp:Label ID="GlblOpponent" runat="server" Text='<%# Bind("OpponentTeamName") %>'></asp:Label>
                        </center>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--this is Field names--%>
                <asp:TemplateField HeaderText="Fields" Visible="true">
                    <EditItemTemplate>
                        <center>
                            <asp:DropDownList ID="GdrpFields" runat="server" DataTextField="FieldName" DataValueField="FieldName">
                                <asp:ListItem Enabled="true">Memorial (Bergenfield)</asp:ListItem>
                                <asp:ListItem Enabled="true">Roy Brown (Bergnfield)</asp:ListItem>
                                <asp:ListItem Enabled="true">Hickory (Bergnfield)</asp:ListItem>
                                <asp:ListItem Enabled="true">Mackay (Englewood)</asp:ListItem>
                                <asp:ListItem Enabled="true">Tryon 1 & 2 (Englewood)</asp:ListItem>
                                <asp:ListItem Enabled="true">Sagamore (Teaneck)</asp:ListItem>
                                <asp:ListItem Enabled="true">Terhune (Teaneck)</asp:ListItem>
                                <asp:ListItem Enabled="true">Ben Franklin (Teaneck)</asp:ListItem>
                                <asp:ListItem Enabled="true">Thomas Jefferson (Teaneck)</asp:ListItem>
                                <asp:ListItem Enabled="true">Votee - Middle (Teaneck)</asp:ListItem>
                                <asp:ListItem Enabled="true">Votee - New (Teaneck)</asp:ListItem>
                            </asp:DropDownList>
                        </center>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <center>
                            <asp:Label ID="GlblField" runat="server" Text='<%# Bind("FieldName") %>'></asp:Label>
                        </center>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--this is Time--%>
                <asp:TemplateField HeaderText="Time">
                    <EditItemTemplate>
                        <center>
                            <asp:DropDownList ID="GdrpTime" runat="server" DataSourceID="objTime" DataTextField="Time"
                                DataValueField="id" SelectedValue='<%# Bind("timeValue") %>'>
                            </asp:DropDownList>
                        </center>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <center>
                            <asp:Label ID="GlblTime" runat="server" Text='<%# Bind("Time") %>'></asp:Label>
                        </center>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--this is Home/Away--%>
                <asp:TemplateField HeaderText="Home/Away">
                    <EditItemTemplate>
                        <center>
                            <asp:DropDownList ID="GdrpHA" runat="server" DataTextField="HomeOrAway" DataValueField="HomeOrAway">
                                <asp:ListItem>Home</asp:ListItem>
                                <asp:ListItem>Away</asp:ListItem>
                            </asp:DropDownList>
                        </center>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <center>
                            <asp:Label ID="GlblHA" runat="server" Text='<%# Bind("HomeOrAway") %>'></asp:Label>
                        </center>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--<asp:CommandField ShowEditButton="True" />--%>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <center>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                                Text="Delete" OnClientClick="return confirm('Warning: All Shcedule info will also be deleted. Ok?');"></asp:LinkButton>
                        </center>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <AlternatingRowStyle BackColor="#F7F7F7" />
        </asp:GridView>
        <%--this is opponent team datasource--%>
        <asp:ObjectDataSource ID="OBJDataOpponent" runat="server" DataObjectTypeName="MensClubSoftBall.Model.Team"
            DeleteMethod="Delete" InsertMethod="Save" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetList" TypeName="MensClubSoftBall.BLL.TeamLogic" UpdateMethod="Save">
        </asp:ObjectDataSource>
        <%--this is time datasource--%>
        <asp:ObjectDataSource ID="objTime" runat="server" DataObjectTypeName="MensClubSoftBall.Model.Time"
            SelectMethod="GetList" TypeName="MensClubSoftBall.BLL.TimeLogic"></asp:ObjectDataSource>
        <%--this is gridview datasource--%>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DataObjectTypeName="MensClubSoftBall.Model.Schedule"
            DeleteMethod="Delete" InsertMethod="Save" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetList" TypeName="MensClubSoftBall.BLL.ScheduleLogic" UpdateMethod="VoidSave"
            SortParameterName="sortExpression">
            <SelectParameters>
                <asp:Parameter DefaultValue="TeamName desc" Name="SortExpression" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
