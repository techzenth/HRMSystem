
Partial Class _Qualification
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

        Select Case Request.QueryString("Page")
            Case "Education"
                MultiView1.ActiveViewIndex = 0
                ' this is really to check the table for the data
                ' then is the data present load into fields
                If Request.QueryString("id") = "" Then
                    Dim defaultSQL = adsEducation.SelectCommand
                    adsEducation.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_education'"
                    Dim dv As System.Data.DataView = adsEducation.Select(DataSourceSelectArguments.Empty)
                    Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
                    Dim edu_count As Integer = CInt(dr.Item(0))
                    adsEducation.SelectCommand = defaultSQL
                    dv = adsEducation.Select(DataSourceSelectArguments.Empty)

                    If edu_count = 0 Then
                        If moduleRight(0) = "1" Then
                            ' addition is allowed
                            newEducationID.Value = "EDU00" & edu_count + 1
                            eduCode.Visible = False
                            btnEducationEditSave.Text = "Save"
                            education()
                            frmQualEducation.Visible = True
                           
                            frmEducation.Visible = False
                        Else
                            ' addition is not allowed
                            MultiView1.ActiveViewIndex = 2
                        End If

                    Else
                        If moduleRight(3) = "1" Then
                            ' viewing is allowed
                            frmQualEducation.Visible = False
                            frmEducation.Visible = True
                            If moduleRight(2) = "1" Then
                                ' deletion is allowed
                            Else
                                ' deletion is not allowed
                                btnEducationDelete.Enabled = False
                            End If
                            If moduleRight(0) = "1" Then
                                ' addtion is allowed
                            Else
                                ' addtion is not allowed
                                btnEducationAdd.Enabled = False
                            End If

                        Else
                            ' viewing is not allowed
                            MultiView1.ActiveViewIndex = 2
                        End If

                    End If
                Else
                    If moduleRight(3) = "1" Then
                        ' viewing is allowed

                        editEducationID.Text = Request.QueryString("id")
                        adsEducation.SelectCommand = "SELECT edu_uni, edu_deg FROM hr_education WHERE edu_code='" + editEducationID.Text + "'"
                        Dim dv As System.Data.DataView = adsEducation.Select(DataSourceSelectArguments.Empty)
                        Dim dr As System.Data.DataRow = dv.ToTable.Rows.Item(0)
                        txtEducationInstitute.Text = dr.Item(0).ToString
                        txtEducationCourse.Text = dr.Item(1).ToString
                        
                        btnEducationEditSave.Text = "Edit"
                        education()
                        If moduleRight(1) = "1" Then
                            ' editing is allowed
                        Else
                            ' editing is not allowed
                            btnEducationEditSave.Enabled = False
                        End If
                    Else
                        ' viewing is not allowed
                        MultiView1.ActiveViewIndex = 2
                    End If
                End If
            Case "Licenses"
                MultiView1.ActiveViewIndex = 1
                ' this is really to check the table for the data
                ' then is the data present load into fields

                If Request.QueryString("id") = "" Then
                    Dim defaultSQL = adsLicenses.SelectCommand
                    adsLicenses.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_licenses'"
                    Dim dv As System.Data.DataView = adsLicenses.Select(DataSourceSelectArguments.Empty)
                    Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
                    Dim lic_count As Integer = CInt(dr.Item(0))
                    adsLicenses.SelectCommand = defaultSQL
                    dv = adsLicenses.Select(DataSourceSelectArguments.Empty)

                    If lic_count = 0 Then
                        If moduleRight(0) = "1" Then
                            ' addition is allowed
                            newLicenseID.Value = "LIC00" & lic_count + 1
                            licenseCode.Visible = False
                            btnLicenseEditSave.Text = "Save"
                            license()
                            frmQualLicenses.Visible = True

                            frmLicenses.Visible = False
                        Else
                            ' addition is not allowed
                            MultiView1.ActiveViewIndex = 2
                        End If

                    Else
                        If moduleRight(3) = "1" Then
                            ' viewing is allowed
                            frmQualLicenses.Visible = False
                            frmLicenses.Visible = True
                            If moduleRight(2) = "1" Then
                                ' deletion is allowed
                            Else
                                ' deletion is not allowed
                                btnLicenseDelete.Enabled = False
                            End If
                            If moduleRight(0) = "1" Then
                                ' addtion is allowed
                            Else
                                ' addtion is not allowed
                                btnLicenseAdd.Enabled = False
                            End If

                        Else
                            ' viewing is not allowed
                            MultiView1.ActiveViewIndex = 2
                        End If

                    End If
                Else
                    If moduleRight(3) = "1" Then
                        ' viewing is allowed

                        editLicenseID.Text = Request.QueryString("id")
                        adsLicenses.SelectCommand = "SELECT licenses_desc FROM hr_licenses WHERE licenses_code='" + editLicenseID.Text + "'"
                        Dim dv As System.Data.DataView = adsLicenses.Select(DataSourceSelectArguments.Empty)
                        Dim dr As System.Data.DataRow = dv.ToTable.Rows.Item(0)
                        txtLicenseDescription.Text = dr.Item(0).ToString

                        btnLicenseEditSave.Text = "Edit"
                        education()
                        If moduleRight(1) = "1" Then
                            ' editing is allowed
                        Else
                            ' editing is not allowed
                            btnLicenseEditSave.Enabled = False
                        End If
                    Else
                        ' viewing is not allowed
                        MultiView1.ActiveViewIndex = 2
                    End If
                End If
            Case Else

        End Select
    End Sub

    Public Sub education()
        If btnEducationEditSave.Text = "Save" Then
            txtEducationInstitute.Enabled = True
            txtEducationCourse.Enabled = True
            
        ElseIf btnEducationEditSave.Text = "Edit" Then
            txtEducationInstitute.Enabled = False
            txtEducationCourse.Enabled = False
        End If
    End Sub
    Public Sub license()
        If btnLicenseEditSave.Text = "Save" Then
            txtLicenseDescription.Enabled = True
        ElseIf btnLicenseEditSave.Text = "Edit" Then
            txtLicenseDescription.Enabled = False
        End If
    End Sub
    Protected Sub btnEducationEditSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEducationEditSave.Click
        If sender.Text = "Save" Then
            If newEducationID.Value <> "" Then
                ' insert a new location
                If adsEducation.Insert() > 0 Then
                    Dim lastID As Integer = Right(newEducationID.Value, 3)
                    adsEducation.UpdateCommand = "UPDATE hr_unique_id SET last_id =" + lastID.ToString + "  WHERE table_name='hr_education'"
                    adsEducation.Update()
                End If
                Response.Redirect("Qualification.aspx?Page=Education&id=" + newEducationID.Value)
            ElseIf editEducationID.Text <> "" Then
                adsEducation.UpdateCommand = "UPDATE hr_education SET edu_uni = '" + txtEducationInstitute.Text + "', edu_deg = '" + txtEducationCourse.Text + "' WHERE edu_code = '" + editEducationID.Text + "'"
                ' update the record
                If adsEducation.Update() > 0 Then
                    sender.Text = "Edit"
                    education()
                End If
            End If
            'Response.Redirect("Qualification.aspx?Page=Education")
        ElseIf sender.Text = "Edit" Then
            sender.Text = "Save"
            education()
        End If
    End Sub

    Protected Sub btnEducationAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEducationAdd.Click
        Dim defaultSQL = adsEducation.SelectCommand
        adsEducation.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_education'"
        Dim dv As System.Data.DataView = adsEducation.Select(DataSourceSelectArguments.Empty)
        Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
        Dim edu_count As Integer = CInt(dr.Item(0))

        If edu_count < 10 Then
            newEducationID.Value = "EDU00" & edu_count + 1
        ElseIf edu_count < 100 Then
            newEducationID.Value = "EDU0" & edu_count + 1
        ElseIf edu_count < 1000 Then
            newEducationID.Value = "EDU" & edu_count + 1
        End If

        eduCode.Visible = False
        btnEducationEditSave.Text = "Save"
        education()

        frmQualEducation.Visible = True
        frmEducation.Visible = False
    End Sub

    Protected Sub btnEducationDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEducationDelete.Click
        Dim eduString As String = Request.Form("education[]")
        Dim eduCodes As String = eduString.Replace(",", "' OR edu_code='")

        adsEducation.DeleteCommand = "DELETE FROM hr_education WHERE edu_code='" + eduCodes + "'"
        adsEducation.Delete()
        'Response.Write(adsEducation.DeleteCommand)
    End Sub

    Protected Sub btnEducationSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEducationSearch.Click
        Dim searchString As String = ""
        If cmbEducationSearchBy.SelectedValue = "" Then
            searchString = "SELECT edu_code, edu_deg, edu_uni  FROM hr_education WHERE edu_code LIKE '" + txtEducationSearch.Text + "' OR edu_uni LIKE '" + txtEducationSearch.Text + "' OR edu_deg LIKE '" + txtEducationSearch.Text + "'"
        ElseIf cmbEducationSearchBy.SelectedValue = "ID" Then
            searchString = "SELECT edu_code, edu_deg, edu_uni  FROM hr_education WHERE edu_code LIKE '" + txtEducationSearch.Text + "'"
        ElseIf cmbEducationSearchBy.SelectedValue = "Institute" Then
            searchString = "SELECT edu_code, edu_deg, edu_uni  FROM hr_education WHERE edu_uni LIKE '" + txtEducationSearch.Text + "'"
        ElseIf cmbEducationSearchBy.SelectedValue = "Course" Then
            searchString = "SELECT edu_code, edu_deg, edu_uni  FROM hr_education WHERE edu_deg LIKE '" + txtEducationSearch.Text + "'"
        End If
        adsEducation.SelectCommand = searchString
        Dim dv As System.Data.DataView = adsEducation.Select(DataSourceSelectArguments.Empty)
        'Response.Write(dv.Count.ToString)
        'Response.Write(searchString)
    End Sub

    Protected Sub btnLicenseEditSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLicenseEditSave.Click
        If sender.Text = "Save" Then
            If newLicenseID.Value <> "" Then
                ' insert a new location
                If adsLicenses.Insert() > 0 Then
                    Dim lastID As Integer = Right(newLicenseID.Value, 3)
                    adsLicenses.UpdateCommand = "UPDATE hr_unique_id SET last_id =" + lastID.ToString + "  WHERE table_name='hr_licenses'"
                    adsLicenses.Update()
                End If
                Response.Redirect("Qualification.aspx?Page=Licenses&id=" + newLicenseID.Value)
            ElseIf editLicenseID.Text <> "" Then
                adsLicenses.UpdateCommand = "UPDATE hr_licenses SET licenses_desc = '" + txtLicenseDescription.Text + "' WHERE license_code = '" + editLicenseID.Text + "'"
                ' update the record
                If adsLicenses.Update() > 0 Then
                    sender.Text = "Edit"
                    license()
                End If
            End If
            'Response.Redirect("Qualification.aspx?Page=Licenses")
        ElseIf sender.Text = "Edit" Then
            sender.Text = "Save"
            license()
        End If
    End Sub

    Protected Sub btnLicenseAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLicenseAdd.Click
        Dim defaultSQL = adsLicenses.SelectCommand
        adsLicenses.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_licenses'"
        Dim dv As System.Data.DataView = adsLicenses.Select(DataSourceSelectArguments.Empty)
        Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
        Dim lic_count As Integer = CInt(dr.Item(0))

        If lic_count < 10 Then
            newLicenseID.Value = "LIC00" & lic_count + 1
        ElseIf lic_count < 100 Then
            newLicenseID.Value = "LIC0" & lic_count + 1
        ElseIf lic_count < 1000 Then
            newLicenseID.Value = "LIC" & lic_count + 1
        End If

        licenseCode.Visible = False
        btnLicenseEditSave.Text = "Save"
        license()

        frmQualLicenses.Visible = True
        frmLicenses.Visible = False
    End Sub

    Protected Sub btnLicenseDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLicenseDelete.Click
        Dim licString As String = Request.Form("licenses[]")
        Dim licCodes As String = licString.Replace(",", "' OR licenses_code='")

        adsLicenses.DeleteCommand = "DELETE FROM hr_licenses WHERE licenses_code='" + licCodes + "'"
        adsLicenses.Delete()
        'Response.Write(adsLicenses.DeleteCommand)
    End Sub

    Protected Sub btnLicenseSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLicenseSearch.Click
        Dim searchString As String = ""
        If cmbLicenseSearchBy.SelectedValue = "" Then
            searchString = "SELECT licenses_code, licenses_desc FROM hr_licenses WHERE licenses_code LIKE '" + txtLicenseSearch.Text + "' OR license_desc LIKE '" + txtLicenseSearch.Text + "'"
        ElseIf cmbLicenseSearchBy.SelectedValue = "ID" Then
            searchString = "SELECT licenses_code, licenses_desc FROM hr_licenses WHERE licenses_code LIKE '" + txtLicenseSearch.Text + "'"
        ElseIf cmbLicenseSearchBy.SelectedValue = "Institute" Then
            searchString = "SELECT licenses_code, licenses_desc FROM hr_licenses WHERE licenses_desc LIKE '" + txtLicenseSearch.Text + "'"
        End If
        adsLicenses.SelectCommand = searchString
        Dim dv As System.Data.DataView = adsLicenses.Select(DataSourceSelectArguments.Empty)
        'Response.Write(dv.Count.ToString)
        'Response.Write(searchString)
    End Sub
End Class
