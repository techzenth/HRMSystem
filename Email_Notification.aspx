<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="Email_Notification.aspx.vb" Inherits="_EmailNotification" %>

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
        .style6
        {
            text-align: right;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentplace1" Runat="Server">

    <table ID="frmMailConfig" runat="server"
                
                
                
                
                style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" 
                __designer:mapid="209e">
    <tr>
        <td colspan="4" 
                        
            style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
            Mail Configuration</td>
    </tr>
    <tr>
        <td>
            Mail Sent As<asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtFromEmail" 
                            ErrorMessage="The Mail Sent As is required.">*</asp:RequiredFieldValidator>
        </td>
        <td class="style4">
            <asp:TextBox ID="txtFromEmail" runat="server" CssClass="txtLine" Width="144px" Enabled="False"></asp:TextBox>
        </td>
        <td class="style4">
            &nbsp;</td>
        <td class="style4">
            &nbsp;</td>
    </tr>
    <tr>
        <td>
                        SMTP Host<asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtSMTPHost" 
                            ErrorMessage="The SMTP Host is required.">*</asp:RequiredFieldValidator>
        </td>
        <td class="style4">
            <asp:TextBox ID="txtSMTPHost" runat="server" Enabled="False" CssClass="txtLine" 
                Width="145px"></asp:TextBox>
        </td>
        <td class="style6">
            SMTP Port<asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtSMTPPort" 
                            ErrorMessage="The SMTP Port is required.">*</asp:RequiredFieldValidator>
                                    </td>
        <td class="style4">
            <asp:TextBox ID="txtSMTPPort" runat="server" Enabled="False" CssClass="txtLine" 
                Width="138px"></asp:TextBox>
                                    </td>
    </tr>
    <tr>
        <td>
                        Use SMTP Authentication</td>
        <td class="style4">
            <asp:RadioButtonList ID="rdoYesNo" runat="server" RepeatDirection="Horizontal" 
                Enabled="False">
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Yes</asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td class="style4">
            &nbsp;</td>
        <td class="style4">
            &nbsp;</td>
    </tr>
    <tr>
        <td>
                        SMTP User</td>
        <td class="style4">
            <asp:TextBox ID="txtSMTPUser" runat="server" Enabled="False" CssClass="txtLine" 
                Width="146px"></asp:TextBox>
        </td>
        <td>
                        SMTP Password</td>
        <td class="style4">
            <asp:TextBox ID="txtSMTPPassword" runat="server" Enabled="False" 
                CssClass="txtLine" Width="137px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
                        Use Secure Connection</td>
        <td class="style4">
            <asp:RadioButtonList ID="rdoNoSSLTLS" runat="server" 
                RepeatDirection="Horizontal" Enabled="False">
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>SSL</asp:ListItem>
                <asp:ListItem>TLS</asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td class="style4">
            &nbsp;</td>
        <td class="style4">
            &nbsp;</td>
    </tr>
    <tr>
        <td>
                        Send Test Email</td>
        <td class="style5">
            <asp:CheckBox ID="chkSendTestEmail" runat="server" Enabled="False" />
        </td>
        <td>
                        Test Email Address</td>
        <td class="style4">
            <asp:TextBox ID="txtTestEmailAddress" runat="server" Enabled="False" 
                CssClass="txtLine" Width="138px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td colspan="4" style="text-align: center;">
            <asp:Button ID="btnMailConfigEditSave" runat="server" Text="Edit" />
            <input ID="cmdReset" type="reset" value="Reset" />
        </td>
    </tr>
</table>
<asp:ValidationSummary runat="server" ID="valSummary"   />
</asp:Content>

