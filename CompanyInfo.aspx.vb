
Partial Class _CompanyInfo
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
            Case "General"
                MultiView1.ActiveViewIndex = 0
                ' this is really to check the table for the data
                ' then is the data present load into fields
                If moduleRight(3) = "1" Then
                    ' Viewing is allowed
                    Dim defaultSQL = adsGenifo.SelectCommand
                    adsGenifo.SelectCommand = "SELECT COUNT(*) FROM hr_employee"
                    Dim dv As System.Data.DataView = adsGenifo.Select(DataSourceSelectArguments.Empty)
                    Dim dr As System.Data.DataRow = dv.ToTable.Rows.Item(0)
                    lblNumEmployees.Text = dr.Item(0).ToString
                    adsGenifo.SelectCommand = defaultSQL
                    dv = adsGenifo.Select(DataSourceSelectArguments.Empty)
                    dr = dv.ToTable.Rows.Item(0)

                    If dr.Item(0).ToString <> "" Then
                        Dim cKeys As String = dr.Item(0).ToString
                        Dim keyArr() As String = cKeys.Split("|")
                        Dim cValue As String = dr.Item(1).ToString
                        Dim valArr() As String = cValue.Split("|")
                        txtCompanyName.Text = valArr(0)
                        cmbCountry.SelectedValue = valArr(1)
                        txtAddress1.Text = valArr(2)
                        txtAddress2.Text = valArr(3)
                        txtState.Text = valArr(4)
                        txtCity.Text = valArr(5)
                        txtZipCode.Text = valArr(6)
                        txtPhone.Text = valArr(7)
                        txtFax.Text = valArr(8)
                        txtTaxID.Text = valArr(9)
                        txtNAICS.Text = valArr(10)
                        txtComments.Text = valArr(11)

                        If moduleRight(1) = "1" Then
                            ' Editing is allowed")
                            btnCompanyEditSave.Text = "Edit"
                            companyInfo()
                        Else
                            'Editing is not allowed
                            btnCompanyEditSave.Enabled = False
                        End If
                    Else
                        btnCompanyEditSave.Text = "Save"
                        companyInfo()
                    End If
                Else
                    'Response.Write("Viewing to db not allowed")
                    MultiView1.ActiveViewIndex = 4
                End If
            Case "Location"
                MultiView1.ActiveViewIndex = 1
                ' this is really to check the table for the data
                ' then is the data present load into fields
                If Request.QueryString("loc_code") = "" Then
                    Dim defaultSQL = adsLocation.SelectCommand
                    adsLocation.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_location'"
                    Dim dv As System.Data.DataView = adsLocation.Select(DataSourceSelectArguments.Empty)
                    Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
                    Dim loc_count As Integer = CInt(dr.Item(0))
                    adsLocation.SelectCommand = defaultSQL
                    dv = adsLocation.Select(DataSourceSelectArguments.Empty)

                    If loc_count = 0 Then
                        If moduleRight(0) = "1" Then
                            ' addition is allowed
                            newID.Value = "LOC000" & loc_count + 1
                            locCode.Visible = False
                            btnLocEditSave.Text = "Save"
                            frmLocEntry.Visible = True
                            Location()
                            frmLocation.Visible = False
                        Else
                            ' addition is not allowed
                            MultiView1.ActiveViewIndex = 4
                        End If
                    Else
                        If moduleRight(3) = "1" Then
                            ' viewing is allowed
                            frmLocEntry.Visible = False
                            frmLocation.Visible = True
                            If moduleRight(2) = "1" Then
                                ' deletion is allowed
                            Else
                                ' deletion is not allowed
                                btnLocDelete.Enabled = False
                            End If
                            If moduleRight(0) = "1" Then
                                ' addition is allowed
                            Else
                                ' addition is not allowed
                                btnLocAdd.Enabled = False
                            End If
                        Else
                            ' viewing is not allowed
                            MultiView1.ActiveViewIndex = 4
                        End If
                    End If
                Else
                    If moduleRight(3) = "1" Then
                        ' viewing is allowed
                        ' data present load into fields
                        editID.Text = Request.QueryString("loc_code")
                        locCode.Visible = True
                        adsLocation.SelectCommand = "SELECT * FROM hr_locations WHERE loc_code='" + editID.Text + "'"
                        Dim dv As System.Data.DataView = adsLocation.Select(DataSourceSelectArguments.Empty)
                        Dim dr As System.Data.DataRow = dv.ToTable.Rows.Item(0)
                        txtLocName.Text = dr.Item(1).ToString
                        cmbLocCountry.SelectedValue = dr.Item(2).ToString
                        txtLocState.Text = dr.Item(3).ToString
                        txtLocCity.Text = dr.Item(4).ToString
                        txtLocAddress.Text = dr.Item(5).ToString
                        txtLocZipCode.Text = dr.Item(6).ToString
                        txtLocPhone.Text = dr.Item(7).ToString
                        txtLocFax.Text = dr.Item(8).ToString
                        txtLocComments.Text = dr.Item(9).ToString
                        btnLocEditSave.Text = "Edit"
                        frmLocEntry.Visible = True
                        Location()
                        frmLocation.Visible = False
                        If moduleRight(1) = "1" Then
                            ' editing is allowed
                        Else
                            ' editing is not allowed
                            btnLocEditSave.Enabled = False
                        End If
                    Else
                        ' viewing is not allowed
                        MultiView1.ActiveViewIndex = 4
                    End If
                End If
            Case "Company Structure"
                MultiView1.ActiveViewIndex = 2
                ' this is really to check the table for the data
                ' then is the data present load into fields
                Dim dv As System.Data.DataView = adsStructures.Select(DataSourceSelectArguments.Empty)
                Dim struct As Integer = dv.ToTable.Rows.Count

                ' prepare tree to be populated
                tvCompStructures.Nodes.Clear()

                If struct < 1 Then
                    ' create parent first
                    tblStructure.Visible = True
                    newStructID.Value = "0"
                    btnStructure.Text = "Save"
                    Structures()
                Else
                    ' add, edit, and delete
                    Dim dt As System.Data.DataTable = dv.ToTable()
                    ' structure "Unit Id", "Title", "Description"
                    Response.Write(dt.Rows.Item(0).Item(0).ToString)
                    Dim child As TreeNode = New TreeNode
                    child.Text = dt.Rows.Item(0).Item(0).ToString
                    tvCompStructures.Nodes.Add(child)
                    ' all others follow
                    ' if parent_id < current_id then
                    '   child
                    'else added to current level

                End If
            Case "Company Property"
                MultiView1.ActiveViewIndex = 3
                ' this is really to check the table for the data
                ' then is the data present load into fields
                If Request.QueryString("id") = "" Then
                    Dim dv As System.Data.DataView = adsProperty.Select(DataSourceSelectArguments.Empty)
                    Dim prop_count As Integer = dv.ToTable.Rows.Count

                    'For x As Integer = 1 To prop_count - 2
                    '    Dim empSel As DropDownList = rptProperty.Controls(x).FindControl("cmbEmployee")
                    '    Dim hId As HiddenField = rptProperty.Controls(x).FindControl("ePropID")
                    '    adsProperty.SelectCommand = "SELECT emp_id  FROM hr_comp_property WHERE prop_id=" + hId.Value + ""
                    '    dv = adsProperty.Select(DataSourceSelectArguments.Empty)
                    '    Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
                    '    empSel.SelectedValue = dr.Item(0)
                    'Next

                    If prop_count = 0 Then
                        If moduleRight(0) = "1" Then
                            ' addition is allowed
                            newPropID.Value = prop_count + 1
                            frmProperty.Visible = True
                            frmCompProperty.Visible = False
                        Else
                            ' addition is not allowed
                            MultiView1.ActiveViewIndex = 4
                        End If

                    Else
                        If moduleRight(3) = "1" Then
                            ' viewing is allowed
                            frmProperty.Visible = False
                            frmCompProperty.Visible = True
                            If moduleRight(2) = "1" Then
                                ' deletion is allowed

                            Else
                                ' deletion is not allowed
                                btnProDelete.Enabled = False
                            End If
                            If moduleRight(0) = "1" Then
                                ' addition is allowed
                            Else
                                ' addition is not allowed
                                btnProAdd.Enabled = False
                            End If

                        Else
                            ' viewing is not allowed
                            MultiView1.ActiveViewIndex = 4
                        End If

                    End If
                Else
                    editPropID.Value = Request.QueryString("id")
                    adsProperty.SelectCommand = "SELECT [prop_name] FROM hr_comp_property WHERE prop_id=" + editPropID.Value + ""
                    Dim dv As System.Data.DataView = adsProperty.Select(DataSourceSelectArguments.Empty)
                    Dim dr As System.Data.DataRow = dv.ToTable.Rows.Item(0)
                    txtPropertyName.Text = dr.Item(0)
                    frmProperty.Visible = True
                    newPropID.Visible = False
                    frmCompProperty.Visible = False
                    If moduleRight(1) = "1" Then
                        ' editing is allowed
                    Else
                        ' editing is not allowed
                        btnPropertySave.Enabled = False
                    End If
                End If

            Case Else

        End Select

    End Sub

    Protected Sub btnEditSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCompanyEditSave.Click
        If sender.Text = "Save" Then
            Dim geninfo_keys As String = "COMPANY|COUNTRY|STREET1|STREET2|STATE|CITY|ZIPCODE|PHONE|FAX|TAX|NAICS|COMMENTS"
            Dim geninfo_values As String = txtCompanyName.Text.ToString & "|" & cmbCountry.SelectedValue.ToString & "|" & txtAddress1.Text.ToString & "|" & txtAddress2.Text.ToString & "|" & txtState.Text.ToString & "|" & txtCity.Text.ToString & "|" & txtZipCode.Text.ToString & "|" & txtPhone.Text.ToString & "|" & txtFax.Text.ToString & "|" & txtTaxID.Text.ToString & "|" & txtNAICS.Text & "|" & txtComments.Text.ToString
            adsGenifo.UpdateCommand = "UPDATE hr_geninfo SET [geninfo_keys] = '" + geninfo_keys + "' , [geninfo_values] = '" + geninfo_values + "' WHERE code ='001'"
            ' update general info
            adsGenifo.Update()
            Session("Message") = "Company Information Saved"
            Response.Redirect(Request.RawUrl)
        ElseIf sender.Text = "Edit" Then
            sender.Text = "Save"
            companyInfo()
        End If

    End Sub

    Public Sub companyInfo()
        If btnCompanyEditSave.Text = "Save" Then
            txtCompanyName.Enabled = True
            txtTaxID.Enabled = True
            txtPhone.Enabled = True
            txtFax.Enabled = True
            txtNAICS.Enabled = True
            cmbCountry.Enabled = True
            txtAddress1.Enabled = True
            txtAddress2.Enabled = True
            txtCity.Enabled = True
            txtState.Enabled = True
            txtZipCode.Enabled = True
            txtComments.Enabled = True
        ElseIf btnCompanyEditSave.Text = "Edit" Then
            txtCompanyName.Enabled = False
            txtTaxID.Enabled = False
            txtPhone.Enabled = False
            txtFax.Enabled = False
            txtNAICS.Enabled = False
            cmbCountry.Enabled = False
            txtAddress1.Enabled = False
            txtAddress2.Enabled = False
            txtCity.Enabled = False
            txtState.Enabled = False
            txtZipCode.Enabled = False
            txtComments.Enabled = False
        End If

    End Sub

    Public Sub Location()
        If btnLocEditSave.Text = "Save" Then
            txtLocName.Enabled = True
            cmbLocCountry.Enabled = True
            txtLocState.Enabled = True
            txtLocCity.Enabled = True
            txtLocAddress.Enabled = True
            txtLocZipCode.Enabled = True
            txtLocPhone.Enabled = True
            txtLocFax.Enabled = True
            txtLocComments.Enabled = True
        ElseIf btnLocEditSave.Text = "Edit" Then
            txtLocName.Enabled = False
            cmbLocCountry.Enabled = False
            txtLocState.Enabled = False
            txtLocCity.Enabled = False
            txtLocAddress.Enabled = False
            txtLocZipCode.Enabled = False
            txtLocPhone.Enabled = False
            txtLocFax.Enabled = False
            txtLocComments.Enabled = False
        End If
    End Sub

    Public Sub Structures()
        If btnStructure.Text = "Save" Then
            txtUnitId.Enabled = True
            txtStructName.Enabled = True
            txtStructDescription.Enabled = True
        ElseIf btnStructure.Text = "Edit" Then
            txtUnitId.Enabled = False
            txtStructName.Enabled = False
            txtStructDescription.Enabled = False
        End If
    End Sub

    Protected Sub btnLocEditSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLocEditSave.Click
        If sender.Text = "Save" Then
            If newID.Value <> "" Then
                ' insert a new location
                If adsLocation.Insert() > 0 Then
                    Dim lastID As Integer = Right(newID.Value, 3)
                    adsLocation.UpdateCommand = "UPDATE hr_unique_id SET last_id =" + lastID.ToString + "  WHERE table_name='hr_location'"
                    adsLocation.Update()
                    Session("Message") = "New Location saved"
                    Response.Redirect(Request.RawUrl)
                End If
            ElseIf editID.Text <> "" Then
                adsLocation.UpdateCommand = "UPDATE hr_locations SET loc_name = '" + txtLocName.Text + "', loc_country = '" + cmbLocCountry.SelectedValue + "', loc_state = '" + txtLocState.Text + "', loc_city = '" + txtLocCity.Text + "', loc_zip = '" + txtLocZipCode.Text + "', loc_phone = '" + txtLocPhone.Text + "', loc_add = '" + txtLocAddress.Text + "', loc_fax = '" + txtLocFax.Text + "', loc_comments = '" + txtLocComments.Text + "' WHERE (loc_code = '" + editID.Text + "')"
                ' update the record
                If adsLocation.Update() > 0 Then
                    Session("Message") = "Location saved"
                    Response.Redirect(Request.RawUrl)
                End If

            End If
            'Response.Redirect("CompanyInfo.aspx?Page=Location")
        ElseIf sender.Text = "Edit" Then
            sender.Text = "Save"
            Location()
        End If

    End Sub

    Protected Sub btnLocAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLocAdd.Click
        adsLocation.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_location'"
        Dim dv As System.Data.DataView = adsLocation.Select(DataSourceSelectArguments.Empty)
        Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
        Dim loc_count As Integer = CInt(dr.Item(0))


        If loc_count < 10 Then
            newID.Value = "LOC00" & loc_count + 1
        ElseIf loc_count < 100 Then
            newID.Value = "LOC0" & loc_count + 1

        Else
            newID.Value = "LOC" & loc_count + 1
        End If


        locCode.Visible = False
        btnLocEditSave.Text = "Save"
        frmLocEntry.Visible = True
        Location()
        frmLocation.Visible = False
    End Sub


    Protected Sub btnLocDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLocDelete.Click
        Dim locString As String = Request.Form("location[]")
        Dim locCodes As String = locString.Replace(",", "' OR loc_code='")

        adsLocation.DeleteCommand = "DELETE FROM hr_locations WHERE loc_code='" + locCodes + "'"
        If adsLocation.Delete() < 1 Then
            Session("Message") = locCodes.Length & " Location(s) Deleted"
        End If
        'Response.Write(adsLocation.DeleteCommand)
    End Sub

    Protected Sub btnLocSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLocSearch.Click
        Dim searchString As String = ""
        If cmbSearchBy.SelectedValue = "" Then
            searchString = "SELECT [loc_code], [loc_name], [loc_city] FROM [hr_locations] WHERE [loc_code] LIKE '" + txtSearchBy.Text + "' OR [loc_name] LIKE '" + txtSearchBy.Text + "' OR [loc_city] LIKE '" + txtSearchBy.Text + "'"
        ElseIf cmbSearchBy.SelectedValue = "ID" Then
            searchString = "SELECT [loc_code], [loc_name], [loc_city] FROM [hr_locations] WHERE [loc_code] LIKE '" + txtSearchBy.Text + "'"
        ElseIf cmbSearchBy.SelectedValue = "Name" Then
            searchString = "SELECT [loc_code], [loc_name], [loc_city] FROM [hr_locations] WHERE [loc_name] LIKE '" + txtSearchBy.Text + "'"
        ElseIf cmbSearchBy.SelectedValue = "City Name" Then
            searchString = "SELECT [loc_code], [loc_name], [loc_city] FROM [hr_locations] WHERE [loc_city] LIKE '" + txtSearchBy.Text + "'"
        End If
        adsLocation.SelectCommand = searchString
        Dim dv As System.Data.DataView = adsLocation.Select(DataSourceSelectArguments.Empty)
        'Response.Write(dv.Count.ToString)
        Response.Write(searchString)
    End Sub

    Protected Sub btnStructure_Click(sender As Object, e As EventArgs) Handles btnStructure.Click
        ' save to database a structure value
        If newStructID.Value <> "" Then
            adsStructures.InsertCommand = "INSERT INTO hr_compstructtree ([title], [description], [id]) VALUES ('" + txtStructName.Text + "','" + txtStructDescription.Text + "'," + newStructID.Value + ")"
            If adsStructures.Insert() > 0 Then
                Session("Message") = "New Structure added"
                Response.Redirect(Request.RawUrl)
            End If
        ElseIf txtUnitId.Text <> "" Then
            adsStructures.UpdateCommand = "UPDATE hr_compstructtree SET title='" + txtStructName.Text + "', description ='" + txtStructDescription.Text + "', WHERE id=" + txtUnitId.Text + ""
            If adsStructures.Update() > 0 Then
                Session("Message") = "Structure saved"
                Response.Redirect(Request.RawUrl)
            End If
        End If

    End Sub

    Protected Sub btnPropertySave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPropertySave.Click
        ' save company property
        If newPropID.Value <> "" Then
            adsProperty.InsertCommand = "INSERT INTO hr_comp_property ([prop_name], [prop_id],[emp_id]) VALUES ('" + txtPropertyName.Text + "', '" + newPropID.Value + "','0')"
            If adsProperty.Insert() > 0 Then
                Session("Message") = "New Property Saved"
                Response.Redirect(Request.RawUrl)
            End If
        ElseIf editPropID.Value <> "" Then
            adsProperty.UpdateCommand = "UPDATE hr_comp_property SET prop_name='" + txtPropertyName.Text + "' WHERE prop_id=" + editPropID.Value + ""
            If adsProperty.Update() > 0 Then
                Session("Message") = "Property Saved"
                Response.Redirect(Request.RawUrl)
            End If
        End If


    End Sub

    Protected Sub btnProAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProAdd.Click
        Dim dv As System.Data.DataView = adsProperty.Select(DataSourceSelectArguments.Empty)
        Dim prop_count As Integer = dv.ToTable.Rows.Count

        For x As Integer = 0 To prop_count - 1
            newPropID.Value = prop_count + 1
            Dim dr As System.Data.DataRow = dv.ToTable.Rows(x)
            If dr.Item(0) = newPropID.Value Then
                Exit For
            End If
        Next
        'Response.Write(newPropID.Value)

        frmProperty.Visible = True
        editPropID.Visible = False
        frmCompProperty.Visible = False
    End Sub


    Protected Sub btnProSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProSave.Click
        ' save the employee with property

        'Response.Write(empSel.SelectedValue)
        If rptProperty.Controls.Count < 3 Then Exit Sub

        For x As Integer = 1 To rptProperty.Controls.Count - 2
            Dim empSel As DropDownList = rptProperty.Controls(x).FindControl("cmbEmployee")
            Dim hId As HiddenField = rptProperty.Controls(x).FindControl("ePropID")
            adsProperty.UpdateCommand = "UPDATE hr_comp_property SET emp_id=" + empSel.SelectedValue + " WHERE prop_id=" + hId.Value + ""
            If adsProperty.Update() > 0 Then
                ' Response.Write(adsProperty.UpdateCommand + "<br/>")
            End If

        Next
        Session("Message") = "Properties assignment saved"
        Response.Redirect(Request.RawUrl)
    End Sub

    Protected Sub btnProDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProDelete.Click
        If Request.Form("property[]") = Nothing Then Exit Sub

        Dim proString As String = Request.Form("property[]")
        Dim proCodes As String = proString.Replace(",", "' OR prop_id='")

        adsProperty.DeleteCommand = "DELETE FROM hr_comp_property WHERE prop_id=" + proCodes.ToString + ""
        adsProperty.Delete()
        Session("Message") = "Proptery removed"
        Response.Redirect(Request.RawUrl)
        'Response.Write(adsProperty.DeleteCommand)
        'System.Diagnostics.Debug.Write(adsProperty.DeleteCommand)
    End Sub



    Protected Sub rptProperty_ItemCommand(source As Object, e As RepeaterCommandEventArgs) Handles rptProperty.ItemCommand
        '' get control and set values
        'If (e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem) Then
        '    Dim empSel As DropDownList = e.Item.FindControl("cmbEmployee")
        '    Dim empId As String = e.Item.DataItem(0).ToString


        '    'If empSel.Items.FindByValue("000" + empId) <> Nothing Then
        '    empSel.SelectedValue = "000" + empId

        '    'End If
        'End If
    End Sub

    Protected Sub rptProperty_ItemCreated(sender As Object, e As RepeaterItemEventArgs) Handles rptProperty.ItemCreated
        'e.Item.DataItem(0)
    End Sub

    Protected Sub rptProperty_ItemDataBound(sender As Object, e As RepeaterItemEventArgs) Handles rptProperty.ItemDataBound
        If (e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem) Then
            Dim empSel As DropDownList = e.Item.FindControl("cmbEmployee")
            Dim empId As String = e.Item.DataItem(2).ToString


            'If empSel.Items.FindByValue("000" + empId) <> Nothing Then
            empSel.SelectedValue = "000" + empId

            'End If
        End If

    End Sub


    Protected Sub tvCompStructures_SelectedNodeChanged(sender As Object, e As EventArgs) Handles tvCompStructures.SelectedNodeChanged

    End Sub
End Class
