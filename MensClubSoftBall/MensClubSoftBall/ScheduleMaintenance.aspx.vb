Imports MensClubSoftBall.Model
Imports MensClubSoftBall.BLL
Partial Public Class ScheduleMaintenance
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
            Dim mySchedule As New Schedule
            If Not row Is Nothing Then
                If CType(row.FindControl("lblID"), Label).Text <> "" Then
                    'get id
                    mySchedule.id = CType(CType(row.FindControl("lblID"), Label).Text, Integer)
                    'fill another fields from row data
                    mySchedule.TeamId = CType(CType(row.FindControl("GdrpTeam"), DropDownList).SelectedValue, Integer)
                    mySchedule.OpponentTeamId = CType(CType(row.FindControl("GdrpOpponent"), DropDownList).SelectedValue, Integer)
                    mySchedule.HomeOrAway = CType(CType(row.FindControl("GdrpHA"), DropDownList).SelectedValue, String)
                    mySchedule.Dates = CType(CType(row.FindControl("GclndrDate"), Calendar).SelectedDate, DateTime).Date
                    mySchedule.FieldName = CType(CType(row.FindControl("GdrpFields"), DropDownList).SelectedValue, String)
                    mySchedule.timeValue = CType(CType(row.FindControl("GdrpTime"), DropDownList).SelectedValue, Integer)
                    'save subcategory GdrpTime
                    Dim id As Integer = ScheduleLogic.Save(mySchedule)
                End If


            End If
            'stop this event
            GridView1.EditIndex = -1
            GridView1.DataBind()
        Catch ex As Exception

        End Try


    End Sub

    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        Try
            Dim mySchedule As New Schedule
            mySchedule.Dates = Me.clndrDate.SelectedDate.Date
            mySchedule.FieldName = Me.drpField.SelectedItem.Text
            mySchedule.HomeOrAway = Me.drpHA.SelectedItem.Text
            mySchedule.OpponentTeamId = CType(Me.drpOpponent.SelectedValue, Integer)
            mySchedule.TeamId = CType(Me.drpTeamName.SelectedValue, Integer)
            mySchedule.timeValue = CType(Me.drpTime.SelectedValue, Integer)

            Dim id As Integer = ScheduleLogic.Save(mySchedule)
            'Me.clndrDate.SelectedDate = Date.Today

            GridView1.DataBind()

            'SCORE ENTRY
            Dim myScore As New Score
            myScore.Dates = mySchedule.Dates
            myScore.OpponentScore = Nothing
            myScore.OwnScore = Nothing
            myScore.TeamId = CType(Me.drpTeamName.SelectedValue, Integer)
            myScore.OpponentTeamId = CType(Me.drpOpponent.SelectedValue, Integer)
            If mySchedule.timeValue = 5 Then
                myScore.IsBye = True
            Else
                myScore.IsBye = False
            End If
            'Dim win As Boolean = False
            'If (myScore.OwnScore > myScore.OpponentScore) Then
            '    win = True
            'End If
            Dim index As Integer = ScoreLogic.Save(myScore)


        Catch ex As Exception

        End Try
        
    End Sub
End Class