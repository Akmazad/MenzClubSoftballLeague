Imports MensClubSoftBall.Model
Imports MensClubSoftBall.BLL
Partial Public Class SchedulesByWeek
    Inherits System.Web.UI.Page
    Dim wholescheduleList As New ScheduleList
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack <> True Then

        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        Dim scheduledList As New ArrayList
        Dim s As String = Me.txtStartDate.Text.Replace("-", "/")
        Dim en As String = Me.txtEndDate.Text.Replace("-", "/")
        Me.tblGrid.Visible = True

        If s IsNot "" And en IsNot "" Then
            Dim startDate As DateTime = DateTime.Parse(s)
            Dim enddate As DateTime = DateTime.Parse(en)
            Dim diff As Integer = DateDiff(DateInterval.Day, startDate, enddate)

            If diff >= 0 Then

                wholescheduleList = ScheduleLogic.GetList("")

                For Each schedule As Schedule In wholescheduleList
                    Dim currentdate As DateTime = DateTime.Parse(schedule.Dates)

                    If DateDiff(DateInterval.Day, startDate, currentdate) <= diff Then
                        scheduledList.Add(schedule)
                    End If

                Next

                Me.lblDateSchedule.Text = "Schedules From: " & startDate.ToString("MMMM d, yyyy") & " - " & enddate.ToString("MMMM d, yyyy")
                Me.GridView1.DataSource = scheduledList
                Me.GridView1.DataBind()
            Else
                Response.Write("Error: Start Time is greater than End Time !!")
            End If

        End If

    End Sub
End Class