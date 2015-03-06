
Partial Class _Skills
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
            Case "Skills"
                MultiView1.ActiveViewIndex = 0
                ' this is really to check the table for the data
                ' then is the data present load into fields
                If Request.QueryString("id") = "" Then
                    Dim defaultSQL = adsSkills.SelectCommand
                    adsSkills.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_skill'"
                    Dim dv As System.Data.DataView = adsSkills.Select(DataSourceSelectArguments.Empty)
                    Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
                    Dim skill_count As Integer = CInt(dr.Item(0))
                    adsSkills.SelectCommand = defaultSQL
                    dv = adsSkills.Select(DataSourceSelectArguments.Empty)

                    If skill_count = 0 Then
                        If moduleRight(0) = "1" Then
                            ' addition is allowed
                            newSkillID.Value = "SKI00" & skill_count + 1
                            skillCode.Visible = False
                            btnSkillEditSave.Text = "Save"
                            skills()
                            frmSkillSkills.Visible = True

                            frmSkills.Visible = False
                        Else
                            ' addition is not allowed
                            MultiView1.ActiveViewIndex = 2
                        End If

                    Else
                        If moduleRight(3) = "1" Then
                            ' viewing is allowed
                            frmSkillSkills.Visible = False
                            frmSkills.Visible = True
                            If moduleRight(2) = "1" Then
                                ' deletion is allowed
                            Else
                                ' deletion is not allowed
                                btnSkillDelete.Enabled = False
                            End If
                            If moduleRight(0) = "1" Then
                                ' addtion is allowed
                            Else
                                ' addtion is not allowed
                                btnSkillAdd.Enabled = False
                            End If

                        Else
                            ' viewing is not allowed
                            MultiView1.ActiveViewIndex = 2
                        End If

                    End If
                Else
                    If moduleRight(3) = "1" Then
                        ' viewing is allowed

                        editSkillID.Text = Request.QueryString("id")
                        adsSkills.SelectCommand = "SELECT skill_name, skill_description FROM hr_skill WHERE skill_code='" + editSkillID.Text + "'"
                        Dim dv As System.Data.DataView = adsSkills.Select(DataSourceSelectArguments.Empty)
                        Dim dr As System.Data.DataRow = dv.ToTable.Rows.Item(0)
                        txtSkillName.Text = dr.Item(0).ToString
                        txtSkillDescription.Text = dr.Item(1).ToString

                        btnSkillEditSave.Text = "Edit"
                        skills()
                        If moduleRight(1) = "1" Then
                            ' editing is allowed
                        Else
                            ' editing is not allowed
                            btnSkillEditSave.Enabled = False
                        End If
                    Else
                        ' viewing is not allowed
                        MultiView1.ActiveViewIndex = 2
                    End If
                End If
            Case "Languages"
                MultiView1.ActiveViewIndex = 1
                ' this is really to check the table for the data
                ' then is the data present load into fields

                If Request.QueryString("id") = "" Then
                    Dim defaultSQL = adsLanguages.SelectCommand
                    adsLanguages.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_language'"
                    Dim dv As System.Data.DataView = adsLanguages.Select(DataSourceSelectArguments.Empty)
                    Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
                    Dim lan_count As Integer = CInt(dr.Item(0))
                    adsLanguages.SelectCommand = defaultSQL
                    dv = adsLanguages.Select(DataSourceSelectArguments.Empty)

                    If lan_count = 0 Then
                        If moduleRight(0) = "1" Then
                            ' addition is allowed
                            newLanguageID.Value = "LAN00" & lan_count + 1
                            languageCode.Visible = False
                            btnLanguageEditSave.Text = "Save"
                            language()
                            frmSkillLanguages.Visible = True

                            frmLanguages.Visible = False
                        Else
                            ' addition is not allowed
                            MultiView1.ActiveViewIndex = 2
                        End If

                    Else
                        If moduleRight(3) = "1" Then
                            ' viewing is allowed
                            frmSkillLanguages.Visible = False
                            frmLanguages.Visible = True
                            If moduleRight(2) = "1" Then
                                ' deletion is allowed
                            Else
                                ' deletion is not allowed
                                btnLanguageDelete.Enabled = False
                            End If
                            If moduleRight(0) = "1" Then
                                ' addtion is allowed
                            Else
                                ' addtion is not allowed
                                btnLanguageAdd.Enabled = False
                            End If

                        Else
                            ' viewing is not allowed
                            MultiView1.ActiveViewIndex = 2
                        End If

                    End If
                Else
                    If moduleRight(3) = "1" Then
                        ' viewing is allowed

                        editLanguageID.Text = Request.QueryString("id")
                        adsLanguages.SelectCommand = "SELECT lang_name FROM hr_language WHERE lang_code='" + editLanguageID.Text + "'"
                        Dim dv As System.Data.DataView = adsLanguages.Select(DataSourceSelectArguments.Empty)
                        Dim dr As System.Data.DataRow = dv.ToTable.Rows.Item(0)
                        txtLanguageName.Text = dr.Item(0).ToString

                        btnLanguageEditSave.Text = "Edit"
                        language()
                        If moduleRight(1) = "1" Then
                            ' editing is allowed
                        Else
                            ' editing is not allowed
                            btnLanguageEditSave.Enabled = False
                        End If
                    Else
                        ' viewing is not allowed
                        MultiView1.ActiveViewIndex = 2
                    End If
                End If

            Case Else

        End Select
    End Sub
    Public Sub skills()
        If btnSkillEditSave.Text = "Save" Then
            txtSkillName.Enabled = True
            txtSkillDescription.Enabled = True
        ElseIf btnSkillEditSave.Text = "Edit" Then
            txtSkillName.Enabled = False
            txtSkillDescription.Enabled = False
        End If
    End Sub

    Public Sub language()
        If btnLanguageEditSave.Text = "Save" Then
            txtLanguageName.Enabled = True
        ElseIf btnLanguageEditSave.Text = "Edit" Then
            txtLanguageName.Enabled = False
        End If
    End Sub


    Protected Sub btnSkillEditSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSkillEditSave.Click
        If sender.Text = "Save" Then
            If newSkillID.Value <> "" Then
                ' insert a new location
                If adsSkills.Insert() > 0 Then
                    Dim lastID As Integer = Right(newSkillID.Value, 3)
                    adsSkills.UpdateCommand = "UPDATE hr_unique_id SET last_id =" + lastID.ToString + "  WHERE table_name='hr_skill'"
                    adsSkills.Update()
                End If
                Response.Redirect("Skills.aspx?Page=Skills&id=" + newSkillID.Value)
            ElseIf editSkillID.Text <> "" Then
                adsSkills.UpdateCommand = "UPDATE hr_skill SET skill_name= '" + txtSkillName.Text + "', skill_description = '" + txtSkillDescription.Text + "' WHERE skill_code = '" + editSkillID.Text + "'"
                ' update the record
                If adsSkills.Update() > 0 Then
                    sender.Text = "Edit"
                    skills()
                End If
            End If
            'Response.Redirect("Skills.aspx?Page=Skills")
        ElseIf sender.Text = "Edit" Then
            sender.Text = "Save"
            skills()
        End If
    End Sub

    Protected Sub btnSkillAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSkillAdd.Click
        Dim defaultSQL = adsSkills.SelectCommand
        adsSkills.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_skill'"
        Dim dv As System.Data.DataView = adsSkills.Select(DataSourceSelectArguments.Empty)
        Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
        Dim skill_count As Integer = CInt(dr.Item(0))

        If skill_count < 10 Then
            newSkillID.Value = "SKI00" & skill_count + 1
        ElseIf skill_count < 100 Then
            newSkillID.Value = "SKI0" & skill_count + 1
        ElseIf skill_count < 1000 Then
            newSkillID.Value = "SKI" & skill_count + 1
        End If

        skillCode.Visible = False
        btnSkillEditSave.Text = "Save"
        skills()

        frmSkillSkills.Visible = True
        frmSkills.Visible = False
    End Sub

    Protected Sub btnSkillDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSkillDelete.Click
        Dim skillString As String = Request.Form("skills[]")
        Dim skillCodes As String = skillString.Replace(",", "' OR skill_code='")

        adsSkills.DeleteCommand = "DELETE FROM hr_skill WHERE skill_code='" + skillCodes + "'"
        adsSkills.Delete()
        'Response.Write(adsSkills.DeleteCommand)
    End Sub

    Protected Sub btnSkillSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSkillSearch.Click
        Dim searchString As String = ""
        If cmbSkillSearchBy.SelectedValue = "" Then
            searchString = "SELECT skill_code, skill_name FROM hr_skill WHERE skill_code LIKE '" + txtSkillSearch.Text + "' OR skill_name LIKE '" + txtSkillSearch.Text + "'"
        ElseIf cmbSkillSearchBy.SelectedValue = "ID" Then
            searchString = "SELECT skill_code, skill_name FROM hr_skill WHERE skill_code LIKE '" + txtSkillSearch.Text + "'"
        ElseIf cmbSkillSearchBy.SelectedValue = "Name" Then
            searchString = "SELECT skill_code, skill_name FROM hr_skill WHERE skill_name LIKE '" + txtSkillSearch.Text + "'"
        End If
        adsSkills.SelectCommand = searchString
        Dim dv As System.Data.DataView = adsSkills.Select(DataSourceSelectArguments.Empty)
        'Response.Write(dv.Count.ToString)
        'Response.Write(searchString)
    End Sub

    Protected Sub btnLanguageEditSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLanguageEditSave.Click
        If sender.Text = "Save" Then
            If newLanguageID.Value <> "" Then
                ' insert a new location
                If adsLanguages.Insert() > 0 Then
                    Dim lastID As Integer = Right(newLanguageID.Value, 3)
                    adsLanguages.UpdateCommand = "UPDATE hr_unique_id SET last_id =" + lastID.ToString + "  WHERE table_name='hr_language'"
                    adsLanguages.Update()
                End If
                Response.Redirect("Skills.aspx?Page=Languages&id=" + newLanguageID.Value)
            ElseIf editLanguageID.Text <> "" Then
                adsLanguages.UpdateCommand = "UPDATE hr_language SET lang_name = '" + txtLanguageName.Text + "' WHERE lang_code = '" + editLanguageID.Text + "'"
                ' update the record
                If adsLanguages.Update() > 0 Then
                    sender.Text = "Edit"
                    language()
                End If
            End If
            'Response.Redirect("Skills.aspx?Page=Languages")
        ElseIf sender.Text = "Edit" Then
            sender.Text = "Save"
            language()
        End If
    End Sub

    Protected Sub btnLanguageAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLanguageAdd.Click
        Dim defaultSQL = adsLanguages.SelectCommand
        adsLanguages.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_language'"
        Dim dv As System.Data.DataView = adsLanguages.Select(DataSourceSelectArguments.Empty)
        Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
        Dim lan_count As Integer = CInt(dr.Item(0))

        If lan_count < 10 Then
            newLanguageID.Value = "LAN00" & lan_count + 1
        ElseIf lan_count < 100 Then
            newLanguageID.Value = "LAN0" & lan_count + 1
        ElseIf lan_count < 1000 Then
            newLanguageID.Value = "LAN" & lan_count + 1
        End If

        languageCode.Visible = False
        btnLanguageEditSave.Text = "Save"
        language()

        frmSkillLanguages.Visible = True
        frmLanguages.Visible = False
    End Sub

    Protected Sub btnLanguageDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLanguageDelete.Click
        Dim lanString As String = Request.Form("languages[]")
        Dim lanCodes As String = lanString.Replace(",", "' OR lang_code='")

        adsLanguages.DeleteCommand = "DELETE FROM hr_language WHERE lang_code='" + lanCodes + "'"
        adsLanguages.Delete()
        'Response.Write(adsLanguages.DeleteCommand)
    End Sub

    Protected Sub btnLanguageSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLanguageSearch.Click
        Dim searchString As String = ""
        If cmbLanguageSearchBy.SelectedValue = "" Then
            searchString = "SELECT lang_code, lang_name FROM hr_language WHERE lang_code LIKE '" + txtLanguageSearch.Text + "' OR lang_name LIKE '" + txtLanguageSearch.Text + "'"
        ElseIf cmbLanguageSearchBy.SelectedValue = "ID" Then
            searchString = "SELECT lang_code, lang_name FROM hr_language WHERE lang_code LIKE '" + txtLanguageSearch.Text + "'"
        ElseIf cmbLanguageSearchBy.SelectedValue = "Name" Then
            searchString = "SELECT lang_code, lang_name FROM hr_language WHERE lang_name LIKE '" + txtLanguageSearch.Text + "'"
        End If
        adsLanguages.SelectCommand = searchString
        Dim dv As System.Data.DataView = adsLanguages.Select(DataSourceSelectArguments.Empty)
        'Response.Write(dv.Count.ToString)
        'Response.Write(searchString)
    End Sub
End Class
