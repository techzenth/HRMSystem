<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="CustomFields.aspx.vb" Inherits="_CustomFields" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">




        .style4
        {
            text-align: left;
        }
        .style7
        {
            text-align: left;
            width: 220px;
        }
        .style8
        {
            width: 220px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentplace1" Runat="Server">
    <table ID="frmCustomField" runat="server"
                
                
                
                
                style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" 
                __designer:mapid="209e">
        <tr>
            <td colspan="2" 
                        
            style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                Custom Fields</td>
        </tr>
        <tr>
            <td>
                Field Number</td>
            <td class="style4">
                <asp:DropDownList ID="cmbFieldNumber" runat="server">
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Field Name<asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtFieldName" 
                            ErrorMessage="The Field Name is required.">*</asp:RequiredFieldValidator>
            </td>
            <td class="style4">
                <asp:TextBox ID="txtFieldName" runat="server" Enabled="False" CssClass="txtLine" 
                Width="145px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Type<asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator9" runat="server" ControlToValidate="cmbFieldType" 
                            ErrorMessage="The  Field Type is required.">*</asp:RequiredFieldValidator>
            </td>
            <td class="style4">
                <asp:DropDownList ID="cmbFieldType" runat="server">
                    <asp:ListItem>String</asp:ListItem>
                    <asp:ListItem>Drop Down</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center;">
                <asp:Button ID="btnCustomFieldsEditSave" runat="server" Text="Edit" />
                <input ID="cmdReset" type="reset" value="Reset" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            <table ID="frmCustomFields" runat="server" 
                style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" 
                visible="False" width="100%" __designer:mapid="d6e">
                <tr>
                    <td colspan="3" 
                        style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                        Custom Fields</td>
                </tr>
                <tr>
                    <td class="style4" colspan="3">
                        <asp:Button ID="btnCustomFieldsAdd" runat="server" Text="Add" />
                        <asp:Button ID="btnCustomFieldsDelete" runat="server" Text="Delete" />
                    </td>
                </tr>
                <tr style="background-color: #00FFFF; border-spacing: 0px;">
                    <td class="style7">
                        <asp:CheckBox ID="chkCustomFields" runat="server" />
                    </td>
                    <td class="style4">
                        Custom Field Id</td>
                    <td class="style4">
                        Custom Field Name</td>
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
        </asp:Content>

