
Partial Class Default2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If CBool(Session("login")) <> True Then
            Response.Redirect("Login.aspx")
        End If
        ' the admin module is mod002
        Dim moduleRights As String = Session("MOD002")

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

        ' removes the dependents menu item
        mnuPersonal.Items.RemoveAt(3)
        ' removes the immigration menu item
        mnuPersonal.Items.RemoveAt(3)

        mnuEmployment.Items.RemoveAt(1)
        mnuEmployment.Items.RemoveAt(1)
        mnuEmployment.Items.RemoveAt(1)

        Dim defaultSQL = adsEmployee.SelectCommand
        adsEmployee.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_employee'"
        Dim dv As System.Data.DataView = adsEmployee.Select(DataSourceSelectArguments.Empty)
        Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
        Dim emp_count As Integer = CInt(dr.Item(0))
        adsEmployee.SelectCommand = defaultSQL
        dv = adsEmployee.Select(DataSourceSelectArguments.Empty)

        If Request.QueryString("id") <> "" And Request.QueryString("picture") <> "" Then
            adsPhotograph.SelectParameters("@emp_number").DefaultValue = CStr(Request.QueryString("id"))
            dv = adsPhotograph.Select(DataSourceSelectArguments.Empty)
            dr = dv.ToTable.Rows(0)
            Response.Clear()
            Response.ContentType = dr.Item("epic_type").ToString
            Response.OutputStream.Write(CType(dr.Item("epic_picture"), Byte()), 0, CInt(dr.Item("epic_file_size")))
            Response.End()
        End If

        Select Case Request.QueryString("Page")
            Case "Employee List"
                MultiView1.ActiveViewIndex = 0
                ' this is really to check the table for the data
                ' then is the data present load into fields
                If emp_count = 0 Then
                    Response.Redirect("Employee.aspx?Page=Add Employee")
                End If
            Case "Add Employee"
                MultiView1.ActiveViewIndex = 1
                ' this is really to check the table for the data
                ' then is the data present load into fields
                If moduleRight(0) = "1" Then
                    ' addition is allowed

                    If emp_count < 10 Then
                        txtPIMCode.Text = "000" & emp_count + 1
                    ElseIf emp_count < 100 Then
                        txtPIMCode.Text = "00" & emp_count + 1
                    ElseIf emp_count < 1000 Then
                        txtPIMCode.Text = "0" & emp_count + 1
                    Else
                        txtPIMCode.Text = emp_count + 1
                    End If

                    newEmpNumber.Value = emp_count + 1
                Else
                    ' addition is not allowed
                    MultiView1.ActiveViewIndex = 3
                End If
            Case "Edit Employee"
                MultiView1.ActiveViewIndex = 2
                ' this is really to check the table for the data
                ' then is the data present load into fields
                If moduleRight(3) = "1" Then
                    ' viewing is allowed
                    If Request.QueryString("id") <> "" Then
                        editEmpNumber.Value = Request.QueryString("id")
                        adsEmployeeList.SelectCommand = "SELECT emp_lastname, emp_firstname, emp_middle_name  FROM hr_employee WHERE emp_number=" & editEmpNumber.Value
                        dv = adsEmployeeList.Select(DataSourceSelectArguments.Empty)
                        dr = dv.ToTable.Rows.Item(0)
                        lblEmpName.Text = dr.Item(1).ToString & " " & dr.Item(2).ToString & " " & dr.Item(0).ToString

                        dv = adsPhotograph.Select(DataSourceSelectArguments.Empty)
                        If dv.ToTable.Rows.Count > 0 Then
                            dr = dv.ToTable.Rows.Item(0)
                            imgEmpPicture.ImageUrl = "Employee.aspx?picture=" & dr.Item("epic_filename").ToString & "&id=" & editEmpNumber.Value
                        End If
                        mnuPersonal.Items(0).NavigateUrl = "~/Employee.aspx?Page=Edit Employee&Info=Personal Details&id=" & editEmpNumber.Value
                        mnuPersonal.Items(1).NavigateUrl = "~/Employee.aspx?Page=Edit Employee&Info=Contact Details&id=" & editEmpNumber.Value
                        mnuPersonal.Items(2).NavigateUrl = "~/Employee.aspx?Page=Edit Employee&Info=Emergency Contact&id=" & editEmpNumber.Value
                        'mnuPersonal.Items(3).NavigateUrl = "~/Employee.aspx?Page=Edit Employee&Info=Dependents&id=" & editEmpNumber.Value
                        'mnuPersonal.Items(4).NavigateUrl = "~/Employee.aspx?Page=Edit Employee&Info=Immigration&id=" & editEmpNumber.Value
                        mnuPersonal.Items(3).NavigateUrl = "~/Employee.aspx?Page=Edit Employee&Info=Photograph&id=" & editEmpNumber.Value

                        mnuEmployment.Items(0).NavigateUrl = "Employee.aspx?Page=Edit Employee&Info=Job&id=" & editEmpNumber.Value
                        'mnuEmployment.Items(1).NavigateUrl = "Employee.aspx?Page=Edit Employee&Info=Salary&id=" & editEmpNumber.Value
                        'mnuEmployment.Items(2).NavigateUrl = "Employee.aspx?Page=Edit Employee&Info=Tax Exemptions&id=" & editEmpNumber.Value
                        'mnuEmployment.Items(3).NavigateUrl = "Employee.aspx?Page=Edit Employee&Info=Direct Desposit&id=" & editEmpNumber.Value
                        mnuEmployment.Items(1).NavigateUrl = "Employee.aspx?Page=Edit Employee&Info=Report-to&id=" & editEmpNumber.Value

                        Select Case Request.QueryString("Info")
                            Case "Personal Details"
                                mvwEmployee.ActiveViewIndex = 0

                                adsEmployee.SelectCommand = "SELECT employee_id, emp_lastname, emp_firstname, emp_middle_name, emp_nick_name, emp_smoker, ethnic_race_code, emp_birthday, nation_code, emp_gender, emp_marital_status, emp_ssn_num, emp_sin_num, emp_other_id, emp_dri_lice_num, emp_military_service, emp_dri_lice_exp_date FROM hr_employee WHERE emp_number=" & editEmpNumber.Value
                                dv = adsEmployee.Select(DataSourceSelectArguments.Empty)
                                dr = dv.ToTable.Rows.Item(0)

                                txtEmpCode.Text = dr.Item(0).ToString
                                txtLastName.Text = dr.Item(1).ToString
                                txtFirstName.Text = dr.Item(2).ToString
                                txtMiddleName.Text = dr.Item(3).ToString

                                txtNickName.Text = dr.Item(4).ToString
                                chkSmoker.Checked = CBool(CInt(dr.Item(5).ToString))

                                If dr.Item(6).ToString <> "" Then
                                    cmbEthnicRace.SelectedValue = dr.Item(6).ToString
                                End If

                                If dr.Item(7).ToString <> "" Then
                                    txtDOB.Text = FormatDateTime(CDate(dr.Item(7).ToString), DateFormat.ShortDate)
                                End If

                                If dr.Item(8).ToString <> "" Then
                                    cmbNationality.SelectedValue = dr.Item(8).ToString
                                End If

                                If dr.Item(9).ToString = "0" Then
                                    rdoGender.SelectedValue = "Male"
                                Else
                                    rdoGender.SelectedValue = "Female"
                                End If

                                If dr.Item(10).ToString <> "" Then
                                    cmbMartialStatus.SelectedValue = dr.Item(10).ToString
                                End If
                                txtTRNNo.Text = dr.Item(11).ToString
                                txtNISNo.Text = dr.Item(12).ToString
                                txtOtherID.Text = dr.Item(13).ToString
                                txtDriversLicense.Text = dr.Item(14).ToString
                                txtMilitaryService.Text = dr.Item(15).ToString
                                If dr.Item(16).ToString <> "" Then
                                    txtLicenseExpiryDate.Text = FormatDateTime(CDate(dr.Item(16).ToString), DateFormat.ShortDate)
                                End If

                                btnPersonalDetailsEditSave.Text = "Edit"
                                personalDetails()
                            Case "Contact Details"
                                mvwEmployee.ActiveViewIndex = 1

                                adsEmployeeContact.SelectCommand = "SELECT emp_street1, emp_street2, city_code, coun_code, provin_code, emp_zip_code, emp_hm_telephone, emp_mobile, emp_work_telephone, emp_work_email, emp_oth_email FROM hr_employee WHERE emp_number=" & editEmpNumber.Value
                                'Response.Write(adsEmployeeContact.SelectCommand)
                                dv = adsEmployeeContact.Select(DataSourceSelectArguments.Empty)
                                dr = dv.ToTable.Rows.Item(0)

                                txtStreet1.Text = dr.Item(0).ToString
                                txtStreet2.Text = dr.Item(1).ToString
                                txtCityTown.Text = dr.Item(2).ToString
                                If dr.Item(3).ToString <> "" Then
                                    cmbCountries.SelectedValue = dr.Item(3).ToString
                                End If
                                txtStateProvince.Text = dr.Item(4).ToString
                                txtZIPCode.Text = dr.Item(5).ToString
                                txtHomeTelephone.Text = dr.Item(6).ToString
                                txtMobile.Text = dr.Item(7).ToString
                                txtWorkTelephone.Text = dr.Item(8).ToString
                                txtWorkEmail.Text = dr.Item(9).ToString
                                txtOtherEmail.Text = dr.Item(10).ToString

                                btnContactDetailsEditSave.Text = "Edit"
                                contactDetails()
                            Case "Emergency Contact"
                                mvwEmployee.ActiveViewIndex = 2
                                If Request.QueryString("contact") <> "" Then
                                    editEmergencyContactNo.Value = Request.QueryString("contact")
                                    adsEmployeeList.SelectCommand = "SELECT eec_name, eec_relationship, eec_home_no, eec_mobile_no, eec_office_no FROM hr_emp_emergency_contacts WHERE emp_number = " & editEmpNumber.Value & " AND eec_seqno=" & editEmergencyContactNo.Value
                                    dv = adsEmployeeList.Select(DataSourceSelectArguments.Empty)
                                    dr = dv.ToTable.Rows.Item(0)

                                    txtContactName.Text = dr.Item(0).ToString
                                    txtContactRelationship.Text = dr.Item(1).ToString
                                    txtContactHomeTelephone.Text = dr.Item(2).ToString
                                    txtContactMobile.Text = dr.Item(3).ToString
                                    txtContactWorkTelephone.Text = dr.Item(4).ToString

                                End If
                                dv = adsEmergencyContact.Select(DataSourceSelectArguments.Empty)
                                Dim emer_count As Integer = dv.ToTable.Rows.Count

                                If emer_count = 0 Then
                                    assignedEmergencyContacts0.Visible = False
                                    assignedEmergencyContacts1.Visible = False
                                    assignedEmergencyContacts2.Visible = False
                                Else
                                    assignedEmergencyContacts0.Visible = True
                                    assignedEmergencyContacts1.Visible = True
                                    assignedEmergencyContacts2.Visible = True
                                End If

                            Case "Dependents"
                                mvwEmployee.ActiveViewIndex = 3

                            Case "Immigration"
                                mvwEmployee.ActiveViewIndex = 4
                            Case "Photograph"
                                mvwEmployee.ActiveViewIndex = 5
                                dv = adsPhotograph.Select(DataSourceSelectArguments.Empty)
                                If dv.ToTable.Rows.Count > 0 Then
                                    dr = dv.ToTable.Rows.Item(0)
                                    imgEmpPhotograph.ImageUrl = "Employee.aspx?picture=" & dr.Item("epic_filename").ToString & "&id=" & editEmpNumber.Value
                                End If
                            Case "Job"
                                mvwEmployee.ActiveViewIndex = 6
                                dv = adsEmployeeJob.Select(DataSourceSelectArguments.Empty)
                                dr = dv.ToTable.Rows.Item(0)
                                If dr.Item(0).ToString <> "" Then
                                    cmbJobTitle.SelectedValue = dr.Item(0).ToString
                                End If
                                If dr.Item(1).ToString <> "" Then
                                    cmbEmploymentStatus.SelectedValue = dr.Item(1).ToString
                                End If

                                If dr.Item(3).ToString <> "" Then
                                    txtJoinedDate.Text = FormatDateTime(dr.Item(3), DateFormat.ShortDate).ToString
                                End If

                                If dr.Item(2).ToString <> "" Then
                                    cmbEEOCategory.SelectedValue = dr.Item(2).ToString
                                End If

                                'dv = adsJobSpecInfo.Select(DataSourceSelectArguments.Empty)

                                'dr = dv.ToTable.Rows.Item(0)
                                'lblJobSpecification.Text = dr.Item(0).ToString
                                'lblJobDuties.Text = dr.Item(1).ToString

                                btnJobEditSave.Text = "Edit"
                                employmentJob()
                            Case "Salary"
                                mvwEmployee.ActiveViewIndex = 7
                            Case "Tax Exemptions"
                                mvwEmployee.ActiveViewIndex = 8
                            Case "Direct Deposit"
                                mvwEmployee.ActiveViewIndex = 9
                            Case "Report-to"
                                mvwEmployee.ActiveViewIndex = 10

                            Case Else

                        End Select
                    End If
                Else
                    ' viewing is not allowed
                    MultiView1.ActiveViewIndex = 3
                End If
            Case Else

        End Select
    End Sub

    Public Sub personalDetails()
        If btnPersonalDetailsEditSave.Text = "Save" Then
            txtEmpCode.Enabled = True
            txtLastName.Enabled = True
            txtFirstName.Enabled = True
            txtMiddleName.Enabled = True
            txtNickName.Enabled = True
            txtTRNNo.Enabled = True
            txtNISNo.Enabled = True
            cmbNationality.Enabled = True
            txtDOB.Enabled = True
            txtOtherID.Enabled = True
            cmbMartialStatus.Enabled = True
            chkSmoker.Enabled = True
            rdoGender.Enabled = True
            txtDriversLicense.Enabled = True
            txtLicenseExpiryDate.Enabled = True
            txtMilitaryService.Enabled = True
            cmbEthnicRace.Enabled = True
            btnBirthDate.Enabled = True
            btnExpiryDate.Enabled = True
        ElseIf btnPersonalDetailsEditSave.Text = "Edit" Then
            txtEmpCode.Enabled = False
            txtLastName.Enabled = False
            txtFirstName.Enabled = False
            txtMiddleName.Enabled = False
            txtNickName.Enabled = False
            txtTRNNo.Enabled = False
            txtNISNo.Enabled = False
            cmbNationality.Enabled = False
            txtDOB.Enabled = False
            txtOtherID.Enabled = False
            cmbMartialStatus.Enabled = False
            chkSmoker.Enabled = False
            rdoGender.Enabled = False
            txtDriversLicense.Enabled = False
            txtLicenseExpiryDate.Enabled = False
            txtMilitaryService.Enabled = False
            cmbEthnicRace.Enabled = False
            btnBirthDate.Enabled = False
            btnExpiryDate.Enabled = False
        End If
    End Sub

    Public Sub contactDetails()
        If btnContactDetailsEditSave.Text = "Save" Then
            cmbCountries.Enabled = True
            txtStreet1.Enabled = True
            txtStreet2.Enabled = True
            txtCityTown.Enabled = True
            txtStateProvince.Enabled = True
            txtZIPCode.Enabled = True
            txtHomeTelephone.Enabled = True
            txtMobile.Enabled = True
            txtWorkTelephone.Enabled = True
            txtWorkEmail.Enabled = True
            txtOtherEmail.Enabled = True
        ElseIf btnContactDetailsEditSave.Text = "Edit" Then
            cmbCountries.Enabled = False
            txtStreet1.Enabled = False
            txtStreet2.Enabled = False
            txtCityTown.Enabled = False
            txtStateProvince.Enabled = False
            txtZIPCode.Enabled = False
            txtHomeTelephone.Enabled = False
            txtMobile.Enabled = False
            txtWorkTelephone.Enabled = False
            txtWorkEmail.Enabled = False
            txtOtherEmail.Enabled = False
        End If
    End Sub

    Public Sub employmentJob()
        If btnJobEditSave.Text = "Save" Then
            cmbJobTitle.Enabled = True
            cmbEmploymentStatus.Enabled = True
            cmbEEOCategory.Enabled = True
            txtJoinedDate.Enabled = True
            btnJoinedDate.Enabled = True
            txtSubdivison.Enabled = True
        ElseIf btnJobEditSave.Text = "Edit" Then
            cmbJobTitle.Enabled = False
            cmbEmploymentStatus.Enabled = False
            cmbEEOCategory.Enabled = False
            txtJoinedDate.Enabled = False
            btnJoinedDate.Enabled = False
            txtSubdivison.Enabled = False
        End If
    End Sub

    Protected Sub btnAddEmpSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddEmpSave.Click
        'MultiView1.ActiveViewIndex = 2
        'txtEmpCode.Text = txtPIMCode.Text
        'txtLastName.Text = txtPIMLastName.Text
        'txtFirstName.Text = txtPIMFirstName.Text
        'txtMiddleName.Text = txtPIMMiddleName.Text
        'txtNickName.Text = txtPIMNickName.Text
        'lblEmpName.Text = txtFirstName.Text & " " & txtLastName.Text
        If adsEmployee.Insert() > 0 Then
            adsEmployee.UpdateCommand = "UPDATE hr_unique_id SET last_id =" + newEmpNumber.Value + "  WHERE table_name='hr_employee'"
            adsEmployee.Update()
            If filePIMPicture.HasFile Then
                Dim emp_picture As HttpPostedFile = filePIMPicture.PostedFile
                'emp_picture.ContentType
                'adsPhotograph.InsertCommand = ""
                adsPhotograph.InsertParameters("@epic_filename").DefaultValue = CStr(emp_picture.FileName)
                adsPhotograph.InsertParameters("@epic_type").DefaultValue = CStr(emp_picture.ContentType)
                adsPhotograph.InsertParameters("@epic_file_size").DefaultValue = CStr(emp_picture.ContentLength)
                adsPhotograph.Insert()
                'Response.Write(adsPhotograph.InsertCommand)
            End If
            Response.Redirect("Employee.aspx?Page=Edit Employee&Info=Personal Details&id=" & CInt(txtPIMCode.Text).ToString)
        End If
    End Sub


    Protected Sub btnEmployeeAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEmployeeAdd.Click
        Response.Redirect("Employee.aspx?Page=Add Employee")
    End Sub

    Protected Sub btnPersonalDetailsEditSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPersonalDetailsEditSave.Click
        If sender.Text = "Save" Then
            Dim smoker, gender As Integer
            If chkSmoker.Checked Then
                smoker = 1
            Else
                smoker = 0
            End If

            If rdoGender.SelectedValue = "Male" Then
                gender = 0
            Else
                gender = 1
            End If
            adsEmployee.UpdateCommand = "UPDATE hr_employee SET emp_lastname ='" + txtLastName.Text + "', emp_firstname ='" + txtFirstName.Text + "', emp_middle_name ='" + txtMiddleName.Text + "', emp_nick_name ='" + txtNickName.Text + "', emp_smoker =" & smoker & ", ethnic_race_code ='" + cmbEthnicRace.SelectedValue + "', emp_birthday ='" & txtDOB.Text & "', nation_code ='" + cmbNationality.SelectedValue + "', emp_gender =" & gender & ", emp_marital_status ='" + cmbMartialStatus.SelectedValue + "', emp_ssn_num ='" + txtTRNNo.Text + "', emp_sin_num ='" + txtNISNo.Text + "', emp_other_id ='" + txtOtherID.Text + "', emp_dri_lice_num ='" + txtDriversLicense.Text + "', emp_dri_lice_exp_date ='" & txtLicenseExpiryDate.Text & "', emp_military_service ='" + txtMilitaryService.Text + "' WHERE emp_number = " & editEmpNumber.Value
            'Response.Write(adsEmployee.UpdateCommand)
            ' update the record
            If adsEmployee.Update() > 0 Then
                sender.Text = "Edit"
                personalDetails()
            End If
        ElseIf sender.Text = "Edit" Then
            sender.Text = "Save"
            personalDetails()
        End If
    End Sub

    Protected Sub btnContactDetailsEditSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnContactDetailsEditSave.Click
        If sender.Text = "Save" Then
            Dim smoker, gender As Integer
            If chkSmoker.Checked Then
                smoker = 1
            Else
                smoker = 0
            End If

            If rdoGender.SelectedValue = "Male" Then
                gender = 0
            Else
                gender = 1
            End If
            adsEmployeeContact.UpdateCommand = "UPDATE hr_employee SET emp_street1 ='" + txtStreet1.Text + "', emp_street2 ='" + txtStreet2.Text + "', city_code ='" + txtCityTown.Text + "', coun_code ='" + cmbCountries.SelectedValue + "', provin_code ='" + txtStateProvince.Text + "', emp_zip_code ='" + txtZIPCode.Text + "', emp_hm_telephone ='" + txtHomeTelephone.Text + "', emp_mobile ='" + txtMobile.Text + "', emp_work_telephone ='" + txtWorkTelephone.Text + "', emp_work_email ='" + txtWorkEmail.Text + "', emp_oth_email ='" + txtOtherEmail.Text + "' WHERE emp_number = " & editEmpNumber.Value
            'Response.Write(adsEmployeeContact.UpdateCommand)
            ' update the record
            If adsEmployeeContact.Update() > 0 Then
                sender.Text = "Edit"
                contactDetails()
            End If
        ElseIf sender.Text = "Edit" Then
            sender.Text = "Save"
            contactDetails()
        End If
    End Sub

    Protected Sub btnEmergencyContactsEditSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEmergencyContactsEditSave.Click
        If editEmergencyContactNo.Value = "" Then
            Dim dv As System.Data.DataView = adsEmergencyContact.Select(DataSourceSelectArguments.Empty)
            Dim emer_count As Integer = dv.ToTable.Rows.Count
            'adsEmergencyContact.InsertCommand = ""
            adsEmergencyContact.InsertParameters("@eec_seqno").DefaultValue = CStr(emer_count + 1)
            adsEmergencyContact.Insert()
            'Response.Write(adsEmergencyContact.InsertCommand)
            Response.Redirect("Employee.aspx?Page=Edit Employee&Info=Emergency Contact&id=" & editEmpNumber.Value)
        Else
            adsEmergencyContact.UpdateCommand = "UPDATE hr_emp_emergency_contacts SET eec_name ='" + txtContactName.Text + "', eec_relationship ='" + txtContactRelationship.Text + "', eec_home_no ='" + txtContactHomeTelephone.Text + "', eec_mobile_no ='" + txtContactMobile.Text + "', eec_office_no ='" + txtContactWorkTelephone.Text + "' WHERE emp_number = " & editEmpNumber.Value & " AND eec_seqno=" & editEmergencyContactNo.Value
            adsEmergencyContact.Update()
        End If
    End Sub

    
    Protected Sub btnContactDetailsAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnContactDetailsAdd.Click
        editEmergencyContactNo.Value = ""
        txtContactName.Text = ""
        txtContactRelationship.Text = ""
        txtContactHomeTelephone.Text = ""
        txtContactMobile.Text = ""
        txtContactWorkTelephone.Text = ""
    End Sub

    Protected Sub btnContactDetailsDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnContactDetailsDelete.Click
        Dim emerConString As String = Request.Form("emergencyContact[]")
        Dim emerConCodes As String = emerConString.Replace(",", "' OR eec_seqno='")

        adsEthnicRace.DeleteCommand = "DELETE FROM hr_ethnic_race WHERE emp_number=" & editEmpNumber.Value & " AND eec_seqno='" + emerConCodes + "'"
        adsEthnicRace.Delete()
        'Response.Write(adsEthnicRace.DeleteCommand)
    End Sub


    Protected Sub btnPhotographSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPhotographSave.Click
        If filePhotograph.HasFile Then
            Dim emp_picture As HttpPostedFile = filePhotograph.PostedFile
            If imgEmpPhotograph.ImageUrl = "~/images/photohandler.gif" Then
                'adsEmployeeList.InsertCommand = ""
                adsEmployeeList.InsertParameters("@epic_filename").DefaultValue = CStr(emp_picture.FileName)
                adsEmployeeList.InsertParameters("@epic_type").DefaultValue = CStr(emp_picture.ContentType)
                adsEmployeeList.InsertParameters("@epic_file_size").DefaultValue = CStr(emp_picture.ContentLength)
                adsEmployeeList.Insert()
            Else
                'adsPhotograph.UpdateCommand = ""
                adsPhotograph.UpdateParameters("@epic_filename").DefaultValue = CStr(emp_picture.FileName)
                adsPhotograph.UpdateParameters("@epic_type").DefaultValue = CStr(emp_picture.ContentType)
                adsPhotograph.UpdateParameters("@epic_file_size").DefaultValue = CStr(emp_picture.ContentLength)
                adsPhotograph.Update()
                'Response.Write(adsPhotograph.UpdateCommand)
            End If
            Response.Redirect("Employee.aspx?Page=Edit Employee&Info=Photograph&id=" & editEmpNumber.Value)
        End If
    End Sub

    Protected Sub btnJobEditSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnJobEditSave.Click
        If sender.Text = "Save" Then

            adsEmployeeJob.UpdateCommand = "UPDATE hr_employee SET job_title_code = '" + cmbJobTitle.SelectedValue + "', emp_status ='" + cmbEmploymentStatus.SelectedValue + "', eeo_cat_code ='" + cmbEEOCategory.SelectedValue + "', joined_date ='" + txtJoinedDate.Text + "' WHERE emp_number =" & editEmpNumber.Value
            If adsEmployeeJob.Update() > 0 Then
                sender.Text = "Edit"
                employmentJob()
            End If
        ElseIf sender.Text = "Edit" Then
            sender.Text = "Save"
            employmentJob()

        End If
    End Sub
End Class
