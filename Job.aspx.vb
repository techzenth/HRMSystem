
Partial Class _Job
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
            Case "Job Titles"
                MultiView1.ActiveViewIndex = 0
                ' this is really to check the table for the data
                ' then is the data present load into fields
                If Request.QueryString("id") = "" Then
                    Dim defaultSQL = adsJobTitle.SelectCommand
                    adsJobTitle.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_job_title'"
                    Dim dv As System.Data.DataView = adsJobTitle.Select(DataSourceSelectArguments.Empty)
                    Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
                    Dim job_count As Integer = CInt(dr.Item(0))
                    adsJobTitle.SelectCommand = defaultSQL
                    dv = adsJobTitle.Select(DataSourceSelectArguments.Empty)

                    If job_count = 0 Then
                        If moduleRight(0) = "1" Then
                            ' addition is allowed
                            newJobTitleID.Value = "JOB00" & job_count + 1
                            jobTitleID.Visible = False
                            btnJobTitleEditSave.Text = "Save"
                            JobTitle()
                            frmJobTitle.Visible = True
                            empStat0.Visible = False
                            empStat1.Visible = False
                            empStat2.Visible = False
                            frmJobTitles.Visible = False
                        Else
                            ' addition is not allowed
                            MultiView1.ActiveViewIndex = 5
                        End If

                    Else
                        If moduleRight(3) = "1" Then
                            ' viewing is allowed
                            frmJobTitle.Visible = False
                            frmJobTitles.Visible = True
                            If moduleRight(2) = "1" Then
                                ' deletion is allowed
                            Else
                                ' deletion is not allowed
                                btnJobTitleDelete.Enabled = False
                            End If
                            If moduleRight(0) = "1" Then
                                ' addtion is allowed
                            Else
                                ' addtion is not allowed
                                btnJobTitleAdd.Enabled = False
                            End If

                        Else
                            ' viewing is not allowed
                            MultiView1.ActiveViewIndex = 5
                        End If

                    End If
                Else
                    If moduleRight(3) = "1" Then
                        ' viewing is allowed

                        editJobTitleID.Text = Request.QueryString("id")
                        adsJobTitle.SelectCommand = "SELECT jobtit_name, jobtit_desc, jobtit_comm, sal_grd_code, jobspec_id FROM hr_job_title WHERE jobtit_code='" + editJobTitleID.Text + "'"
                        'Response.Write(adsJobTitle.SelectCommand)
                        Dim dv As System.Data.DataView = adsJobTitle.Select(DataSourceSelectArguments.Empty)
                        Dim dr As System.Data.DataRow = dv.ToTable.Rows.Item(0)
                        txtJobTitleName.Text = dr.Item(0).ToString
                        txtJobDescription.Text = dr.Item(1).ToString
                        txtJobTitleComments.Text = dr.Item(2).ToString
                        cmbJobSpecification.SelectedValue = dr.Item(4).ToString
                        cmbPayGrade.SelectedValue = dr.Item(3).ToString
                        'Response.End()
                        ' Employment Status selection in the list box
                        empStat0.Visible = True
                        empStat1.Visible = True
                        empStat2.Visible = False

                        btnJobTitleEditSave.Text = "Edit"
                        JobTitle()
                        If moduleRight(1) = "1" Then
                            ' editing is allowed
                        Else
                            ' editing is not allowed
                            btnJobTitleEditSave.Enabled = False
                        End If
                    Else
                        ' viewing is not allowed
                        MultiView1.ActiveViewIndex = 5
                    End If
                End If
            Case "Job Specification"
                MultiView1.ActiveViewIndex = 1
                ' this is really to check the table for the data
                ' then is the data present load into fields
                If Request.QueryString("id") = "" Then
                    Dim defaultSQL = adsJobSpecification.SelectCommand
                    adsJobSpecification.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_job_spec'"
                    Dim dv As System.Data.DataView = adsJobSpecification.Select(DataSourceSelectArguments.Empty)
                    Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
                    Dim job_count As Integer = CInt(dr.Item(0))
                    adsJobSpecification.SelectCommand = defaultSQL
                    dv = adsJobSpecification.Select(DataSourceSelectArguments.Empty)

                    If job_count = 0 Then
                        If moduleRight(0) = "1" Then
                            ' addition is allowed
                            newJobSpecID.Value = job_count + 1
                            'jobTitleID.Visible = False
                            btnJobSpecEditSave.Text = "Save"
                            JobSpec()
                            frmJobSpecification.Visible = True
                            frmJobSpecifications.Visible = False
                        Else
                            ' addition is not allowed
                            MultiView1.ActiveViewIndex = 5
                        End If
                    Else
                        If moduleRight(3) = "1" Then
                            ' viewing is allowed
                            frmJobSpecifications.Visible = True
                            frmJobSpecification.Visible = False
                            If moduleRight(2) = "1" Then
                                ' deletion is allowed
                            Else
                                ' deletion is not allowed
                                btnJobSpecDelete.Enabled = False
                            End If

                            If moduleRight(0) = "1" Then
                                ' additiion is allowed
                            Else
                                ' addition is not allowed
                                btnJobSpecAdd.Enabled = False
                            End If
                        Else
                            ' viewing is not allowed
                            MultiView1.ActiveViewIndex = 5
                        End If
                    End If
                Else
                    If moduleRight(3) = "1" Then
                        ' viewing is allowed

                        editJobSpecID.Value = Request.QueryString("id")
                        adsJobSpecification.SelectCommand = "SELECT jobspec_name, jobspec_desc, jobspec_duties FROM hr_job_spec WHERE jobspec_id=" + editJobSpecID.Value
                        Dim dv As System.Data.DataView = adsJobSpecification.Select(DataSourceSelectArguments.Empty)
                        Dim dr As System.Data.DataRow = dv.ToTable.Rows.Item(0)
                        txtJobSpecName.Text = dr.Item(0).ToString
                        txtJobSpecDescription.Text = dr.Item(1).ToString
                        txtJobSpecDuties.Text = dr.Item(2).ToString

                        btnJobSpecEditSave.Text = "Edit"
                        JobSpec()
                        If moduleRight(1) = "1" Then
                            ' editing is allowed
                        Else
                            ' editing is not allowed
                            btnJobSpecEditSave.Enabled = False
                        End If
                    Else
                        ' viewing is not allowed
                    End If
                End If
            Case "Pay Grades"
                MultiView1.ActiveViewIndex = 2
                ' this is really to check the table for the data
                ' then is the data present load into fields
                If Request.QueryString("new") <> "" Then
                    Dim defaultSQL = adsPayGrade.SelectCommand
                    adsPayGrade.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='pr_salary_grade'"
                    Dim dv As System.Data.DataView = adsPayGrade.Select(DataSourceSelectArguments.Empty)
                    Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
                    Dim paygrd_count As Integer = CInt(dr.Item(0))
                    adsPayGrade.SelectCommand = defaultSQL
                    dv = adsPayGrade.Select(DataSourceSelectArguments.Empty)
                    If moduleRight(0) = "1" Then
                        ' addition is allowed

                        newPayGradeID.Value = "SAL00" & paygrd_count + 1
                        payCode.Visible = False
                        btnPayGradeEditSave.Text = "Save"
                        PayGrade()
                        newCurrency0.Visible = False
                        newCurrency1.Visible = False

                        assignedCurrency0.Visible = False
                        assignedCurrency1.Visible = False
                        assignedCurrency2.Visible = False

                        frmPayGrade.Visible = True
                        frmPayGrades.Visible = False
                    Else
                        ' addition is not allowed
                        MultiView1.ActiveViewIndex = 5
                    End If
                ElseIf Request.QueryString("id") = "" Then

                    Dim defaultSQL = adsPayGrade.SelectCommand
                    adsPayGrade.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='pr_salary_grade'"
                    Dim dv As System.Data.DataView = adsPayGrade.Select(DataSourceSelectArguments.Empty)
                    Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
                    Dim paygrd_count As Integer = CInt(dr.Item(0))
                    adsPayGrade.SelectCommand = defaultSQL
                    dv = adsPayGrade.Select(DataSourceSelectArguments.Empty)

                    If paygrd_count = 0 Then
                        If moduleRight(0) = "1" Then
                            ' addition is allowed

                            newPayGradeID.Value = "SAL00" & paygrd_count + 1
                            payCode.Visible = False
                            btnPayGradeEditSave.Text = "Save"
                            PayGrade()
                            newCurrency0.Visible = False
                            newCurrency1.Visible = False

                            assignedCurrency0.Visible = False
                            assignedCurrency1.Visible = False
                            assignedCurrency2.Visible = False

                            frmPayGrade.Visible = True
                            frmPayGrades.Visible = False
                        Else
                            ' addition is not allowed
                            MultiView1.ActiveViewIndex = 5
                        End If
                    Else
                        If moduleRight(3) = "1" Then
                            ' viewing is allowed
                            frmPayGrades.Visible = True
                            frmPayGrade.Visible = False
                            If moduleRight(2) = "1" Then
                                ' deletion is allowed
                            Else
                                ' deletion is not allowed
                                btnPayGradeDelete.Enabled = False
                            End If

                            If moduleRight(0) = "1" Then
                                ' additiion is allowed
                            Else
                                ' addition is not allowed
                                btnPayGradeAdd.Enabled = False
                            End If
                        Else
                            ' viewing is not allowed
                            MultiView1.ActiveViewIndex = 5
                        End If
                    End If

                Else
                    If moduleRight(3) = "1" Then
                        ' viewing is allowed

                        editPayGradeID.Text = Request.QueryString("id")
                        adsPayGrade.SelectCommand = "SELECT sal_grd_name FROM pr_salary_grade WHERE sal_grd_code='" + editPayGradeID.Text + "'"
                        Dim dv As System.Data.DataView = adsPayGrade.Select(DataSourceSelectArguments.Empty)
                        Dim dr As System.Data.DataRow = dv.ToTable.Rows.Item(0)
                        txtPayGradeName.Text = dr.Item(0).ToString

                        btnPayGradeEditSave.Text = "Edit"
                        PayGrade()
                        payCode.Visible = True

                        If moduleRight(1) = "1" Then
                            ' editing is allowed
                        Else
                            ' editing is not allowed
                            btnPayGradeEditSave.Enabled = False
                        End If

                        newCurrency0.Visible = True
                        newCurrency1.Visible = True



                        If Request.QueryString("currency") = "" Then
                            btnCurrencyEditSave.Text = "Save"
                            currencyDetails()
                            cmbCurrency.Visible = True
                            editCurrency.Visible = False
                            flagCurrency.Value = "New"
                            currencyCell0.InnerHtml = "Assign new currency"
                            If moduleRight(0) = "1" Then
                                ' addition is allowed
                            Else
                                ' addition is not allowed
                                btnCurrencyEditSave.Enabled = False
                            End If
                        Else
                            Dim currencyVal As String = Request.QueryString("currency")
                            adsCurrencyType.SelectCommand = "SELECT hr_currency_type.currency_name, pr_salary_currency_detail.salcurr_dtl_minsalary, pr_salary_currency_detail.sal_curr_dtl_maxsalary, pr_salary_currency_detail.salcurr_dtl_stepsalary FROM (pr_salary_currency_detail INNER JOIN hr_currency_type ON pr_salary_currency_detail.currency_id = hr_currency_type.currency_id) WHERE pr_salary_currency_detail.sal_grd_code='" + editPayGradeID.Text + "' AND hr_currency_type.currency_id = '" + currencyVal + "'"
                            dv = adsCurrencyType.Select(DataSourceSelectArguments.Empty)
                            dr = dv.ToTable.Rows(0)
                            editCurrency.Text = dr.Item(0).ToString
                            txtMinSalary.Text = dr.Item(1).ToString
                            txtMaxSalary.Text = dr.Item(2).ToString
                            txtStepIncrease.Text = dr.Item(3).ToString

                            btnCurrencyEditSave.Text = "Edit"
                            currencyDetails()
                            cmbCurrency.Visible = False
                            editCurrencyID.Value = currencyVal
                            editCurrency.Visible = True
                            flagCurrency.Value = "Update"
                            currencyCell0.InnerHtml = "Edit Assigned currency"
                            If moduleRight(1) = "1" Then
                                ' editing is allowed
                            Else
                                ' editing is not allowed
                                btnCurrencyEditSave.Enabled = False
                            End If
                        End If

                        dv = adsCurrencyDetails.Select(DataSourceSelectArguments.Empty)
                        Dim currency_count As Integer = dv.ToTable.Rows.Count
                        If currency_count > 0 Then
                            assignedCurrency0.Visible = True
                            assignedCurrency1.Visible = True
                            assignedCurrency2.Visible = True
                        Else
                            assignedCurrency0.Visible = False
                            assignedCurrency1.Visible = False
                            assignedCurrency2.Visible = False
                        End If
                    Else
                        ' viewing is not allowed
                        MultiView1.ActiveViewIndex = 5
                    End If
                End If
            Case "Employment Status"
                MultiView1.ActiveViewIndex = 3
                ' this is really to check the table for the data
                ' then is the data present load into fields
                If Request.QueryString("id") = "" Then
                    Dim defaultSQL = adsEmploymentStatus.SelectCommand
                    adsEmploymentStatus.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_empstat'"
                    Dim dv As System.Data.DataView = adsEmploymentStatus.Select(DataSourceSelectArguments.Empty)
                    Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
                    Dim empstat_count As Integer = CInt(dr.Item(0))
                    adsEmploymentStatus.SelectCommand = defaultSQL
                    dv = adsEmploymentStatus.Select(DataSourceSelectArguments.Empty)

                    If empstat_count = 0 Then
                        If moduleRight(0) = "1" Then
                            ' addition is allowed

                            newEmploymentStatusID.Value = "EST00" & empstat_count + 1
                            empstatCode.Visible = False
                            btnEmpStatEditSave.Text = "Save"
                            employmentStatus()

                            frmEmploymentStatus.Visible = True
                            frmEmploymentStatuses.Visible = False
                        Else
                            ' addition is not allowed
                            MultiView1.ActiveViewIndex = 5
                        End If
                    Else
                        If moduleRight(3) = "1" Then
                            ' viewing is allowed
                            frmEmploymentStatuses.Visible = True
                            frmEmploymentStatus.Visible = False
                            If moduleRight(2) = "1" Then
                                ' deletion is allowed
                            Else
                                ' deletion is not allowed
                                btnEmploymentStatusDelete.Enabled = False
                            End If

                            If moduleRight(0) = "1" Then
                                ' additiion is allowed
                            Else
                                ' addition is not allowed
                                btnEmploymentStatusAdd.Enabled = False
                            End If
                        Else
                            ' viewing is not allowed
                            MultiView1.ActiveViewIndex = 5
                        End If
                    End If
                Else
                    If moduleRight(3) = "1" Then
                        ' viewing is allowed

                        editEmploymentStatusID.Text = Request.QueryString("id")
                        adsEmploymentStatus.SelectCommand = "SELECT estat_name FROM hr_empstat WHERE estat_code='" + editEmploymentStatusID.Text + "'"
                        Dim dv As System.Data.DataView = adsEmploymentStatus.Select(DataSourceSelectArguments.Empty)
                        Dim dr As System.Data.DataRow = dv.ToTable.Rows.Item(0)
                        txtEmpStatName.Text = dr.Item(0).ToString

                        btnEmpStatEditSave.Text = "Edit"
                        employmentStatus()
                        empstatCode.Visible = True

                        If moduleRight(1) = "1" Then
                            ' editing is allowed
                        Else
                            ' editing is not allowed
                            btnEmpStatEditSave.Enabled = False
                        End If

                    Else
                        ' viewing is not allowed
                        MultiView1.ActiveViewIndex = 5
                    End If
                End If
            Case "EEO Job Categories"
                MultiView1.ActiveViewIndex = 4
                ' this is really to check the table for the data
                ' then is the data present load into fields
                If Request.QueryString("id") = "" Then
                    Dim defaultSQL = adsEEOJobCategory.SelectCommand
                    adsEEOJobCategory.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_eec'"
                    Dim dv As System.Data.DataView = adsEEOJobCategory.Select(DataSourceSelectArguments.Empty)
                    Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
                    Dim eeojobcat_count As Integer = CInt(dr.Item(0))
                    adsEEOJobCategory.SelectCommand = defaultSQL
                    dv = adsEEOJobCategory.Select(DataSourceSelectArguments.Empty)

                    If eeojobcat_count = 0 Then
                        If moduleRight(0) = "1" Then
                            ' addition is allowed

                            newEEOJobCategoryID.Value = "EST00" & eeojobcat_count + 1
                            EEOCode.Visible = False
                            btnEEOJobCategoryEditSave.Text = "Save"
                            eeoJobCategory()

                            frmJobEEOJobCat.Visible = True
                            frmJobEEOJobCats.Visible = False
                        Else
                            ' addition is not allowed
                            MultiView1.ActiveViewIndex = 5
                        End If
                    Else
                        If moduleRight(3) = "1" Then
                            ' viewing is allowed
                            frmJobEEOJobCats.Visible = True
                            frmJobEEOJobCat.Visible = False
                            If moduleRight(2) = "1" Then
                                ' deletion is allowed
                            Else
                                ' deletion is not allowed
                                btnEEOJobCategoryDelete.Enabled = False
                            End If

                            If moduleRight(0) = "1" Then
                                ' additiion is allowed
                            Else
                                ' addition is not allowed
                                btnEEOJobCategoryAdd.Enabled = False
                            End If
                        Else
                            ' viewing is not allowed
                            MultiView1.ActiveViewIndex = 5
                        End If
                    End If
                Else
                    If moduleRight(3) = "1" Then
                        ' viewing is allowed

                        editEEOJobCatergoryID.Text = Request.QueryString("id")
                        adsEEOJobCategory.SelectCommand = "SELECT eec_desc FROM hr_eec WHERE eec_code='" + editEEOJobCatergoryID.Text + "'"
                        Dim dv As System.Data.DataView = adsEEOJobCategory.Select(DataSourceSelectArguments.Empty)
                        Dim dr As System.Data.DataRow = dv.ToTable.Rows.Item(0)
                        txtEEOJobCategoryTitle.Text = dr.Item(0).ToString

                        btnEEOJobCategoryEditSave.Text = "Edit"
                        eeoJobCategory()
                        EEOCode.Visible = True

                        If moduleRight(1) = "1" Then
                            ' editing is allowed
                        Else
                            ' editing is not allowed
                            btnEEOJobCategoryEditSave.Enabled = False
                        End If

                    Else
                        ' viewing is not allowed
                        MultiView1.ActiveViewIndex = 5
                    End If
                End If
            Case Else

        End Select
    End Sub
    Public Sub JobTitle()
        If btnJobTitleEditSave.Text = "Save" Then
            txtJobTitleName.Enabled = True
            txtJobDescription.Enabled = True
            txtJobTitleComments.Enabled = True
            cmbJobSpecification.Enabled = True
            cmbPayGrade.Enabled = True
            btnAddPayGrade.Enabled = True
            btnEditPayGrade.Enabled = True
            ' other controls to be show when editing job titles
            lstJobTitle.Enabled = True
            lstEmpStatus.Enabled = True
            btnAddEmploymentStatus.Enabled = True
            btnEditEmploymentStatus.Enabled = True
            btnEmpStatusRemove.Enabled = True
            btnEmpStatusAdd.Enabled = True
        ElseIf btnJobTitleEditSave.Text = "Edit" Then
            txtJobTitleName.Enabled = False
            txtJobDescription.Enabled = False
            txtJobTitleComments.Enabled = False
            cmbJobSpecification.Enabled = False
            cmbPayGrade.Enabled = False
            btnAddPayGrade.Enabled = False
            btnEditPayGrade.Enabled = False
            ' other controls to be show when editing job titles
            lstJobTitle.Enabled = False
            lstEmpStatus.Enabled = False
            btnAddEmploymentStatus.Enabled = False
            btnEditEmploymentStatus.Enabled = False
            btnEmpStatusRemove.Enabled = False
            btnEmpStatusAdd.Enabled = False

        End If
    End Sub

    Public Sub JobSpec()
        If btnJobSpecEditSave.Text = "Save" Then
            txtJobSpecName.Enabled = True
            txtJobSpecDescription.Enabled = True
            txtJobSpecDuties.Enabled = True
           
        ElseIf btnJobTitleEditSave.Text = "Edit" Then
            txtJobSpecName.Enabled = False
            txtJobSpecDescription.Enabled = False
            txtJobSpecDuties.Enabled = False
        End If
    End Sub

    Public Sub PayGrade()
        If btnPayGradeEditSave.Text = "Save" Then
            txtPayGradeName.Enabled = True
        ElseIf btnPayGradeEditSave.Text = "Edit" Then
            txtPayGradeName.Enabled = False
        End If
    End Sub

    Public Sub currencyDetails()
        If btnCurrencyEditSave.Text = "Save" Then
            cmbCurrency.Enabled = True
            txtMinSalary.Enabled = True
            txtMaxSalary.Enabled = True
            txtStepIncrease.Enabled = True
        ElseIf btnCurrencyEditSave.Text = "Edit" Then
            cmbCurrency.Enabled = False
            txtMinSalary.Enabled = False
            txtMaxSalary.Enabled = False
            txtStepIncrease.Enabled = False
        End If
    End Sub
    Public Sub employmentStatus()
        If btnEmpStatEditSave.Text = "Save" Then
            txtEmpStatName.Enabled = True
        ElseIf btnEmpStatEditSave.Text = "Edit" Then
            txtEmpStatName.Enabled = False
        End If
    End Sub
    Public Sub eeoJobCategory()
        If btnEEOJobCategoryEditSave.Text = "Save" Then
            txtEEOJobCategoryTitle.Enabled = True
        ElseIf btnEEOJobCategoryEditSave.Text = "Edit" Then
            txtEEOJobCategoryTitle.Enabled = False
        End If
    End Sub
    Protected Sub btnJobTitleEditSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnJobTitleEditSave.Click
        If sender.Text = "Save" Then
            If newJobTitleID.Value <> "" Then
                ' insert a new job title
                If adsJobTitle.Insert() > 0 Then
                    Dim lastID As Integer = Right(newJobTitleID.Value, 3)
                    adsJobTitle.UpdateCommand = "UPDATE hr_unique_id SET last_id =" + lastID.ToString + "  WHERE table_name='hr_job_title'"
                    adsJobTitle.Update()
                    adsJobTitleEmpStat.InsertCommand = "INSERT INTO hr_jobtit_empstat (jobtit_code,estat_code) VALUES('" + newJobTitleID.Value + "','EST000')"
                    adsJobTitleEmpStat.Insert()

                    Response.Redirect("Job.aspx?Page=Job Titles&id=" + newJobTitleID.Value)
                End If
            ElseIf editJobTitleID.Text <> "" Then
                adsJobTitle.UpdateCommand = "UPDATE hr_job_title SET jobtit_name ='" + txtJobTitleName.Text + "', jobtit_desc ='" + txtJobDescription.Text + "', jobtit_comm ='" + txtJobTitleComments.Text + "', sal_grd_code ='" + cmbPayGrade.SelectedValue + "', jobspec_id ='" + cmbJobSpecification.SelectedValue + "' WHERE jobtit_code='" + editJobTitleID.Text + "'"
                ' update the record
                'Response.Write(adsJobTitle.UpdateCommand)
                If adsJobTitle.Update() > 0 Then
                    Response.Redirect(Request.RawUrl)
                End If
            End If
        ElseIf sender.Text = "Edit" Then
            sender.Text = "Save"
            JobTitle()
        End If
    End Sub

    Protected Sub btnJobTitleAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnJobTitleAdd.Click
        adsJobTitle.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_job_title'"
        Dim dv As System.Data.DataView = adsJobTitle.Select(DataSourceSelectArguments.Empty)
        Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
        Dim job_count As Integer = CInt(dr.Item(0))


        If job_count < 10 Then
            newJobTitleID.Value = "JOB00" & job_count + 1
        ElseIf job_count < 100 Then
            newJobTitleID.Value = "JOB0" & job_count + 1
        Else
            newJobTitleID.Value = "JOB" & job_count + 1
        End If
        

        jobTitleID.Visible = False
        btnJobTitleEditSave.Text = "Save"
        JobTitle()
        frmJobTitle.Visible = True
        empStat0.Visible = False
        empStat1.Visible = False
        empStat2.Visible = False
        frmJobTitles.Visible = False
    End Sub

    Protected Sub btnEmpStatusAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEmpStatusAdd.Click
        Dim jobtitEmpStat As String
        For i As Integer = 0 To lstEmpStatus.Items.Count - 1
            If lstEmpStatus.Items(i).Selected = True Then
                jobtitEmpStat = "INSERT INTO hr_jobtit_empstat VALUES ('" + editJobTitleID.Text + "','" + lstEmpStatus.Items(i).Value + "');"
                adsJobTitleEmpStat.InsertCommand = jobtitEmpStat
                adsJobTitleEmpStat.Insert()
                'lstJobTitle.Items.RemoveAt(i)
                'Response.Write(adsJobTitleEmpStat.InsertCommand)
                'Response.Write("<br/>" + lstEmpStatus.Items(i).Value)
            End If
        Next
    End Sub

    Protected Sub btnEmpStatusRemove_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEmpStatusRemove.Click
        Dim jobtitEmpStat As String
        jobtitEmpStat = "DELETE FROM hr_jobtit_empstat WHERE jobtit_code='" + editJobTitleID.Text + "' AND"
        For i As Integer = 0 To lstJobTitle.Items.Count - 1
            If lstJobTitle.Items(i).Selected = True Then
                jobtitEmpStat = jobtitEmpStat + " estat_code='" + lstJobTitle.Items(i).Value + "' OR"
                lstEmpStatus.Items.RemoveAt(i)
                '  Response.Write("<br/>" + lstJobTitle.Items(i).Value)
            End If
        Next

        jobtitEmpStat = Left(jobtitEmpStat, jobtitEmpStat.Length - 3)
        adsJobTitleEmpStat.DeleteCommand = jobtitEmpStat
        'Response.Write(adsJobTitleEmpStat.DeleteCommand)
        adsJobTitleEmpStat.Delete()
    End Sub

    Protected Sub btnAddEmploymentStatus_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddEmploymentStatus.Click
        empStat2.Visible = True
        'load the new available id into hidden field
    End Sub

    Protected Sub btnEditEmploymentStatus_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEditEmploymentStatus.Click
        If lstEmpStatus.SelectedValue <> "" Then
            empStat2.Visible = True
            'load the selected id into hidden field
            txtJobEmpStatus.Text = lstEmpStatus.SelectedItem.Text
        End If
    End Sub

    Protected Sub btnEmpStatusSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEmpStatusSave.Click
        ' is the edit mode
        ' update the employment status
        ' otherwise
        ' insert a new record
    End Sub

    Protected Sub btnJobTitleDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnJobTitleDelete.Click
        Dim jobString As String = Request.Form("jobtitle[]")
        Dim jobCodes As String = jobString.Replace(",", "' OR jobtit_code='")

        adsJobTitle.DeleteCommand = "DELETE FROM hr_job_title WHERE jobtit_code='" + jobCodes + "'"
        adsJobTitle.Delete()
        'Response.Write(adsjobtitle.DeleteCommand)
    End Sub

    Protected Sub btnJobTitleSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnJobTitleSearch.Click
        Dim searchString As String = ""
        If cmbJobTitleSearchBy.SelectedValue = "" Then
            searchString = "SELECT [jobtit_code], [jobtit_name] FROM [hr_job_title] WHERE [jobtit_code] LIKE '" + txtJobTitleSearchFor.Text + "%' OR [jobtit_name] LIKE '" + txtJobTitleSearchFor.Text + "%'"
        ElseIf cmbJobTitleSearchBy.SelectedValue = "ID" Then
            searchString = "SELECT [jobtit_code], [jobtit_name] FROM [hr_job_title] WHERE [jobtit_code] LIKE '" + txtJobTitleSearchFor.Text + "%'"
        ElseIf cmbJobTitleSearchBy.SelectedValue = "Name" Then
            searchString = "SELECT [jobtit_code], [jobtit_name] FROM [hr_job_title] WHERE [jobtit_name] LIKE '" + txtJobTitleSearchFor.Text + "%'"
        End If
        adsJobTitle.SelectCommand = searchString
        Dim dv As System.Data.DataView = adsJobTitle.Select(DataSourceSelectArguments.Empty)
        'Response.Write(dv.Count.ToString)
        'Response.Write(searchString)
    End Sub

    Protected Sub btnJobSpecEditSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnJobSpecEditSave.Click
        If sender.Text = "Save" Then
            If newJobSpecID.Value <> "" Then
                ' insert a new location
                If adsJobSpecification.Insert() > 0 Then
                    Dim lastID As Integer = newJobSpecID.Value
                    adsJobSpecification.UpdateCommand = "UPDATE hr_unique_id SET last_id =" + lastID.ToString + "  WHERE table_name='hr_job_spec'"
                    adsJobSpecification.Update()
                End If
                Response.Redirect("Job.aspx?Page=Job Specification")
            ElseIf editJobSpecID.Value <> "" Then
                adsJobSpecification.UpdateCommand = "UPDATE hr_job_spec SET jobspec_name = '" + txtJobSpecName.Text + "', jobspec_desc = '" + txtJobSpecDescription.Text + "', jobspec_duties = '" + txtJobSpecDuties.Text + "' WHERE (jobspec_id = " + editJobSpecID.Value + ")"
                ' update the record
                If adsJobSpecification.Update() > 0 Then
                    Response.Redirect(Request.RawUrl)
                End If

            End If
        ElseIf sender.Text = "Edit" Then
            sender.Text = "Save"
            JobSpec()
        End If
    End Sub

    Protected Sub btnJobSpecAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnJobSpecAdd.Click
        adsJobSpecification.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_job_spec'"
        Dim dv As System.Data.DataView = adsJobSpecification.Select(DataSourceSelectArguments.Empty)
        Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
        Dim job_count As Integer = CInt(dr.Item(0))

        newJobSpecID.Value = job_count + 1
        'jobTitleID.Visible = False
        btnJobSpecEditSave.Text = "Save"
        JobSpec()
        frmJobSpecification.Visible = True

        frmJobSpecifications.Visible = False
        
    End Sub

    Protected Sub btnJobSpecDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnJobSpecDelete.Click
        Dim jobString As String = Request.Form("jobspec[]")
        Dim jobCodes As String = jobString.Replace(",", " OR jobspec_id=")

        adsJobSpecification.DeleteCommand = "DELETE FROM hr_job_spec WHERE jobspec_id=" + jobCodes
        adsJobSpecification.Delete()
        'Response.Write(adsJobSpecification.DeleteCommand)
    End Sub

    Protected Sub btnJobSpecSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnJobSpecSearch.Click
        Dim searchString As String = ""
        If cmbJobSpecSearchBy.SelectedValue = "" Then
            searchString = "SELECT [jobspec_id], [jobspec_name]  FROM [hr_job_spec] WHERE [jobspec_id] LIKE " + txtJobSpecSearch.Text + " OR [jobspec_name] LIKE '" + txtJobSpecSearch.Text + "%'"
        ElseIf cmbJobSpecSearchBy.SelectedValue = "ID" Then
            searchString = "SELECT [jobspec_id], [jobspec_name]  FROM [hr_job_spec] WHERE [jobspec_id] LIKE " + txtJobSpecSearch.Text
        ElseIf cmbJobSpecSearchBy.SelectedValue = "Name" Then
            searchString = "SELECT [jobspec_id], [jobspec_name]  FROM [hr_job_spec] WHERE [jobspec_name] LIKE '" + txtJobSpecSearch.Text + "%'"
        End If
        adsJobSpecification.SelectCommand = searchString
        Dim dv As System.Data.DataView = adsJobSpecification.Select(DataSourceSelectArguments.Empty)
        'Response.Write(dv.Count.ToString)
        'Response.Write(searchString)
    End Sub

    Protected Sub btnPayGradeEditSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPayGradeEditSave.Click
        If sender.Text = "Save" Then
            If newPayGradeID.Value <> "" Then
                ' insert a new location
                If adsPayGrade.Insert() > 0 Then
                    Dim lastID As Integer = Right(newPayGradeID.Value, 3)
                    adsPayGrade.UpdateCommand = "UPDATE hr_unique_id SET last_id =" + lastID.ToString + "  WHERE table_name='pr_salary_grade'"
                    adsPayGrade.Update()
                End If
                Response.Redirect("Job.aspx?Page=Pay Grades&id=" + newPayGradeID.Value)
            ElseIf editPayGradeID.Text <> "" Then
                adsPayGrade.UpdateCommand = "UPDATE pr_salary_grade SET sal_grd_name = '" + txtPayGradeName.Text + "' WHERE sal_grd_code = '" + editPayGradeID.Text + "'"
                ' update the record
                If adsPayGrade.Update() > 0 Then
                    sender.Text = "Edit"
                    PayGrade()
                End If
            End If
            'Response.Redirect("Job.aspx?Page=Job Specification")
        ElseIf sender.Text = "Edit" Then
            sender.Text = "Save"
            PayGrade()
        End If
    End Sub

   
    Protected Sub btnCurrencyEditSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCurrencyEditSave.Click
        If sender.Text = "Save" Then
            If flagCurrency.Value = "New" Then
                ' insert a new record
                adsCurrencyDetails.Insert()
                'Response.Redirect("Job.aspx?Page=Pay Grades&id=" + editPayGradeID.Text)
            ElseIf flagCurrency.Value = "Update" Then
                ' update the record
                adsCurrencyDetails.UpdateCommand = "UPDATE pr_salary_currency_detail SET salcurr_dtl_minsalary = '" + txtMinSalary.Text + "', salcurr_dtl_stepsalary = '" + txtStepIncrease.Text + "', sal_curr_dtl_maxsalary = '" + txtMaxSalary.Text + "' WHERE sal_grd_code = '" + editPayGradeID.Text + "' AND currency_id='" + editCurrencyID.Value + "'"
                adsCurrencyDetails.Update()
                sender.Text = "Edit"
                currencyDetails()
            End If
            Response.Redirect("Job.aspx?Page=Pay Grades&id=" + editPayGradeID.Text)
        ElseIf sender.Text = "Edit" Then
            sender.Text = "Save"
            currencyDetails()
        End If
    End Sub

    Protected Sub btnCurrencyDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCurrencyDelete.Click
        Dim curString As String = Request.Form("currency[]")
        Dim curCodes As String = curString.Replace(",", "' OR currency_id='")

        adsCurrencyDetails.DeleteCommand = "DELETE FROM pr_salary_currency_detail WHERE sal_grd_code='" + editPayGradeID.Text + "' AND currency_id='" + curCodes + "'"
        adsCurrencyDetails.Delete()
        'Response.Write(adsCurrencyDetails.DeleteCommand)
    End Sub

    Protected Sub btnPayGradeAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPayGradeAdd.Click
        Dim defaultSQL = adsPayGrade.SelectCommand
        adsPayGrade.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='pr_salary_grade'"
        Dim dv As System.Data.DataView = adsPayGrade.Select(DataSourceSelectArguments.Empty)
        Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
        Dim paygrd_count As Integer = CInt(dr.Item(0))

        If paygrd_count < 10 Then
            newPayGradeID.Value = "SAL00" & paygrd_count + 1
        ElseIf paygrd_count < 100 Then
            newPayGradeID.Value = "SAL0" & paygrd_count + 1
        ElseIf paygrd_count < 1000 Then
            newPayGradeID.Value = "SAL" & paygrd_count + 1
        End If

        payCode.Visible = False
        btnPayGradeEditSave.Text = "Save"
        PayGrade()
        newCurrency0.Visible = False
        newCurrency1.Visible = False

        assignedCurrency0.Visible = False
        assignedCurrency1.Visible = False
        assignedCurrency2.Visible = False

        frmPayGrade.Visible = True
        frmPayGrades.Visible = False
    End Sub

    Protected Sub btnPayGradeDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPayGradeDelete.Click
        Dim payString As String = Request.Form("payGrade[]")
        Dim payCodes As String = payString.Replace(",", "' OR sal_grd_code='")

        adsPayGrade.DeleteCommand = "DELETE FROM pr_salary_grade WHERE sal_grd_code='" + payCodes + "'"
        adsPayGrade.Delete()
        'Response.Write(adsPayGrade.DeleteCommand)
    End Sub

    Protected Sub btnPayGradeSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPayGradeSearch.Click
        Dim searchString As String = ""
        If cmbPayGradeSearchBy.SelectedValue = "" Then
            searchString = "SELECT sal_grd_code, sal_grd_name FROM pr_salary_grade WHERE sal_grd_code LIKE '" + txtPayGradeSearch.Text + "%' OR [sal_grd_name] LIKE '" + txtPayGradeSearch.Text + "%'"
        ElseIf cmbPayGradeSearchBy.SelectedValue = "ID" Then
            searchString = "SELECT sal_grd_code, sal_grd_name FROM pr_salary_grade WHERE sal_grd_code LIKE '" + txtPayGradeSearch.Text + "%'"
        ElseIf cmbPayGradeSearchBy.SelectedValue = "Name" Then
            searchString = "SELECT sal_grd_code, sal_grd_name FROM pr_salary_grade WHERE sal_grd_name LIKE '" + txtPayGradeSearch.Text + "%'"
        End If
        adsPayGrade.SelectCommand = searchString
        Dim dv As System.Data.DataView = adsPayGrade.Select(DataSourceSelectArguments.Empty)
        'Response.Write(dv.Count.ToString)
        'Response.Write(searchString)
    End Sub

    Protected Sub btnEmpStatEditSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEmpStatEditSave.Click
        If sender.Text = "Save" Then
            If newEmploymentStatusID.Value <> "" Then
                ' insert a new location
                If adsEmploymentStatus.Insert() > 0 Then
                    Dim lastID As Integer = Right(newEmploymentStatusID.Value, 3)
                    adsEmploymentStatus.UpdateCommand = "UPDATE hr_unique_id SET last_id =" + lastID.ToString + "  WHERE table_name='hr_empstat'"
                    adsEmploymentStatus.Update()
                End If
                Response.Redirect("Job.aspx?Page=Employment Status&id=" + newEmploymentStatusID.Value)
            ElseIf editEmploymentStatusID.Text <> "" Then
                adsEmploymentStatus.UpdateCommand = "UPDATE hr_empstat SET estat_name = '" + txtEmpStatName.Text + "' WHERE estat_code = '" + editEmploymentStatusID.Text + "'"
                ' update the record
                If adsEmploymentStatus.Update() > 0 Then
                    sender.Text = "Edit"
                    employmentStatus()
                End If
            End If
            'Response.Redirect("Job.aspx?Page=Job Specification")
        ElseIf sender.Text = "Edit" Then
            sender.Text = "Save"
            employmentStatus()
        End If
    End Sub

    Protected Sub btnEmploymentStatusAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEmploymentStatusAdd.Click
        Dim defaultSQL = adsEmploymentStatus.SelectCommand
        adsEmploymentStatus.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_empstat'"
        Dim dv As System.Data.DataView = adsEmploymentStatus.Select(DataSourceSelectArguments.Empty)
        Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
        Dim empstat_count As Integer = CInt(dr.Item(0))

        If empstat_count < 10 Then
            newEmploymentStatusID.Value = "EST00" & empstat_count + 1
        ElseIf empstat_count < 100 Then
            newEmploymentStatusID.Value = "EST0" & empstat_count + 1
        ElseIf empstat_count < 1000 Then
            newEmploymentStatusID.Value = "EST" & empstat_count + 1
        End If

        empstatCode.Visible = False
        btnEmpStatEditSave.Text = "Save"
        employmentStatus()

        frmEmploymentStatus.Visible = True
        frmEmploymentStatuses.Visible = False
    End Sub

    Protected Sub btnEmploymentStatusDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEmploymentStatusDelete.Click
        Dim empstatString As String = Request.Form("empStat[]")
        Dim empstatCodes As String = empstatString.Replace(",", "' OR estat_code='")

        adsEmploymentStatus.DeleteCommand = "DELETE FROM hr_empstat WHERE estat_code='" + empstatCodes + "'"
        adsEmploymentStatus.Delete()
        'Response.Write(adsEmploymentStatus.DeleteCommand)
    End Sub

    Protected Sub btnEmploymentStatusSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEmploymentStatusSearch.Click
        Dim searchString As String = ""
        If cmbEmpStatSearchBy.SelectedValue = "" Then
            searchString = "SELECT estat_code, estat_name FROM hr_empstat WHERE estat_code LIKE '" + txtEmploymentSearchFor.Text + "%' OR [estat_name] LIKE '" + txtEmploymentSearchFor.Text + "%'"
        ElseIf cmbEmpStatSearchBy.SelectedValue = "ID" Then
            searchString = "SELECT estat_code, estat_name FROM hr_empstat WHERE estat_code LIKE '" + txtEmploymentSearchFor.Text + "%'"
        ElseIf cmbPayGradeSearchBy.SelectedValue = "Name" Then
            searchString = "SELECT estat_code, estat_name FROM hr_empstat WHERE estat_name LIKE '" + txtEmploymentSearchFor.Text + "%'"
        End If
        adsEmploymentStatus.SelectCommand = searchString
        Dim dv As System.Data.DataView = adsEmploymentStatus.Select(DataSourceSelectArguments.Empty)
        'Response.Write(dv.Count.ToString)
        'Response.Write(searchString)
    End Sub

    Protected Sub btnEEOJobCategoryEditSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEEOJobCategoryEditSave.Click
        If sender.Text = "Save" Then
            If newEEOJobCategoryID.Value <> "" Then
                ' insert a new location
                If adsEEOJobCategory.Insert() > 0 Then
                    Dim lastID As Integer = Right(newEEOJobCategoryID.Value, 3)
                    adsEEOJobCategory.UpdateCommand = "UPDATE hr_unique_id SET last_id =" + lastID.ToString + "  WHERE table_name='hr_eec'"
                    adsEEOJobCategory.Update()
                End If
                Response.Redirect("Job.aspx?Page=EEO Job Categories&id=" + newEmploymentStatusID.Value)
            ElseIf editEEOJobCatergoryID.Text <> "" Then
                adsEEOJobCategory.UpdateCommand = "UPDATE hr_eec SET eec_desc = '" + txtEEOJobCategoryTitle.Text + "' WHERE eec_code = '" + editEEOJobCatergoryID.Text + "'"
                ' update the record
                If adsEEOJobCategory.Update() > 0 Then
                    sender.Text = "Edit"
                    eeoJobCategory()
                End If
            End If
            'Response.Redirect("Job.aspx?Page=EEO Job Categories")
        ElseIf sender.Text = "Edit" Then
            sender.Text = "Save"
            eeoJobCategory()
        End If
    End Sub

    Protected Sub btnEEOJobCategoryAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEEOJobCategoryAdd.Click
        Dim defaultSQL = adsEEOJobCategory.SelectCommand
        adsEEOJobCategory.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_eec'"
        Dim dv As System.Data.DataView = adsEEOJobCategory.Select(DataSourceSelectArguments.Empty)
        Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
        Dim eeojob_count As Integer = CInt(dr.Item(0))

        If eeojob_count < 10 Then
            newEEOJobCategoryID.Value = "EEC00" & eeojob_count + 1
        ElseIf eeojob_count < 100 Then
            newEEOJobCategoryID.Value = "EEC0" & eeojob_count + 1
        ElseIf eeojob_count < 1000 Then
            newEEOJobCategoryID.Value = "EEC" & eeojob_count + 1
        End If

        EEOCode.Visible = False
        btnEEOJobCategoryEditSave.Text = "Save"
        eeoJobCategory()

        frmJobEEOJobCat.Visible = True
        frmJobEEOJobCats.Visible = False
    End Sub

    Protected Sub btnEEOJobCategoryDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEEOJobCategoryDelete.Click
        Dim eecString As String = Request.Form("EEOJobCategory[]")
        Dim eecCodes As String = eecString.Replace(",", "' OR eec_code='")

        adsEEOJobCategory.DeleteCommand = "DELETE FROM hr_eec WHERE eec_code='" + eecCodes + "'"
        adsEEOJobCategory.Delete()
        'Response.Write(adsEmploymentStatus.DeleteCommand)
    End Sub

    Protected Sub btnEEOJobCategorySearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEEOJobCategorySearch.Click
        Dim searchString As String = ""
        If cmbEEOJobCategorySearchBy.SelectedValue = "" Then
            searchString = "SELECT eec_code, eec_desc FROM hr_eec WHERE eec_code LIKE '" + txtEEOJobCategorySearch.Text + "' OR [eec_desc] LIKE '" + txtEEOJobCategorySearch.Text + "'"
        ElseIf cmbEEOJobCategorySearchBy.SelectedValue = "ID" Then
            searchString = "SELECT eec_code, eec_desc FROM hr_eec WHERE eec_code LIKE '" + txtEEOJobCategorySearch.Text + "'"
        ElseIf cmbEEOJobCategorySearchBy.SelectedValue = "Name" Then
            searchString = "SELECT eec_code, eec_desc FROM hr_eec WHERE eec_code LIKE '" + txtEEOJobCategorySearch.Text + "'"
        End If
        adsEEOJobCategory.SelectCommand = searchString
        Dim dv As System.Data.DataView = adsEEOJobCategory.Select(DataSourceSelectArguments.Empty)
        'Response.Write(dv.Count.ToString)
        'Response.Write(searchString)
    End Sub

    Protected Sub btnAddPayGrade_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddPayGrade.Click
        Response.Redirect("Job.aspx?Page=Pay Grades&new=true")
    End Sub

    Protected Sub btnEditPayGrade_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEditPayGrade.Click
        If cmbPayGrade.SelectedValue <> "" Then
            Response.Redirect("Job.aspx?Page=Pay Grades&id=" & cmbPayGrade.SelectedValue)
        End If
    End Sub
End Class
