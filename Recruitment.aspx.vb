
Partial Class _Recruitment
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If CBool(Session("login")) <> True Then
            Response.Redirect("Login.aspx")
        End If
        ' the recruitment module is mod001
        Dim moduleRights As String = Session("MOD008")

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
            Case "Job Vacancies"
                MultiView1.ActiveViewIndex = 0
                ' this is really to check the table for the data
                ' then is the data present load into fields
                If Request.QueryString("id") = "" Then
                    Dim defaultSQL = adsJobVacancy.SelectCommand
                    adsJobVacancy.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_job_vacancy'"
                    Dim dv As System.Data.DataView = adsJobVacancy.Select(DataSourceSelectArguments.Empty)
                    Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
                    Dim jobvac_count As Integer = CInt(dr.Item(0))
                    adsJobVacancy.SelectCommand = defaultSQL
                    dv = adsJobVacancy.Select(DataSourceSelectArguments.Empty)

                    If jobvac_count = 0 Then
                        If moduleRight(0) = "1" Then
                            ' addition is allowed
                            newJobVacID.Value = jobvac_count + 1
                            frmJobVacancy.Rows(0).Cells(0).InnerText = "Add Vacancy"
                            btnJobVacEditSave.Text = "Save"
                            jobVacancy()
                            frmJobVacancies.Visible = False

                            frmJobVacancy.Visible = True
                        Else
                            ' addition is not allowed
                            MultiView1.ActiveViewIndex = 2
                        End If

                    Else
                        If moduleRight(3) = "1" Then
                            ' viewing is allowed
                            frmJobVacancies.Visible = True
                            frmJobVacancy.Visible = False
                            If moduleRight(2) = "1" Then
                                ' deletion is allowed
                            Else
                                ' deletion is not allowed
                                btnJobVacDelete.Enabled = False
                            End If
                            If moduleRight(0) = "1" Then
                                ' addtion is allowed
                            Else
                                ' addtion is not allowed
                                btnJobVacAdd.Enabled = False
                            End If

                        Else
                            ' viewing is not allowed
                            MultiView1.ActiveViewIndex = 2
                        End If

                    End If
                Else
                    If moduleRight(3) = "1" Then
                        ' viewing is allowed

                        editJobVacID.Value = Request.QueryString("id")
                        adsJobVacancy.SelectCommand = "SELECT hr_job_vacancy.jobtit_code, hr_employee.emp_lastname, hr_employee.emp_firstname, hr_job_vacancy.active, hr_job_vacancy.description FROM (hr_job_vacancy INNER JOIN hr_employee ON hr_job_vacancy.manager_id = hr_employee.emp_number) WHERE (hr_job_vacancy.vacancy_id = " & editJobVacID.Value & ")"
                        'Response.Write(adsJobVacancy.SelectCommand)
                        Dim dv As System.Data.DataView = adsJobVacancy.Select(DataSourceSelectArguments.Empty)
                        Dim dr As System.Data.DataRow = dv.ToTable.Rows.Item(0)
                        cmbJobTitle.SelectedValue = dr.Item(0).ToString
                        txtHiringManager.Text = dr.Item(2).ToString + " " + dr.Item(1).ToString
                        chkActive.Checked = CBool(CInt(dr.Item(3)))
                        txtJobDescription.Text = dr.Item(4).ToString

                        frmJobVacancy.Rows(0).Cells(0).InnerText = "Edit Vacancy"
                        btnJobVacEditSave.Text = "Edit"
                        jobVacancy()
                        If moduleRight(1) = "1" Then
                            ' editing is allowed
                        Else
                            ' editing is not allowed
                            btnJobVacEditSave.Enabled = False
                        End If
                    Else
                        ' viewing is not allowed
                        MultiView1.ActiveViewIndex = 2
                    End If
                End If
            Case "Applicants"
                MultiView1.ActiveViewIndex = 1
                ' this is really to check the table for the data
                ' then is the data present load into fields
                'If Request.QueryString("id") = "" Then
                '    Dim defaultSQL = adsJobApplication.SelectCommand
                '    adsJobApplication.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_users'"
                '    Dim dv As System.Data.DataView = adsJobApplication.Select(DataSourceSelectArguments.Empty)
                '    Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
                '    Dim usr_count As Integer = CInt(dr.Item(0))
                '    adsJobApplication.SelectCommand = defaultSQL
                '    dv = adsJobApplication.Select(DataSourceSelectArguments.Empty)

                '    If usr_count = 0 Then
                '        If moduleRight(0) = "1" Then
                '            ' addition is allowed
                '            newAdminUserID.Value = "USR00" & usr_count + 1
                '            AdminUserCode.Visible = False
                '            passwordRow.Visible = True
                '            btnHRAdminUsersEditSave.Text = "Save"
                '            hrAdminUser()
                '            frmHRAdminUsers.Visible = False

                '            frmAdminUsers.Visible = True
                '        Else
                '            ' addition is not allowed
                '            MultiView1.ActiveViewIndex = 4
                '        End If

                '    Else
                '        If moduleRight(3) = "1" Then
                '            ' viewing is allowed
                '            frmHRAdminUsers.Visible = True
                '            frmAdminUsers.Visible = False
                '            If moduleRight(2) = "1" Then
                '                ' deletion is allowed
                '            Else
                '                ' deletion is not allowed
                '                btnHRAdminUserDelete.Enabled = False
                '            End If
                '            If moduleRight(0) = "1" Then
                '                ' addtion is allowed
                '            Else
                '                ' addtion is not allowed
                '                btnHRAdminUserAdd.Enabled = False
                '            End If

                '        Else
                '            ' viewing is not allowed
                '            MultiView1.ActiveViewIndex = 4
                '        End If

                '    End If
                'Else
                '    If moduleRight(3) = "1" Then
                '        ' viewing is allowed

                '        editHRAdminUserID.Text = Request.QueryString("id")
                '        adsJobApplication.SelectCommand = "SELECT user_name, emp_number, status, userg_id FROM hr_users WHERE id='" + editHRAdminUserID.Text + "'"
                '        Dim dv As System.Data.DataView = adsJobApplication.Select(DataSourceSelectArguments.Empty)
                '        Dim dr As System.Data.DataRow = dv.ToTable.Rows.Item(0)
                '        txtAdminUserName.Text = dr.Item(0).ToString
                '        txtHiringManager.Text = dr.Item(1).ToString
                '        cmbAdminUserStatus.SelectedValue = dr.Item(2).ToString
                '        cmbAdminUserGroup.SelectedValue = dr.Item(3).ToString

                '        AdminUserCode.Visible = True
                '        passwordRow.Visible = False
                '        btnHRAdminUsersEditSave.Text = "Edit"
                '        hrAdminUser()
                '        If moduleRight(1) = "1" Then
                '            ' editing is allowed
                '        Else
                '            ' editing is not allowed
                '            btnHRAdminUsersEditSave.Enabled = False
                '        End If
                '    Else
                '        ' viewing is not allowed
                '        MultiView1.ActiveViewIndex = 4
                '    End If
                'End If
            Case Else

        End Select

    End Sub

    Public Sub jobVacancy()
        If btnJobVacEditSave.Text = "Save" Then
            cmbJobTitle.Enabled = True
            txtHiringManager.Enabled = True
            txtJobDescription.Enabled = True
            chkActive.Enabled = True
        ElseIf btnJobVacEditSave.Text = "Edit" Then
            cmbJobTitle.Enabled = False
            txtHiringManager.Enabled = False
            txtJobDescription.Enabled = False
            chkActive.Enabled = False
        End If
    End Sub

    Protected Sub btnJobVacEditSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnJobVacEditSave.Click
        If sender.Text = "Save" Then
            If newJobVacID.Value <> "" Then
                ' insert a new vacancy
                Dim arrEmp() = Split(txtHiringManager.Text, " ")
                Dim emp_number = CInt(arrEmp(0))
                adsJobVacancy.InsertParameters("@manager_id").DefaultValue = emp_number.ToString
                'Response.Write(adsJobVacancy.InsertCommand)
                If adsJobVacancy.Insert() > 0 Then
                    Dim lastID As Integer = newJobVacID.Value
                    adsJobVacancy.UpdateCommand = "UPDATE hr_unique_id SET last_id =" + lastID.ToString + "  WHERE table_name='hr_job_vacancy'"
                    adsJobVacancy.Update()
                End If
                Response.Redirect("Recruitment.aspx?Page=Job Vacancy&id=" + newJobVacID.Value)
            ElseIf editJobVacID.Value <> "" Then
                Dim jobVacActive, manager_id As Integer
                If chkActive.Checked Then
                    jobVacActive = 1
                End If
                manager_id = Left(txtHiringManager.Text, 3)
                adsJobVacancy.UpdateCommand = "UPDATE hr_job_vacancy SET jobtit_code ='" + cmbJobTitle.SelectedValue + "', manager_id =" & manager_id & ", active =" & jobVacActive & ", description = '" + txtJobDescription.Text + "' WHERE vacancy_id=" & editJobVacID.Value
                ' update the record
                'Response.Write(adsJobVacancy.UpdateCommand)
                If adsJobVacancy.Update() > 0 Then
                    sender.Text = "Edit"
                    jobVacancy()
                End If
            End If
            'Response.Redirect("Users.aspx?Page=HR Admin Users")
        ElseIf sender.Text = "Edit" Then
            sender.Text = "Save"
            jobVacancy()
        End If
    End Sub

    Protected Sub btnJobVacAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnJobVacAdd.Click
        adsJobVacancy.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_job_vacancy'"
        Dim dv As System.Data.DataView = adsJobVacancy.Select(DataSourceSelectArguments.Empty)
        Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
        Dim jobvac_count As Integer = CInt(dr.Item(0))

        newJobVacID.Value = jobvac_count + 1
        frmJobVacancy.Rows(0).Cells(0).InnerText = "Add Vacancy"
        btnJobVacEditSave.Text = "Save"
        jobVacancy()
        frmJobVacancies.Visible = False
        frmJobVacancy.Visible = True
    End Sub
End Class
