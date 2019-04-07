<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="Site.Master" CodeBehind="NewTeam.aspx.vb"
    Inherits="MensClubSoftBall.NewTeam" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h2>
            NewTeam</h2>
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblTeamName" runat="server" Text="Team Name: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtTeamName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblDivision" runat="server" Text="Select Division:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="drpDivsion" runat="server">
                        <asp:ListItem>Division A</asp:ListItem>
                        <asp:ListItem>Division B</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <asp:Button ID="btnAdd" runat="server" Text="Add Team" />
        <br />
        <br />
        <br />
        <h2>
            Edit Team</h2>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="false" AllowSorting="True"
            AutoGenerateColumns="False" DataSourceID="ObjectDataSource2" DataKeyNames="id"
            BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px"
            CellPadding="3" GridLines="Horizontal" Width="100%">
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <Columns>
                <asp:TemplateField HeaderText="TeamId" Visible="false">
                    <EditItemTemplate>
                        <asp:Label ID="ElblID" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblID" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Team Name" >
                    <EditItemTemplate>
                        <asp:TextBox ID="txtTeamName" runat="server" MaxLength="50" Text='<%# Bind("TeamName") %>'
                            Width="180px"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblTeamName" runat="server" Text='<%# Bind("TeamName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Division" Visible="true">
                    <EditItemTemplate>
                        <asp:DropDownList ID="UpdatedrpDivision" runat="server" DataTextField="Division"
                            DataValueField="Division" SelectedValue='<%# Bind("Division") %>'>
                            <asp:ListItem>Division A</asp:ListItem>
                            <asp:ListItem>Division B</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblDivision" runat="server" Text='<%# Bind("Division") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="Delete" OnClientClick="return confirm('Warning: All team info will also be deleted. Ok?');"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <AlternatingRowStyle BackColor="#F7F7F7" />
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DataObjectTypeName="MensClubSoftBall.Model.Team"
            DeleteMethod="Delete" InsertMethod="Save" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetList" TypeName="MensClubSoftBall.BLL.TeamLogic" UpdateMethod="Save">
            <%--<SelectParameters>
                <asp:Parameter DefaultValue="TeamName desc" Name="SortExpression" Type="String" />
            </SelectParameters>--%>
        </asp:ObjectDataSource>
        <%--<asp:ObjectDataSource ID="ObjectDataSource3" runat="server" DataObjectTypeName="VMPConnectWeb.Model.SubCategories"
            SelectMethod="GetList" TypeName="VMPConnectWeb.BLL.CategoriesLogic" SortParameterName="SortExpression">
            
            <SelectParameters>
                <asp:Parameter DefaultValue="CategoryName desc" Name="SortExpression" Type="String" />
            </SelectParameters>
            
        </asp:ObjectDataSource>--%>
    </div>
</asp:Content>
