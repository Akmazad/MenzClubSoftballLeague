<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="Site.Master" CodeBehind="StandingMaintenance.aspx.vb"
    Inherits="MensClubSoftBall.StandingMaintenance" Title="Standing Maintenance" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h1>
            Standing Maintenance</h1>
        <%--<br />
        <br />
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblTeamName" runat="server" Text="Team Name: "></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="drpTeamName" runat="server" DataSourceID="OBJDataOpponent"
                        DataTextField="TeamName" DataValueField="id" >
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblRecord" runat="server" Text="Record: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtRecord" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblGMsBack" runat="server" Text="GMs Back: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtGMsBack" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblStreak" runat="server" Text="Streak: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtStreak" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblRunFor" runat="server" Text="Run For: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtRunFor" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblRunAgainst" runat="server" Text="Run Against: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtRunAgainst" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <asp:Button ID="btnAdd" runat="server" Text="Add Standing" />--%>
        
        <asp:GridView ID="GridView1" runat="server" AllowPaging="false" AllowSorting="True"
            AutoGenerateColumns="False" DataSourceID="ObjectDataSource2" DataKeyNames="id"
            BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px"
            CellPadding="3" GridLines="Horizontal" Width="100%">
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            
            <Columns>
                <asp:TemplateField HeaderText="StandingId" Visible="false">
                    
                    <ItemTemplate>
                        <asp:Label ID="lblID" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                                
                
                <%--this is is Current Team--%>
                <asp:TemplateField HeaderText="Team" Visible="true">
                    <EditItemTemplate>
                        <asp:DropDownList ID ="GdrpTeam" runat="server" DataSourceID="OBJDataOpponent" 
                        DataTextField ="TeamName" DataValueField = "id" SelectedValue='<%# Bind("TeamId") %>' ></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="GlblTeam" runat="server" Text='<%# Bind("TeamName") %>' ></asp:Label>
                    </ItemTemplate>
                 </asp:TemplateField>
                 
                 <%--SelectedValue='<%# Bind("TeamName") %>' --%>
                <%--this is Record Info --%>
                
                
                
                
                
                <%--this is Record--%>
                <asp:TemplateField HeaderText="Record" >
                    <EditItemTemplate>
                        <asp:TextBox ID="GtxtRecord" runat="server" MaxLength="50" Text='<%# Bind("Record") %>'
                            Width="180px"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="GlblRecord" runat="server" Text='<%# Bind("Record") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <%--this is GMsback--%>
                <asp:TemplateField HeaderText="GMs Back" >
                    <EditItemTemplate>
                        <asp:TextBox ID="GtxtGMsback" runat="server" MaxLength="50" Text='<%# Bind("GMsback") %>'
                            Width="180px"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="GlblGMsback" runat="server" Text='<%# Bind("GMsback") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <%--this is Streak--%>
                <asp:TemplateField HeaderText="Streak" >
                    <EditItemTemplate>
                        <asp:TextBox ID="GtxtStreak" runat="server" MaxLength="50" Text='<%# Bind("Streak") %>'
                            Width="180px"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="GlblStreak" runat="server" Text='<%# Bind("Streak") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <%--this is RunFor--%>
                <asp:TemplateField HeaderText="Run For" >
                    <EditItemTemplate>
                        <asp:TextBox ID="GtxtRunFor" runat="server" MaxLength="50" Text='<%# Bind("RunFor") %>'
                            Width="180px"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="GlblRunFor" runat="server" Text='<%# Bind("RunFor") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <%--this is RunAgainst--%>
                <asp:TemplateField HeaderText="Run Against" >
                    <EditItemTemplate>
                        <asp:TextBox ID="GtxtRunAgainst" runat="server" MaxLength="50" Text='<%# Bind("RunAgainst") %>'
                            Width="180px"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="GlblRunAgainst" runat="server" Text='<%# Bind("RunAgainst") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <%--this is Home/Away--%>
                <%--<asp:TemplateField HeaderText="Home/Away" SortExpression="Id">
                    <EditItemTemplate>
                        <asp:DropDownList ID ="GdrpHA" runat="server"  
                        DataTextField ="HomeOrAway" DataValueField = "HomeOrAway"   ><asp:ListItem>Home</asp:ListItem><asp:ListItem>Away</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="GlblHA" runat="server" Text='<%# Bind("HomeOrAway") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>--%>
                
                <%--<asp:CommandField ShowEditButton="True" />--%>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="Delete" OnClientClick="return confirm('Warning: All Standing info will also be deleted. Ok?');"></asp:LinkButton>
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
            SelectMethod="GetList" TypeName="MensClubSoftBall.BLL.TeamLogic"  UpdateMethod ="Save" >
        </asp:ObjectDataSource>
        
        <%--this is gridview datasource--%>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DataObjectTypeName="MensClubSoftBall.Model.Standing"
            DeleteMethod="Delete" InsertMethod="Save" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetList" TypeName="MensClubSoftBall.BLL.StandingLogic"  UpdateMethod ="VoidSave" SortParameterName="sortExpression">
            <SelectParameters>
                <asp:Parameter DefaultValue="TeamName desc" Name="SortExpression" Type="String" />
            </SelectParameters>
            
        </asp:ObjectDataSource>
    </div>
</asp:Content>
