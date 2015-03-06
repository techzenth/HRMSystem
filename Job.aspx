<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="Job.aspx.vb"
    Inherits="_Job" Title="" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style2
        {
            text-align: left;
        }
        .style4
        {
            text-align: left;
        }
        .style5
        {
            text-align: right;
        }
        .style6
        {
            text-align: center;
        }
        .style7
        {
            background-color: #00FFFF;
        }
        .style8
        {
            text-align: left;
            width: 226px;
        }
        .style9
        {
            width: 194px;
        }
        .style11
        {
            width: 194px;
            text-align: left;
        }
    </style>

    <script language="javascript" type="text/javascript" src="js/common.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentplace1" runat="Server">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <table runat="server" style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" id="frmJobTitle">
                <tr>
                    <td colspan="4" style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                        Job<span lang="en-us" style="text-align: left;"> :&nbsp; </span><span style="text-align: left;">
                            Job Title</span>
                    </td>
                </tr>
                <tr id="jobTitleID" runat="server">
                    <td>
                        Job Title ID
                    </td>
                    <td class="style2" colspan="3">
                        <asp:Label ID="editJobTitleID" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Job Title Name<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="txtJobTitleName" ErrorMessage="The Job Title Name is required.">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="style2" colspan="3">
                        <asp:TextBox ID="txtJobTitleName" runat="server" CssClass="txtLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Job Description<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                            ControlToValidate="txtJobDescription" ErrorMessage="The Job Description is required.">*</asp:RequiredFieldValidator>
                        &nbsp;
                    </td>
                    <td class="style2" colspan="3">
                        <asp:TextBox ID="txtJobDescription" runat="server" Enabled="False" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Job Title Comments
                    </td>
                    <td class="style2" colspan="3">
                        <asp:TextBox ID="txtJobTitleComments" runat="server" Enabled="False" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Job Specification
                    </td>
                    <td class="style2">
                        <asp:DropDownList runat="server" ID="cmbJobSpecification" SelectionMode="Single"
                            Height="21px" AppendDataBoundItems="True" 
                            DataSourceID="adsJobSpecification" DataTextField="jobspec_name" 
                            DataValueField="jobspec_id">
                            <asp:ListItem Value="">--Select--</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="style2" colspan="2">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        Pay Grade
                    </td>
                    <td class="style2">
                        <asp:DropDownList ID="cmbPayGrade" runat="server" Height="21px" 
                            SelectionMode="Single" AppendDataBoundItems="True" DataSourceID="adsPayGrade" 
                            DataTextField="sal_grd_name" DataValueField="sal_grd_code">
                            <asp:ListItem Value="">--Select--</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="style2" colspan="2">
                        <asp:Button ID="btnAddPayGrade" runat="server" Text="Add Pay Grade" />
                        <asp:Button ID="btnEditPayGrade" runat="server" Text="Edit Pay Grade" />
                    </td>
                </tr>
                <tr id="empStat0" runat="server">
                    <td>
                        Employment Status#
                    </td>
                    <td class="style2">
                        <asp:ListBox ID="lstJobTitle" runat="server" DataSourceID="adsJobTitleEmpStat" DataTextField="estat_name"
                            DataValueField="estat_code" SelectionMode="Multiple" ></asp:ListBox>
                        <asp:AccessDataSource ID="adsJobTitleEmpStat" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
                            SelectCommand="SELECT hr_empstat.estat_code, hr_empstat.estat_name FROM hr_empstat INNER JOIN hr_jobtit_empstat ON hr_empstat.estat_code = hr_jobtit_empstat.estat_code WHERE hr_jobtit_empstat.jobtit_code= @jobtit_code ORDER BY hr_empstat.estat_code ASC">
                            <SelectParameters>
                            <asp:ControlParameter ControlID="editJobTitleID" PropertyName="Text" Name="@jobtit_code" />
                            </SelectParameters>
                        </asp:AccessDataSource>
                    </td>
                    <td class="style2">
                        <asp:Button ID="btnEmpStatusAdd" runat="server" Text="&lt; Add" />
                        <br />
                        <asp:Button ID="btnEmpStatusRemove" runat="server" Text="Remove &gt;" />
                    </td>
                    <td class="style2">
                        <asp:ListBox ID="lstEmpStatus" runat="server" DataSourceID="adsEmpStat" DataTextField="estat_name"
                            DataValueField="estat_code" SelectionMode="Multiple"></asp:ListBox>
                        <asp:AccessDataSource ID="adsEmpStat" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
                            SelectCommand="SELECT estat_code, estat_name FROM hr_empstat ORDER BY estat_code">
                        </asp:AccessDataSource>
                    </td>
                </tr>
                <tr id="empStat1" runat="server">
                    <td class="style2" colspan="2">
                        <asp:Button ID="btnAddEmploymentStatus" runat="server" Text="Add Employment Status" />
                        <br />
                        <asp:Button ID="btnEditEmploymentStatus" runat="server" Text="Edit Employment Status" />
                    </td>
                    <td class="style2" colspan="2">
                        &nbsp;
                    </td>
                </tr>
                <tr id="empStat2" runat="server">
                    <td class="style2" colspan="4">
                        <table>
                            <tr>
                                <td>
                                    Employment Status
                                </td>
                                <td>
                                    <asp:TextBox ID="txtJobEmpStatus" runat="server" CssClass="txtLine" Width="210px"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;<asp:Button ID="btnEmpStatusSave" runat="server" Text="Save" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center;" colspan="4">
                        <asp:Button ID="btnJobTitleEditSave" runat="server" Text="Save" />
                        <input id="cmdReset0" type="reset" value="Reset" /><asp:HiddenField ID="newJobTitleID"
                            runat="server" />
                    </td>
                </tr>
            </table>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            <asp:AccessDataSource ID="adsJobTitle" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
                SelectCommand="SELECT [jobtit_code], [jobtit_name] FROM hr_job_title" 
                InsertCommand="INSERT INTO hr_job_title(jobtit_code, jobtit_name, jobtit_desc, jobtit_comm, sal_grd_code, jobspec_id) VALUES (@jobtit_code, @jobtit_name, @jobtit_desc, @jobtit_comm, @sal_grd_code, @jobspec_id)">
                <InsertParameters>
                    <asp:ControlParameter ControlID="newJobTitleID" Name="@jobtit_code" PropertyName="Value" />
                    <asp:ControlParameter ControlID="txtJobTitleName" Name="@jobtit_name" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtJobDescription" Name="@jobtit_desc" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtJobTitleComments" Name="@jobtit_comm" PropertyName="Text" />
                    <asp:ControlParameter ControlID="cmbPayGrade" Name="@sal_grd_code" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="cmbJobSpecification" Name="@jobspec_id" PropertyName="SelectedValue" />
                </InsertParameters>
            </asp:AccessDataSource>
            <br />
            <table id="frmJobTitles" runat="server" style="text-align: right; border: solid 2px #def;
                border-bottom-color: #0ff; border-top-color: #0ff; border-right-color: #0ff;
                border-left-color: #0ff;" visible="false" width="100%">
                <tr>
                    <td colspan="3" style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                        <span lang="en-us" style="text-align: left;">Job :&nbsp; </span><span style="text-align: left;">
                            Job Title</span>
                    </td>
                </tr>
                <tr>
                    <td class="style2" colspan="3">
                        &nbsp;Search By:
                        <asp:DropDownList ID="cmbJobTitleSearchBy" runat="server">
                            <asp:ListItem>-Select-</asp:ListItem>
                            <asp:ListItem>ID</asp:ListItem>
                            <asp:ListItem>Name</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;Search for:
                        <asp:TextBox ID="txtJobTitleSearchFor" runat="server" CssClass="txtLine"></asp:TextBox>
                        &nbsp;&nbsp;
                        <asp:Button ID="btnJobTitleSearch" runat="server" Text="Search" />
                        <input id="cmdReset2" type="reset" value="Reset" />
                    </td>
                </tr>
                <tr>
                    <td class="style2" colspan="3">
                        <asp:Button ID="btnJobTitleAdd" runat="server" Text="Add" />
                        <asp:Button ID="btnJobTitleDelete" runat="server" Text="Delete" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Repeater ID="rptJobTitle" runat="server" DataSourceID="adsJobTitle">
                            <HeaderTemplate>
                                <table width="100%">
                                    <tr style="background-color: #00FFFF; border-spacing: 0px;">
                                        <td class="style8" width="50">
                                            <input name="allCheck" type="checkbox" onclick="doHandleAll()" />
                                        </td>
                                        <td class="style2">
                                            Job Title ID
                                        </td>
                                        <td class="style2">
                                            Job Title Name
                                        </td>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr style="background-color: #CCFFFF">
                                    <td class="style8" width="50">
                                        <input name="jobtitle[]" type="checkbox" value="<%# Container.DataItem(0) %>" />
                                    </td>
                                    <td class="style2">
                                        <a class="updatelink" href="Job.aspx?Page=Job Titles&id=<%# Container.DataItem(0) %>">
                                            <%# Container.DataItem(0) %></a>
                                    </td>
                                    <td class="style2">
                                        <a class="updatelink" href="Job.aspx?Page=Job Titles&id=<%# Container.DataItem(0) %>">
                                            <%#Container.DataItem(1)%></a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr style="background-color: #CCCCFF">
                                    <td class="style8" width="50">
                                        <input name="jobtitle[]" type="checkbox" value="<%# Container.DataItem(0) %>" />
                                    </td>
                                    <td class="style2">
                                        <a class="updatelink" href="Job.aspx?Page=Job Titles&id=<%# Container.DataItem(0) %>">
                                            <%# Container.DataItem(0) %></a>
                                    </td>
                                    <td class="style2">
                                        <a class="updatelink" href="Job.aspx?Page=Job Titles&id=<%# Container.DataItem(0) %>">
                                            <%#Container.DataItem(1)%></a>
                                    </td>
                                </tr>
                            </AlternatingItemTemplate>
                            <FooterTemplate>
                                </table></FooterTemplate>
                        </asp:Repeater>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table runat="server" style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" id="frmJobSpecification">
                <tr style="padding: 0 0 0 0;">
                    <td colspan="3" style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                        <span style="text-align: left;" lang="en-us">Job :&nbsp; </span><span style="text-align: left;">
                            Job Specifications</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        Name<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtJobSpecName"
                            ErrorMessage="The Job Specification Name is required.">*</asp:RequiredFieldValidator>
                        &nbsp;
                    </td>
                    <td colspan="2" class="style2">
                        <asp:TextBox ID="txtJobSpecName" runat="server" CssClass="txtLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        Description
                    </td>
                    <td class="style4">
                        <asp:TextBox ID="txtJobSpecDescription" runat="server" Enabled="False" Height="88px"
                            TextMode="MultiLine" Width="243px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        Duties
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="txtJobSpecDuties" runat="server" Enabled="False" Height="49px" TextMode="MultiLine"
                            Width="173px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align: center;">
                        <asp:Button ID="btnJobSpecEditSave" runat="server" Text="Edit" />
                        <input id="cmdReset" type="reset" value="Reset" />
                        <asp:HiddenField ID="newJobSpecID" runat="server" />
                        <asp:HiddenField ID="editJobSpecID" runat="server" />
                    </td>
                </tr>
            </table>
            <asp:AccessDataSource ID="adsJobSpecification" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
                SelectCommand="SELECT jobspec_id, jobspec_name FROM hr_job_spec" InsertCommand="INSERT INTO hr_job_spec(jobspec_name, jobspec_id, jobspec_desc, jobspec_duties) VALUES (@jobspec_name, @jobspec_id, @jobspec_desc, @jobspec_duties)">
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtJobSpecName" Name="@jobspec_name" PropertyName="Text" />
                    <asp:ControlParameter ControlID="newJobSpecID" Name="@jobspec_id" PropertyName="Value" />
                    <asp:ControlParameter ControlID="txtJobSpecDescription" Name="@jobspec_desc" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtJobSpecDuties" Name="@job_duties" PropertyName="Text" />
                </InsertParameters>
            </asp:AccessDataSource>
            <asp:ValidationSummary ID="ValidationSummary2" runat="server" />
            <table runat="server" visible="false" style="text-align: right; border: solid 2px #def;
                border-bottom-color: #0ff; border-top-color: #0ff; border-right-color: #0ff;
                border-left-color: #0ff;" id="frmJobSpecifications" width="100%">
                <tr>
                    <td colspan="3" style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                        <span lang="en-us" style="text-align: left;">Job :&nbsp; </span><span style="text-align: left;">
                            Job </span><span style="text-align: left;">Specifications</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="style2">
                        &nbsp;Search By:
                        <asp:DropDownList ID="cmbJobSpecSearchBy" runat="server">
                            <asp:ListItem>-Select-</asp:ListItem>
                            <asp:ListItem>ID</asp:ListItem>
                            <asp:ListItem>Name</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;Search for:
                        <asp:TextBox ID="txtJobSpecSearch" runat="server" CssClass="txtLine"></asp:TextBox>
                        &nbsp;&nbsp;
                        <asp:Button ID="btnJobSpecSearch" runat="server" Text="Search" />
                        <input id="cmdReset1" type="reset" value="Reset" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="style2">
                        <asp:Button ID="btnJobSpecAdd" runat="server" Text="Add" />
                        <asp:Button ID="btnJobSpecDelete" runat="server" Text="Delete" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Repeater ID="rptJobSpecification" runat="server" DataSourceID="adsJobSpecification">
                            <HeaderTemplate>
                                <table width="100%">
                                    <tr style="text-align: left; background-color: #00FFFF; color: Black; border-color: #00FFFF">
                                        <td class="style9" style="width: 5;">
                                            <input name="allCheck" type="checkbox" onclick="doHandleAll()" />
                                        </td>
                                        <td>
                                            ID
                                        </td>
                                        <td>
                                            Name
                                        </td>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr style="background-color: #CCFFFF">
                                    <td class="style11" style="width: 5;">
                                        <input type="checkbox" name="jobspec[]" value="<%#Container.DataItem(0)%>" />
                                    </td>
                                    <td class="style11">
                                        <a class="updatelink" href="Job.aspx?Page=Job Specification&id=<%#Container.DataItem(0)%>">
                                            <%#Container.DataItem(0)%></a>
                                    </td>
                                    <td class="style11">
                                        <a class="updatelink" href="Job.aspx?Page=Job Specification&id=<%#Container.DataItem(0)%>">
                                            <%#Container.DataItem(1)%></a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr style="background-color: #CCCCFF">
                                    <td class="style11" style="width: 5;">
                                        <input type="checkbox" name="jobspec[]" value="<%#Container.DataItem(0)%>" />
                                    </td>
                                    <td class="style11">
                                        <a class="updatelink" href="Job.aspx?Page=Job Specification&id=<%#Container.DataItem(0)%>">
                                            <%#Container.DataItem(0)%></a>
                                    </td>
                                    <td class="style11">
                                        <a class="updatelink" href="Job.aspx?Page=Job Specification&id=<%#Container.DataItem(0)%>">
                                            <%#Container.DataItem(1)%></a>
                                    </td>
                                </tr>
                            </AlternatingItemTemplate>
                            <FooterTemplate>
                                </table></FooterTemplate>
                        </asp:Repeater>
                    </td>
                </tr>
            </table>
            <br />
        </asp:View>
        <asp:View ID="View3" runat="server">
            <table cellpadding="0" cellspacing="0" style="text-align: right; border: solid 2px #def;
                border-bottom-color: #0ff; border-top-color: #0ff; border-right-color: #0ff;
                border-left-color: #0ff;" runat="server" id="frmPayGrade">
                <tr>
                    <td style="text-align: left; background-color: #00FFFF; border-color: #00FFFF" colspan="5">
                        <span lang="en-us" style="text-align: left;">Job :&nbsp; </span>Pay Grades
                    </td>
                </tr>
                <tr id="payCode" runat="server">
                    <td class="style5" colspan="2">
                        Code
                    </td>
                    <td class="style2" colspan="3">
                        &nbsp;
                        <asp:Label ID="editPayGradeID" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style5" colspan="2">
                        &nbsp; Name<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                            ControlToValidate="txtPayGradeName" ErrorMessage="The Pay Grade Name is required">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="style2" colspan="3">
                        <asp:TextBox ID="txtPayGradeName" runat="server" CssClass="txtLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style6" colspan="5">
                        <asp:HiddenField ID="newPayGradeID" runat="server" />
                        <asp:Button ID="btnPayGradeEditSave" runat="server" Text="Edit" />
                        <input id="cmdReset3" type="reset" value="Reset" />
                    </td>
                </tr>
                <tr id="newCurrency0" runat="server">
                    <td style="text-align: left; background-color: #00FFFF; border-color: #00FFFF" colspan="5"
                        id="currencyCell0" runat="server">
                        Assign new currency
                    </td>
                </tr>
                <tr id="newCurrency1" runat="server">
                    <td colspan="5">
                        <table width="100%">
                            <tr>
                                <td class="style5" colspan="2">
                                    Currency<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="cmbCurrency"
                                        ErrorMessage="The currency is required">*</asp:RequiredFieldValidator>
                                </td>
                                <td class="style2" colspan="3">
                                    <asp:DropDownList ID="cmbCurrency" runat="server" AppendDataBoundItems="True" DataSourceID="adsCurrencyType"
                                        DataTextField="currency_name" DataValueField="currency_id">
                                        <asp:ListItem>---Select Currency---</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Label ID="editCurrency" runat="server"></asp:Label>
                                    <asp:AccessDataSource ID="adsCurrencyType" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
                                        SelectCommand="SELECT hr_currency_type.currency_id, hr_currency_type.currency_name FROM (pr_salary_currency_detail RIGHT OUTER JOIN hr_currency_type ON pr_salary_currency_detail.currency_id = hr_currency_type.currency_id) WHERE (pr_salary_currency_detail.currency_id IS NULL) ORDER BY hr_currency_type.currency_name">
                                    </asp:AccessDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="style5" colspan="2">
                                    Minimum Salary
                                </td>
                                <td class="style2" colspan="3">
                                    <asp:TextBox ID="txtMinSalary" runat="server" CssClass="txtLine"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style5" colspan="2">
                                    Maximum Salary
                                </td>
                                <td class="style2" colspan="3">
                                    <asp:TextBox ID="txtMaxSalary" runat="server" CssClass="txtLine"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style5" colspan="2">
                                    Step Increase
                                </td>
                                <td class="style2" colspan="3">
                                    <asp:TextBox ID="txtStepIncrease" runat="server" CssClass="txtLine"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style6" colspan="5">
                                    <asp:Button ID="btnCurrencyEditSave" runat="server" Text="Save" />
                                    <asp:HiddenField ID="flagCurrency" runat="server" Value="New" />
                                    <asp:HiddenField ID="editCurrencyID" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="assignedCurrency0" runat="server">
                    <td class="style6" colspan="5" style="text-align: left; background-color: #00FFFF;
                        border-color: #00FFFF">
                        Assigned currencies
                    </td>
                </tr>
                <tr id="assignedCurrency1" runat="server">
                    <td class="style2" colspan="5">
                        <asp:Button ID="btnCurrencyDelete" runat="server" Text="Delete" />
                    </td>
                </tr>
                <tr id="assignedCurrency2" runat="server">
                    <td colspan="5">
                        <asp:Repeater ID="rptcurrency" runat="server" DataSourceID="adsCurrencyDetails">
                            <HeaderTemplate>
                                <table width="100%">
                                    <tr>
                                        <td class="style2">
                                            &nbsp;
                                        </td>
                                        <td class="style2">
                                            Currency
                                        </td>
                                        <td class="style2">
                                            Minimum Salary
                                        </td>
                                        <td class="style2">
                                            Maximum Salary
                                        </td>
                                        <td class="style2">
                                            Step Increase
                                        </td>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td class="style2">
                                        <input name="currency[]" type="checkbox" value="<%#Container.DataItem(0) %>" />
                                    </td>
                                    <td class="style2">
                                        <a class="updatelink" href="Job.aspx?Page=Pay Grades&id=<% = editPayGradeID.Text %>&currency=<%#Container.DataItem(0)%>">
                                            <%#Container.DataItem(1)%></a>
                                    </td>
                                    <td class="style5">
                                        <%#Container.DataItem(2)%>
                                    </td>
                                    <td class="style5">
                                        <%#Container.DataItem(3)%>
                                    </td>
                                    <td class="style5">
                                        <%#Container.DataItem(4)%>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table></FooterTemplate>
                        </asp:Repeater>
                        <asp:AccessDataSource ID="adsCurrencyDetails" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
                            SelectCommand="SELECT hr_currency_type.currency_id, hr_currency_type.currency_name, pr_salary_currency_detail.salcurr_dtl_minsalary, pr_salary_currency_detail.sal_curr_dtl_maxsalary, pr_salary_currency_detail.salcurr_dtl_stepsalary FROM (pr_salary_currency_detail INNER JOIN hr_currency_type ON pr_salary_currency_detail.currency_id = hr_currency_type.currency_id) WHERE pr_salary_currency_detail.sal_grd_code= @sal_grd_code"
                            InsertCommand="INSERT INTO pr_salary_currency_detail (sal_grd_code, currency_id, salcurr_dtl_minsalary, salcurr_dtl_stepsalary, sal_curr_dtl_maxsalary) VALUES (@sal_grd_code, @currency_id, @salcurr_dtl_minsalary, @salcurr_dtl_stepsalary, @sal_curr_dtl_maxsalary)"
                            UpdateCommand="UPDATE pr_salary_currency_detail SET currency_id =@currency_id, salcurr_dtl_minsalary =@salcurr_dtl_minsalary, salcurr_dtl_stepsalary = @salcurr_dtl_stepsalary, sal_curr_dtl_maxsalary = @sal_curr_dtl_maxsalary WHERE sal_grd_code = @sal_grd_code">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="editPayGradeID" Name="@sal_grd_code" PropertyName="Text" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="cmbCurrency" Name="@currency_id" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="txtMinSalary" Name="@sal_curr_dtl_minsalary" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtStepIncrease" Name="@sal_curr_dtl_stepsalary"
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtMaxSalary" Name="@sal_curr_dtl_maxsalary" PropertyName="Text" />
                                <asp:ControlParameter ControlID="editPayGradeID" Name="@sal_grd_code" PropertyName="Text" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="editPayGradeID" Name="@sal_grd_code" PropertyName="Text" />
                                <asp:ControlParameter ControlID="cmbCurrency" Name="@currency_id" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="txtMinSalary" Name="@salcurr_dtl_minsalary" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtStepIncrease" Name="@salcurr_dtl_stepsalary"
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtMaxSalary" Name="@salcurr_dtl_maxsalary" PropertyName="Text" />
                            </InsertParameters>
                        </asp:AccessDataSource>
                    </td>
                </tr>
            </table>
            </td> </tr> </table>
            <asp:AccessDataSource ID="adsPayGrade" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
                SelectCommand="SELECT sal_grd_code, sal_grd_name FROM pr_salary_grade" InsertCommand="INSERT INTO pr_salary_grade(sal_grd_code, sal_grd_name) VALUES (@sal_grd_code, @sal_grd_name)">
                <InsertParameters>
                    <asp:ControlParameter ControlID="newPayGradeID" Name="@sal_grd_code" PropertyName="Value" />
                    <asp:ControlParameter ControlID="txtPayGradeName" Name="@sal_grd_name" PropertyName="Text" />
                </InsertParameters>
            </asp:AccessDataSource>
            <asp:ValidationSummary ID="ValidationSummary3" runat="server" />
            <table id="frmPayGrades" runat="server" style="text-align: right; border: solid 2px #def;
                border-bottom-color: #0ff; border-top-color: #0ff; border-right-color: #0ff;
                border-left-color: #0ff;" visible="false" width="100%">
                <tr>
                    <td colspan="3" style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                        <span lang="en-us" style="text-align: left;">Job :&nbsp; </span><span style="text-align: left;">
                            <span class="style7">Pay Grades</span></span>
                    </td>
                </tr>
                <tr>
                    <td class="style2" colspan="3">
                        &nbsp;Search By:
                        <asp:DropDownList ID="cmbPayGradeSearchBy" runat="server">
                            <asp:ListItem>-Select-</asp:ListItem>
                            <asp:ListItem>ID</asp:ListItem>
                            <asp:ListItem>Name</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;Search for:
                        <asp:TextBox ID="txtPayGradeSearch" runat="server" CssClass="txtLine"></asp:TextBox>
                        &nbsp;&nbsp;
                        <asp:Button ID="btnPayGradeSearch" runat="server" Text="Search" />
                        <input id="cmdReset4" type="reset" value="Reset" />
                    </td>
                </tr>
                <tr>
                    <td class="style2" colspan="3">
                        <asp:Button ID="btnPayGradeAdd" runat="server" Text="Add" />
                        <asp:Button ID="btnPayGradeDelete" runat="server" Text="Delete" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Repeater ID="rptPayGrade" runat="server" DataSourceID="adsPayGrade">
                            <HeaderTemplate>
                                <table width="100%">
                                    <tr style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                                        <td>
                                            <input name="allCheck" type="checkbox" onclick="doHandleAll()" />
                                        </td>
                                        <td>
                                            Pay Grade ID
                                        </td>
                                        <td>
                                            Pay Grade Name
                                        </td>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr style="background-color: #CCFFFF">
                                    <td class="style4">
                                        <input name="payGrade[]" type="checkbox" value="<%# Container.DataItem(0) %>" />
                                    </td>
                                    <td class="style4">
                                        <a class="updatelink" href="Job.aspx?Page=Pay Grades&id=<%# Container.DataItem(0) %>">
                                            <%#Container.DataItem(0)%></a>
                                    </td>
                                    <td class="style4">
                                        <a class="updatelink" href="Job.aspx?Page=Pay Grades&id=<%# Container.DataItem(0) %>">
                                            <%#Container.DataItem(1)%></a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr style="background-color: #CCCCFF">
                                    <td class="style4">
                                        <input name="payGrade[]" type="checkbox" value="<%# Container.DataItem(0) %>" />
                                    </td>
                                    <td class="style4">
                                        <a class="updatelink" href="Job.aspx?Page=Pay Grades&id=<%# Container.DataItem(0) %>">
                                            <%#Container.DataItem(0)%></a>
                                    </td>
                                    <td class="style4">
                                        <a class="updatelink" href="Job.aspx?Page=Pay Grades&id=<%# Container.DataItem(0) %>">
                                            <%#Container.DataItem(1)%></a>
                                    </td>
                                </tr>
                            </AlternatingItemTemplate>
                            <FooterTemplate>
                                </table></FooterTemplate>
                        </asp:Repeater>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View4" runat="server">
            <table style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" id="frmEmploymentStatus"
                runat="server">
                <tr>
                    <td style="text-align: left; background-color: #00FFFF; border-color: #00FFFF" colspan="2">
                        <span lang="en-us" style="text-align: left;">Job :&nbsp; </span>Employment Status
                    </td>
                </tr>
                <tr id="empstatCode" runat="server">
                    <td>
                        Code
                    </td>
                    <td class="style2">
                        <asp:Label ID="editEmploymentStatusID" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Name<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtEmpStatName"
                            ErrorMessage="The Employment Status Name is required">*</asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmpStatName" runat="server" CssClass="txtLine" Width="247px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style6" colspan="2">
                        <asp:Button ID="btnEmpStatEditSave" runat="server" Text="Edit" />
                        <input id="cmdReset7" type="reset" value="Reset" />
                        <asp:HiddenField ID="newEmploymentStatusID" runat="server" />
                    </td>
                </tr>
            </table>
            <asp:ValidationSummary ID="ValidationSummary4" runat="server" />
            <table id="frmEmploymentStatuses" runat="server" style="text-align: right; border: solid 2px #def;
                border-bottom-color: #0ff; border-top-color: #0ff; border-right-color: #0ff;
                border-left-color: #0ff;" visible="false" width="100%">
                <tr>
                    <td colspan="3" style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                        <span lang="en-us" style="text-align: left;">Job :&nbsp; </span>Employment<span style="text-align: left;">&nbsp;Statu</span><span
                            style="text-align: left;">s</span>
                    </td>
                </tr>
                <tr>
                    <td class="style2" colspan="3">
                        &nbsp;Search By:
                        <asp:DropDownList ID="cmbEmpStatSearchBy" runat="server">
                            <asp:ListItem>-Select-</asp:ListItem>
                            <asp:ListItem>ID</asp:ListItem>
                            <asp:ListItem>Name</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;Search for:
                        <asp:TextBox ID="txtEmploymentSearchFor" runat="server" CssClass="txtLine"></asp:TextBox>
                        &nbsp;&nbsp;
                        <asp:Button ID="btnEmploymentStatusSearch" runat="server" Text="Search" />
                        <input id="cmdReset5" type="reset" value="Reset" />
                    </td>
                </tr>
                <tr>
                    <td class="style2" colspan="3">
                        <asp:Button ID="btnEmploymentStatusAdd" runat="server" Text="Add" Style="height: 26px" />
                        <asp:Button ID="btnEmploymentStatusDelete" runat="server" Text="Delete" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Repeater ID="rptEmploymentStatus" runat="server" DataSourceID="adsEmploymentStatus">
                            <HeaderTemplate>
                                <table width="100%">
                                    <tr style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                                        <td>
                                            <input name="allCheck" type="checkbox" onclick="doHandleAll()" />
                                        </td>
                                        <td>
                                            Employment Status ID
                                        </td>
                                        <td>
                                            Employment Status Name
                                        </td>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr style="background-color: #CCFFFF">
                                    <td class="style2">
                                        <input name="empStat[]" type="checkbox" value="<%# Container.DataItem(0) %>" />
                                    </td>
                                    <td class="style2">
                                        <a class="updatelink" href="Job.aspx?Page=Employment Status&id=<%# Container.DataItem(0) %>">
                                            <%# Container.DataItem(0) %></a>
                                    </td>
                                    <td class="style2">
                                        <a class="updatelink" href="Job.aspx?Page=Employment Status&id=<%# Container.DataItem(0) %>">
                                            <%# Container.DataItem(1) %></a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr style="background-color: #CCCCFF">
                                    <td class="style2">
                                        <input name="empStat[]" type="checkbox" value="<%# Container.DataItem(0) %>" />
                                    </td>
                                    <td class="style2">
                                        <a class="updatelink" href="Job.aspx?Page=Employment Status&id=<%# Container.DataItem(0) %>">
                                            <%# Container.DataItem(0) %></a>
                                    </td>
                                    <td class="style2">
                                        <a class="updatelink" href="Job.aspx?Page=Employment Status&id=<%# Container.DataItem(0) %>">
                                            <%# Container.DataItem(1) %></a>
                                    </td>
                                </tr>
                            </AlternatingItemTemplate>
                            <FooterTemplate>
                                </table></FooterTemplate>
                        </asp:Repeater>
                        <asp:AccessDataSource ID="adsEmploymentStatus" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
                            SelectCommand="SELECT estat_code, estat_name FROM hr_empstat ORDER BY estat_code"
                            InsertCommand="INSERT INTO hr_empstat(estat_code, estat_name) VALUES (@estat_code, @estat_name)"
                            UpdateCommand="UPDATE hr_empstat SET estat_name =@estat_name WHERE estat_code=@estat_code">
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="txtEmpStatName" Name="@estat_name" PropertyName="Text" />
                                <asp:ControlParameter ControlID="editEmploymentStatusID" Name="@estat_code" PropertyName="Text" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="newEmploymentStatusID" Name="@estat_code" PropertyName="Value" />
                                <asp:ControlParameter ControlID="txtEmpStatName" Name="@estat_name" PropertyName="Text" />
                            </InsertParameters>
                        </asp:AccessDataSource>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View5" runat="server">
            </td>
            <table style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" id="frmJobEEOJobCat"
                runat="server">
                <tr>
                    <td style="text-align: left; background-color: #00FFFF; border-color: #00FFFF" colspan="2">
                        <span lang="en-us" style="text-align: left;">Job :&nbsp; </span><span style="text-align: left;">
                            EEO Job Category</span>
                    </td>
                </tr>
                <tr id="EEOCode" runat="server">
                    <td>
                        Code
                    </td>
                    <td class="style2">
                        <asp:Label ID="editEEOJobCatergoryID" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Title<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtEEOJobCategoryTitle"
                            ErrorMessage="The Job Category Title is required">*</asp:RequiredFieldValidator>
                        &nbsp;
                    </td>
                    <td>
                        <asp:TextBox ID="txtEEOJobCategoryTitle" runat="server" CssClass="txtLine" Width="179px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style6" colspan="2">
                        <asp:Button ID="btnEEOJobCategoryEditSave" runat="server" Text="Edit" />
                        <input id="cmdReset8" type="reset" value="Reset" />
                        <asp:HiddenField ID="newEEOJobCategoryID" runat="server" />
                    </td>
                </tr>
            </table>
            <asp:ValidationSummary ID="ValidationSummary5" runat="server" />
            <table id="frmJobEEOJobCats" runat="server" style="text-align: right; border: solid 2px #def;
                border-bottom-color: #0ff; border-top-color: #0ff; border-right-color: #0ff;
                border-left-color: #0ff;" visible="false" width="100%">
                <tr>
                    <td colspan="3" style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                        <span lang="en-us" style="text-align: left;">Job :&nbsp; <span style="text-align: left;">
                            EEO Job Category</span></span>
                    </td>
                </tr>
                <tr>
                    <td class="style2" colspan="3">
                        &nbsp;Search By:
                        <asp:DropDownList ID="cmbEEOJobCategorySearchBy" runat="server">
                            <asp:ListItem>-Select-</asp:ListItem>
                            <asp:ListItem>ID</asp:ListItem>
                            <asp:ListItem>Name</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;Search for:
                        <asp:TextBox ID="txtEEOJobCategorySearch" runat="server" CssClass="txtLine"></asp:TextBox>
                        &nbsp;&nbsp;
                        <asp:Button ID="btnEEOJobCategorySearch" runat="server" Text="Search" />
                        <input id="cmdReset6" type="reset" value="Reset" />
                    </td>
                </tr>
                <tr>
                    <td class="style2" colspan="3">
                        <asp:Button ID="btnEEOJobCategoryAdd" runat="server" Text="Add" />
                        <asp:Button ID="btnEEOJobCategoryDelete" runat="server" Text="Delete" />
                    </td>
                </tr>
                <tr>
                    <td>
                    <asp:Repeater ID="rptEEOJobCategory" runat="server" 
                            DataSourceID="adsEEOJobCategory"><HeaderTemplate>
                        <table width="100%">
                            <tr style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                                <td>
                                    <input name="allCheck" type="checkbox" onclick="doHandleAll()" />
                                </td>
                                <td>
                                    EEO Job Category Id
                                </td>
                                <td>
                                    EEO Job Category Name
                                </td>
                            </tr>
                            </HeaderTemplate><ItemTemplate>
                            <tr style="background-color: #CCFFFF">
                                <td class="style2">
                                    <input name="EEOJobCategory[]" type="checkbox" value="<%# Container.DataItem(0) %>" />
                                </td>
                                <td class="style2">
                                        <a class="updatelink" href="Job.aspx?Page=EEO Job Categories&id=<%# Container.DataItem(0) %>">
                                            <%# Container.DataItem(0) %></a>
                                    </td>
                                    <td class="style2">
                                        <a class="updatelink" href="Job.aspx?Page=EEO Job Categories&id=<%# Container.DataItem(0) %>">
                                            <%# Container.DataItem(1) %></a>
                                    </td>
                            </tr></ItemTemplate><AlternatingItemTemplate>
                            <tr style="background-color: #CCCCFF">
                                <td class="style2">
                                     <input name="EEOJobCategory[]" type="checkbox" value="<%# Container.DataItem(0) %>" />
                                </td>
                                <td class="style2">
                                        <a class="updatelink" href="Job.aspx?Page=EEO Job Categories&id=<%# Container.DataItem(0) %>">
                                            <%# Container.DataItem(0) %></a>
                                    </td>
                                    <td class="style2">
                                        <a class="updatelink" href="Job.aspx?Page=EEO Job Categories&id=<%# Container.DataItem(0) %>">
                                            <%# Container.DataItem(1) %></a>
                                    </td>
                            </tr></AlternatingItemTemplate><FooterTemplate>
                        </table></FooterTemplate></asp:Repeater>
                        <asp:AccessDataSource ID="adsEEOJobCategory" runat="server" 
                            DataFile="~/App_Data/hrmsystem.mdb" 
                            InsertCommand="INSERT INTO hr_eec (eec_code, eec_desc) VALUES (@eec_code, @eec_desc)" 
                            SelectCommand="SELECT eec_code, eec_desc FROM hr_eec">
                            <InsertParameters>
                                <asp:ControlParameter ControlID="newEEOJobCategoryID" Name="@eec_code" 
                                    PropertyName="Value" />
                                <asp:ControlParameter ControlID="txtEEOJobCategoryTitle" Name="@eec_desc" 
                                    PropertyName="Text" />
                            </InsertParameters>
                        </asp:AccessDataSource>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View6" runat="server">
        </asp:View>
    </asp:MultiView>
</asp:Content>
