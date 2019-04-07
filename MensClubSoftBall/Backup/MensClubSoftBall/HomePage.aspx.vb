Imports MensClubSoftBall.BLL
Imports MensClubSoftBall.Model
Partial Public Class HomePage
    Inherits System.Web.UI.Page

    Dim wholeScoreList As New ScoreList
    Dim startDate As String = ConfigurationManager.ConnectionStrings("initial").ToString()
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack <> True Then


            wholeScoreList = ScoreLogic.GetList("bla")
            If wholeScoreList IsNot Nothing Then
                Dim tempList As New ScoreList
                'extract for only this week
                For Each element In wholeScoreList
                    If (element.OwnScoreString <> "" And element.OpponentScoreString <> "") Then
                        Dim currentdt As DateTime = DateTime.Parse(element.Dates)
                        Dim sdate As DateTime = DateTime.Parse(startDate)
                        If DateDiff(DateInterval.Day, sdate, currentdt) < 7 And DateDiff(DateInterval.Day, sdate, currentdt) > 0 Then

                            If (element.OwnScore < element.OpponentScore) Then
                                Dim tempscore As Integer = element.OwnScore
                                Dim tempTeamName As String = element.TeamName
                                'change it
                                element.OwnScore = element.OpponentScore
                                element.TeamName = element.OpponentTeamName
                                element.OpponentScore = tempscore
                                element.OpponentTeamName = tempTeamName

                            End If
                            tempList.Add(element)
                        End If
                    End If
                    

                Next
                rptrScoreBoard.DataSource = tempList
                rptrScoreBoard.DataBind()
                Me.lblWeekNotifier.Text = "This Week - " & DateTime.Parse(startDate).ToString("MMMM d, yyyy") & " - Week 1"
            End If
        End If
    End Sub

    Protected Sub drpWeekBefore_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles drpWeekBefore.SelectedIndexChanged

        wholeScoreList = ScoreLogic.GetList("bla")
        Me.rptrScoreBoard.DataSource = Nothing
        Me.rptrScoreBoard.DataBind()

        Dim weekBefore As Integer = Me.drpWeekBefore.SelectedValue - 1
        If wholeScoreList IsNot Nothing Then
            Dim tempList As New ScoreList
            'extract for only this week
            For Each element In wholeScoreList
                If (element.OwnScoreString <> "" And element.OpponentScoreString <> "") Then
                    Dim currentdt As DateTime = DateTime.Parse(element.Dates)
                    Dim sdate As DateTime = DateTime.Parse(startDate).AddDays(weekBefore * 7)
                    If DateDiff(DateInterval.Day, sdate, currentdt) < 7 And DateDiff(DateInterval.Day, sdate, currentdt) > 0 Then

                        If (element.OwnScore < element.OpponentScore) Then
                            Dim tempscore As Integer = element.OwnScore
                            Dim tempTeamName As String = element.TeamName
                            'change it
                            element.OwnScore = element.OpponentScore
                            element.TeamName = element.OpponentTeamName
                            element.OpponentScore = tempscore
                            element.OpponentTeamName = tempTeamName

                        End If
                        tempList.Add(element)
                    End If

                End If
                
            Next
            rptrScoreBoard.DataSource = tempList
            rptrScoreBoard.DataBind()
            Me.lblWeekNotifier.Text = "This Week - " & DateTime.Parse(startDate).AddDays(weekBefore * 7).ToString("MMMM d, yyyy") & " - Week " & (weekBefore + 1)

        End If

    End Sub
End Class