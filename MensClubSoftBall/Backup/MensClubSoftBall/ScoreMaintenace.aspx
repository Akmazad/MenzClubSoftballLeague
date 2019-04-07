<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="Site.Master" CodeBehind="ScoreMaintenace.aspx.vb"
    Inherits="MensClubSoftBall.ScoreMaintenace" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h2>
            Score Maintenance</h2>
            
        <%--<table>
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
                    <asp:DropDownList ID="drpTeamName" runat="server" 
                        DataSourceID="OBJDataOpponent" DataTextField="TeamName" 
                        DataValueField="id">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Label ID="lblOwnScore" runat="server" Text="Score: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtOwnScore" runat="server"></asp:TextBox>
                </td>
            </tr>
            
            <tr>
                <td>
                    <asp:Label ID="lblOpponent" runat="server" Text="Opponent:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="drpOpponent" runat="server" 
                        DataSourceID="OBJDataOpponent" DataTextField="TeamName" 
                        DataValueField="id">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Label ID="lblOpponentScore" runat="server" Text="Score: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtOpponentScore" runat="server"></asp:TextBox>
                </td>
            </tr>
            
        </table>
        <br />
        
        <asp:Button ID="btnAdd" runat="server" Text="Add Score" />
        <br />
        <br />
        <br />--%>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="false" AllowSorting="True"
            AutoGenerateColumns="False" DataSourceID="ObjectDataSource2" DataKeyNames="id"
            BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px"
            CellPadding="3" GridLines="Horizontal" Width="100%">
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            
            <Columns>
                <asp:TemplateField HeaderText="ScoreId" Visible="false">
                    
                    <ItemTemplate>
                        <asp:Label ID="lblID" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <%--this is date Field--%>
                <asp:TemplateField HeaderText="Date" >
                    <EditItemTemplate>
                        <asp:Calendar ID="GclndrDate" runat="server" SelectedDate='<%# Bind("Dates") %>'></asp:Calendar>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="GlblDate" runat="server" Text='<%# Bind("Dates") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                
                <%--this is is Current Team--%>
                <asp:TemplateField HeaderText="Team" Visible="true">
                    <EditItemTemplate>
                        <asp:DropDownList ID ="GdrpTeam" runat="server" DataSourceID="OBJDataOpponent" 
                        DataTextField ="TeamName" DataValueField = "id"  SelectedValue='<%# Bind("TeamId") %>'></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="GlblTeam" runat="server" Text='<%# Bind("TeamName") %>' ></asp:Label>
                    </ItemTemplate>
                 </asp:TemplateField>
                 
                <%--this is OwnScore--%>
                <asp:TemplateField HeaderText="Own Score" Visible="true">
                    <EditItemTemplate>
                        <asp:TextBox ID="GtxtOwnScore" runat="server" Text='<%# Bind("OwnScore") %>' ></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="GlblOwnScore" runat="server" Text='<%# Bind("OwnScoreString") %>' ></asp:Label>
                    </ItemTemplate>
                 </asp:TemplateField> 
                 
                 <%--this is OpponentScore--%>
                <asp:TemplateField HeaderText="Opponent Score" Visible="true">
                    <EditItemTemplate>
                        <asp:TextBox ID="GtxtOpponentScore" runat="server" Text='<%# Bind("OpponentScore") %>' ></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="GlblOpponentScore" runat="server" Text='<%# Bind("OpponentScoreString") %>' ></asp:Label>
                    </ItemTemplate>
                 </asp:TemplateField> 
                 
                <%--this is Opponent --%>
                <asp:TemplateField HeaderText="Opponent" Visible="true">
                    <EditItemTemplate>
                        <asp:DropDownList ID ="GdrpOpponent" runat="server" DataSourceID="OBJDataOpponent" 
                        DataTextField ="TeamName" DataValueField = "id"  SelectedValue='<%# Bind("OpponentTeamId") %>'></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="GlblOpponent" runat="server" Text='<%# Bind("OpponentTeamName") %>' ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:CheckBoxField DataField="IsBye" HeaderText="IsBye" />
                
                
                <asp:CommandField ShowEditButton="True" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="Delete" OnClientClick="return confirm('Warning: All Score info will also be deleted. Ok?');"></asp:LinkButton>
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
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DataObjectTypeName="MensClubSoftBall.Model.Score"
            DeleteMethod="Delete" InsertMethod="Save" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetList" TypeName="MensClubSoftBall.BLL.ScoreLogic"  UpdateMethod ="VoidSave" SortParameterName="sortExpression">
            <SelectParameters>
                <asp:Parameter DefaultValue="TeamName desc" Name="SortExpression" Type="String" />
            </SelectParameters>
            
        </asp:ObjectDataSource>
    </div>
</asp:Content>
