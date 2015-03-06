
Partial Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If CBool(Session("login")) <> True Then

        Else
            Response.Redirect("Default.aspx")
        End If
        If Not Request.Cookies("userName") Is Nothing Then
            Dim aCookie As HttpCookie = Request.Cookies("userName")
            UserName.Text = Server.HtmlEncode(aCookie.Value)
        End If

    End Sub

    Protected Sub LoginButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LoginButton.Click
        ' Get Login Info
        If Password.Text.Length < 6 Then
            FailureText.Text = "Password must be 6 alpha-numeric characters"
            Exit Sub
        End If

        adsUsers.SelectCommand = "SELECT id, first_name, last_name, emp_number, is_admin, status, employee_status, userg_id FROM hr_users WHERE user_name='" + UserName.Text + "' AND user_password='" + Password.Text + "'"
        Dim dv As System.Data.DataView = adsUsers.Select(DataSourceSelectArguments.Empty)

        If dv.ToTable.Rows.Count < 1 Then
            FailureText.Text = "Login failed"
            Exit Sub
        End If

        Dim dr As System.Data.DataRow = dv.ToTable.Rows.Item(0)
        If dr.Item("status") = "Disabled" Then
            FailureText.Text = "The user is Disabled"
            Exit Sub
        End If

        ' add to the session vars
        For i As Integer = 0 To dr.ItemArray.Count - 1
            'Response.Write(dv.ToTable.Columns(i).ColumnName)
            'Response.Write(" = ")
            'Response.Write(dr.Item(i))
            'Response.Write("<br/>")
            Session(dv.ToTable.Columns(i).ColumnName) = dr.Item(i)
        Next
        If Session("emp_number").ToString <> "" Then
            adsUsers.SelectCommand = "SELECT emp_lastname, emp_firstname FROM hr_employee WHERE emp_number=" & Session("emp_number")
            dv = adsUsers.Select(DataSourceSelectArguments.Empty)
            dr = dv.ToTable.Rows.Item(0)
            Session("first_name") = dr.Item(1).ToString
            Session("last_name") = dr.Item(0).ToString
            'Response.Write(Session("emp_number").ToString)
        End If
        ' Set the flag for login
        Session("login") = "true"
        Session.Timeout = 10

        If RememberMe.Checked Then
            Response.Cookies("userName").Value = UserName.Text
            Response.Cookies("userName").Expires = DateTime.Now.AddDays(1)
        End If
        'Response.Write("Login success")

        Response.Redirect("Default.aspx?LOGIN_SUCCESS")
    End Sub
End Class
