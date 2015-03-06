<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="Recruitment.aspx.vb" Inherits="_Recruitment" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentplace1" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    <Services>
    <asp:ServiceReference Path="~/hrmsystem.asmx" />
    </Services>
    </asp:ToolkitScriptManager>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
          <table runat="server" style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" id="frmJobVacancy">
                <tr style="padding: 0 0 0 0;">
                    <td colspan="3" style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                        Add / Edit Job Vacancy
                    </td>
                </tr>
                <tr>
                    <td>
                        Job Title<asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                            runat="server" ControlToValidate="cmbJobTitle"
                            ErrorMessage="The Job Vacancy Name is required.">*</asp:RequiredFieldValidator>
                        &nbsp;
                    </td>
                    <td colspan="2" class="style1">
                        <asp:DropDownList ID="cmbJobTitle" runat="server" AppendDataBoundItems="True" 
                            DataSourceID="adsJobTitle" DataTextField="jobtit_name" 
                            DataValueField="jobtit_code">
                            <asp:ListItem Value="">-- Select --</asp:ListItem>
                        </asp:DropDownList>
                        <asp:AccessDataSource ID="adsJobTitle" runat="server" 
                            DataFile="~/App_Data/hrmsystem.mdb" 
                            SelectCommand="SELECT jobtit_name, jobtit_code FROM hr_job_title">
                        </asp:AccessDataSource>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        Hiring Manager<asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                            runat="server" ErrorMessage="The Hiring Manger is required" 
                            ControlToValidate="txtHiringManager">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="style1">
                    <asp:UpdatePanel ID="ajaxPanel" runat="server">
                        <ContentTemplate>
                        <asp:TextBox ID="txtHiringManager" runat="server" CssClass="txtLine" Enabled="False"
                            Width="179px"></asp:TextBox><asp:AutoCompleteExtender ID="AutoCompleteExtender1"
                                runat="server" ServiceMethod="GetEmployeeList"  ServicePath="hrmsystem.asmx"
                                TargetControlID="txtHiringManager" UseContextKey="True"  
                                MinimumPrefixLength="1"></asp:AutoCompleteExtender>
                        </ContentTemplate></asp:UpdatePanel>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        Description
                    </td>
                    <td class="style1">
                        <asp:TextBox ID="txtJobDescription" runat="server" Enabled="False" 
                            Height="88px" TextMode="MultiLine" Width="243px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        Active</td>
                    <td class="style1">
                        <asp:CheckBox ID="chkActive" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align: center;">
                        <asp:Button ID="btnJobVacEditSave" runat="server" Text="Edit" />
                        <input id="cmdReset" type="reset" value="Reset" />
                        <asp:HiddenField ID="newJobVacID" runat="server" />
                        <asp:HiddenField ID="editJobVacID" runat="server" />
                    </td>
                </tr>
            </table>
            <asp:AccessDataSource ID="adsJobVacancy" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
                
                SelectCommand="SELECT hr_job_vacancy.vacancy_id, hr_job_title.jobtit_name, hr_employee.emp_firstname, hr_employee.emp_lastname, hr_job_vacancy.active FROM ((hr_job_vacancy INNER JOIN hr_job_title ON hr_job_vacancy.jobtit_code = hr_job_title.jobtit_code) INNER JOIN hr_employee ON hr_job_vacancy.manager_id = hr_employee.emp_number)" 
                
                InsertCommand="INSERT INTO hr_job_vacancy(vacancy_id, jobtit_code, manager_id, active, description) VALUES (@vacancy_id, @jobtit_code, @manager_id, @active, @description)">
                <InsertParameters>
                    <asp:ControlParameter ControlID="newJobVacID" Name="@vacancy_id" 
                        PropertyName="Value" />
                    <asp:ControlParameter ControlID="cmbJobTitle" Name="@jobtit_code" 
                        PropertyName="SelectedValue" />
                    <asp:Parameter Name="@manager_id" />
                    <asp:ControlParameter ControlID="chkActive" Name="@active" 
                        PropertyName="Checked" />
                    <asp:ControlParameter ControlID="txtJobDescription" Name="@description" 
                        PropertyName="Text" />
                </InsertParameters>
            </asp:AccessDataSource>
            <asp:ValidationSummary ID="ValidationSummary2" runat="server" />
            <table runat="server" visible="False" style="text-align: right; border: solid 2px #def;
                border-bottom-color: #0ff; border-top-color: #0ff; border-right-color: #0ff;
                border-left-color: #0ff;" id="frmJobVacancies" width="100%">
                <tr>
                    <td colspan="3" 
                        style="text-align: left; background-color: #00FFFF; border-color: #00FFFF" 
                        visible="True">
                        <span style="text-align: left;">
                            Job </span><span style="text-align: left;">Vacancy</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="style1">
                        &nbsp;Search By:
                        <asp:DropDownList ID="cmbJobVacSearchBy" runat="server">
                            <asp:ListItem>-Select-</asp:ListItem>
                            <asp:ListItem>ID</asp:ListItem>
                            <asp:ListItem>Name</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;Search for:
                        <asp:TextBox ID="txtJobVacSearch" runat="server" CssClass="txtLine"></asp:TextBox>
                        &nbsp;&nbsp;
                        <asp:Button ID="btnJobVacSearch" runat="server" Text="Search" />
                        <input id="cmdReset1" type="reset" value="Reset" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="style1">
                        <asp:Button ID="btnJobVacAdd" runat="server" Text="Add" />
                        <asp:Button ID="btnJobVacDelete" runat="server" Text="Delete" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Repeater ID="rptJobVacancy" runat="server" DataSourceID="adsJobVacancy">
                            <HeaderTemplate>
                                <table width="100%">
                                    <tr style="text-align: left; background-color: #00FFFF; color: Black; border-color: #00FFFF">
                                        <td class="style1" style="width: 5;">
                                            <input name="allCheck" type="checkbox" onclick="doHandleAll()" />
                                        </td>
                                        <td>
                                            ID
                                        </td>
                                        <td>Job Title</td>
                                        <td>
                                            Hiring Manager
                                        </td>
                                        <td>Status</td>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr style="background-color: #CCFFFF">
                                    <td class="style1" style="width: 5;">
                                        <input type="checkbox" name="jobvac[]" value="<%#Container.DataItem(0)%>" />
                                    </td>
                                    <td class="style1">
                                        <a class="updatelink" href="Recruitment.aspx?Page=Job Vacancies&id=<%#Container.DataItem(0)%>">
                                            <%#Container.DataItem(0)%></a>
                                    </td>
                                    <td class="style1">
                                        <a class="updatelink" href="Recruitment.aspx?Page=Job Vacancies&id=<%#Container.DataItem(0)%>">
                                            <%#Container.DataItem(1)%></a>
                                    </td>
                                    <td class="style1"> <%#Container.DataItem(2)%>  <%#Container.DataItem(3)%></td>
                                    <td class="style1"> <%#Container.DataItem(4)%></td>
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr style="background-color: #CCCCFF">
                                    <td class="style1" style="width: 5;">
                                        <input type="checkbox" name="jobvac[]" value="<%#Container.DataItem(0)%>" />
                                    </td>
                                    <td class="style1">
                                        <a class="updatelink" href="Recruitment.aspx?Page=Job Vacancies&id=<%#Container.DataItem(0)%>">
                                            <%#Container.DataItem(0)%></a>
                                    </td>
                                    <td class="style1">
                                        <a class="updatelink" href="Recruitment.aspx?Page=Job Vacancies&id=<%#Container.DataItem(0)%>">
                                            <%#Container.DataItem(1)%></a>
                                    </td>
                                    <td class="style1"> <%#Container.DataItem(2)%>  <%#Container.DataItem(3)%></td>
                                    <td class="style1"> <%#Container.DataItem(4)%></td>
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
        <asp:View ID="View2" runat="server">
        </asp:View>
        <asp:View ID="View3" runat="server">
        </asp:View>
    </asp:MultiView>
</asp:Content>

