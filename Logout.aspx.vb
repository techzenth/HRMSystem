
Partial Class Logout
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' unset session values
        Session.Abandon()
        ' send to login page
        Response.Redirect("Default.aspx")
    End Sub
End Class
