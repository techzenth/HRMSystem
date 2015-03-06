
Partial Class main
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If CBool(Session("login")) = True Then

            LoginName.Text = Session("first_name").ToString
            LoginName.Text &= " " + Session("last_name").ToString

            If Session("is_admin") = "Yes" Then
                ' hide employee self service menu
                mnuESS.Visible = False
                ' show hr admin menu
                mnuNav.Visible = True
            Else
                ' show employee self service menu
                mnuESS.Visible = True
                ' hide hr admin menu
                mnuNav.Visible = False
            End If

            If CBool(Session("rights")) <> True Or Session("is_admin") = "Yes" Then
                adsRights.SelectCommand = "SELECT mod_id, addition, editing, deletion, viewing FROM hr_rights WHERE userg_id = '" + Session("userg_id").ToString + "'"
                Dim dv As System.Data.DataView = adsRights.Select(DataSourceSelectArguments.Empty)


                For i As Integer = 0 To dv.ToTable.Rows.Count - 1
                    Dim dr As System.Data.DataRow = dv.ToTable.Rows.Item(i)
                    Dim userRights As String = ""
                    For x As Integer = 1 To dr.ItemArray.Count - 1
                        userRights = userRights + dr.Item(x).ToString + "|"
                        'Response.Write(dr.Item(0).ToString + " = " + dr.Item(x).ToString + "|")
                    Next
                    Session(dr.Item(0)) = Left(userRights, userRights.Length - 1)
                    'Response.Write(Session(dr.Item(0)))
                    'Response.Write("<br/>")
                Next
                ' all session rights set 
                Session("rights") = "True"
            End If
            If Request.QueryString("Page") <> "" Then
                Page.Title = Page.Title & " - " & Request.QueryString("Page")
            End If
            If Session("Message") <> "" Then
                Message.Text = Session("Message")
                Session("Message") = ""
                statusMsg.Visible = True
            End If
        Else
            Response.Redirect("Login.aspx")
        End If
    End Sub
End Class

