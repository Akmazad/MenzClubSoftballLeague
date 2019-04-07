Imports MensClubSoftBall.Model
Imports MensClubSoftBall.BLL
Partial Public Class StandingMaintenance
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
        Try

            'new subcategory
            Dim myStanding As New Standing
            If Not row Is Nothing Then
                If CType(row.FindControl("lblID"), Label).Text <> "" Then
                    'get id
                    myStanding.id = CType(CType(row.FindControl("lblID"), Label).Text, Integer)
                    'fill another fields from row data
                    myStanding.TeamId = CType(CType(row.FindControl("GdrpTeam"), DropDownList).SelectedValue, Integer)
                    'mySchedule.OpponentTeamName = CType(CType(row.FindControl("GdrpOpponent"), DropDownList).SelectedValue, String)
                    'mySchedule.HomeOrAway = CType(CType(row.FindControl("GdrpHA"), DropDownList).SelectedValue, String)
                    'mySchedule.DateTime = CType(CType(row.FindControl("GclndrDate"), Calendar).SelectedDate, DateTime)
                    'mySchedule.FieldName = CType(CType(row.FindControl("GdrpFields"), DropDownList).SelectedValue, String)
                    'mySchedule.Time = CType(row.FindControl("GtxtTime"), TextBox).Text

                    myStanding.Record = CType(row.FindControl("GtxtRecord"), TextBox).Text
                    myStanding.GMsBack = CType(row.FindControl("GtxtGMsBack"), TextBox).Text
                    myStanding.Streak = CType(row.FindControl("GtxtStreak"), TextBox).Text
                    myStanding.RunFor = CType(row.FindControl("GtxtRunFor"), TextBox).Text
                    myStanding.RunAgainst = CType(row.FindControl("GtxtRunAgainst"), TextBox).Text

                    'save subcategory
                    Dim id As Integer = StandingLogic.Save(myStanding)
                End If


            End If
            'stop this event
            GridView1.EditIndex = -1
            GridView1.DataBind()
        Catch ex As Exception

        End Try


    End Sub

    'Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click
    '    Dim myStanding As New Standing
    '    myStanding.TeamId = CType(Me.drpTeamName.SelectedValue, Integer)
    '    myStanding.Record = Me.txtRecord.Text
    '    myStanding.GMsBack = Int32.Parse(Me.txtGMsBack.Text)
    '    myStanding.Streak = Me.txtStreak.Text
    '    myStanding.RunFor = Int32.Parse(Me.txtRunFor.Text)
    '    myStanding.RunAgainst = Int32.Parse(Me.txtRunAgainst.Text)

    '    Dim indx = StandingLogic.Save(myStanding)
    '    'clear all the fields
    '    Me.txtGMsBack.Text = ""
    '    Me.txtRecord.Text = ""
    '    Me.txtRunAgainst.Text = ""
    '    Me.txtRunFor.Text = ""
    '    Me.txtStreak.Text = ""
    '    'bind gridview with newly added data
    '    GridView1.DataBind()
    'End Sub
End Class