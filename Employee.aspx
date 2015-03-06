<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="Employee.aspx.vb"
    Inherits="Default2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style4
        {
            text-align: left;
        }
        .style7
        {
            text-align: left;
            width: 13px;
        }
        .style5
        {
            text-align: center;
        }
        .style6
        {
            text-align: right;
        }
        .newStyle1
        {
            vertical-align: top;
        }
        #loadBox
        {
        }
        .style8
        {
            width: 124px;
        }
        .style9
        {
            width: 213px;
            text-align: left;
        }
        .style11
        {
            width: 15px;
        }
        .style12
        {
            width: 113px;
        }
        .style13
        {
            width: 113px;
            text-align: right;
        }
    </style>

    <script language="javascript" type="text/javascript" src="js/common.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentplace1" runat="Server">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <br />
            <table id="frmEmployees" runat="server" style="text-align: right; border: solid 2px #def;
                border-bottom-color: #0ff; border-top-color: #0ff; border-right-color: #0ff;
                border-left-color: #0ff;" visible="True" width="100%">
                <tr>
                    <td colspan="7" style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                        Employee Information
                    </td>
                </tr>
                <tr>
                    <td class="style4" colspan="7">
                        &nbsp;Search By:
                        <asp:DropDownList ID="cmbEmployeeSearchBy" runat="server">
                            <asp:ListItem>-Select-</asp:ListItem>
                            <asp:ListItem>Emp.ID</asp:ListItem>
                            <asp:ListItem>Emp.First Name</asp:ListItem>
                            <asp:ListItem>Emp.Last Name</asp:ListItem>
                            <asp:ListItem>Emp.Middle Name</asp:ListItem>
                            <asp:ListItem>Job Title</asp:ListItem>
                            <asp:ListItem>Employment status</asp:ListItem>
                            <asp:ListItem>Sub-Division</asp:ListItem>
                            <asp:ListItem>Supervisor</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;Search for:
                        <asp:TextBox ID="txtEmployeeSearch" runat="server" CssClass="txtLine"></asp:TextBox>
                        &nbsp;&nbsp;
                        <asp:Button ID="btnEmployeeSearch" runat="server" Text="Search" />
                        <input id="cmdReset3" type="reset" value="Reset" />
                    </td>
                </tr>
                <tr>
                    <td class="style4" colspan="7">
                        <asp:Button ID="btnEmployeeAdd" runat="server" Text="Add" />
                        <asp:Button ID="btnEmployeeDelete" runat="server" Text="Delete" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Repeater ID="rptEmployee" runat="server" DataSourceID="adsEmployeeList">
                            <HeaderTemplate>
                                <table width="100%">
                                    <tr style="background-color: #00FFFF; border-spacing: 0px;">
                                        <td class="style7">
                                            <input type="CheckBox" name="allCheck" onclick="doHandleAll()" />
                                        </td>
                                        <td class="style4">
                                            Employee Id
                                        </td>
                                        <td class="style4">
                                            Employee Name
                                        </td>
                                        <td class="style4">
                                            Job Title
                                        </td>
                                        <td class="style4">
                                            Employment Status
                                        </td>
                                        <td class="style4">
                                            Sub Divison
                                        </td>
                                        <td class="style4">
                                            Supervisor
                                        </td>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr style="background-color: #CCFFFF">
                                    <td class="style7">
                                        <input type="CheckBox" name="employee[]" value="<%# Container.DataItem(0) %>" />
                                    </td>
                                    <td class="style4">
                                        <%# Container.DataItem(1) %>
                                    </td>
                                    <td class="style4">
                                        <a class="updatelink" href="Employee.aspx?Page=Edit Employee&Info=Personal Details&id=<%# Container.DataItem(0) %>">
                                            <%# Container.DataItem(2) %>
                                            <%# Container.DataItem(3) %>
                                            <%# Container.DataItem(4) %></a>
                                    </td>
                                    <td class="style4">
                                        <%# Container.DataItem(5) %>
                                    </td>
                                    <td class="style4">
                                        <%# Container.DataItem(6) %>
                                    </td>
                                    <td class="style4">
                                    </td>
                                    <td class="style4">
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr style="background-color: #CCCCFF">
                                    <td class="style7">
                                        <input type="CheckBox" name="employee[]" value="<%# Container.DataItem(0) %>" />
                                    </td>
                                    <td class="style4">
                                        <%# Container.DataItem(1) %>
                                    </td>
                                    <td class="style4">
                                        <a class="updatelink" href="Employee.aspx?Page=Edit Employee&Info=Personal Details&id=<%# Container.DataItem(0) %>">
                                            <%# Container.DataItem(2) %>
                                            <%# Container.DataItem(3) %>
                                            <%# Container.DataItem(4) %></a>
                                    </td>
                                    <td class="style4">
                                        <%# Container.DataItem(5) %>
                                    </td>
                                    <td class="style4">
                                        <%# Container.DataItem(6) %>
                                    </td>
                                    <td class="style4">
                                    </td>
                                    <td class="style4">
                                    </td>
                                </tr>
                            </AlternatingItemTemplate>
                            <FooterTemplate>
                                </table></FooterTemplate>
                        </asp:Repeater>
                        <asp:AccessDataSource ID="adsEmployeeList" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
                            SelectCommand="SELECT hr_employee.emp_number, hr_employee.employee_id, hr_employee.emp_firstname, hr_employee.emp_middle_name, hr_employee.emp_lastname, (SELECT hr_job_title.jobtit_name FROM hr_job_title WHERE hr_job_title.jobtit_code = hr_employee.job_title_code), (SELECT hr_empstat.estat_name FROM hr_empstat WHERE hr_empstat.estat_code = hr_employee.emp_status) FROM hr_employee ORDER BY hr_employee.emp_number ASC"
                            InsertCommand="INSERT INTO hr_emp_picture(emp_number, epic_picture, epic_filename, epic_type, epic_file_size) VALUES (@emp_number, @epic_picture, @epic_filename, @epic_type, @epic_file_size)">
                            <InsertParameters>
                                <asp:ControlParameter ControlID="editEmpNumber" Name="@emp_number" PropertyName="Value" />
                                <asp:ControlParameter ControlID="filePhotograph" Name="@epic_picture" PropertyName="FileBytes" />
                                <asp:Parameter Name="@epic_filename" />
                                <asp:Parameter Name="@epic_type" />
                                <asp:Parameter Name="@epic_file_size" />
                            </InsertParameters>
                        </asp:AccessDataSource>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table id="frmAddEmployee" runat="server" style="text-align: right; border: solid 2px #def;
                border-bottom-color: #0ff; border-top-color: #0ff; border-right-color: #0ff;
                border-left-color: #0ff;">
                <tr>
                    <td colspan="4" style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                        PIM : Add Employee
                    </td>
                </tr>
                <tr>
                    <td>
                        Cod<span lang="en-us">e</span>
                    </td>
                    <td class="style4">
                        <asp:TextBox ID="txtPIMCode" runat="server" CssClass="txtLine"></asp:TextBox>
                    </td>
                    <td class="style5" colspan="2">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        Last Name<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                            ControlToValidate="txtPIMLastName" ErrorMessage="The Last Name is required.">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="style4">
                        <asp:TextBox ID="txtPIMLastName" runat="server" CssClass="txtLine"></asp:TextBox>
                    </td>
                    <td class="style6">
                        First Name<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                            ControlToValidate="txtPIMFirstName" ErrorMessage="The First Name is required.">*</asp:RequiredFieldValidator>
                        &nbsp;
                    </td>
                    <td class="style4">
                        <asp:TextBox ID="txtPIMFirstName" runat="server" CssClass="txtLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Middle Name
                    </td>
                    <td class="style4">
                        <asp:TextBox ID="txtPIMMiddleName" runat="server" CssClass="txtLine"></asp:TextBox>
                    </td>
                    <td>
                        Nick Name
                    </td>
                    <td class="style4">
                        <asp:TextBox ID="txtPIMNickName" runat="server" CssClass="txtLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Picture<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                            ControlToValidate="filePIMPicture" ErrorMessage="Only Images are allowed" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.bmp|.BMP|.jpg|.JPG|.jpeg|.JPEG|.gif|.GIF)$">*</asp:RegularExpressionValidator>
                        &nbsp;
                    </td>
                    <td class="style4" colspan="3">
                        <asp:FileUpload ID="filePIMPicture" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center;">
                        <asp:Button ID="btnAddEmpSave" runat="server" Text="Save" />
                        <input id="cmdReset2" type="reset" value="Reset" />
                        <asp:HiddenField ID="newEmpNumber" runat="server" />
                    </td>
                </tr>
            </table>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        </asp:View>
        <asp:View ID="View3" runat="server">
            <asp:ToolkitScriptManager runat="Server" EnableScriptGlobalization="true" EnableScriptLocalization="true"
                ID="ScriptManager1" />
            <asp:UpdateProgress ID="loadingEmployee" runat="server" AssociatedUpdatePanelID="updateEmployee"
                DisplayAfter="0">
                <ProgressTemplate>
                    <div id="loadBox" style="position: absolute; z-index: 1; background-color: Transparent;
                        top: 150px; left: 400px;" align="center">
                        <img src="images/loading.gif" /><br />
                        Loading...
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
            <table style="width: 100%;">
                <tr>
                    <td style="vertical-align: top" width="20%">
                        <table>
                            <tr>
                                <td>
                                    <asp:Menu ID="mnuPersonal" runat="server" BackColor="#FFFBD6" DynamicHorizontalOffset="2"
                                        Font-Names="Verdana" Font-Size="0.8em" ForeColor="#990000" StaticSubMenuIndent="10px"
                                        Width="100%">
                                        <StaticSelectedStyle BackColor="#FFCC66" />
                                        <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                                        <DynamicHoverStyle BackColor="#990000" ForeColor="White" />
                                        <DynamicMenuStyle BackColor="#FFFBD6" />
                                        <DynamicSelectedStyle BackColor="#FFCC66" />
                                        <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                                        <StaticHoverStyle BackColor="#990000" ForeColor="White" />
                                        <Items>
                                            <asp:MenuItem Text="Personal Details" Value="Personal Details" NavigateUrl="~/Employee.aspx?Page=Edit Employee&amp;Info=Personal Details">
                                            </asp:MenuItem>
                                            <asp:MenuItem Text="Contact Details" Value="Contact Details" NavigateUrl="~/Employee.aspx?Page=Edit Employee&amp;Info=Contact Details">
                                            </asp:MenuItem>
                                            <asp:MenuItem Text="Emergency Contact(s)" Value="Emergency Contact" NavigateUrl="~/Employee.aspx?Page=Edit Employee&amp;Info=Emergency Contact">
                                            </asp:MenuItem>
                                            <asp:MenuItem Text="Dependents" Value="Dependents" NavigateUrl="~/Employee.aspx?Page=Edit Employee&amp;Info=Dependents"
                                                Enabled="False"></asp:MenuItem>
                                            <asp:MenuItem Text="Immigration" Value="Immigration" NavigateUrl="~/Employee.aspx?Page=Edit Employee&amp;Info=Immigration"
                                                Enabled="False"></asp:MenuItem>
                                            <asp:MenuItem Text="Photograph" Value="Photograph" NavigateUrl="~/Employee.aspx?Page=Edit Employee&amp;Info=Photograph">
                                            </asp:MenuItem>
                                        </Items>
                                    </asp:Menu>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Menu ID="mnuEmployment" runat="server" BackColor="#FFFBD6" DynamicHorizontalOffset="2"
                                        Font-Names="Verdana" Font-Size="0.8em" ForeColor="#990000" StaticSubMenuIndent="10px"
                                        Width="100%">
                                        <StaticSelectedStyle BackColor="#FFCC66" />
                                        <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                                        <DynamicHoverStyle BackColor="#990000" ForeColor="White" />
                                        <DynamicMenuStyle BackColor="#FFFBD6" />
                                        <DynamicSelectedStyle BackColor="#FFCC66" />
                                        <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                                        <StaticHoverStyle BackColor="#990000" ForeColor="White" />
                                        <Items>
                                            <asp:MenuItem Text="Job" Value="Job" NavigateUrl="~/Employee.aspx?Page=Edit Employee&amp;Info=Job">
                                            </asp:MenuItem>
                                            <asp:MenuItem Text="Salary" Value="Salary" NavigateUrl="~/Employee.aspx?Page=Edit Employee&amp;Info=Salary">
                                            </asp:MenuItem>
                                            <asp:MenuItem Text="Tax Exemptions" Value="Tax Exemptions" NavigateUrl="~/Employee.aspx?Page=Edit Employee&amp;Info=Tax Exemptions">
                                            </asp:MenuItem>
                                            <asp:MenuItem Text="Direct Deposit" Value="Direct Deposit" NavigateUrl="~/Employee.aspx?Page=Edit Employee&amp;Info=Direct Deposit"
                                                Enabled="False"></asp:MenuItem>
                                            <asp:MenuItem Text="Report-to" Value="Report-to" NavigateUrl="~/Employee.aspx?Page=Edit Employee&amp;Info=Report-to">
                                            </asp:MenuItem>
                                        </Items>
                                    </asp:Menu>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="60%">
                        <asp:HiddenField ID="editEmpNumber" runat="server" />
                        <asp:UpdatePanel ID="updateEmployee" runat="Server">
                            <Triggers>
                                <asp:PostBackTrigger ControlID="btnPersonalDetailsEditSave" />
                                <asp:PostBackTrigger ControlID="btnContactDetailsEditSave" />
                                <asp:PostBackTrigger ControlID="btnEmergencyContactsEditSave" />
                                <asp:PostBackTrigger ControlID="btnPhotographSave" />
                                <asp:PostBackTrigger ControlID="btnJobEditSave" />
                                <asp:PostBackTrigger ControlID="cmbJobTitle" />
                                <asp:PostBackTrigger ControlID="btnReportToEditSave" />
                            </Triggers>
                            <ContentTemplate>
                                <asp:MultiView ID="mvwEmployee" runat="server" ActiveViewIndex="0">
                                    <asp:View ID="vwPersonalDetails" runat="server">
                                        <table id="frmPersonalDetails" runat="server" style="text-align: right; border: solid 2px #def;
                                            border-bottom-color: #0ff; border-top-color: #0ff; border-right-color: #0ff;
                                            border-left-color: #0ff;">
                                            <tr>
                                                <td colspan="4" style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                                                    Personal Details
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Cod<span lang="en-us">e<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                                                        ControlToValidate="txtEmpCode" ErrorMessage="The Employee Code is required.">*</asp:RequiredFieldValidator>
                                                    </span>
                                                </td>
                                                <td class="style4">
                                                    <asp:TextBox ID="txtEmpCode" runat="server" CssClass="txtLine" Enabled="False"></asp:TextBox>
                                                </td>
                                                <td>
                                                    Last Name<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                                                        ControlToValidate="txtLastName" ErrorMessage="The Last Name is required.">*</asp:RequiredFieldValidator>
                                                </td>
                                                <td class="style4">
                                                    <asp:TextBox ID="txtLastName" runat="server" CssClass="txtLine" Enabled="False"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style6">
                                                    First Name&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server"
                                                        ControlToValidate="txtFirstName" ErrorMessage="The First Name is required.">*</asp:RequiredFieldValidator>
                                                    &nbsp;
                                                </td>
                                                <td class="style4">
                                                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="txtLine" Enabled="False"></asp:TextBox>
                                                </td>
                                                <td>
                                                    Middle Name
                                                </td>
                                                <td class="style4">
                                                    <asp:TextBox ID="txtMiddleName" runat="server" CssClass="txtLine" Enabled="False"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Nick Name
                                                </td>
                                                <td class="style4">
                                                    <asp:TextBox ID="txtNickName" runat="server" CssClass="txtLine" Enabled="False"></asp:TextBox>
                                                </td>
                                                <td colspan="2">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    TRN No&nbsp;
                                                </td>
                                                <td class="style4">
                                                    <asp:TextBox ID="txtTRNNo" runat="server" CssClass="txtLine" Enabled="False"></asp:TextBox>
                                                </td>
                                                <td class="style6">
                                                    Nationality
                                                </td>
                                                <td class="style4">
                                                    <asp:DropDownList ID="cmbNationality" runat="server" AppendDataBoundItems="True"
                                                        DataSourceID="adsNationality" DataTextField="nat_name" DataValueField="nat_code"
                                                        Enabled="False">
                                                        <asp:ListItem Value="">Select Nationality</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:AccessDataSource ID="adsNationality" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
                                                        SelectCommand="SELECT [nat_name], [nat_code] FROM [hr_nationality]"></asp:AccessDataSource>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    NIS No
                                                </td>
                                                <td class="style4">
                                                    <asp:TextBox ID="txtNISNo" runat="server" CssClass="txtLine" Enabled="False"></asp:TextBox>
                                                </td>
                                                <td class="style6">
                                                    Date of Birth
                                                </td>
                                                <td class="style4">
                                                    <asp:TextBox ID="txtDOB" runat="server" CssClass="txtLine"></asp:TextBox>
                                                    <asp:ImageButton ID="btnBirthDate" ImageUrl="~/images/Calendar_scheduleHS.png" runat="server"
                                                        CausesValidation="False" Enabled="False" />
                                                    <asp:CalendarExtender runat="server" ID="ajaxCaldendar" TargetControlID="txtDOB"
                                                        Format="yyyy-MM-dd" PopupButtonID="btnBirthDate" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Other ID
                                                </td>
                                                <td class="style4">
                                                    <asp:TextBox ID="txtOtherID" runat="server" CssClass="txtLine" Enabled="False"></asp:TextBox>
                                                </td>
                                                <td class="style6">
                                                    Martial Status
                                                </td>
                                                <td class="style4">
                                                    <asp:DropDownList ID="cmbMartialStatus" runat="server" Enabled="False">
                                                        <asp:ListItem Value="">--Select--</asp:ListItem>
                                                        <asp:ListItem>Unmarried</asp:ListItem>
                                                        <asp:ListItem>Married</asp:ListItem>
                                                        <asp:ListItem>Divorced</asp:ListItem>
                                                        <asp:ListItem>Other</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Smoker
                                                </td>
                                                <td class="style4">
                                                    <asp:CheckBox ID="chkSmoker" runat="server" Enabled="False" />
                                                </td>
                                                <td class="style6">
                                                    Gender
                                                </td>
                                                <td class="style4">
                                                    <asp:RadioButtonList ID="rdoGender" runat="server" RepeatDirection="Horizontal" Enabled="False">
                                                        <asp:ListItem>Male</asp:ListItem>
                                                        <asp:ListItem>Female</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Driver&#39;s License Number
                                                </td>
                                                <td class="style4">
                                                    <asp:TextBox ID="txtDriversLicense" runat="server" CssClass="txtLine" Enabled="False"></asp:TextBox>
                                                </td>
                                                <td class="style6">
                                                    License Expiry Date
                                                </td>
                                                <td class="style4">
                                                    <asp:TextBox ID="txtLicenseExpiryDate" runat="server" CssClass="txtLine" Enabled="False"></asp:TextBox>
                                                    <asp:ImageButton ID="btnExpiryDate" ImageUrl="~/images/Calendar_scheduleHS.png" runat="server"
                                                        CausesValidation="False" Enabled="False" />
                                                    <asp:CalendarExtender runat="server" ID="ajaxCalendar1" TargetControlID="txtLicenseExpiryDate"
                                                        Format="yyyy-MM-dd" PopupButtonID="btnExpiryDate" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Military Service
                                                </td>
                                                <td class="style4">
                                                    <asp:TextBox ID="txtMilitaryService" runat="server" CssClass="txtLine" Enabled="False"></asp:TextBox>
                                                </td>
                                                <td class="style6">
                                                    Ethnic Race
                                                </td>
                                                <td class="style4">
                                                    <asp:DropDownList ID="cmbEthnicRace" runat="server" AppendDataBoundItems="True" DataSourceID="adsEthnicRace"
                                                        DataTextField="ethinic_race_desc" DataValueField="ethnic_race_code" Enabled="False">
                                                        <asp:ListItem Value="">Select Ethnic Race</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:AccessDataSource ID="adsEthnicRace" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
                                                        SelectCommand="SELECT [ethnic_race_code], [ethinic_race_desc] FROM [hr_ethnic_race]">
                                                    </asp:AccessDataSource>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="text-align: center;">
                                                    <asp:Button ID="btnPersonalDetailsEditSave" runat="server" Text="Save" />
                                                    <input id="cmdReset4" type="reset" value="Reset" />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:AccessDataSource ID="adsEmployee" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
                                            SelectCommand="SELECT employee_id, emp_lastname, emp_firstname, emp_middle_name, emp_nick_name, emp_smoker, ethnic_race_code, emp_birthday, nation_code, emp_gender, emp_marital_status, emp_ssn_num, emp_sin_num, emp_other_id, emp_dri_lice_num, emp_military_service, emp_dri_lice_exp_date FROM hr_employee"
                                            InsertCommand="INSERT INTO hr_employee(emp_number, employee_id, emp_firstname, emp_middle_name, emp_lastname, emp_nick_name) VALUES (@emp_number, @employee_id, @emp_firstname, @emp_middle_name, @emp_lastname, @emp_nick_name)">
                                            <InsertParameters>
                                                <asp:ControlParameter ControlID="newEmpNumber" Name="@emp_number" PropertyName="Value" />
                                                <asp:ControlParameter ControlID="txtPIMCode" Name="@employee_id" PropertyName="Text" />
                                                <asp:ControlParameter ControlID="txtPIMFirstName" Name="@emp_firstname" PropertyName="Text" />
                                                <asp:ControlParameter ControlID="txtPIMMiddleName" Name="@emp_middle_name" PropertyName="Text" />
                                                <asp:ControlParameter ControlID="txtPIMLastName" Name="@emp_lastname" PropertyName="Text" />
                                                <asp:ControlParameter ControlID="txtPIMNickName" Name="@emp_nick_name" PropertyName="Text" />
                                            </InsertParameters>
                                        </asp:AccessDataSource>
                                    </asp:View>
                                    <asp:View ID="vwContactDetails" runat="server">
                                        <table id="frmContactDetails" runat="server" style="text-align: right; border: solid 2px #def;
                                            border-bottom-color: #0ff; border-top-color: #0ff; border-right-color: #0ff;
                                            border-left-color: #0ff;">
                                            <tr>
                                                <td colspan="4" style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                                                    Contact Details
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Country
                                                </td>
                                                <td class="style4" colspan="3">
                                                    <asp:DropDownList ID="cmbCountries" runat="server" AppendDataBoundItems="True" DataSourceID="adsCountries"
                                                        DataTextField="cou_name" DataValueField="cou_code" Enabled="False">
                                                        <asp:ListItem Value="">Select Country</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:AccessDataSource ID="adsCountries" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
                                                        SelectCommand="SELECT [cou_name], [cou_code] FROM [hr_country]"></asp:AccessDataSource>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style6">
                                                    Street 1&nbsp;&nbsp;
                                                </td>
                                                <td class="style4">
                                                    <asp:TextBox ID="txtStreet1" runat="server" CssClass="txtLine" Enabled="False"></asp:TextBox>
                                                </td>
                                                <td>
                                                    Street 2
                                                </td>
                                                <td class="style4">
                                                    <asp:TextBox ID="txtStreet2" runat="server" CssClass="txtLine" Enabled="False"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    City/Town
                                                </td>
                                                <td class="style4">
                                                    <asp:TextBox ID="txtCityTown" runat="server" CssClass="txtLine" Enabled="False"></asp:TextBox>
                                                </td>
                                                <td>
                                                    State/Province
                                                </td>
                                                <td class="style4">
                                                    <asp:TextBox ID="txtStateProvince" runat="server" CssClass="txtLine" Enabled="False"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    ZIP Code
                                                </td>
                                                <td class="style4">
                                                    <asp:TextBox ID="txtZIPCode" runat="server" CssClass="txtLine" Enabled="False"></asp:TextBox>
                                                </td>
                                                <td class="style6" colspan="2">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Home Telephone
                                                </td>
                                                <td class="style4">
                                                    <asp:TextBox ID="txtHomeTelephone" runat="server" CssClass="txtLine" Enabled="False"></asp:TextBox>
                                                </td>
                                                <td class="style6">
                                                    Mobile
                                                </td>
                                                <td class="style4">
                                                    <asp:TextBox ID="txtMobile" runat="server" CssClass="txtLine" Enabled="False"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Work Telephone
                                                </td>
                                                <td class="style4">
                                                    <asp:TextBox ID="txtWorkTelephone" runat="server" CssClass="txtLine" Enabled="False"></asp:TextBox>
                                                </td>
                                                <td class="style6" colspan="2">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Work Email<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                                        ControlToValidate="txtWorkEmail" ErrorMessage="The Work Email is not in the correct format"
                                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                                                </td>
                                                <td class="style4">
                                                    <asp:TextBox ID="txtWorkEmail" runat="server" CssClass="txtLine" Enabled="False"></asp:TextBox>
                                                </td>
                                                <td class="style6">
                                                    Other Email<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                                        ControlToValidate="txtOtherEmail" ErrorMessage="The Other Email is not in the correct format"
                                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                                                </td>
                                                <td class="style4">
                                                    <asp:TextBox ID="txtOtherEmail" runat="server" CssClass="txtLine" Enabled="False"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="text-align: center;">
                                                    <asp:Button ID="btnContactDetailsEditSave" runat="server" Text="Save" />
                                                    <input id="cmdReset5" type="reset" value="Reset" />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:AccessDataSource ID="adsEmployeeContact" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
                                            SelectCommand="SELECT emp_street1, emp_street2, city_code, coun_code, provin_code, emp_zip_code, emp_hm_telephone, emp_mobile, emp_work_telephone, emp_work_email, emp_oth_email FROM hr_employee WHERE emp_number=@emp_number">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="editEmpNumber" Name="@emp_number" PropertyName="Value" />
                                            </SelectParameters>
                                        </asp:AccessDataSource>
                                    </asp:View>
                                    <asp:View ID="vwEmergencyContacts" runat="server">
                                        <table id="frmEmergencyContacts" runat="server" style="text-align: right; border: solid 2px #def;
                                            border-bottom-color: #0ff; border-top-color: #0ff; border-right-color: #0ff;
                                            border-left-color: #0ff;">
                                            <tr>
                                                <td colspan="4" style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                                                    Emergency Contact(s)
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="1" class="style8">
                                                    Name<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtContactName"
                                                        ErrorMessage="The Name of emergency contact is required">*</asp:RequiredFieldValidator>
                                                </td>
                                                <td class="style4" colspan="1">
                                                    <asp:TextBox ID="txtContactName" runat="server" CssClass="txtLine"></asp:TextBox>
                                                </td>
                                                <td class="style6" colspan="1">
                                                    Relationship<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"
                                                        ControlToValidate="txtContactRelationship" ErrorMessage="The Relation of the contact is required">*</asp:RequiredFieldValidator>
                                                </td>
                                                <td class="style4" colspan="1">
                                                    <asp:TextBox ID="txtContactRelationship" runat="server" CssClass="txtLine"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="1" class="style8">
                                                    Work Telephone
                                                </td>
                                                <td class="style4" colspan="2">
                                                    <asp:TextBox ID="txtContactHomeTelephone" runat="server" CssClass="txtLine"></asp:TextBox>
                                                </td>
                                                <td class="style6" colspan="1">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="1" class="style8">
                                                    Home Telephone
                                                </td>
                                                <td class="style4" colspan="1">
                                                    <asp:TextBox ID="txtContactWorkTelephone" runat="server" CssClass="txtLine"></asp:TextBox>
                                                </td>
                                                <td class="style6" colspan="1">
                                                    Mobile
                                                </td>
                                                <td class="style4" colspan="1">
                                                    <asp:TextBox ID="txtContactMobile" runat="server" CssClass="txtLine"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="text-align: center;">
                                                    <asp:Button ID="btnEmergencyContactsEditSave" runat="server" Text="Save" />
                                                    <input id="cmdReset6" type="reset" value="Reset" />
                                                    <asp:HiddenField ID="editEmergencyContactNo" runat="server" />
                                                </td>
                                            </tr>
                                            <tr id="assignedEmergencyContacts0" runat="server">
                                                <td colspan="4" style="border-color: #00FFFF; text-align: left; background-color: #00FFFF;"
                                                    class="style4">
                                                    Assigned Emergency Contacts
                                                </td>
                                            </tr>
                                            <tr id="assignedEmergencyContacts1" runat="server">
                                                <td class="style4" colspan="4">
                                                    <asp:Button ID="btnContactDetailsAdd" runat="server" Text="Add" />
                                                    <asp:Button ID="btnContactDetailsDelete" runat="server" Text="Delete" />
                                                </td>
                                            </tr>
                                            <tr id="assignedEmergencyContacts2" runat="server">
                                                <td class="style9" colspan="4">
                                                    <asp:Repeater ID="rptEmergencyContacts" runat="server" DataSourceID="adsEmergencyContact">
                                                        <HeaderTemplate>
                                                            <table class="style10" width="100%">
                                                                <tr style="background-color: #66FFFF">
                                                                    <td class="style11">
                                                                        <input name="allCheck" type="checkbox" />
                                                                    </td>
                                                                    <td>
                                                                        Name
                                                                    </td>
                                                                    <td>
                                                                        Relationship
                                                                    </td>
                                                                    <td>
                                                                        Home Telephone
                                                                    </td>
                                                                    <td>
                                                                        Mobile
                                                                    </td>
                                                                    <td>
                                                                        Work Telephone
                                                                    </td>
                                                                </tr>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr style="background-color: #EEFFFF">
                                                                <td class="style11">
                                                                    <input name="emergencyContact[]" type="checkbox" value="<%# Container.DataItem(0) %>" />
                                                                </td>
                                                                <td>
                                                                    <a class="updatelink" href="Employee.aspx?Page=Edit Employee&Info=Emergency Contact&id=<%=editEmpNumber.Value %>&contact=<%#Container.DataItem(0) %>">
                                                                        <%#Container.DataItem(1)%>
                                                                    </a>
                                                                </td>
                                                                <td>
                                                                    <%#Container.DataItem(2)%>
                                                                </td>
                                                                <td>
                                                                    <%#Container.DataItem(3)%>
                                                                </td>
                                                                <td>
                                                                    <%#Container.DataItem(4)%>
                                                                </td>
                                                                <td>
                                                                    <%#Container.DataItem(5)%>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <AlternatingItemTemplate>
                                                            <tr style="background-color: #CCCCFF">
                                                                <td class="style11">
                                                                    <input name="emergencyContact[]" type="checkbox" value="<%# Container.DataItem(0) %>" />
                                                                </td>
                                                                <td>
                                                                    <a class="updatelink" href="Employee.aspx?Page=Edit Employee&Info=Emergency Contact&id=<%=editEmpNumber.Value %>&contact=<%#Container.DataItem(0) %>">
                                                                        <%#Container.DataItem(1)%>
                                                                    </a>
                                                                </td>
                                                                <td>
                                                                    <%#Container.DataItem(2)%>
                                                                </td>
                                                                <td>
                                                                    <%#Container.DataItem(3)%>
                                                                </td>
                                                                <td>
                                                                    <%#Container.DataItem(4)%>
                                                                </td>
                                                                <td>
                                                                    <%#Container.DataItem(5)%>
                                                                </td>
                                                            </tr>
                                                        </AlternatingItemTemplate>
                                                        <FooterTemplate>
                                                            </table></FooterTemplate>
                                                    </asp:Repeater>
                                                    <asp:AccessDataSource ID="adsEmergencyContact" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
                                                        SelectCommand="SELECT eec_seqno, eec_name, eec_relationship, eec_home_no, eec_mobile_no, eec_office_no FROM hr_emp_emergency_contacts WHERE emp_number = @emp_number ORDER BY eec_seqno ASC"
                                                        InsertCommand="INSERT INTO hr_emp_emergency_contacts(emp_number, eec_seqno, eec_name, eec_relationship, eec_home_no, eec_mobile_no, eec_office_no) VALUES (@emp_number, @eec_seqno, @eec_name, @eec_relationship, @eec_home_no, @eec_mobile_no, @eec_office_no)">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="editEmpNumber" Name="@emp_number" PropertyName="Value" />
                                                        </SelectParameters>
                                                        <InsertParameters>
                                                            <asp:ControlParameter ControlID="editEmpNumber" Name="@emp_number" PropertyName="Value" />
                                                            <asp:Parameter Name="@eec_seqno" />
                                                            <asp:ControlParameter ControlID="txtContactName" Name="@eec_name" PropertyName="Text" />
                                                            <asp:ControlParameter ControlID="txtContactRelationship" Name="@eec_relationship"
                                                                PropertyName="Text" />
                                                            <asp:ControlParameter ControlID="txtContactHomeTelephone" Name="@eec_home_no" PropertyName="Text" />
                                                            <asp:ControlParameter ControlID="txtContactMobile" Name="@eec_mobile_no" PropertyName="Text" />
                                                            <asp:ControlParameter ControlID="txtContactWorkTelephone" Name="@eec_office_no" PropertyName="Text" />
                                                        </InsertParameters>
                                                    </asp:AccessDataSource>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:View>
                                    <asp:View ID="vwDependents" runat="server">
                                        <table id="frmDependents" runat="server" style="text-align: right; border: solid 2px #def;
                                            border-bottom-color: #0ff; border-top-color: #0ff; border-right-color: #0ff;
                                            border-left-color: #0ff;">
                                            <tr>
                                                <td colspan="4" style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                                                    Dependents
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" class="style4">
                                                    Dependents
                                                </td>
                                                <td class="style4" colspan="2">
                                                    Children
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="1">
                                                    Name<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="The Name dependent is required"
                                                        ControlToValidate="txtDependentName">*</asp:RequiredFieldValidator>
                                                </td>
                                                <td class="style4" colspan="1">
                                                    <asp:TextBox ID="txtDependentName" runat="server" CssClass="txtLine"></asp:TextBox>
                                                </td>
                                                <td class="style6" colspan="1">
                                                    Name
                                                </td>
                                                <td class="style4" colspan="1">
                                                    <asp:TextBox ID="txtChildName" runat="server" CssClass="txtLine"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="1">
                                                    Relationship
                                                </td>
                                                <td class="style4" colspan="1">
                                                    <asp:TextBox ID="txtDependentRelationship" runat="server" CssClass="txtLine"></asp:TextBox>
                                                </td>
                                                <td class="style6" colspan="1">
                                                    Date of Birth
                                                </td>
                                                <td class="style4" colspan="1">
                                                    <asp:TextBox ID="txtChildDateofBirth" runat="server" CssClass="txtLine"></asp:TextBox>
                                                    <asp:ImageButton ID="btnChildDateofBirth" ImageUrl="~/images/Calendar_scheduleHS.png"
                                                        runat="server" CausesValidation="False" />
                                                    <asp:CalendarExtender runat="server" ID="CalendarExtender1" TargetControlID="txtChildDateofBirth"
                                                        Format="yyyy-MM-dd" PopupButtonID="btnChildofBirth" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="text-align: center;">
                                                    <asp:Button ID="btnDependentSave" runat="server" Text="Save" />
                                                    <input id="Reset1" type="reset" value="Reset" />
                                                </td>
                                                <td colspan="2" style="text-align: center;">
                                                    <asp:Button ID="btnChildSave" runat="server" Text="Save" />
                                                    <input id="Reset2" type="reset" value="Reset" />&nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td id="assignedDependents0" runat="server" class="style4" colspan="2" style="border-color: #00FFFF;
                                                    text-align: left; background-color: #00FFFF;">
                                                    Assigned Dependents
                                                </td>
                                                <td id="assignChildren0" runat="server" class="style4" colspan="2" style="border-color: #00FFFF;
                                                    text-align: left; background-color: #00FFFF;">
                                                    Assigned Childen
                                                </td>
                                            </tr>
                                            <tr>
                                                <td id="assignedDependents1" runat="server" class="style4" colspan="2">
                                                    <asp:Button ID="btnDependentAdd" runat="server" Text="Add" />
                                                    <asp:Button ID="btnDependentDelete" runat="server" Text="Delete" />
                                                </td>
                                                <td id="assignedChilren1" runat="server" class="style4" colspan="2">
                                                    <asp:Button ID="btnChildAdd" runat="server" Text="Add" />
                                                    <asp:Button ID="btnChildDelete" runat="server" Text="Delete" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td id="assignedDependents2" runat="server" colspan="2">
                                                    <table width="100%">
                                                        <tr style="background-color: #66FFFF">
                                                            <td class="style4">
                                                                &nbsp;
                                                            </td>
                                                            <td class="style4" colspan="4">
                                                                Name
                                                            </td>
                                                            <td class="style4">
                                                                Relationship
                                                            </td>
                                                        </tr>
                                                        <tr style="background-color: #EEFFFF">
                                                            <td class="style4" colspan="2">
                                                                <input name="contact[]" type="checkbox" />
                                                            </td>
                                                            <td class="style4" colspan="2">
                                                                &nbsp;
                                                            </td>
                                                            <td class="style4" colspan="2">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr style="background-color: #CCCCFF">
                                                            <td class="style4" colspan="2">
                                                                <input name="contact[]" type="checkbox" />
                                                            </td>
                                                            <td class="style4" colspan="2">
                                                                &nbsp;
                                                            </td>
                                                            <td class="style4" colspan="2">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td id="assignedChildren2" runat="server" colspan="2">
                                                    <table width="100%">
                                                        <tr style="background-color: #66FFFF">
                                                            <td class="style4">
                                                                &nbsp;
                                                            </td>
                                                            <td class="style4" colspan="4">
                                                                Name
                                                            </td>
                                                            <td class="style4">
                                                                Date of Birth
                                                            </td>
                                                        </tr>
                                                        <tr style="background-color: #EEFFFF">
                                                            <td class="style4" colspan="2">
                                                                <input name="contact[]0" type="checkbox" />
                                                            </td>
                                                            <td class="style4" colspan="2">
                                                                &nbsp;
                                                            </td>
                                                            <td class="style4" colspan="2">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr style="background-color: #CCCCFF">
                                                            <td class="style4" colspan="2">
                                                                <input name="contact[]1" type="checkbox" />
                                                            </td>
                                                            <td class="style4" colspan="2">
                                                                &nbsp;
                                                            </td>
                                                            <td class="style4" colspan="2">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:View>
                                    <asp:View ID="vwImmigration" runat="server">
                                        <table id="frmContactDetails1" runat="server" style="text-align: right; border: solid 2px #def;
                                            border-bottom-color: #0ff; border-top-color: #0ff; border-right-color: #0ff;
                                            border-left-color: #0ff;">
                                            <tr>
                                                <td colspan="12" style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                                                    Immigration
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="6">
                                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal"
                                                        TextAlign="Left">
                                                        <asp:ListItem>Passport</asp:ListItem>
                                                        <asp:ListItem>Visa</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                                <td class="style6" colspan="3">
                                                    Citizenship
                                                </td>
                                                <td class="style4" colspan="3">
                                                    <asp:DropDownList ID="cmbCitizen" runat="server" AppendDataBoundItems="True" DataSourceID="adsCountries"
                                                        DataTextField="cou_name" DataValueField="cou_code">
                                                        <asp:ListItem>-- Select Country --</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    Passport/Visa No
                                                </td>
                                                <td class="style4" colspan="3">
                                                    <asp:TextBox ID="txtPassportVisaNo" runat="server" CssClass="txtLine"></asp:TextBox>
                                                </td>
                                                <td class="style6" colspan="3">
                                                    Issued Date
                                                </td>
                                                <td class="style4" colspan="3">
                                                    <asp:TextBox ID="txtIssuedDate" runat="server" CssClass="txtLine"></asp:TextBox>
                                                    <asp:ImageButton ID="btnIssuedDate" ImageUrl="~/images/Calendar_scheduleHS.png" runat="server"
                                                        CausesValidation="False" />
                                                    <asp:CalendarExtender runat="server" ID="calIssuedDate" TargetControlID="txtIssuedDate"
                                                        Format="yyyy-MM-dd" PopupButtonID="btnIssuedDate" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    I9 Status
                                                </td>
                                                <td class="style4" colspan="3">
                                                    <asp:TextBox ID="txtINine" runat="server" CssClass="txtLine"></asp:TextBox>
                                                </td>
                                                <td class="style6" colspan="3">
                                                    Date of Expiry
                                                </td>
                                                <td class="style4" colspan="3">
                                                    <asp:TextBox ID="txtDateofExpiry" runat="server" CssClass="txtLine"></asp:TextBox>
                                                    <asp:ImageButton ID="btnDateofExpiry" ImageUrl="~/images/Calendar_scheduleHS.png"
                                                        runat="server" CausesValidation="False" />
                                                    <asp:CalendarExtender runat="server" ID="calDateofExpiry" TargetControlID="txtDateofexpiry"
                                                        Format="yyyy-MM-dd" PopupButtonID="btnDateofExpiry" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    I9 Review Date
                                                </td>
                                                <td class="style4" colspan="3">
                                                    <asp:TextBox ID="txtINineReviewDate" runat="server" CssClass="txtLine" Enabled="False"></asp:TextBox>
                                                    <asp:ImageButton ID="btnINineReviewDate" ImageUrl="~/images/Calendar_scheduleHS.png"
                                                        runat="server" CausesValidation="False" />
                                                    <asp:CalendarExtender runat="server" ID="calINineReviewDate" TargetControlID="txtINineReviewDate"
                                                        Format="yyyy-MM-dd" PopupButtonID="btnINineReviewDate" />
                                                </td>
                                                <td class="style6" colspan="3">
                                                    &nbsp;
                                                </td>
                                                <td class="style6" colspan="3">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="12" style="text-align: center;">
                                                    <asp:Button ID="btnImmigrationEditSave" runat="server" Enabled="False" Text="Save" />
                                                    <input id="cmdReset7" type="reset" value="Reset" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style4" colspan="12" style="border-color: #00FFFF; text-align: left; background-color: #00FFFF;">
                                                    Assigned Passport/Visa
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style4" colspan="12">
                                                    <asp:Button ID="btnImmigrationAdd" runat="server" Enabled="False" Text="Add" />
                                                    <asp:Button ID="btnImmigrationDelete" runat="server" Enabled="False" Text="Delete" />
                                                </td>
                                            </tr>
                                            <tr style="background-color: #66FFFF">
                                                <td class="style4">
                                                    <asp:CheckBox ID="chkImmigration" runat="server" />
                                                </td>
                                                <td class="style4" colspan="4">
                                                    Name
                                                </td>
                                                <td class="style4">
                                                    Relationship
                                                </td>
                                                <td class="style4">
                                                    Home Telephone
                                                </td>
                                                <td class="style4" colspan="4">
                                                    Mobile
                                                </td>
                                                <td class="style4">
                                                    Work Telephone
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style4" colspan="2">
                                                    <input name="contact[]2" type="checkbox" />
                                                </td>
                                                <td class="style4" colspan="2">
                                                    &nbsp;
                                                </td>
                                                <td class="style4" colspan="2">
                                                    &nbsp;
                                                </td>
                                                <td class="style4" colspan="2">
                                                    &nbsp;
                                                </td>
                                                <td class="style4" colspan="2">
                                                    &nbsp;
                                                </td>
                                                <td class="style4" colspan="2">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr style="background-color: #CCCCCC">
                                                <td class="style4" colspan="2">
                                                    <input name="contact[]3" type="checkbox" />
                                                </td>
                                                <td class="style4" colspan="2">
                                                    &nbsp;
                                                </td>
                                                <td class="style4" colspan="2">
                                                    &nbsp;
                                                </td>
                                                <td class="style4" colspan="2">
                                                    &nbsp;
                                                </td>
                                                <td class="style4" colspan="2">
                                                    &nbsp;
                                                </td>
                                                <td class="style4" colspan="2">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:View>
                                    <asp:View ID="vwPhotograph" runat="server">
                                        <table id="frmPhotograph" runat="server" style="text-align: right; border: solid 2px #def;
                                            border-bottom-color: #0ff; border-top-color: #0ff; border-right-color: #0ff;
                                            border-left-color: #0ff;">
                                            <tr>
                                                <td colspan="3" style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                                                    Photograph
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style4" colspan="3">
                                                    <asp:Image ID="imgEmpPhotograph" runat="server" AlternateText="Click to edit Photo"
                                                        BorderStyle="None" Height="120" ImageUrl="~/images/photohandler.gif" Width="100" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style4">
                                                    Select a Photo
                                                </td>
                                                <td class="style4">
                                                    <asp:FileUpload ID="filePhotograph" runat="server" />
                                                </td>
                                                <td class="style6">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" style="text-align: center;">
                                                    <asp:Button ID="btnPhotographSave" runat="server" Text="Save" Style="height: 26px" />
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:AccessDataSource ID="adsPhotograph" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
                                            InsertCommand="INSERT INTO hr_emp_picture(emp_number, epic_picture, epic_filename, epic_type, epic_file_size) VALUES (@emp_number, @epic_picture, @epic_filename, @epic_type, @epic_file_size)"
                                            SelectCommand="SELECT epic_picture, epic_filename, epic_type, epic_file_size FROM hr_emp_picture WHERE emp_number = @emp_number"
                                            UpdateCommand="UPDATE hr_emp_picture SET epic_picture =@epic_picture, epic_filename =@epic_filename, epic_type =@epic_type, epic_file_size =@epic_file_size WHERE @emp_number">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="editEmpNumber" Name="@emp_number" PropertyName="Value" />
                                            </SelectParameters>
                                            <UpdateParameters>
                                                <asp:ControlParameter ControlID="filePhotograph" Name="@epic_picture" PropertyName="FileBytes" />
                                                <asp:Parameter Name="@epic_filename" />
                                                <asp:Parameter Name="@epic_type" />
                                                <asp:Parameter Name="@epic_file_size" />
                                                <asp:ControlParameter ControlID="editEmpNumber" Name="@emp_number" PropertyName="Value" />
                                            </UpdateParameters>
                                            <InsertParameters>
                                                <asp:ControlParameter ControlID="newEmpNumber" Name="@emp_number" PropertyName="Value" />
                                                <asp:ControlParameter ControlID="filePIMPicture" Name="@epic_picture" PropertyName="FileBytes" />
                                                <asp:Parameter Name="@epic_filename" />
                                                <asp:Parameter Name="@epic_type" />
                                                <asp:Parameter Name="@epic_file_size" />
                                            </InsertParameters>
                                        </asp:AccessDataSource>
                                    </asp:View>
                                    <asp:View ID="vwJob" runat="server">
                                        <table id="frmJob" runat="server" style="text-align: right; border: solid 2px #def;
                                            border-bottom-color: #0ff; border-top-color: #0ff; border-right-color: #0ff;
                                            border-left-color: #0ff;">
                                            <tr>
                                                <td colspan="2" style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                                                    Job<asp:AccessDataSource ID="adsJobSpecInfo" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
                                                        SelectCommand="SELECT hr_job_spec.jobspec_name, hr_job_spec.jobspec_duties FROM (hr_job_spec INNER JOIN hr_job_title ON hr_job_spec.jobspec_id = hr_job_title.jobspec_id) WHERE hr_job_title.jobtit_code = @jobtit_code">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="cmbJobTitle" Name="@jobtit_code" PropertyName="SelectedValue" />
                                                        </SelectParameters>
                                                    </asp:AccessDataSource>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="1" class="style12">
                                                    Job Title
                                                </td>
                                                <td class="style4" colspan="1">
                                                    <asp:DropDownList ID="cmbJobTitle" runat="server" AppendDataBoundItems="True" DataSourceID="adsJobTitle"
                                                        DataTextField="jobtit_name" DataValueField="jobtit_code" AutoPostBack="True">
                                                        <asp:ListItem Value="">-- Select Job Title --</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:AccessDataSource ID="adsJobTitle" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
                                                        SelectCommand="SELECT [jobtit_code], [jobtit_name] FROM [hr_job_title]"></asp:AccessDataSource>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="1" class="style12">
                                                    Employment Status
                                                </td>
                                                <td class="style4" colspan="1">
                                                    <asp:DropDownList ID="cmbEmploymentStatus" runat="server" AppendDataBoundItems="True"
                                                        DataSourceID="adsEmpStat" DataTextField="estat_name" DataValueField="estat_code">
                                                        <asp:ListItem>-- Select Empl. Status --</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:AccessDataSource ID="adsEmpStat" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
                                                        SelectCommand="SELECT hr_empstat.estat_code, hr_empstat.estat_name FROM (hr_empstat INNER JOIN hr_jobtit_empstat ON hr_empstat.estat_code = hr_jobtit_empstat.estat_code) WHERE hr_jobtit_empstat.jobtit_code = @jobtit_code ORDER BY hr_empstat.estat_code">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="cmbJobTitle" Name="@jobtit_code" PropertyName="SelectedValue" />
                                                        </SelectParameters>
                                                    </asp:AccessDataSource>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="1" class="style12">
                                                    Job Specification
                                                </td>
                                                <td class="style4" colspan="1">
                                                    <asp:Label ID="lblJobSpecification" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style12" colspan="1">
                                                    Job Duties
                                                </td>
                                                <td class="style4" colspan="1">
                                                    <asp:Label ID="lblJobDuties" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style12" colspan="1">
                                                    EEO Category
                                                </td>
                                                <td class="style4" colspan="1">
                                                    <asp:DropDownList ID="cmbEEOCategory" runat="server" DataSourceID="adsEEOCategory"
                                                        DataTextField="eec_desc" DataValueField="eec_code" AppendDataBoundItems="True">
                                                        <asp:ListItem>-- Select EEO Cat --</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:AccessDataSource ID="adsEEOCategory" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
                                                        SelectCommand="SELECT eec_code, eec_desc FROM hr_eec"></asp:AccessDataSource>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style12" colspan="1">
                                                    Joined Date
                                                </td>
                                                <td class="style4" colspan="1">
                                                    <asp:TextBox ID="txtJoinedDate" runat="server" CssClass="txtLine"></asp:TextBox>
                                                    <asp:ImageButton ID="btnJoinedDate" runat="server" CausesValidation="False" ImageUrl="~/images/Calendar_scheduleHS.png" />
                                                    <asp:CalendarExtender ID="CalendarExtender4" runat="server" Format="yyyy-MM-dd" PopupButtonID="btnJoinedDate"
                                                        TargetControlID="txtJoinedDate" />
                                                </td>
                                            </tr>
                                            <tr id="subDivision" runat="server" visible="False">
                                                <td class="style12" colspan="1">
                                                    Sub-Divison
                                                </td>
                                                <td class="style4" colspan="1">
                                                    <asp:TextBox ID="txtSubdivison" runat="server" CssClass="txtLine"></asp:TextBox>
                                                    <asp:Button ID="btnSubdivision" runat="server" Text="..." />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="text-align: center;">
                                                    <asp:Button ID="btnJobEditSave" runat="server" Text="Save" />
                                                    <input id="Reset3" type="reset" value="Reset" />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:AccessDataSource ID="adsEmployeeJob" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
                                            SelectCommand="SELECT job_title_code, emp_status, eeo_cat_code, joined_date FROM hr_employee WHERE emp_number = @emp_number">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="editEmpNumber" Name="@emp_number" PropertyName="Value" />
                                            </SelectParameters>
                                        </asp:AccessDataSource>
                                    </asp:View>
                                    <asp:View ID="View5" runat="server">
                                    </asp:View>
                                    <asp:View ID="View6" runat="server">
                                    </asp:View>
                                    <asp:View ID="View7" runat="server">
                                    </asp:View>
                                    <asp:View ID="vwReportTo" runat="server">
                                        <table id="frmReportTo" runat="server" style="text-align: right; border: solid 2px #def;
                                            border-bottom-color: #0ff; border-top-color: #0ff; border-right-color: #0ff;
                                            border-left-color: #0ff;">
                                            <tr>
                                                <td colspan="2" style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                                                    Report-To
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="1" class="style12">
                                                    Supervisor/Subordinate
                                                </td>
                                                <td class="style4" colspan="1">
                                                    <asp:DropDownList ID="cmbSupervisorSubordinate" runat="server" 
                                                        AppendDataBoundItems="True">
                                                        <asp:ListItem>-- Select --</asp:ListItem>
                                                        <asp:ListItem>Supervisor</asp:ListItem>
                                                        <asp:ListItem>Subordinate</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="1" class="style13">
                                                    Employee Name
                                                </td>
                                                <td class="style4" colspan="1">
                                                    <asp:TextBox ID="txtEmployee" runat="server" CssClass="txtLine"></asp:TextBox>
                                                    <asp:AutoCompleteExtender ID="AutoCompleteExtender1"
                                runat="server" ServiceMethod="GetEmployeeList"  ServicePath="hrmsystem.asmx"
                                TargetControlID="txtEmployee" UseContextKey="True"  
                                MinimumPrefixLength="1"></asp:AutoCompleteExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style12" colspan="1">
                                                    Reporting Method
                                                </td>
                                                <td class="style4" colspan="1">
                                                    <asp:DropDownList ID="cmbReportingMethod" runat="server" 
                                                        AppendDataBoundItems="True">
                                                        <asp:ListItem>-- Select Method --</asp:ListItem>
                                                        <asp:ListItem Value="1">Direct</asp:ListItem>
                                                        <asp:ListItem Value="2">Indirect</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="text-align: center;">
                                                    <asp:Button ID="btnReportToEditSave" runat="server" Text="Save" />
                                                    <input id="Reset4" type="reset" value="Reset" />
                                                </td>
                                            </tr>
                                            <tr style="background-color: #66FFFF">
                                                <td class="style4" colspan="2">
                                                    Supervisors</td>
                                                
                                            </tr>
                                            <tr>
                                                <td class="style4" colspan="2">
                                                    <asp:Button ID="btnSupervisorAdd" runat="server" Text="Add" />
                                                    <asp:Button ID="btnSupervisorDelete" runat="server" Text="Delete" />
                                                </td>
                                                
                                            </tr>
                                            <tr>
                                                <td class="style4" colspan="2">
                                                  <asp:Repeater ID="rptSupervisor" runat="server" DataSourceID="adsSupervisor">
                                                <HeaderTemplate>
                                                    <table style="border-color: #66FFFF; width: 100%;">
                                                        <tr style="background-color: #66FFFF">
                                                            <td>
                                                                Id</td>
                                                            <td>
                                                                Name</td>
                                                            <td>
                                                                Reporting Method</td>
                                                        </tr>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                        <tr style="background-color: #EEFFFF">
                                                            <td>
                                                                <%#Container.DataItem(0)%></td>
                                                            <td>
                                                                <%#Container.DataItem(1)%></td>
                                                            <td>
                                                                <%#Container.DataItem(2)%></td>
                                                        </tr></ItemTemplate>
                                                        <AlternatingItemTemplate>
                                                        <tr style="background-color: #CCCCFF">
                                                            <td>
                                                                <%#Container.DataItem(0)%></td>
                                                            <td>
                                                                <%#Container.DataItem(1)%></td>
                                                            <td>
                                                                <%#Container.DataItem(2)%></td>
                                                        </tr></AlternatingItemTemplate>
                                                        <FooterTemplate>
                                                    </table></FooterTemplate>
                                                    </asp:Repeater>
                                                    <asp:AccessDataSource ID="adsSupervisor" runat="server" 
                                                        DataFile="~/App_Data/hrmsystem.mdb" 
                                                        SelectCommand="SELECT erep_sup_emp_number, erep_reporting_mode FROM hr_emp_reportto WHERE erep_sub_emp_number=@erep_sub_emp_number">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="editEmpNumber" Name="@erep_sub_emp_number" 
                                                                PropertyName="Value" />
                                                        </SelectParameters>
                                                    </asp:AccessDataSource>
                                                </td>
                                                </tr><tr style="background-color: #66FFFF">
                                                <td class="style4" colspan="2">
                                                    Subordinate</td></tr><tr>
                                                    <td class="style4" colspan="2">
                                                    <asp:Button ID="btnSubordinateAdd" runat="server" Text="Add" />
                                                    <asp:Button ID="btnSubordinateDelete" runat="server" Text="Delete" />
                                                </td></tr><tr>
                                                <td class="style4" colspan="2">
                                                <asp:Repeater ID="rptSubordinate" runat="server" DataSourceID="adsSubordinate">
                                                <HeaderTemplate>
                                                    <table style="border-color: #66FFFF; width: 100%;">
                                                        <tr style="background-color: #66FFFF">
                                                            <td>
                                                                Id</td>
                                                            <td>
                                                                Name</td>
                                                            <td>
                                                                Reporting Method</td>
                                                        </tr>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                        <tr style="background-color: #EEFFFF">
                                                            <td>
                                                                <%#Container.DataItem(0)%></td>
                                                            <td>
                                                                <%#Container.DataItem(1)%></td>
                                                            <td>
                                                                <%#Container.DataItem(2)%></td>
                                                        </tr></ItemTemplate>
                                                        <AlternatingItemTemplate>
                                                        <tr style="background-color: #CCCCFF">
                                                            <td>
                                                                <%#Container.DataItem(0)%></td>
                                                            <td>
                                                                <%#Container.DataItem(1)%></td>
                                                            <td>
                                                                <%#Container.DataItem(2)%></td>
                                                        </tr></AlternatingItemTemplate>
                                                        <FooterTemplate>
                                                    </table></FooterTemplate>
                                                    </asp:Repeater>
                                                    <asp:AccessDataSource ID="adsSubordinate" runat="server" 
                                                        DataFile="~/App_Data/hrmsystem.mdb" 
                                                        SelectCommand="SELECT erep_sub_emp_number, erep_reporting_mode FROM hr_emp_reportto WHERE erep_sup_emp_number=@erep_sup_emp_number">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="editEmpNumber" Name="@erep_sup_emp_number" 
                                                                PropertyName="Value" />
                                                        </SelectParameters>
                                                    </asp:AccessDataSource>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:View>
                                </asp:MultiView>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:ValidationSummary ID="ValidationSummary2" runat="server" />
                        <br />
                    </td>
                    <td style="vertical-align: top" class="style5" width="20%">
                        <asp:Image ID="imgEmpPicture" runat="server" Width="100" Height="120" BorderStyle="None"
                            ImageUrl="~/images/photohandler.gif" AlternateText="Click to edit Photo" /><br />
                        <asp:Label ID="lblEmpName" runat="server" Text="Employee Name"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View4" runat="server">
        </asp:View>
    </asp:MultiView>
</asp:Content>
