Imports MensClubSoftBall.Model
Imports MensClubSoftBall.BLL
Partial Public Class NewTeam
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack <> True Then
            GridView1.DataBind()
        End If
    End Sub

    Protected Sub GridView1_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles GridView1.RowDeleted
        GridView1.DataBind()
    End Sub
    Protected Sub GridView1_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles GridView1.RowUpdated
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridView1.RowUpdating

        'get operated row
        Dim row As GridViewRow = GridView1.Rows(e.RowIndex)

        'new subcategory
        Dim myteam As New Model.Team
        If Not row Is Nothing Then
            If CType(row.FindControl("ElblID"), Label).Text <> "" Then
                'get id
                myteam.id = CType(CType(row.FindControl("ElblID"), Label).Text, Integer)
                'fill another fields from row data
                myteam.TeamName = CType(CType(row.FindControl("txtTeamName"), TextBox).Text, String)
                myteam.Division = CType(CType(row.FindControl("UpdatedrpDivision"), DropDownList).SelectedValue, String)
                'save subcategory
                Dim id As Integer = TeamLogic.Save(myteam)
            End If


        End If

        GridView1.EditIndex = -1
        GridView1.DataBind()

    End Sub


    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnAdd.Click
        Dim myteam As New Team

        myteam.TeamName = Me.txtTeamName.Text
        myteam.Division = Me.drpDivsion.SelectedItem.Text
        Dim retid As Integer = TeamLogic.Save(myteam)

        Me.txtTeamName.Text = ""
        GridView1.DataBind()
    End Sub
End Class