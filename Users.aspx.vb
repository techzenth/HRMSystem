
Partial Class _Users
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
            Case "HR Admin Users"
                MultiView1.ActiveViewIndex = 0
                ' this is really to check the table for the data
                ' then is the data present load into fields
                If Request.QueryString("id") = "" Then
                    Dim defaultSQL = adsAdminUsers.SelectCommand
                    adsAdminUsers.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_users'"
                    Dim dv As System.Data.DataView = adsAdminUsers.Select(DataSourceSelectArguments.Empty)
                    Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
                    Dim usr_count As Integer = CInt(dr.Item(0))
                    adsAdminUsers.SelectCommand = defaultSQL
                    dv = adsAdminUsers.Select(DataSourceSelectArguments.Empty)

                    If usr_count = 0 Or dv.ToTable.Rows.Count = 0 Then
                        If moduleRight(0) = "1" Then
                            ' addition is allowed
                            newAdminUserID.Value = "USR00" & usr_count + 1
                            AdminUserCode.Visible = False
                            passwordRow.Visible = True
                            btnHRAdminUsersEditSave.Text = "Save"
                            hrAdminUser()
                            frmHRAdminUsers.Visible = False

                            frmAdminUsers.Visible = True
                        Else
                            ' addition is not allowed
                            MultiView1.ActiveViewIndex = 4
                        End If

                    Else
                        If moduleRight(3) = "1" Then
                            ' viewing is allowed
                            frmHRAdminUsers.Visible = True
                            frmAdminUsers.Visible = False
                            If moduleRight(2) = "1" Then
                                ' deletion is allowed
                            Else
                                ' deletion is not allowed
                                btnHRAdminUserDelete.Enabled = False
                            End If
                            If moduleRight(0) = "1" Then
                                ' addtion is allowed
                            Else
                                ' addtion is not allowed
                                btnHRAdminUserAdd.Enabled = False
                            End If

                        Else
                            ' viewing is not allowed
                            MultiView1.ActiveViewIndex = 4
                        End If

                    End If
                Else
                    If moduleRight(3) = "1" Then
                        ' viewing is allowed

                        editHRAdminUserID.Text = Request.QueryString("id")
                        adsAdminUsers.SelectCommand = "SELECT user_name, emp_number, status, userg_id FROM hr_users WHERE id='" + editHRAdminUserID.Text + "'"
                        Dim dv As System.Data.DataView = adsAdminUsers.Select(DataSourceSelectArguments.Empty)
                        Dim dr As System.Data.DataRow = dv.ToTable.Rows.Item(0)
                        txtAdminUserName.Text = dr.Item(0).ToString
                        txtAdminEmployee.Text = dr.Item(1).ToString
                        cmbAdminUserStatus.SelectedValue = dr.Item(2).ToString
                        cmbAdminUserGroup.SelectedValue = dr.Item(3).ToString

                        AdminUserCode.Visible = True
                        passwordRow.Visible = False
                        btnHRAdminUsersEditSave.Text = "Edit"
                        hrAdminUser()
                        If moduleRight(1) = "1" Then
                            ' editing is allowed
                        Else
                            ' editing is not allowed
                            btnHRAdminUsersEditSave.Enabled = False
                        End If
                    Else
                        ' viewing is not allowed
                        MultiView1.ActiveViewIndex = 4
                    End If
                End If
            Case "ESS Users"
                MultiView1.ActiveViewIndex = 1
                ' this is really to check the table for the data
                ' then is the data present load into fields
                If Request.QueryString("id") = "" Then
                    Dim defaultSQL = adsESSUsers.SelectCommand
                    adsESSUsers.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_users'"
                    Dim dv As System.Data.DataView = adsESSUsers.Select(DataSourceSelectArguments.Empty)
                    Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
                    Dim usr_count As Integer = CInt(dr.Item(0))
                    adsESSUsers.SelectCommand = defaultSQL
                    dv = adsESSUsers.Select(DataSourceSelectArguments.Empty)

                    If usr_count = 0 Or dv.ToTable.Rows.Count = 0 Then
                        If moduleRight(0) = "1" Then
                            ' addition is allowed
                            newESSUserID.Value = "USR00" & usr_count + 1
                            ESSUserCode.Visible = False
                            passwRow.Visible = True
                            btnESSEditSave.Text = "Save"
                            essUser()
                            frmESSUsers.Visible = False
                            frmUsersESSUsers.Visible = True
                        Else
                            ' addition is not allowed
                            MultiView1.ActiveViewIndex = 4
                        End If

                    Else
                        If moduleRight(3) = "1" Then
                            ' viewing is allowed
                            frmUsersESSUsers.Visible = False
                            frmESSUsers.Visible = True
                            If moduleRight(2) = "1" Then
                                ' deletion is allowed
                            Else
                                ' deletion is not allowed
                                btnESSUsersDelete.Enabled = False
                            End If
                            If moduleRight(0) = "1" Then
                                ' addtion is allowed
                            Else
                                ' addtion is not allowed
                                btnESSUsersAdd.Enabled = False
                            End If

                        Else
                            ' viewing is not allowed
                            MultiView1.ActiveViewIndex = 4
                        End If

                    End If
                Else
                    If moduleRight(3) = "1" Then
                        ' viewing is allowed

                        editESSUserID.Text = Request.QueryString("id")
                        adsESSUsers.SelectCommand = "SELECT user_name, emp_number, status FROM hr_users WHERE id='" + editESSUserID.Text + "'"
                        Dim dv As System.Data.DataView = adsESSUsers.Select(DataSourceSelectArguments.Empty)
                        Dim dr As System.Data.DataRow = dv.ToTable.Rows.Item(0)
                        txtESSUserName.Text = dr.Item(0).ToString
                        txtESSEmployee.Text = dr.Item(1).ToString
                        cmbESSUserStatus.SelectedValue = dr.Item(2).ToString


                        ESSUserCode.Visible = True
                        passwRow.Visible = False
                        btnESSEditSave.Text = "Edit"
                        hrAdminUser()
                        If moduleRight(1) = "1" Then
                            ' editing is allowed
                        Else
                            ' editing is not allowed
                            btnESSEditSave.Enabled = False
                        End If
                    Else
                        ' viewing is not allowed
                        MultiView1.ActiveViewIndex = 4
                    End If
                End If
            Case "Admin User Groups"
                MultiView1.ActiveViewIndex = 2
                ' this is really to check the table for the data
                ' then is the data present load into fields
                If Request.QueryString("id") = "" Then
                    Dim defaultSQL = adsAdminUserGroup.SelectCommand
                    adsAdminUserGroup.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_user_group'"
                    Dim dv As System.Data.DataView = adsAdminUserGroup.Select(DataSourceSelectArguments.Empty)
                    Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
                    Dim usrg_count As Integer = CInt(dr.Item(0))
                    adsAdminUserGroup.SelectCommand = defaultSQL
                    dv = adsAdminUserGroup.Select(DataSourceSelectArguments.Empty)

                    If usrg_count = 0 Then
                        If moduleRight(0) = "1" Then
                            ' addition is allowed
                            newAdminUserGroupID.Value = "USG00" & usrg_count + 1
                            usergroupCode.Visible = False
                            btnUserGroupEditSave.Text = "Save"
                            adminUserGroup()
                            frmAdminUserGroup.Visible = True
                            lnkRights.Visible = False
                            frmAdminUserGroups.Visible = False
                        Else
                            ' addition is not allowed
                            MultiView1.ActiveViewIndex = 4
                        End If

                    Else
                        If moduleRight(3) = "1" Then
                            ' viewing is allowed
                            frmAdminUserGroup.Visible = False
                            frmAdminUserGroups.Visible = True

                            If moduleRight(2) = "1" Then
                                ' deletion is allowed
                            Else
                                ' deletion is not allowed
                                btnAdminUserGroupDelete.Enabled = False
                            End If
                            If moduleRight(0) = "1" Then
                                ' addtion is allowed
                            Else
                                ' addtion is not allowed
                                btnAdminUserGroupAdd.Enabled = False
                            End If

                        Else
                            ' viewing is not allowed
                            MultiView1.ActiveViewIndex = 4
                        End If

                    End If
                Else
                    If moduleRight(3) = "1" Then
                        ' viewing is allowed

                        editAdminUserGroupID.Text = Request.QueryString("id")
                        adsAdminUserGroup.SelectCommand = "SELECT userg_name FROM hr_user_group WHERE userg_id='" + editAdminUserGroupID.Text + "'"
                        Dim dv As System.Data.DataView = adsAdminUserGroup.Select(DataSourceSelectArguments.Empty)
                        Dim dr As System.Data.DataRow = dv.ToTable.Rows.Item(0)
                        txtUserGroupName.Text = dr.Item(0).ToString


                        btnUserGroupEditSave.Text = "Edit"
                        lnkRights.Visible = True
                        lnkRights.NavigateUrl = lnkRights.NavigateUrl & "&id=" & editAdminUserGroupID.Text

                        adminUserGroup()
                        If moduleRight(1) = "1" Then
                            ' editing is allowed
                        Else
                            ' editing is not allowed
                            btnUserGroupEditSave.Enabled = False
                        End If
                    Else
                        ' viewing is not allowed
                        MultiView1.ActiveViewIndex = 4
                    End If
                End If
            Case "Assigned User Rights"
                MultiView1.ActiveViewIndex = 3
                ' this is really to check the table for the data
                ' then is the data present load into fields

                If Request.QueryString("id") <> "" Then
                    If moduleRight(3) = "1" Then
                        ' viewing is allowed

                        editUserGroupRightsID.Text = Request.QueryString("id")
                        adsAdminUserGroup.SelectCommand = "SELECT userg_name FROM hr_user_group WHERE userg_id='" + editUserGroupRightsID.Text + "'"
                        Dim dv As System.Data.DataView = adsAdminUserGroup.Select(DataSourceSelectArguments.Empty)
                        Dim dr As System.Data.DataRow = dv.ToTable.Rows.Item(0)
                        editUserGroupRightsName.Text = dr.Item(0).ToString


                        If moduleRight(1) = "1" Then
                            ' editing is allowed
                        Else
                            ' editing is not allowed
                            btnAssignedRightsSave.Enabled = False
                        End If

                        If moduleRight(0) = "1" Then
                            ' addition is allowed
                        Else
                            ' addition is not allowed
                            btnAssignedRightsSave.Enabled = False
                        End If

                        If Request.QueryString("mod") <> "" Then
                            cmbModules.Visible = False
                            editModuleID.Value = Request.QueryString("mod")

                            Dim defaultSQL = adsAdminUserRights.SelectCommand
                            adsAdminUserRights.SelectCommand = "SELECT hr_module.name, hr_rights.addition, hr_rights.editing, hr_rights.deletion, hr_rights.viewing, hr_rights.mod_id FROM (hr_module INNER JOIN hr_rights ON hr_module.mod_id = hr_rights.mod_id) WHERE hr_rights.userg_id = '" + editUserGroupRightsID.Text + "' AND hr_rights.mod_id='" + Request.QueryString("mod") + "'"
                            'Response.Write(adsAdminUserRights.SelectCommand)
                            dv = adsAdminUserRights.Select(DataSourceSelectArguments.Empty)
                            dr = dv.ToTable.Rows.Item(0)

                            lblModule.Visible = True
                            lblModule.Text = dr.Item(0).ToString
                            chkAdd.Checked = CBool(CInt(dr.Item(1).ToString))
                            chkDelete.Checked = CBool(CInt(dr.Item(3).ToString))
                            chkEdit.Checked = CBool(CInt(dr.Item(2).ToString))
                            chkView.Checked = CBool(CInt(dr.Item(4).ToString))
                            adsAdminUserRights.SelectCommand = defaultSQL
                            btnAssignedRightsSave.Text = "Edit"
                            assignedRight()
                            flagSaveStatus.Value = "Edit"
                        Else
                            lblModule.Visible = False
                            btnAssignedRightsSave.Text = "Save"
                            assignedRight()
                            flagSaveStatus.Value = "New"
                        End If
                    Else
                        ' viewing is not allowed
                        MultiView1.ActiveViewIndex = 4
                    End If
                End If
            Case Else

        End Select
    End Sub
    Public Sub hrAdminUser()
        If btnHRAdminUsersEditSave.Text = "Save" Then
            txtAdminUserName.Enabled = True
            txtAdminPassword.Enabled = True
            txtAdminConfirmPassword.Enabled = True
            cmbAdminUserStatus.Enabled = True
            cmbAdminUserGroup.Enabled = True
            txtAdminEmployee.Enabled = True
        ElseIf btnHRAdminUsersEditSave.Text = "Edit" Then
            txtAdminUserName.Enabled = False
            txtAdminPassword.Enabled = False
            txtAdminConfirmPassword.Enabled = False
            cmbAdminUserStatus.Enabled = False
            cmbAdminUserGroup.Enabled = False
            txtAdminEmployee.Enabled = False
        End If
    End Sub

    Public Sub essUser()
        If btnESSEditSave.Text = "Save" Then
            txtESSUserName.Enabled = True
            txtESSPassword.Enabled = True
            txtESSConfirmPassword.Enabled = True
            cmbESSUserStatus.Enabled = True
            txtESSEmployee.Enabled = True
        ElseIf btnESSEditSave.Text = "Edit" Then
            txtESSUserName.Enabled = False
            txtESSPassword.Enabled = False
            txtESSConfirmPassword.Enabled = False
            cmbESSUserStatus.Enabled = False
            txtESSEmployee.Enabled = False
        End If
    End Sub
    Public Sub adminUserGroup()
        If btnUserGroupEditSave.Text = "Save" Then
            txtUserGroupName.Enabled = True
        ElseIf btnUserGroupEditSave.Text = "Edit" Then
            txtUserGroupName.Enabled = False
        End If
    End Sub

    Public Sub assignedRight()
        If btnAssignedRightsSave.Text = "Save" Then
            chkAdd.Enabled = True
            chkDelete.Enabled = True
            chkEdit.Enabled = True
            chkView.Enabled = True
        ElseIf btnAssignedRightsSave.Text = "Edit" Then
            chkAdd.Enabled = False
            chkDelete.Enabled = False
            chkEdit.Enabled = False
            chkView.Enabled = False
        End If
    End Sub

    Public Function convertYesNo(ByVal value As Integer) As String
        Dim strValue As String = ""
        If value = 1 Then
            strValue = "Yes"
        ElseIf value = 0 Then
            strValue = "No"
        End If
        convertYesNo = strValue
    End Function

    Protected Sub btnHRAdminUsersEditSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnHRAdminUsersEditSave.Click
        If sender.Text = "Save" Then
            If newAdminUserID.Value <> "" Then
                ' insert a new admin user
                Dim emp_number = 0
                If txtAdminEmployee.Text <> "" Then
                    Dim arrEmp() = Split(txtAdminEmployee.Text, " ")
                    emp_number = CInt(arrEmp(0))
                    adsAdminUsers.InsertParameters("@emp_number").DefaultValue = emp_number.ToString
                End If
                If adsAdminUsers.Insert() > 0 Then
                    Dim lastID As Integer = Right(newAdminUserID.Value, 3)
                    adsAdminUsers.UpdateCommand = "UPDATE hr_unique_id SET last_id =" + lastID.ToString + "  WHERE table_name='hr_users'"
                    adsAdminUsers.Update()
                End If
                Response.Redirect("Users.aspx?Page=HR Admin Users&id=" + newAdminUserID.Value)
            ElseIf editHRAdminUserID.Text <> "" Then
                Dim emp_number = 0
                If txtAdminEmployee.Text <> "" Then
                    Dim arrEmp() = Split(txtAdminEmployee.Text, " ")
                    emp_number = CInt(arrEmp(0))
                End If
                adsAdminUsers.UpdateCommand = "UPDATE hr_users SET user_name ='" + txtAdminUserName.Text + "', emp_number =" & emp_number & ", status ='" + cmbAdminUserStatus.SelectedValue + "', userg_id ='" + cmbAdminUserGroup.SelectedValue + "' WHERE id='" + editHRAdminUserID.Text + "'"
                ' update the record

                If adsAdminUsers.Update() > 0 Then
                    Response.Redirect(Request.RawUrl)
                End If
            End If
            'Response.Redirect("Users.aspx?Page=HR Admin Users")
        ElseIf sender.Text = "Edit" Then
            sender.Text = "Save"
            hrAdminUser()
        End If
    End Sub


    Protected Sub btnHRAdminUserAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnHRAdminUserAdd.Click
        Dim defaultSQL = adsAdminUsers.SelectCommand
        adsAdminUsers.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_users'"
        Dim dv As System.Data.DataView = adsAdminUsers.Select(DataSourceSelectArguments.Empty)
        Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
        Dim usr_count As Integer = CInt(dr.Item(0))

        ' addition is allowed
        If usr_count < 10 Then
            newAdminUserID.Value = "USR00" & usr_count + 1
        ElseIf usr_count < 100 Then
            newAdminUserID.Value = "USR0" & usr_count + 1
        ElseIf usr_count < 1000 Then
            newAdminUserID.Value = "USR" & usr_count + 1
        End If

        AdminUserCode.Visible = False
        passwordRow.Visible = True
        btnHRAdminUsersEditSave.Text = "Save"
        hrAdminUser()
        frmHRAdminUsers.Visible = False

        frmAdminUsers.Visible = True
    End Sub

    Protected Sub btnHRAdminUserDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnHRAdminUserDelete.Click
        Dim usrString As String = Request.Form("adminUsers[]")
        Dim usrCodes As String = usrString.Replace(",", "' OR id='")

        adsAdminUsers.DeleteCommand = "DELETE FROM hr_users WHERE id='" + usrCodes + "'"
        adsAdminUsers.Delete()
        'Response.Write(adsAdminUsers.DeleteCommand)
    End Sub

    Protected Sub btnHRAdminUserSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnHRAdminUserSearch.Click
        Dim searchString As String = ""
        If cmbHRAdminUserSearchBy.SelectedValue = "" Then
            searchString = "SELECT id, user_name FROM hr_users WHERE is_admin='Yes' AND id LIKE '" + txtHRAdminUserSearch.Text + "' OR user_name LIKE '" + txtHRAdminUserSearch.Text + "'"
        ElseIf cmbHRAdminUserSearchBy.SelectedValue = "ID" Then
            searchString = "SELECT id, user_name FROM hr_users WHERE is_admin='Yes' AND id LIKE '" + txtHRAdminUserSearch.Text + "'"
        ElseIf cmbHRAdminUserSearchBy.SelectedValue = "Institute" Then
            searchString = "SELECT id, user_name FROM hr_users WHERE is_admin='Yes' AND user_name LIKE '" + txtHRAdminUserSearch.Text + "'"
        End If
        adsAdminUsers.SelectCommand = searchString
        Dim dv As System.Data.DataView = adsAdminUsers.Select(DataSourceSelectArguments.Empty)
        'Response.Write(dv.Count.ToString)
        'Response.Write(searchString)
    End Sub

    Protected Sub btnUserGroupEditSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUserGroupEditSave.Click
        If sender.Text = "Save" Then
            If newAdminUserGroupID.Value <> "" Then
                ' insert a new location
                If adsAdminUserGroup.Insert() > 0 Then
                    Dim lastID As Integer = Right(newAdminUserGroupID.Value, 3)
                    adsAdminUserGroup.UpdateCommand = "UPDATE hr_unique_id SET last_id =" + lastID.ToString + "  WHERE table_name='hr_user_group'"
                    adsAdminUserGroup.Update()
                End If
                Response.Redirect("Users.aspx?Page=Admin User Groups&id=" + newAdminUserGroupID.Value)
            ElseIf editAdminUserGroupID.Text <> "" Then
                adsAdminUserGroup.UpdateCommand = "UPDATE hr_user_group SET userg_name ='" + txtUserGroupName.Text + "' WHERE userg_id = '" + editAdminUserGroupID.Text + "'"
                ' update the record
                If adsAdminUserGroup.Update() > 0 Then
                    sender.Text = "Edit"
                    adminUserGroup()
                End If
            End If
            'Response.Redirect("Users.aspx?Page=Admin User Groups")
        ElseIf sender.Text = "Edit" Then
            sender.Text = "Save"
            adminUserGroup()
        End If
    End Sub

    Protected Sub btnAdminUserGroupAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdminUserGroupAdd.Click
        Dim defaultSQL = adsAdminUserGroup.SelectCommand
        adsAdminUserGroup.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_user_group'"
        Dim dv As System.Data.DataView = adsAdminUserGroup.Select(DataSourceSelectArguments.Empty)
        Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
        Dim usrg_count As Integer = CInt(dr.Item(0))

        If usrg_count < 10 Then
            newAdminUserGroupID.Value = "USG00" & usrg_count + 1
        ElseIf usrg_count < 100 Then
            newAdminUserGroupID.Value = "USG0" & usrg_count + 1
        ElseIf usrg_count < 1000 Then
            newAdminUserGroupID.Value = "USG" & usrg_count + 1
        End If

        usergroupCode.Visible = False
        lnkRights.Visible = False
        btnUserGroupEditSave.Text = "Save"
        adminUserGroup()

        frmAdminUserGroup.Visible = True
        frmAdminUserGroups.Visible = False
    End Sub

    Protected Sub btnAdminUserGroupDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdminUserGroupDelete.Click
        Dim usrgString As String = Request.Form("adminUserGroup[]")
        Dim usrgCodes As String = usrgString.Replace(",", "' OR userg_id='")

        adsAdminUserGroup.DeleteCommand = "DELETE FROM hr_user_group WHERE userg_id='" + usrgCodes + "'"
        adsAdminUserGroup.Delete()
        'Response.Write(adsAdminUserGroup.DeleteCommand)
    End Sub

    Protected Sub btnAdminUserGroupSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdminUserGroupSearch.Click
        Dim searchString As String = ""
        If cmbAdminUserGroupSearchBy.SelectedValue = "" Then
            searchString = "SELECT userg_id, userg_name FROM hr_user_group WHERE userg_id LIKE '" + txtAdminUserGroupSearch.Text + "' OR userg_name LIKE '" + txtAdminUserGroupSearch.Text + "'"
        ElseIf cmbAdminUserGroupSearchBy.SelectedValue = "ID" Then
            searchString = "SELECT userg_id, userg_name FROM hr_user_group WHERE userg_id LIKE '" + txtAdminUserGroupSearch.Text + "'"
        ElseIf cmbAdminUserGroupSearchBy.SelectedValue = "Institute" Then
            searchString = "SELECT userg_id, userg_name FROM hr_user_group WHERE userg_name LIKE '" + txtAdminUserGroupSearch.Text + "'"
        End If
        adsAdminUserGroup.SelectCommand = searchString
        Dim dv As System.Data.DataView = adsAdminUserGroup.Select(DataSourceSelectArguments.Empty)
        'Response.Write(dv.Count.ToString)
        'Response.Write(searchString)
    End Sub

    Protected Sub btnAssignedRightsSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAssignedRightsSave.Click
        ' edit and save the module infomation
        If sender.Text = "Save" Then
            Dim addition, editing, deletion, viewing As Integer
            If chkAdd.Checked Then
                addition = 1
            Else
                addition = 0
            End If

            If chkEdit.Checked Then
                editing = 1
            Else
                editing = 0
            End If

            If chkDelete.Checked Then
                deletion = 1
            Else
                deletion = 0
            End If

            If chkView.Checked Then
                viewing = 1
            Else
                viewing = 0
            End If
            If flagSaveStatus.Value = "New" Then
                ' insert a new location
                adsAdminUserRights.InsertCommand = "INSERT INTO hr_rights (userg_id, mod_id, addition, editing, deletion, viewing) VALUES ('" + editUserGroupRightsID.Text + "', '" + cmbModules.SelectedValue + "', " & addition & ", " & editing & ", " & deletion & ", " & viewing & ")"
                adsAdminUserRights.Insert()
            ElseIf flagSaveStatus.Value = "Edit" Then
                
                adsAdminUserRights.UpdateCommand = "UPDATE hr_rights SET addition =" & addition & ", editing =" & editing & ", deletion =" & deletion & ", viewing =" & viewing & " WHERE userg_id = '" + editUserGroupRightsID.Text + "' AND mod_id='" + editModuleID.Value + "'"
                'Response.Write(adsAdminUserRights.UpdateCommand)
                ' update the record
                If adsAdminUserRights.Update() > 0 Then
                    sender.Text = "Edit"
                    assignedRight()
                End If
            End If
        ElseIf sender.Text = "Edit" Then
            sender.Text = "Save"
            assignedRight()
        End If
    End Sub

    Protected Sub btnAssignedRightsReset_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAssignedRightsReset.Click
        adsAdminUserRights.UpdateCommand = "UPDATE hr_rights SET addition =0, editing =0, deletion =0, viewing =0 WHERE userg_id = '" + editUserGroupRightsID.Text + "'"
        'Response.Write(adsAdminUserRights.UpdateCommand)
        adsAdminUserRights.Update()
    End Sub

    Protected Sub btnESSEditSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnESSEditSave.Click
        If sender.Text = "Save" Then
            If newESSUserID.Value <> "" Then
                ' insert a new ESS User
                Dim emp_number = 0
                If txtESSEmployee.Text <> "" Then
                    Dim arrEmp() = Split(txtESSEmployee.Text, " ")
                    emp_number = CInt(arrEmp(0))
                    adsESSUsers.InsertParameters("@emp_number").DefaultValue = emp_number.ToString
                End If
                'Response.Write(adsESSUsers.InsertCommand)

                If adsESSUsers.Insert() > 0 Then
                    Dim lastID As Integer = Right(newESSUserID.Value, 3)
                    adsESSUsers.UpdateCommand = "UPDATE hr_unique_id SET last_id =" + lastID.ToString + "  WHERE table_name='hr_users'"
                    adsESSUsers.Update()
                End If
                Response.Redirect("Users.aspx?Page=ESS Users&id=" + newESSUserID.Value)
            ElseIf editESSUserID.Text <> "" Then
                Dim emp_number = 0
                If txtESSEmployee.Text <> "" Then
                    Dim arrEmp() = Split(txtESSEmployee.Text, " ")
                    emp_number = CInt(arrEmp(0))
                End If
                adsESSUsers.UpdateCommand = "UPDATE hr_users SET user_name ='" + txtESSUserName.Text + "', emp_number =" & emp_number & ", status ='" + cmbESSUserStatus.SelectedValue + "' WHERE id='" + editESSUserID.Text + "'"
                ' update the record

                If adsESSUsers.Update() > 0 Then
                    Response.Redirect(Request.RawUrl)
                End If
            End If
            'Response.Redirect("Users.aspx?Page=HR Admin Users")
        ElseIf sender.Text = "Edit" Then
            sender.Text = "Save"
            essUser()
        End If
    End Sub

    Protected Sub btnESSUsersSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnESSUsersSearch.Click
        Dim searchString As String = ""
        If cmbESSUsersSearchBy.SelectedValue = "" Then
            searchString = "SELECT id, user_name FROM hr_users WHERE (is_admin = 'No') AND id LIKE '" + txtESSUsersSearchBy.Text + "%' OR user_name LIKE '" + txtESSUsersSearchBy.Text + "%'"
        ElseIf cmbESSUsersSearchBy.SelectedValue = "ID" Then
            searchString = "SELECT id, user_name FROM hr_users WHERE (is_admin = 'No') AND id LIKE '" + txtESSUsersSearchBy.Text + "%'"
        ElseIf cmbESSUsersSearchBy.SelectedValue = "Institute" Then
            searchString = "SELECT id, user_name FROM hr_users WHERE (is_admin = 'No') AND user_name LIKE '" + txtESSUsersSearchBy.Text + "%'"
        End If
        adsESSUsers.SelectCommand = searchString
        Dim dv As System.Data.DataView = adsESSUsers.Select(DataSourceSelectArguments.Empty)
        'Response.Write(dv.Count.ToString)
        'Response.Write(searchString)
    End Sub

    Protected Sub btnESSUsersAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnESSUsersAdd.Click
        Dim defaultSQL = adsESSUsers.SelectCommand
        adsESSUsers.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_users'"
        Dim dv As System.Data.DataView = adsESSUsers.Select(DataSourceSelectArguments.Empty)
        Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
        Dim usr_count As Integer = CInt(dr.Item(0))
        adsESSUsers.SelectCommand = defaultSQL
        dv = adsESSUsers.Select(DataSourceSelectArguments.Empty)

        ' addition is allowed
        newESSUserID.Value = "USR00" & usr_count + 1
        ESSUserCode.Visible = False
        passwRow.Visible = True
        btnESSEditSave.Text = "Save"
        essUser()
        frmESSUsers.Visible = False
        frmUsersESSUsers.Visible = True
    End Sub
End Class

