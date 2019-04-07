Imports MensClubSoftBall.BLL
Imports MensClubSoftBall.Model
Partial Public Class Standings
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim wholeScorelist As New ScoreList
        Dim teamlist As New TeamList

        If Page.IsPostBack <> True Then
            wholeScorelist = ScoreLogic.GetList("bla")
            teamlist = TeamLogic.GetList()

            Dim divisionAlist As New StandingList
            Dim divisionBlist As New StandingList

            For Each team As Team In teamlist
                If team.Division.Trim() = "Division A" Then
                    Dim tempStanding As New Standing
                    'teamname
                    tempStanding.TeamName = TeamLogic.GetItem(team.id).TeamName.Trim()
                    'record
                    tempStanding.Record = GENERATESCORE(wholeScorelist, team.id)
                    'GMSBack
                    tempStanding.GMsBack = GENERATEGMSBACK(wholeScorelist, team.id, teamlist, "A")
                    'streak
                    tempStanding.Streak = GENERATESTREAK(wholeScorelist, team.id)
                    'runfor
                    tempStanding.RunFor = GENERATERUNFOR(wholeScorelist, team.id)
                    'runagainst
                    tempStanding.RunAgainst = GENERATERUNAGAINST(wholeScorelist, team.id)

                    divisionAlist.Add(tempStanding)
                ElseIf team.Division.Trim() = "Division B" Then
                    Dim tempStanding As New Standing
                    'teamname
                    tempStanding.TeamName = TeamLogic.GetItem(team.id).TeamName.Trim()
                    'record
                    tempStanding.Record = GENERATESCORE(wholeScorelist, team.id)
                    'GMSBack
                    tempStanding.GMsBack = GENERATEGMSBACK(wholeScorelist, team.id, teamlist, "B")
                    'streak
                    tempStanding.Streak = GENERATESTREAK(wholeScorelist, team.id)
                    'runfor
                    tempStanding.RunFor = GENERATERUNFOR(wholeScorelist, team.id)
                    'runagainst
                    tempStanding.RunAgainst = GENERATERUNAGAINST(wholeScorelist, team.id)

                    divisionBlist.Add(tempStanding)
                End If
            Next
            
            If divisionAlist IsNot Nothing Then
                Dim tempDivisionAlist As New StandingList
                tempDivisionAlist = GetsortedList(divisionAlist)
                GridView1.DataSource = tempDivisionAlist
                GridView1.DataBind()
            End If
            If divisionBlist IsNot Nothing Then
                Dim tempDivisionBlist As New StandingList
                tempDivisionBlist = GetsortedList(divisionBlist)
                GridView2.DataSource = tempDivisionBlist
                GridView2.DataBind()
            End If

        End If
    End Sub
    Private Function GetsortedList(ByVal list As StandingList) As StandingList

        Dim tempList As New StandingList
        Dim val As Integer = 65535
        Dim i As Integer
        Dim j As Integer

        For j = list.Count - 1 To 0 Step -1
            For i = 0 To j - 1
                If list.Item(i).GMsBack > list.Item(i + 1).GMsBack Then
                    Dim tempitem As New Standing
                    tempitem = list.Item(i)
                    list.Item(i) = list.Item(i + 1)
                    list.Item(i + 1) = tempitem
                ElseIf list.Item(i).GMsBack = list.Item(i + 1).GMsBack Then
                    If list.Item(i).Streak.StartsWith("L") And list.Item(i + 1).Streak.StartsWith("W") Then
                        Dim tempitem As New Standing
                        tempitem = list.Item(i)
                        list.Item(i) = list.Item(i + 1)
                        list.Item(i + 1) = tempitem
                    ElseIf list.Item(i).Streak.StartsWith("W") And list.Item(i + 1).Streak.StartsWith("W") Then
                        Dim s1 As String = list.Item(i).Streak
                        Dim s2 As String = list.Item(i + 1).Streak
                        Dim a As Integer = CType(s1.Replace("W", ""), Integer)
                        Dim b As Integer = CType(s2.Replace("W", ""), Integer)
                        If a < b Then
                            Dim tempitem As New Standing
                            tempitem = list.Item(i)
                            list.Item(i) = list.Item(i + 1)
                            list.Item(i + 1) = tempitem
                        End If

                    ElseIf list.Item(i).Streak.StartsWith("L") And list.Item(i + 1).Streak.StartsWith("L") Then
                        Dim s1 As String = list.Item(i).Streak
                        Dim s2 As String = list.Item(i + 1).Streak
                        Dim a As Integer = CType(s1.Replace("L", ""), Integer)
                        Dim b As Integer = CType(s2.Replace("L", ""), Integer)
                        If a > b Then
                            Dim tempitem As New Standing
                            tempitem = list.Item(i)
                            list.Item(i) = list.Item(i + 1)
                            list.Item(i + 1) = tempitem
                        End If
                    End If
                End If
            Next
        Next



        Return list
    End Function
    'Private Function getSortedBlist(ByVal list As StandingList) As StandingList
    '    Dim tempList As New StandingList
    '    Return tempList
    'End Function
    Private Function BestTeamDiff(ByVal teamList As TeamList, ByVal wholeScoreLists As ScoreList, ByVal division As String) As Integer
        Dim bestDiff As Integer = -65535


        For Each team As Team In teamList
            If team.Division = "Division " & division Then
                Dim winingTotal As Integer = 0
                Dim loosingTotal As Integer = 0

                For Each score As Score In wholeScoreLists
                    If score.TeamId = team.id Then
                        If score.OwnScore > score.OpponentScore Then
                            'win
                            winingTotal = winingTotal + 1
                        ElseIf score.OwnScore < score.OpponentScore Then
                            'lose
                            loosingTotal = loosingTotal + 1
                        End If
                    ElseIf score.OpponentTeamId = team.id Then
                        If score.OpponentScore > score.OwnScore Then
                            'win
                            winingTotal = winingTotal + 1
                        ElseIf score.OpponentScore < score.OwnScore Then
                            'lose
                            loosingTotal = loosingTotal + 1
                        End If
                    End If
                Next
                If winingTotal - loosingTotal > bestDiff Then
                    bestDiff = winingTotal - loosingTotal
                End If
            End If
        Next

        Return bestDiff
    End Function
    Private Function CurrentDiff(ByVal teamId As Integer, ByVal wholeScorelists As ScoreList) As Integer
        Dim currentdiffs As Integer


        Dim winingTotal As Integer = 0
        Dim loosingTotal As Integer = 0


        For Each score As Score In wholeScorelists
            If score.TeamId = teamId Then
                If score.OwnScore > score.OpponentScore Then
                    'win
                    winingTotal = winingTotal + 1
                ElseIf score.OwnScore < score.OpponentScore Then
                    'lose
                    loosingTotal = loosingTotal + 1
                End If
            ElseIf score.OpponentTeamId = teamId Then
                If score.OpponentScore > score.OwnScore Then
                    'win
                    winingTotal = winingTotal + 1
                ElseIf score.OpponentScore < score.OwnScore Then
                    'lose
                    loosingTotal = loosingTotal + 1
                End If
            End If
        Next
        currentdiffs = winingTotal - loosingTotal
        Return currentdiffs
    End Function

    Private Function GENERATESCORE(ByVal wholescorelist As ScoreList, ByVal teamId As Integer) As String
        Dim winingTotal As Integer = 0
        Dim loosingTotal As Integer = 0

        For Each score As Score In wholescorelist
            If score.TeamId = teamId Then
                If score.OwnScore > score.OpponentScore Then
                    'win
                    winingTotal = winingTotal + 1
                ElseIf score.OwnScore < score.OpponentScore Then
                    'lose
                    loosingTotal = loosingTotal + 1
                End If
            ElseIf score.OpponentTeamId = teamId Then
                If score.OpponentScore > score.OwnScore Then
                    'win
                    winingTotal = winingTotal + 1
                ElseIf score.OpponentScore < score.OwnScore Then
                    'lose
                    loosingTotal = loosingTotal + 1
                End If
            End If
        Next
        Dim s As String = winingTotal.ToString() & "-" & loosingTotal.ToString()
        Return s
    End Function
    Private Function GENERATEGMSBACK(ByVal wholescorelist As ScoreList, ByVal teamId As Integer, ByVal teamList As TeamList, ByVal division As String) As Double

        Dim bestdifference As Integer = BestTeamDiff(teamList, wholescorelist, division)
        Dim currentDifference As Integer
        currentDifference = CurrentDiff(teamId, wholescorelist)
        Dim value As Double = (bestdifference - currentDifference) / 2

        Return value
    End Function
    Private Function GENERATESTREAK(ByVal wholescorelist As ScoreList, ByVal teamId As Integer) As String
        Dim status As String = ""
        Dim winningCount As Integer = 0
        Dim loosingCount As Integer = 0

        Dim previousValue As String = ""
        Dim First As Boolean = True

        Dim getallList As New ScoreList
        getallList = ScoreLogic.GetListOrderByDate("")

        For Each element As Score In getallList
            If element.TeamId = teamId Then
                If element.OwnScore > element.OpponentScore Then
                    'win
                    If First Then
                        previousValue = "W1"
                        First = False
                    End If
                    If previousValue.StartsWith("W") Then
                        winningCount = winningCount + 1
                        status = "W" & winningCount.ToString()
                    Else
                        status = "W1"
                    End If

                ElseIf element.OwnScore < element.OpponentScore Then
                    'lose
                    If First Then
                        previousValue = "L1"
                        First = False
                    End If
                    If previousValue.StartsWith("L") Then
                        loosingCount = loosingCount + 1
                        status = "L" & loosingCount.ToString()
                    Else
                        status = "L1"
                    End If

                End If
            ElseIf element.OpponentTeamId = teamId Then
                If element.OpponentScore > element.OwnScore Then
                    'win
                    If First Then
                        previousValue = "W1"
                        First = False
                    End If
                    If previousValue.StartsWith("W") Then
                        winningCount = winningCount + 1
                        status = "W" & winningCount.ToString()
                    Else
                        status = "W1"
                    End If
                ElseIf element.OpponentScore < element.OwnScore Then
                    'lose
                    If First Then
                        previousValue = "L1"
                        First = False
                    End If
                    If previousValue.StartsWith("L") Then
                        loosingCount = loosingCount + 1
                        status = "L" & loosingCount.ToString()
                    Else
                        status = "L1"
                    End If
                End If
            End If
        Next
        Return status
    End Function
    Private Function GENERATERUNFOR(ByVal wholescorelist As ScoreList, ByVal teamId As Integer) As Integer
        Dim runfor As Integer = 0
        For Each element As Score In wholescorelist
            If element.TeamId = teamId Then
                runfor = runfor + element.OwnScore
            ElseIf element.OpponentTeamId = teamId Then
                runfor = runfor + element.OpponentScore
            End If
        Next
        Return runfor
    End Function
    Private Function GENERATERUNAGAINST(ByVal wholescorelist As ScoreList, ByVal teamId As Integer) As Integer
        Dim runagainst As Integer = 0
        For Each element As Score In wholescorelist
            If element.TeamId = teamId Then
                runagainst = runagainst + element.OpponentScore
            ElseIf element.OpponentTeamId = teamId Then
                runagainst = runagainst + element.OwnScore
            End If
        Next
        Return runagainst
    End Function

End Class