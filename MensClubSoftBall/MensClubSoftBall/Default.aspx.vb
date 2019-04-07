Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Login1_LoggingIn(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.LoginCancelEventArgs) Handles Login1.LoggingIn
        If (Me.Login1.UserName = "Admin" And Me.Login1.Password = "admin") Then
            Response.Redirect("NewTeam.aspx")
        Else

        End If

    End Sub
End Class