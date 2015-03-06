
Partial Class _Membership
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
            Case "Membership Types"
                MultiView1.ActiveViewIndex = 0
                ' this is really to check the table for the data
                ' then is the data present load into fields
                If Request.QueryString("id") = "" Then
                    Dim defaultSQL = adsMembershipTypes.SelectCommand
                    adsMembershipTypes.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_membership_type'"
                    Dim dv As System.Data.DataView = adsMembershipTypes.Select(DataSourceSelectArguments.Empty)
                    Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
                    Dim mem_count As Integer = CInt(dr.Item(0))
                    adsMembershipTypes.SelectCommand = defaultSQL
                    dv = adsMembershipTypes.Select(DataSourceSelectArguments.Empty)

                    If mem_count = 0 Then
                        If moduleRight(0) = "1" Then
                            ' addition is allowed
                            newMembershipTypeID.Value = "MEM00" & mem_count + 1
                            membershipTypeCode.Visible = False
                            btnMembershipTypeEditSave.Text = "Save"
                            membershipType()
                            frmMembershipMembershipType.Visible = True

                            frmMembershipType.Visible = False
                        Else
                            ' addition is not allowed
                            MultiView1.ActiveViewIndex = 2
                        End If

                    Else
                        If moduleRight(3) = "1" Then
                            ' viewing is allowed
                            frmMembershipMembershipType.Visible = False
                            frmMembershipType.Visible = True
                            If moduleRight(2) = "1" Then
                                ' deletion is allowed
                            Else
                                ' deletion is not allowed
                                btnMembershipTypeDelete.Enabled = False
                            End If
                            If moduleRight(0) = "1" Then
                                ' addtion is allowed
                            Else
                                ' addtion is not allowed
                                btnMembershipTypeAdd.Enabled = False
                            End If

                        Else
                            ' viewing is not allowed
                            MultiView1.ActiveViewIndex = 2
                        End If

                    End If
                Else
                    If moduleRight(3) = "1" Then
                        ' viewing is allowed

                        editMembershipTypeID.Text = Request.QueryString("id")
                        adsMembershipTypes.SelectCommand = "SELECT membtype_name FROM hr_membership_type WHERE membtype_code='" + editMembershipTypeID.Text + "'"
                        Dim dv As System.Data.DataView = adsMembershipTypes.Select(DataSourceSelectArguments.Empty)
                        Dim dr As System.Data.DataRow = dv.ToTable.Rows.Item(0)
                        txtMembershipTypeName.Text = dr.Item(0).ToString


                        btnMembershipTypeEditSave.Text = "Edit"
                        membershipType()
                        If moduleRight(1) = "1" Then
                            ' editing is allowed
                        Else
                            ' editing is not allowed
                            btnMembershipTypeEditSave.Enabled = False
                        End If
                    Else
                        ' viewing is not allowed
                        MultiView1.ActiveViewIndex = 2
                    End If
                End If
            Case "Memberships"
                MultiView1.ActiveViewIndex = 1
                ' this is really to check the table for the data
                ' then is the data present load into fields
                If Request.QueryString("id") = "" Then
                    Dim defaultSQL = adsMemberships.SelectCommand
                    adsMemberships.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_membership'"
                    Dim dv As System.Data.DataView = adsMemberships.Select(DataSourceSelectArguments.Empty)
                    Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
                    Dim mem_count As Integer = CInt(dr.Item(0))
                    adsMemberships.SelectCommand = defaultSQL
                    dv = adsMemberships.Select(DataSourceSelectArguments.Empty)

                    If mem_count = 0 Then
                        If moduleRight(0) = "1" Then
                            ' addition is allowed
                            newMembershipID.Value = "MME00" & mem_count + 1
                            membershipCode.Visible = False
                            btnMembershipEditSave.Text = "Save"
                            membership()
                            frmMembership.Visible = True

                            frmMemberships.Visible = False
                        Else
                            ' addition is not allowed
                            MultiView1.ActiveViewIndex = 2
                        End If

                    Else
                        If moduleRight(3) = "1" Then
                            ' viewing is allowed
                            frmMembership.Visible = False
                            frmMemberships.Visible = True
                            If moduleRight(2) = "1" Then
                                ' deletion is allowed
                            Else
                                ' deletion is not allowed
                                btnMembershipDelete.Enabled = False
                            End If
                            If moduleRight(0) = "1" Then
                                ' addtion is allowed
                            Else
                                ' addtion is not allowed
                                btnMembershipAdd.Enabled = False
                            End If

                        Else
                            ' viewing is not allowed
                            MultiView1.ActiveViewIndex = 2
                        End If

                    End If
                Else
                    If moduleRight(3) = "1" Then
                        ' viewing is allowed

                        editMembershipID.Text = Request.QueryString("id")
                        adsMemberships.SelectCommand = "SELECT membership_name, membtype_code FROM hr_membership WHERE membership_code='" + editMembershipID.Text + "'"
                        Dim dv As System.Data.DataView = adsMemberships.Select(DataSourceSelectArguments.Empty)
                        Dim dr As System.Data.DataRow = dv.ToTable.Rows.Item(0)
                        txtMembershipName.Text = dr.Item(0).ToString
                        cmbMembershipMembershipType.SelectedValue = dr.Item(1).ToString

                        btnMembershipEditSave.Text = "Edit"
                        membership()
                        If moduleRight(1) = "1" Then
                            ' editing is allowed
                        Else
                            ' editing is not allowed
                            btnMembershipEditSave.Enabled = False
                        End If
                    Else
                        ' viewing is not allowed
                        MultiView1.ActiveViewIndex = 2
                    End If
                End If


            Case Else

        End Select
    End Sub
    Public Sub membershipType()
        If btnMembershipTypeEditSave.Text = "Save" Then
            txtMembershipTypeName.Enabled = True
        ElseIf btnMembershipTypeEditSave.Text = "Edit" Then
            txtMembershipTypeName.Enabled = False
        End If
    End Sub

    Public Sub membership()
        If btnMembershipEditSave.Text = "Save" Then
            txtMembershipName.Enabled = True
            cmbMembershipMembershipType.Enabled = True
        ElseIf btnMembershipEditSave.Text = "Edit" Then
            txtMembershipName.Enabled = False
            cmbMembershipMembershipType.Enabled = False
        End If
    End Sub

    Protected Sub btnMembershipTypeEditSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMembershipTypeEditSave.Click
        If sender.Text = "Save" Then
            If newMembershipTypeID.Value <> "" Then
                ' insert a new location
                If adsMembershipTypes.Insert() > 0 Then
                    Dim lastID As Integer = Right(newMembershipTypeID.Value, 3)
                    adsMembershipTypes.UpdateCommand = "UPDATE hr_unique_id SET last_id =" + lastID.ToString + "  WHERE table_name='hr_membership_type'"
                    adsMembershipTypes.Update()
                End If
                Response.Redirect("Membership.aspx?Page=Membership Types&id=" + newMembershipTypeID.Value)
            ElseIf editMembershipTypeID.Text <> "" Then
                adsMembershipTypes.UpdateCommand = "UPDATE hr_membership_type SET membership_type_name= '" + txtMembershipTypeName.Text + "' WHERE membtype_code = '" + editMembershipTypeID.Text + "'"
                ' update the record
                If adsMembershipTypes.Update() > 0 Then
                    sender.Text = "Edit"
                    membershipType()
                End If
            End If
            'Response.Redirect("Membership.aspx?Page=Membership Types")
        ElseIf sender.Text = "Edit" Then
            sender.Text = "Save"
            membershipType()
        End If
    End Sub

    Protected Sub btnMembershipTypeAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMembershipTypeAdd.Click
        Dim defaultSQL = adsMembershipTypes.SelectCommand
        adsMembershipTypes.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_membership_type'"
        Dim dv As System.Data.DataView = adsMembershipTypes.Select(DataSourceSelectArguments.Empty)
        Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
        Dim mem_count As Integer = CInt(dr.Item(0))

        If mem_count < 10 Then
            newMembershipTypeID.Value = "MEM00" & mem_count + 1
        ElseIf mem_count < 100 Then
            newMembershipTypeID.Value = "MEM0" & mem_count + 1
        ElseIf mem_count < 1000 Then
            newMembershipTypeID.Value = "MEM" & mem_count + 1
        End If

        membershipTypeCode.Visible = False
        btnMembershipTypeEditSave.Text = "Save"
        membershipType()

        frmMembershipMembershipType.Visible = True
        frmMembershipType.Visible = False
    End Sub

    Protected Sub btnMembershipTypeDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMembershipTypeDelete.Click
        Dim memString As String = Request.Form("membershipType[]")
        Dim memCodes As String = memString.Replace(",", "' OR membtype_code='")

        adsMembershipTypes.DeleteCommand = "DELETE FROM hr_membership_type WHERE membtype_code='" + memCodes + "'"
        adsMembershipTypes.Delete()
        'Response.Write(adsMembershipTypes.DeleteCommand)
    End Sub

    Protected Sub btnMembershipTypeSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMembershipTypeSearch.Click
        Dim searchString As String = ""
        If cmbMembershipTypeSearchBy.SelectedValue = "" Then
            searchString = "SELECT membtype_code,membtype_name FROM hr_membership_type WHERE membtype_code LIKE '" + txtMembershipTypeSearch.Text + "' OR membtype_name LIKE '" + txtMembershipTypeSearch.Text + "'"
        ElseIf cmbMembershipTypeSearchBy.SelectedValue = "ID" Then
            searchString = "SELECT membtype_code,membtype_name FROM hr_membership_type WHERE membtype_code LIKE '" + txtMembershipTypeSearch.Text + "'"
        ElseIf cmbMembershipTypeSearchBy.SelectedValue = "Name" Then
            searchString = "SELECT membtype_code,membtype_name FROM hr_membership_type WHERE membtype_name LIKE '" + txtMembershipTypeSearch.Text + "'"
        End If
        adsMembershipTypes.SelectCommand = searchString
        Dim dv As System.Data.DataView = adsMembershipTypes.Select(DataSourceSelectArguments.Empty)
        'Response.Write(dv.Count.ToString)
        'Response.Write(searchString)
    End Sub

    Protected Sub btnMembershipEditSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMembershipEditSave.Click
        If sender.Text = "Save" Then
            If newMembershipID.Value <> "" Then
                ' insert a new location
                If adsMemberships.Insert() > 0 Then
                    Dim lastID As Integer = Right(newMembershipID.Value, 3)
                    adsMemberships.UpdateCommand = "UPDATE hr_unique_id SET last_id =" + lastID.ToString + "  WHERE table_name='hr_membership'"
                    adsMemberships.Update()
                End If
                Response.Redirect("Membership.aspx?Page=Memberships&id=" + newMembershipID.Value)
            ElseIf editMembershipID.Text <> "" Then
                adsMemberships.UpdateCommand = "UPDATE hr_membership SET membership_name = '" + txtMembershipName.Text + "', membtype_code = '" + cmbMembershipMembershipType.SelectedValue + "' WHERE membership_code = '" + editMembershipID.Text + "'"
                ' update the record
                If adsMemberships.Update() > 0 Then
                    sender.Text = "Edit"
                    membership()
                End If
            End If
            'Response.Redirect("Membership.aspx?Page=Memberships")
        ElseIf sender.Text = "Edit" Then
            sender.Text = "Save"
            membership()
        End If
    End Sub

    Protected Sub btnMembershipAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMembershipAdd.Click
        Dim defaultSQL = adsMemberships.SelectCommand
        adsMemberships.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_membership'"
        Dim dv As System.Data.DataView = adsMemberships.Select(DataSourceSelectArguments.Empty)
        Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
        Dim mem_count As Integer = CInt(dr.Item(0))

        If mem_count < 10 Then
            newMembershipID.Value = "MME00" & mem_count + 1
        ElseIf mem_count < 100 Then
            newMembershipID.Value = "MME0" & mem_count + 1
        ElseIf mem_count < 1000 Then
            newMembershipID.Value = "MME" & mem_count + 1
        End If

        membershipCode.Visible = False
        btnMembershipEditSave.Text = "Save"
        membership()

        frmMembership.Visible = True
        frmMemberships.Visible = False
    End Sub

    Protected Sub btnMembershipDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMembershipDelete.Click
        Dim memString As String = Request.Form("membership[]")
        Dim memCodes As String = memString.Replace(",", "' OR membership_code='")

        adsMemberships.DeleteCommand = "DELETE FROM hr_membership WHERE membership_code='" + memCodes + "'"
        adsMemberships.Delete()
        'Response.Write(adsMemberships.DeleteCommand)
    End Sub

    Protected Sub btnMembershipSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMembershipSearch.Click
        Dim searchString As String = ""
        If cmbMembershipSearchBy.SelectedValue = "" Then
            searchString = "SELECT membership_code, membership_name FROM hr_membership WHERE membership_code LIKE '" + txtMembershipSearch.Text + "' OR membership_name LIKE '" + txtMembershipSearch.Text + "'"
        ElseIf cmbMembershipSearchBy.SelectedValue = "ID" Then
            searchString = "SELECT membership_code, membership_name FROM hr_membership WHERE membership_code LIKE '" + txtMembershipSearch.Text + "'"
        ElseIf cmbMembershipSearchBy.SelectedValue = "Name" Then
            searchString = "SELECT membership_code, membership_name FROM hr_membership WHERE membership_name LIKE '" + txtMembershipSearch.Text + "'"
        End If
        adsMemberships.SelectCommand = searchString
        Dim dv As System.Data.DataView = adsMemberships.Select(DataSourceSelectArguments.Empty)
        'Response.Write(dv.Count.ToString)
        'Response.Write(searchString)
    End Sub
End Class
