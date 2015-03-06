<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="ProjectInfo.aspx.vb" Inherits="_ProjectInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">


        .style4
        {
            text-align: left;
        }
        .style5
        {
            text-align: center;
        }
        .style7
        {
            text-align: left;
            width: 118px;
        }
        .style8
        {
            width: 118px;
        }
        .style9
        {
            width: 100px;
        }
        .style11
        {
            text-align: right;
        }
        .newStyle1
        {
            background-color: #FFFFCC;
            border-width: 0px;
            border-right-color: #FFFFCC;
            border-bottom-color: #FFFFCC;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentplace1" Runat="Server">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <table ID="frmProjectCustomer" runat="server"
                
                
                
                style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;">
                <tr>
                    <td colspan="2" 
                        style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                        <span lang="en-us" style="text-align: left;">Project Info :&nbsp; </span>
                        <span style="text-align: left;">Customers</span>
                    </td>
                </tr>
                <tr>
                    <td><span lang="en-us">
                        Name</span><asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtCustomerName" 
                            ErrorMessage="The Customer Name is required.">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="style4">
                        <asp:TextBox ID="txtCustomerName" runat="server" CssClass="txtLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Description</td>
                    <td class="style4">
                        <asp:TextBox ID="txtCustomerDescription" runat="server" Enabled="False" 
                            TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <asp:Button ID="btnCustomerEditSave" runat="server" Text="Edit" />
                        <input ID="cmdReset2" type="reset" value="Reset" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            <table ID="frmCustomers" runat="server" 
                style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" 
                visible="false" width="100%">
                <tr>
                    <td colspan="3" 
                        style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                        <span lang="en-us" style="text-align: left;">Project Info :&nbsp; </span>
                        <span style="text-align: left;">Customers</span>
                    </td>
                </tr>
                <tr>
                    <td class="style4" colspan="3">
                        &nbsp;Search By:
                        <asp:DropDownList ID="cmbCustomerSearchBy" runat="server">
                            <asp:ListItem>-Select-</asp:ListItem>
                            <asp:ListItem>ID</asp:ListItem>
                            <asp:ListItem>Name</asp:ListItem>
                            <asp:ListItem>City Name</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;Search for:
                        <asp:TextBox ID="txtCustomerSearchFor" runat="server" cssclass="txtLine"></asp:TextBox>
                        &nbsp;&nbsp;
                        <asp:Button ID="btnCustomerSearch" runat="server" Text="Search" />
                        <input ID="cmdReset3" type="reset" value="Reset" /></td>
                </tr>
                <tr>
                    <td class="style4" colspan="3">
                        <asp:Button ID="btnCustomerAdd" runat="server" Text="Add" />
                        <asp:Button ID="btnCustomerDelete" runat="server" Text="Delete" />
                    </td>
                </tr>
                <tr style="background-color: #00FFFF; border-spacing: 0px;">
                    <td class="style7">
                        <asp:CheckBox ID="chkCustomer" runat="server" />
                    </td>
                    <td class="style4">
                        Customer ID</td>
                    <td class="style4">
                        Customer Name</td>
                </tr>
                <tr style="background-color: #CCFFFF">
                    <td class="style8">
                        &nbsp;</td>
                    <td class="style3">
                        &nbsp;</td>
                    <td class="style3">
                        &nbsp;</td>
                </tr>
                <tr style="background-color: #CCCCFF">
                    <td class="style8">
                        &nbsp;</td>
                    <td class="style3">
                        &nbsp;</td>
                    <td class="style3">
                        &nbsp;</td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table ID="frmProjectInfoProject" runat="server" 
                
                style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;">
                <tr>
                    <td colspan="2" 
                        style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                        <span lang="en-us" style="text-align: left;">Project Info :&nbsp; </span><span 
                            style="text-align: left;"> Projects</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        Customer <span lang="en-us">Name</span><asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator10" runat="server" ControlToValidate="cmbCustomers" 
                            ErrorMessage="The Customer Name is required.">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="style4">
                        <asp:DropDownList ID="cmbCustomers" runat="server" Height="21px" 
                            SelectionMode="Single">
                            <asp:ListItem>--Select Customer--</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        Name<asp:RequiredFieldValidator ID="RequiredFieldValidator11" 
                            runat="server" ControlToValidate="txtProjectName" 
                            ErrorMessage="The Project Name is required.">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="style4">
                        <asp:TextBox ID="txtProjectName" runat="server" CssClass="txtLine" 
                            Enabled="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Status
                    </td>
                    <td class="style4">
                        <asp:TextBox ID="txtProjectDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <asp:Button ID="btnESSEditSave" runat="server" Text="Edit" />
                        <input ID="cmdReset4" type="reset" value="Reset" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:ValidationSummary 
                            ID="ValidationSummary2" runat="server" />
            <table runat="server"
                visible="false" 
                style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" 
                id="frmProjects" width="100%">
                <tr>
                    <td colspan="4" 
                                        
                        style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                        <span lang="en-us" style="text-align: left;">Project Info :&nbsp; </span>
                        <span style="text-align: left;">Projects</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" class="style4">
                                        &nbsp;Search By:
                                        <asp:DropDownList ID="cmbProjectSearchBy" runat="server">
                                            <asp:ListItem>-Select-</asp:ListItem>
                                            <asp:ListItem>ID</asp:ListItem>
                                            <asp:ListItem>Name</asp:ListItem>
                                            <asp:ListItem>City Name</asp:ListItem>
                        </asp:DropDownList>
                                        &nbsp;&nbsp;&nbsp;Search for:
                                        <asp:TextBox ID="txtProjectSearchBy" runat="server" cssclass="txtLine"></asp:TextBox>
                                        &nbsp;&nbsp;
                                        <asp:Button ID="btnProjectSearch" runat="server" Text="Search" />
                        <input ID="cmdReset1" type="reset" value="Reset" /></td>
                </tr>
                <tr>
                    <td colspan="4" class="style4">
                        <asp:Button ID="btnProjectAdd" runat="server" Text="Add" />
                        <asp:Button ID="btnProjectDelete" runat="server" Text="Delete" />
                    </td>
                </tr>
                <tr style="background-color: #00FFFF; border-spacing: 0px;" class="style4">
                    <td class="style9">
                        <asp:CheckBox ID="chkProject" runat="server" />
                    </td>
                    <td class="style3">
                                        Project Id</td>
                    <td class="style3">
                                        Project Name</td>
                    <td class="style3">
                        Customer Name</td>
                </tr>
                <tr style="background-color: #CCFFFF">
                    <td class="style9">
                                        &nbsp;</td>
                    <td class="style3">
                                        &nbsp;</td>
                    <td class="style3">
                                        &nbsp;</td>
                    <td class="style3">
                        &nbsp;</td>
                </tr>
                <tr style="background-color: #CCCCFF">
                    <td class="style9">
                                        &nbsp;</td>
                    <td class="style3">
                                        &nbsp;</td>
                    <td class="style3">
                                        &nbsp;</td>
                    <td class="style3">
                        &nbsp;</td>
                </tr>
            </table>
            <br />
        </asp:View>
        <asp:View ID="View3" runat="server">
            <table 
                
                style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" 
                ID="frmAdminUserGroup" >
                <tr>
                    <td class="style4" colspan="2" style="background-color: #00FFFF">
                        Project Info : Project Activities</td>
                </tr>
                <tr>
                    <td class="style11">
                        Project</td>
                    <td class="style4">
                        <asp:DropDownList ID="cmbProjects" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style4" colspan="2">
                       <table style="border-width: 1px; border-collapse: collapse; border-style: solid; border-color:Gray;">
                       <tr><th><asp:CheckBox runat="server" ID="chkActivity" /></th><th>Activity</th></tr>
                       <tr><td></td><td></td></tr></table></td>
                </tr>
                <tr><td class="style5" colspan="2">
                    <asp:Button ID="btnProjectActivitiesAdd" runat="server" Text="Add" />
                    <asp:Button ID="btnProjectActivitiesDelete" runat="server" Text="Delete" />
                    </td></tr>
                <tr>
                    <td class="style11">
                        Activity</td>
                    <td class="style4">
                        <asp:TextBox ID="txtProjectActivity" runat="server" CssClass="txtLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style5" colspan="2">
                        <asp:Button ID="btnProjectActivitiesEditSave" runat="server" Text="Edit" />
                        <asp:Button ID="btnProjectActivitiesCancel" runat="server" Text="Cancel" /></td>
                </tr>
            </table>
            <asp:ValidationSummary ID="ValidationSummary3" runat="server" />
        </asp:View>
    </asp:MultiView>
    <br />
</asp:Content>

