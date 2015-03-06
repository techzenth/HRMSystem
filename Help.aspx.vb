
Partial Class _Help
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If CBool(Session("login")) <> True Then
            Response.Redirect("Login.aspx")
        End If
        ' the admin module is mod001
        Dim moduleRights As String = Session("MOD001")
        'Response.Write(moduleRights)
        Dim moduleRight() As String = moduleRights.Split("|")

        If moduleRight(0) = "1" Then
            'Response.Write("Addition to db allowed")
        Else
            'Response.Write("Addition to db not allowed")
        End If

        If moduleRight(1) = "1" Then
            'Response.Write("Editing to db allowed")
        Else
            'Response.Write("Editing to db not allowed")
        End If

        If moduleRight(2) = "1" Then
            'Response.Write("Deletion to db allowed")
        Else
            'Response.Write("Deletion to db not allowed")
        End If

        If moduleRight(3) = "1" Then
            'Response.Write("Viewing to db allowed")
        Else
            'Response.Write("Viewing to db not allowed")
        End If

        If Page.IsPostBack Then Exit Sub

        Select Request.QueryString("Page")
            Case "Help Contents"
                MultiView1.ActiveViewIndex = 0
            Case "Support"
                MultiView1.ActiveViewIndex = 1
        End Select

    End Sub
End Class
