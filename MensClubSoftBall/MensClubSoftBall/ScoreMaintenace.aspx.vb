Imports MensClubSoftBall.Model
Imports MensClubSoftBall.BLL
Partial Public Class ScoreMaintenace
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
            Dim myScore As New Score
            If Not row Is Nothing Then
                If CType(row.FindControl("lblID"), Label).Text <> "" Then
                    'get id
                    myScore.id = CType(CType(row.FindControl("lblID"), Label).Text, Integer)
                    'fill another fields from row data
                    myScore.TeamId = CType(CType(row.FindControl("GdrpTeam"), DropDownList).SelectedValue, Integer)
                    myScore.OpponentTeamId = CType(CType(row.FindControl("GdrpOpponent"), DropDownList).SelectedValue, Integer)
                    'mySchedule.HomeOrAway = CType(CType(row.FindControl("GdrpHA"), DropDownList).SelectedValue, String)
                    myScore.Dates = CType(CType(row.FindControl("GclndrDate"), Calendar).SelectedDate, DateTime).Date
                    'mySchedule.FieldName = CType(CType(row.FindControl("GdrpFields"), DropDownList).SelectedValue, String)
                    'mySchedule.Time = CType(row.FindControl("GtxtTime"), TextBox).Text
                    myScore.OwnScore = CType(row.FindControl("GtxtOwnScore"), TextBox).Text
                    myScore.OpponentScore = CType(row.FindControl("GtxtOpponentScore"), TextBox).Text
                    myScore.IsBye = CType(row.Cells(6).Controls(0), CheckBox).Checked
                    'save subcategory
                    Dim id As Integer = ScoreLogic.Save(myScore)

                    'STANDING SECTION HERE  
                    'Dim win As Boolean = False
                    'If myScore.OwnScore > myScore.OpponentScore Then
                    '    win = True
                    'End If


                    'If win Then
                    '    CurrentTeamStanding(myScore.OwnScore, myScore.OpponentScore, myScore.TeamId, True)
                    '    OpponentTeamStanding(myScore.OpponentScore, myScore.OwnScore, myScore.OpponentTeamId, False)
                    'Else
                    '    CurrentTeamStanding(myScore.OwnScore, myScore.OpponentScore, myScore.TeamId, False)
                    '    OpponentTeamStanding(myScore.OpponentScore, myScore.OwnScore, myScore.OpponentTeamId, True)
                    'End If

                End If


            End If
            'stop this event
            GridView1.EditIndex = -1
            GridView1.DataBind()
        Catch ex As Exception

        End Try


    End Sub
    'Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnAdd.Click
    '    Dim myScore As New Score
    '    myScore.Dates = Me.clndrDate.SelectedDate.Date
    '    myScore.OpponentScore = Int32.Parse(Me.txtOpponentScore.Text)
    '    myScore.OwnScore = Int32.Parse(Me.txtOwnScore.Text)
    '    myScore.TeamId = CType(Me.drpTeamName.SelectedValue, Integer)
    '    myScore.OpponentTeamId = CType(Me.drpOpponent.SelectedValue, Integer)

    '    Dim win As Boolean = False
    '    If (myScore.OwnScore > myScore.OpponentScore) Then
    '        win = True
    '    End If

    '    Dim index As Integer = ScoreLogic.Save(myScore)

    '    GridView1.DataBind()

    '    'STANDING SECTION HERE
    '    If win Then
    '        CurrentTeamStanding(myScore.OwnScore, myScore.OpponentScore, myScore.TeamId, True)
    '        
    '    Else
    '        
    '    End If


    'End Sub
    Private Function FindBestTeam() As Standing
        Dim bestTeam As New Standing
        Dim wholelist As New StandingList
        wholelist = StandingLogic.GetList("")
        Dim diff As Integer = -65535
        For Each element As Standing In wholelist
            Dim sarray(2) As String
            sarray = element.Record.Split("-")
            Dim tempdiff As Integer = Int32.Parse(sarray(0)) - Int32.Parse(sarray(1))
            If tempdiff > diff Then
                diff = tempdiff
                bestTeam = element
            End If
        Next
        Return bestTeam
    End Function
    Private Sub updateALLGMSBack()
        Dim wholelist As New StandingList
        wholelist = StandingLogic.GetList("")
        If wholelist IsNot Nothing Then
            'get the best diff
            Dim diff As Integer = -65535
            For Each element As Standing In wholelist
                Dim sarray(2) As String
                sarray = element.Record.Split("-")
                Dim tempdiff As Integer = Int32.Parse(sarray(0)) - Int32.Parse(sarray(1))
                If tempdiff > diff Then
                    diff = tempdiff
                End If
            Next

            'update all gmsback
            For Each element As Standing In wholelist
                Dim sarray(2) As String
                sarray = element.Record.Split("-")
                Dim tempdiff As Integer = Int32.Parse(sarray(0)) - Int32.Parse(sarray(1))
                element.GMsBack = (diff - tempdiff) / 2
                Dim ii As Integer = StandingLogic.Save(element)
            Next
        End If

    End Sub
    Private Sub CurrentTeamStanding(ByVal OwnScore As Integer, ByVal OpponentScore As Integer, ByVal TeamId As Integer, ByVal win As Boolean)
        Dim wholeStandingList As New StandingList
        wholeStandingList = StandingLogic.GetList("")

        If wholeStandingList Is Nothing Then
            'insert first team entry
            Dim myStanding As New Standing
            myStanding.TeamId = TeamId

            If win Then
                myStanding.Record = "1-0"
                myStanding.Streak = "W1"
                myStanding.GMsBack = 0.0
            Else
                myStanding.Record = "0-1"
                myStanding.Streak = "L1"
                myStanding.GMsBack = -1.0
            End If

            myStanding.RunFor = OwnScore
            myStanding.RunAgainst = OpponentScore
            Dim firstId As Integer = StandingLogic.Save(myStanding)

        Else
            Dim bestTeam As New Standing
            bestTeam = FindBestTeam()
            Dim sarry(2) As String
            sarry = bestTeam.Record.Split("-")
            Dim bestDiff As Integer = Int32.Parse(sarry(0)) - Int32.Parse(sarry(1))


            Dim currentTeam As New Standing
            currentTeam = StandingLogic.GetItemByTeamId(TeamId)

            If currentTeam IsNot Nothing Then
                Dim updatedStanding As New Standing

                updatedStanding.id = currentTeam.id
                'calculate currentTeam's record values
                Dim sCurrent(2) As String
                sCurrent = currentTeam.Record.Split("-")
                If win Then
                    sCurrent(0) = (Int32.Parse(sCurrent(0)) + 1).ToString()
                Else
                    sCurrent(1) = (Int32.Parse(sCurrent(1) + 1)).ToString()
                End If
                updatedStanding.Record = (sCurrent(0) & "-" & sCurrent(1))
                Dim currentDiff As Integer = Int32.Parse(sCurrent(0)) - Int32.Parse(sCurrent(1))
                'update streak
                If win Then
                    If currentTeam.Streak.StartsWith("L") Then
                        updatedStanding.Streak = "W1"
                    ElseIf currentTeam.Streak.StartsWith("W") Then
                        Dim value As String = currentTeam.Streak.Replace("W", "")
                        Dim winingCount As Integer = Int32.Parse(value)
                        winingCount = winingCount + 1
                        updatedStanding.Streak = "W" & winingCount.ToString()

                    End If
                Else
                    If currentTeam.Streak.StartsWith("W") Then
                        updatedStanding.Streak = "L1"
                    ElseIf currentTeam.Streak.StartsWith("L") Then
                        Dim value As String = currentTeam.Streak.Replace("L", "")
                        Dim loosingCount As Integer = Int32.Parse(value)
                        loosingCount = loosingCount + 1
                        updatedStanding.Streak = "L" & loosingCount.ToString()
                    End If
                End If

                'update runfor
                updatedStanding.RunFor = currentTeam.RunFor + OwnScore
                'update runagainst
                updatedStanding.RunAgainst = currentTeam.RunAgainst + OpponentScore
                'update Gmsback
                If win Then
                    If currentTeam.TeamId <> bestTeam.TeamId Then
                        updatedStanding.GMsBack = (bestDiff - currentDiff) / 2
                    End If
                Else
                    If currentTeam.TeamId <> bestTeam.TeamId Then
                        updatedStanding.GMsBack = (bestDiff - currentDiff) / 2
                    End If
                End If

                updatedStanding.TeamId = currentTeam.TeamId
                Dim iii As Integer = StandingLogic.Save(updatedStanding)
                'UPDATE ALL GMSBACK
                updateALLGMSBack()

            Else
                Dim newStanding As New Standing
                newStanding.TeamId = TeamId
                If win Then
                    newStanding.Record = "1-0"
                    newStanding.Streak = "W1"
                    'calculate gmsback
                    Dim currentDiff As Integer = 1
                    newStanding.GMsBack = (bestDiff - currentDiff) / 2
                Else
                    newStanding.Record = "0-1"
                    newStanding.Streak = "L1"
                    'calculate gmsback
                    Dim currentDiff As Integer = -1
                    newStanding.GMsBack = (bestDiff - currentDiff) / 2
                End If
                newStanding.RunFor = OwnScore
                newStanding.RunAgainst = OpponentScore
                Dim tempid As Integer = StandingLogic.Save(newStanding)
            End If
        End If
    End Sub
    Private Sub OpponentTeamStanding(ByVal OwnScore As Integer, ByVal OpponentScore As Integer, ByVal TeamId As Integer, ByVal win As Boolean)
        Dim wholeStandingList As New StandingList
        wholeStandingList = StandingLogic.GetList("")

        If wholeStandingList Is Nothing Then
            'insert first team entry
            Dim myStanding As New Standing
            myStanding.TeamId = TeamId

            If win Then
                myStanding.Record = "1-0"
                myStanding.Streak = "W1"
                myStanding.GMsBack = 0.0
            Else
                myStanding.Record = "0-1"
                myStanding.Streak = "L1"
                myStanding.GMsBack = -1.0
            End If

            myStanding.RunFor = OwnScore
            myStanding.RunAgainst = OpponentScore
            Dim firstId As Integer = StandingLogic.Save(myStanding)

        Else
            Dim bestTeam As New Standing
            bestTeam = FindBestTeam()
            Dim sarry(2) As String
            sarry = bestTeam.Record.Split("-")
            Dim bestDiff As Integer = Int32.Parse(sarry(0)) - Int32.Parse(sarry(1))


            Dim currentTeam As New Standing
            currentTeam = StandingLogic.GetItemByTeamId(TeamId)

            If currentTeam IsNot Nothing Then
                Dim updatedStanding As New Standing

                updatedStanding.id = currentTeam.id
                'calculate currentTeam's record values
                Dim sCurrent(2) As String
                sCurrent = currentTeam.Record.Split("-")
                If win Then
                    sCurrent(0) = (Int32.Parse(sCurrent(0)) + 1).ToString()
                Else
                    sCurrent(1) = (Int32.Parse(sCurrent(1) + 1)).ToString()
                End If
                updatedStanding.Record = (sCurrent(0) & "-" & sCurrent(1))
                Dim currentDiff As Integer = Int32.Parse(sCurrent(0)) - Int32.Parse(sCurrent(1))
                'update streak
                If win Then
                    If currentTeam.Streak.StartsWith("L") Then
                        updatedStanding.Streak = "W1"
                    ElseIf currentTeam.Streak.StartsWith("W") Then
                        Dim value As String = currentTeam.Streak.Replace("W", "")
                        Dim winingCount As Integer = Int32.Parse(value)
                        winingCount = winingCount + 1
                        updatedStanding.Streak = "W" & winingCount.ToString()

                    End If
                Else
                    If currentTeam.Streak.StartsWith("W") Then
                        updatedStanding.Streak = "L1"
                    ElseIf currentTeam.Streak.StartsWith("L") Then
                        Dim value As String = currentTeam.Streak.Replace("L", "")
                        Dim loosingCount As Integer = Int32.Parse(value)
                        loosingCount = loosingCount + 1
                        updatedStanding.Streak = "L" & loosingCount.ToString()
                    End If
                End If

                'update runfor
                updatedStanding.RunFor = currentTeam.RunFor + OwnScore
                'update runagainst
                updatedStanding.RunAgainst = currentTeam.RunAgainst + OpponentScore
                'update Gmsback
                If win Then
                    If currentTeam.TeamId <> bestTeam.TeamId Then
                        updatedStanding.GMsBack = (bestDiff - currentDiff) / 2
                    End If
                Else
                    If currentTeam.TeamId <> bestTeam.TeamId Then
                        updatedStanding.GMsBack = (bestDiff - currentDiff) / 2
                    End If
                End If

                updatedStanding.TeamId = currentTeam.TeamId
                Dim iii As Integer = StandingLogic.Save(updatedStanding)
                'UPDATE ALL GMSBACK
                updateALLGMSBack()

            Else
                Dim newStanding As New Standing
                newStanding.TeamId = TeamId
                If win Then
                    newStanding.Record = "1-0"
                    newStanding.Streak = "W1"
                    'calculate gmsback
                    Dim currentDiff As Integer = 1
                    newStanding.GMsBack = (bestDiff - currentDiff) / 2
                Else
                    newStanding.Record = "0-1"
                    newStanding.Streak = "L1"
                    'calculate gmsback
                    Dim currentDiff As Integer = -1
                    newStanding.GMsBack = (bestDiff - currentDiff) / 2
                End If
                newStanding.RunFor = OwnScore
                newStanding.RunAgainst = OpponentScore
                Dim tempid As Integer = StandingLogic.Save(newStanding)
            End If
        End If
    End Sub
End Class