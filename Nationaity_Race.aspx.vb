
Partial Class _Nationality_Race
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
            Case "Nationality"
                MultiView1.ActiveViewIndex = 0
                ' this is really to check the table for the data
                ' then is the data present load into fields
                If Request.QueryString("id") = "" Then
                    Dim defaultSQL = adsNationality.SelectCommand
                    adsNationality.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_nationality'"
                    Dim dv As System.Data.DataView = adsNationality.Select(DataSourceSelectArguments.Empty)
                    Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
                    Dim nat_count As Integer = CInt(dr.Item(0))
                    adsNationality.SelectCommand = defaultSQL
                    dv = adsNationality.Select(DataSourceSelectArguments.Empty)

                    If nat_count = 0 Then
                        If moduleRight(0) = "1" Then
                            ' addition is allowed
                            newNationalityID.Value = "NAT00" & nat_count + 1
                            nationalityCode.Visible = False
                            btnNationalityEditSave.Text = "Save"
                            nationality()
                            frmNationality.Visible = True

                            frmNationalities.Visible = False
                        Else
                            ' addition is not allowed
                            MultiView1.ActiveViewIndex = 2
                        End If

                    Else
                        If moduleRight(3) = "1" Then
                            ' viewing is allowed
                            frmNationality.Visible = False
                            frmNationalities.Visible = True
                            If moduleRight(2) = "1" Then
                                ' deletion is allowed
                            Else
                                ' deletion is not allowed
                                btnNationalityDelete.Enabled = False
                            End If
                            If moduleRight(0) = "1" Then
                                ' addtion is allowed
                            Else
                                ' addtion is not allowed
                                btnNationalityAdd.Enabled = False
                            End If

                        Else
                            ' viewing is not allowed
                            MultiView1.ActiveViewIndex = 2
                        End If

                    End If
                Else
                    If moduleRight(3) = "1" Then
                        ' viewing is allowed

                        editNationalityID.Text = Request.QueryString("id")
                        adsNationality.SelectCommand = "SELECT nat_name FROM hr_nationality WHERE nat_code='" + editNationalityID.Text + "'"
                        Dim dv As System.Data.DataView = adsNationality.Select(DataSourceSelectArguments.Empty)
                        Dim dr As System.Data.DataRow = dv.ToTable.Rows.Item(0)
                        txtNationalityName.Text = dr.Item(0).ToString


                        btnNationalityEditSave.Text = "Edit"
                        nationality()
                        If moduleRight(1) = "1" Then
                            ' editing is allowed
                        Else
                            ' editing is not allowed
                            btnNationalityEditSave.Enabled = False
                        End If
                    Else
                        ' viewing is not allowed
                        MultiView1.ActiveViewIndex = 2
                    End If
                End If
            Case "Ethnic Races"
                MultiView1.ActiveViewIndex = 1
                ' this is really to check the table for the data
                ' then is the data present load into fields
                If Request.QueryString("id") = "" Then
                    Dim defaultSQL = adsEthnicRace.SelectCommand
                    adsEthnicRace.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_ethnic_race'"
                    Dim dv As System.Data.DataView = adsEthnicRace.Select(DataSourceSelectArguments.Empty)
                    Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
                    Dim eth_count As Integer = CInt(dr.Item(0))
                    adsEthnicRace.SelectCommand = defaultSQL
                    dv = adsEthnicRace.Select(DataSourceSelectArguments.Empty)

                    If eth_count = 0 Then
                        If moduleRight(0) = "1" Then
                            ' addition is allowed
                            newEthnicRaceID.Value = "ETH00" & eth_count + 1
                            ethnicRaceCode.Visible = False
                            btnEthnicRaceEditSave.Text = "Save"
                            ethnicRace()
                            frmEthnicRace.Visible = True

                            frmEthnicRaces.Visible = False
                        Else
                            ' addition is not allowed
                            MultiView1.ActiveViewIndex = 2
                        End If

                    Else
                        If moduleRight(3) = "1" Then
                            ' viewing is allowed
                            frmEthnicRace.Visible = False
                            frmEthnicRaces.Visible = True
                            If moduleRight(2) = "1" Then
                                ' deletion is allowed
                            Else
                                ' deletion is not allowed
                                btnEthnicRaceDelete.Enabled = False
                            End If
                            If moduleRight(0) = "1" Then
                                ' addtion is allowed
                            Else
                                ' addtion is not allowed
                                btnEthnicRaceAdd.Enabled = False
                            End If

                        Else
                            ' viewing is not allowed
                            MultiView1.ActiveViewIndex = 2
                        End If

                    End If
                Else
                    If moduleRight(3) = "1" Then
                        ' viewing is allowed

                        editEthnicRaceID.Text = Request.QueryString("id")
                        adsEthnicRace.SelectCommand = "SELECT ethinic_race_desc FROM hr_ethnic_race WHERE ethnic_race_code='" + editEthnicRaceID.Text + "'"
                        Dim dv As System.Data.DataView = adsEthnicRace.Select(DataSourceSelectArguments.Empty)
                        Dim dr As System.Data.DataRow = dv.ToTable.Rows.Item(0)
                        txtEthnicRaceName.Text = dr.Item(0).ToString


                        btnEthnicRaceEditSave.Text = "Edit"
                        ethnicRace()
                        If moduleRight(1) = "1" Then
                            ' editing is allowed
                        Else
                            ' editing is not allowed
                            btnEthnicRaceEditSave.Enabled = False
                        End If
                    Else
                        ' viewing is not allowed
                        MultiView1.ActiveViewIndex = 2
                    End If
                End If

            Case Else

        End Select
    End Sub

    Public Sub nationality()
        If btnNationalityEditSave.Text = "Save" Then
            txtNationalityName.Enabled = True
        ElseIf btnNationalityEditSave.Text = "Edit" Then
            txtNationalityName.Enabled = False
        End If
    End Sub

    Public Sub ethnicRace()
        If btnEthnicRaceEditSave.Text = "Save" Then
            txtEthnicRaceName.Enabled = True
        ElseIf btnEthnicRaceEditSave.Text = "Edit" Then
            txtEthnicRaceName.Enabled = False
        End If
    End Sub

    Protected Sub btnNationalityEditSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNationalityEditSave.Click
        If sender.Text = "Save" Then
            If newNationalityID.Value <> "" Then
                ' insert a new location
                If adsNationality.Insert() > 0 Then
                    Dim lastID As Integer = Right(newNationalityID.Value, 3)
                    adsNationality.UpdateCommand = "UPDATE hr_unique_id SET last_id =" + lastID.ToString + "  WHERE table_name='hr_nationality'"
                    adsNationality.Update()
                End If
                Response.Redirect("Nationaity_Race.aspx?Page=Nationality&id=" + newNationalityID.Value)
            ElseIf editNationalityID.Text <> "" Then
                adsNationality.UpdateCommand = "UPDATE hr_nationality SET nat_name= '" + txtNationalityName.Text + "' WHERE nat_code = '" + editNationalityID.Text + "'"
                ' update the record
                If adsNationality.Update() > 0 Then
                    sender.Text = "Edit"
                    nationality()
                End If
            End If
            'Response.Redirect("Nationaity_Race.aspx?Page=Nationality")
        ElseIf sender.Text = "Edit" Then
            sender.Text = "Save"
            nationality()
        End If
    End Sub

    Protected Sub btnNationalityAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNationalityAdd.Click
        Dim defaultSQL = adsNationality.SelectCommand
        adsNationality.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_nationality'"
        Dim dv As System.Data.DataView = adsNationality.Select(DataSourceSelectArguments.Empty)
        Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
        Dim nat_count As Integer = CInt(dr.Item(0))

        If nat_count < 10 Then
            newNationalityID.Value = "NAT00" & nat_count + 1
        ElseIf nat_count < 100 Then
            newNationalityID.Value = "NAT0" & nat_count + 1
        ElseIf nat_count < 1000 Then
            newNationalityID.Value = "NAT" & nat_count + 1
        End If

        nationalityCode.Visible = False
        btnNationalityEditSave.Text = "Save"
        nationality()

        frmNationality.Visible = True
        frmNationalities.Visible = False
    End Sub

    Protected Sub btnNationalityDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNationalityDelete.Click
        Dim natString As String = Request.Form("nationality[]")
        Dim natCodes As String = natString.Replace(",", "' OR nat_code='")

        adsNationality.DeleteCommand = "DELETE FROM hr_nationality WHERE nat_code='" + natCodes + "'"
        adsNationality.Delete()
        'Response.Write(adsNationality.DeleteCommand)
    End Sub

    Protected Sub btnNationalitySearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNationalitySearch.Click
        Dim searchString As String = ""
        If cmbNationalitySearchBy.SelectedValue = "" Then
            searchString = "SELECT nat_code,nat_name FROM hr_nationality WHERE nat_code LIKE '" + txtNationalitySearch.Text + "' OR nat_name LIKE '" + txtNationalitySearch.Text + "'"
        ElseIf cmbNationalitySearchBy.SelectedValue = "ID" Then
            searchString = "SELECT nat_code,nat_name FROM hr_nationality WHERE nat_code LIKE '" + txtNationalitySearch.Text + "'"
        ElseIf cmbNationalitySearchBy.SelectedValue = "Name" Then
            searchString = "SELECT nat_code,nat_name FROM hr_nationality WHERE nat_name LIKE '" + txtNationalitySearch.Text + "'"
        End If
        adsNationality.SelectCommand = searchString
        Dim dv As System.Data.DataView = adsNationality.Select(DataSourceSelectArguments.Empty)
        'Response.Write(dv.Count.ToString)
        'Response.Write(searchString)
    End Sub

    Protected Sub btnEthnicRaceEditSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEthnicRaceEditSave.Click
        If sender.Text = "Save" Then
            If newEthnicRaceID.Value <> "" Then
                ' insert a new location
                If adsEthnicRace.Insert() > 0 Then
                    Dim lastID As Integer = Right(newEthnicRaceID.Value, 3)
                    adsEthnicRace.UpdateCommand = "UPDATE hr_unique_id SET last_id =" + lastID.ToString + "  WHERE table_name='hr_ethnic_race'"
                    adsEthnicRace.Update()
                End If
                Response.Redirect("Nationaity_Race.aspx?Page=Ethnic Races&id=" + newEthnicRaceID.Value)
            ElseIf editEthnicRaceID.Text <> "" Then
                adsEthnicRace.UpdateCommand = "UPDATE hr_ethnic_race SET ethnic_race_desc= '" + txtEthnicRaceName.Text + "' WHERE ethnic_race_code = '" + editEthnicRaceID.Text + "'"
                ' update the record
                If adsEthnicRace.Update() > 0 Then
                    sender.Text = "Edit"
                    ethnicRace()
                End If
            End If
            'Response.Redirect("Nationaity_Race.aspx?Page=Ethnic Races")
        ElseIf sender.Text = "Edit" Then
            sender.Text = "Save"
            ethnicRace()
        End If
    End Sub

    Protected Sub btnEthnicRaceAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEthnicRaceAdd.Click
        Dim defaultSQL = adsEthnicRace.SelectCommand
        adsEthnicRace.SelectCommand = "SELECT last_id, table_name FROM hr_unique_id WHERE table_name='hr_ethnic_race'"
        Dim dv As System.Data.DataView = adsEthnicRace.Select(DataSourceSelectArguments.Empty)
        Dim dr As System.Data.DataRow = dv.ToTable.Rows(0)
        Dim eth_count As Integer = CInt(dr.Item(0))

        If eth_count < 10 Then
            newEthnicRaceID.Value = "ETH00" & eth_count + 1
        ElseIf eth_count < 100 Then
            newEthnicRaceID.Value = "ETH0" & eth_count + 1
        ElseIf eth_count < 1000 Then
            newEthnicRaceID.Value = "ETH" & eth_count + 1
        End If

        ethnicRaceCode.Visible = False
        btnEthnicRaceEditSave.Text = "Save"
        ethnicRace()

        frmEthnicRace.Visible = True
        frmEthnicRaces.Visible = False
    End Sub

    Protected Sub btnEthnicRaceDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEthnicRaceDelete.Click
        Dim ethString As String = Request.Form("races[]")
        Dim ethCodes As String = ethString.Replace(",", "' OR ethnic_race_code='")

        adsEthnicRace.DeleteCommand = "DELETE FROM hr_ethnic_race WHERE ethnic_race_code='" + ethCodes + "'"
        adsEthnicRace.Delete()
        'Response.Write(adsEthnicRace.DeleteCommand)
    End Sub

    Protected Sub btnEthnicRaceSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEthnicRaceSearch.Click
        Dim searchString As String = ""
        If cmbEthnicRaceSearchBy.SelectedValue = "" Then
            searchString = "SELECT ethnic_race_code, ethinic_race_desc FROM hr_ethnic_race WHERE ethnic_race_code LIKE '" + txtEthnicRaceSearch.Text + "' OR membtype_name LIKE '" + txtEthnicRaceSearch.Text + "'"
        ElseIf cmbEthnicRaceSearchBy.SelectedValue = "ID" Then
            searchString = "SELECT ethnic_race_code, ethinic_race_desc FROM hr_ethnic_race WHERE ethnic_race_code LIKE '" + txtEthnicRaceSearch.Text + "'"
        ElseIf cmbEthnicRaceSearchBy.SelectedValue = "Name" Then
            searchString = "SELECT ethnic_race_code, ethinic_race_desc FROM hr_ethnic_race WHERE ethnic_race_desc LIKE '" + txtEthnicRaceSearch.Text + "'"
        End If
        adsEthnicRace.SelectCommand = searchString
        Dim dv As System.Data.DataView = adsEthnicRace.Select(DataSourceSelectArguments.Empty)
        'Response.Write(dv.Count.ToString)
        'Response.Write(searchString)
    End Sub
End Class
