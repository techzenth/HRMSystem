<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="Import_Export.aspx.vb" Inherits="_Import_Export" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .style1
        {
            text-align: left;
        }
        .style12
        {
            text-align: right;
        }
        .style14
    {
        text-align: center;
    }
        .style2
        {
            text-align: left;
            width: 161px;
        }
        .style13
        {
            text-align: right;
            width: 161px;
        }
        .style3
        {
            width: 339px;
            text-align: right;
        }
        .style8
        {
            width: 309px;
            text-align: left;
        }
        .style5
        {
            width: 299px;
            text-align: center;
        }
        .style15
        {
            text-align:right;
        }
        .style16
        {
            text-align: left;
            font-size: large;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentplace1" Runat="Server">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <table runat="server" 
                style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" 
                id="frmDefineCustomExport">
                <tr style="padding: 0 0 0 0;">
                    <td colspan="2" style="background-color: #00FFFF; border-color: #00FFFF" 
                        class="style1">
                        Define Custom Export</td>
                </tr>
                <tr>
                    <td class="style12">
                        Name<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtCustomExport" 
                            ErrorMessage="The Custom Export is required.">*</asp:RequiredFieldValidator>
&nbsp;</td>
                    <td class="style1">
                        <asp:TextBox ID="txtCustomExport" runat="server" CssClass="txtLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="style14">
                        <asp:Button ID="btnCustomExportSave" runat="server" Text="Save" />
                        <input ID="Reset1" type="reset" value="Reset" /> </td>
                </tr>
                <tr>
                    <td colspan="2" class="style14">
                        <table>
                            <tr>
                                <td>
                                    Available Fields<br />
                                    <asp:ListBox ID="lstAvailableFlds" runat="server"></asp:ListBox>
                                </td>
                                <td>
                                    <asp:Button ID="btnCustomExportAddField" runat="server" Text="Add &gt;" />
                                    <br />
                                    <asp:Button ID="btnCustomExportRemoveField" runat="server" Text="&lt; Remove" />
                                </td>
                                <td>
                                    Assigned Fields<br />
                                    <asp:ListBox ID="lstAssignedFlds" runat="server"></asp:ListBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <asp:ValidationSummary 
                            ID="ValidationSummary1" runat="server" />
            <table runat="server"
                visible="false" 
                style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" 
                id="frmCustomExportDef" width="100%">
                <tr>
                    <td colspan="3" style="background-color: #00FFFF; border-color: #00FFFF" 
                                        class="style1">
                        Custom Export Definitions
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="style1">
                                        &nbsp;Search By:
                                        <asp:DropDownList ID="cmbCustomExport" runat="server">
                                            <asp:ListItem>-Select-</asp:ListItem>
                                            <asp:ListItem>ID</asp:ListItem>
                                            <asp:ListItem>Name</asp:ListItem>
                                            <asp:ListItem>City Name</asp:ListItem>
                        </asp:DropDownList>
                                        &nbsp;&nbsp;&nbsp;Search for:
                                        <asp:TextBox ID="txtCustomExportSearchFor" runat="server" cssclass="txtLine"></asp:TextBox>
                                        &nbsp;&nbsp;
                                        <asp:Button ID="btnCustomExportSearch" runat="server" Text="Search" />
                        <input ID="Reset2" type="reset" value="Reset" /></td>
                </tr>
                <tr>
                    <td colspan="3" class="style1">
                        <asp:Button ID="btnCustomExportAdd" runat="server" Text="Add" />
                        <asp:Button ID="btnCustomExportDelete" runat="server" Text="Delete" />
                    </td>
                </tr>
                <tr style="background-color: #00FFFF; border-spacing: 0px;">
                    <td class="style2">
                        <asp:CheckBox ID="chkCustomExport" runat="server" />
                    </td>
                    <td class="style1">
                                        ID</td>
                    <td class="style1">
                                        Export Name</td>
                </tr>
                <tr style="background-color: #CCFFFF">
                    <td class="style13">
                                        &nbsp;</td>
                    <td class="style3">
                                        &nbsp;</td>
                    <td class="style3">
                                        &nbsp;</td>
                </tr>
                <tr style="background-color: #CCCCFF">
                    <td class="style13">
                                        &nbsp;</td>
                    <td class="style3">
                                        &nbsp;</td>
                    <td class="style3">
                                        &nbsp;</td>
                </tr>
            </table>
            <div class="style12">
                <br />
            </div>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table 
                
                style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" 
                ID="frmExportHRData" runat="server" >
                <tr>
                    <td class="style8" colspan="2" style="background-color: #00FFFF">
                         
                        Export HR Data</td>
                </tr>
                <tr>
                    <td class="style15">
                        Export Type<asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                            runat="server" ErrorMessage="The Export Type is required" 
                            ControlToValidate="cmbExportType">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="style1">
                        <asp:DropDownList ID="cmbExportType" runat="server">
                            <asp:ListItem>-- Select --</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style5" colspan="2">
                        <asp:Button ID="btnExportData" runat="server" Text="Export" />
                        </td>
                </tr>
            </table>
            <asp:ValidationSummary ID="ValidationSummary4" runat="server" />
            <table runat="server"
                
                style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" 
                ID="frmDownloadProgress" visible="False">
                <tr>
                    <td colspan="2" 
                        style="background-color: #00FFFF; border-color: #00FFFF" class="style1">
                        Download Successful. Continuing with Data Export</td>
                </tr>
                <tr>
                    <td class="style16">
                                        Summary</td>
                    <td class="style1">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        ETA</td>
                    <td class="style1">
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Progress</td>
                    <td class="style1">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        No. of rows imported</td>
                    <td class="style1">
                        <asp:Label ID="Label2" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        No. of Rows which failed to import</td>
                    <td class="style1">
                        <asp:Label ID="Label3" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Final result</td>
                    <td class="style1">
                        <asp:Label ID="Label4" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:View>
<asp:View ID="View3" runat="server">
            <table runat="server" 
                style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" 
                id="frmDefineCustomImport">
                <tr style="padding: 0 0 0 0;">
                    <td colspan="3" style="background-color: #00FFFF; border-color: #00FFFF" 
                        class="style1">
                        Define Custom Import</td>
                </tr>
                <tr>
                    <td class="style12">
                        Name<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txtCustomImportName" 
                            ErrorMessage="The Custom Import is required.">*</asp:RequiredFieldValidator>
&nbsp;</td>
                    <td colspan="2" class="style1">
                        <asp:TextBox ID="txtCustomImportName" runat="server" CssClass="txtLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="style12">
                        Contains Header</td>
                    <td class="style1">
                        <asp:CheckBox ID="chkContainsHeader" runat="server" 
                            Text="(If selected, NWC HRMSystem will skip the first line of the CSV file)" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="style14">
                        <asp:Button ID="btnCustomImportSave" runat="server" Text="Save" />
                        <input ID="cmdReset" type="reset" value="Reset" />
                    </td>
                </tr>
                <tr>
                    <td class="style14" colspan="3">
                    <table>
                        <tr>
                            <td>
                                Available Fields<br />
                                <asp:ListBox ID="lstAvailableFields" runat="server"></asp:ListBox>
                            </td>
                            <td>
                                <asp:Button ID="btnCustomImportAddField" runat="server" Text="Add &gt;" />
                                <br />
                                <asp:Button ID="btnCustomImportRemoveField" runat="server" Text="&lt; Remove" />
                            </td>
                            <td>
                                Assigned Fields<br />
                                <asp:ListBox ID="lstAssignedFields" runat="server"></asp:ListBox>
                            </td>
                        </tr>
                        </table>
                        
                    </td>
                </tr>
            </table>
            <asp:ValidationSummary 
                            ID="ValidationSummary2" runat="server" />
            <table runat="server"
                visible="false" 
                style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" 
                id="frmCustomImportDef" width="100%">
                <tr>
                    <td colspan="3" style="background-color: #00FFFF; border-color: #00FFFF" 
                                        class="style1">
                        Custom Import Definitions
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="style1">
                                        &nbsp;Search By:
                                        <asp:DropDownList ID="cmbCustomImportSearchBy" runat="server">
                                            <asp:ListItem>-Select-</asp:ListItem>
                                            <asp:ListItem>ID</asp:ListItem>
                                            <asp:ListItem>Name</asp:ListItem>
                                            <asp:ListItem>City Name</asp:ListItem>
                        </asp:DropDownList>
                                        &nbsp;&nbsp;&nbsp;Search for:
                                        <asp:TextBox ID="txtCustomImportSearchBy" runat="server" cssclass="txtLine"></asp:TextBox>
                                        &nbsp;&nbsp;
                                        <asp:Button ID="btnCustomImportSearch" runat="server" Text="Search" />
                        <input ID="cmdReset1" type="reset" value="Reset" /></td>
                </tr>
                <tr>
                    <td colspan="3" class="style1">
                        <asp:Button ID="btnCustomImportAdd" runat="server" Text="Add" />
                        <asp:Button ID="btnCustomImportDelete" runat="server" Text="Delete" />
                    </td>
                </tr>
                <tr style="background-color: #00FFFF; border-spacing: 0px;">
                    <td class="style2">
                        <asp:CheckBox ID="chkCustomImport" runat="server" />
                    </td>
                    <td class="style1">
                                        ID</td>
                    <td class="style1">
                                        Import Name</td>
                </tr>
                <tr style="background-color: #CCFFFF">
                    <td class="style13">
                                        &nbsp;</td>
                    <td class="style3">
                                        &nbsp;</td>
                    <td class="style3">
                                        &nbsp;</td>
                </tr>
                <tr style="background-color: #CCCCFF">
                    <td class="style13">
                                        &nbsp;</td>
                    <td class="style3">
                                        &nbsp;</td>
                    <td class="style3">
                                        &nbsp;</td>
                </tr>
            </table>
            <div class="style12">
                <br />
            </div>
        </asp:View>
        <asp:View ID="View4" runat="server">
            <table 
                
                style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" 
                ID="frmImportHRData" runat="server" >
                <tr>
                    <td class="style8" colspan="2" style="background-color: #00FFFF">
                         
                    Import HR Data</td>
                </tr>
                <tr>
                    <td class="style15">
                        Description<asp:RequiredFieldValidator ID="RequiredFieldValidator5" 
                            runat="server" ErrorMessage="The Description is required" 
                            ControlToValidate="cmbImportHRDataDescription">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="style1">
                        <asp:DropDownList ID="cmbImportHRDataDescription" runat="server">
                            <asp:ListItem>-- Select --</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style1" colspan="2">
                        Custom Import types can be managed <a href="Import_Export.aspx?Page=Custom Import">here</a></td>
                </tr>
                <tr>
                    <td class="style15">
                        CSV&nbsp;File<asp:RequiredFieldValidator ID="RequiredFieldValidator6" 
                            runat="server" ErrorMessage="The CSV File is required" 
                            ControlToValidate="FileUpload1">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="style1">
                        <asp:FileUpload ID="fileCSV" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="style5" colspan="2">
                        <asp:Button ID="btnImport" runat="server" Text="Import" />
                        </td>
                </tr>
            </table>
            <asp:ValidationSummary ID="ValidationSummary3" runat="server" />
            <table runat="server"
                
                style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" 
                ID="frmImportSummary" visible="False">
                <tr>
                    <td colspan="2" 
                        style="background-color: #00FFFF; border-color: #00FFFF" class="style1">
                        Upload Successful. Continui with Data Import</td>
                </tr>
                <tr>
                    <td class="style1">
                                        Summary</td>
                    <td class="style1">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        ETA</td>
                    <td class="style1">
                        <asp:Label ID="lblETA" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Progress</td>
                    <td class="style1">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        No. of rows imported</td>
                    <td class="style1">
                        <asp:Label ID="lblRowsImported" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        No. of Rows which failed to import</td>
                    <td class="style1">
                        <asp:Label ID="lblRowsFailed" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Final result</td>
                    <td class="style1">
                        <asp:Label ID="lblFinalResult" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>

