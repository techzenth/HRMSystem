
Partial Class _Import_Export
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack Then Exit Sub

        Select Case Request.QueryString("Page")
            Case "Define Custom Export"
                MultiView1.ActiveViewIndex = 0
                ' this is really to check the table for the data
                ' then is the data present load into fields

            Case "Export"
                MultiView1.ActiveViewIndex = 1
                ' this is really to check the table for the data
                ' then is the data present load into fields
            Case "Define Custom Import"
                MultiView1.ActiveViewIndex = 2
                ' this is really to check the table for the data
                ' then is the data present load into fields
            Case "Import"
                MultiView1.ActiveViewIndex = 3
                ' this is really to check the table for the data
                ' then is the data present load into fields

            Case Else

        End Select
    End Sub
End Class
