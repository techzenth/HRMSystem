
Partial Class _EmailNotification
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Dim config As System.Configuration.Configuration
        'config = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration(Nothing)
        Dim mailHost As String = ConfigurationManager.AppSettings("MailHost").ToString
        Dim mailPort As String = ConfigurationManager.AppSettings("MailPort").ToString
        Dim smtpAuth As String = ConfigurationManager.AppSettings("SMTPAuth").ToString
        Dim smtpUser As String = ConfigurationManager.AppSettings("SMTPUser").ToString
        Dim smtpPassword As String = ConfigurationManager.AppSettings("SMTPPassword").ToString
        Dim secureConn As String = ConfigurationManager.AppSettings("SecureConn").ToString
        Dim fromEmail As String = ConfigurationManager.AppSettings("FromEmail").ToString

        If fromEmail <> "" Then
            txtFromEmail.Text = fromEmail
            emailNotification()
        End If

        If mailHost <> "" Then
            txtSMTPHost.Text = mailHost
        End If

        If mailPort <> "" Then
            txtSMTPPort.Text = mailPort
        End If

        If smtpAuth = "No" Then
            rdoYesNo.Items(0).Selected = True
        ElseIf smtpAuth = "Yes" Then
            rdoYesNo.Items(1).Selected = True
        End If

        txtSMTPUser.Text = smtpUser
        txtSMTPPassword.Text = smtpPassword

        If secureConn = "No" Then
            rdoNoSSLTLS.Items(0).Selected = True
        ElseIf secureConn = "SSL" Then
            rdoNoSSLTLS.Items(1).Selected = True
        ElseIf secureConn = "TLS" Then
            rdoNoSSLTLS.Items(2).Selected = True
        End If

    End Sub

    Public Sub emailNotification()
        If btnMailConfigEditSave.Text = "Save" Then
            txtFromEmail.Enabled = True
            txtSMTPHost.Enabled = True
            txtSMTPPort.Enabled = True
            rdoYesNo.Enabled = True
            txtSMTPUser.Enabled = True
            txtSMTPPassword.Enabled = True
            rdoNoSSLTLS.Enabled = True
            chkSendTestEmail.Enabled = True
            txtTestEmailAddress.Enabled = True
        ElseIf btnMailConfigEditSave.Text = "Edit" Then
            txtFromEmail.Enabled = False
            txtSMTPHost.Enabled = False
            txtSMTPPort.Enabled = False
            rdoYesNo.Enabled = False
            txtSMTPUser.Enabled = False
            txtSMTPPassword.Enabled = False
            rdoNoSSLTLS.Enabled = False
            chkSendTestEmail.Enabled = False
            txtTestEmailAddress.Enabled = False
        End If
    End Sub

    Protected Sub btnMailConfigEditSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMailConfigEditSave.Click
        If sender.Text = "Save" Then
            ConfigurationManager.AppSettings("MailHost") = txtSMTPHost.Text
            ConfigurationManager.AppSettings("MailPort") = txtSMTPPort.Text
            ConfigurationManager.AppSettings("SMTPAuth") = rdoYesNo.SelectedValue
            ConfigurationManager.AppSettings("SMTPUser") = txtSMTPUser.Text
            ConfigurationManager.AppSettings("SMTPPassword") = txtSMTPPassword.Text
            ConfigurationManager.AppSettings("SecureConn") = rdoNoSSLTLS.SelectedValue
            ConfigurationManager.AppSettings("FromEmail") = txtFromEmail.Text
        ElseIf sender.Text = "Edit" Then
            sender.Text = "Save"
            emailNotification()
        End If
    End Sub
End Class
