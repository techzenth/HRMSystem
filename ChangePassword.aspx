<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="ChangePassword.aspx.vb" Inherits="_ChangePassword" title="" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentplace1" Runat="Server">
     <br />
      <table border="0" cellpadding="4" cellspacing="0" 
                style="background-color:#F7F6F3;border-color:#E6E2D8;border-width:1px;border-style:Solid;font-family:Verdana;font-size:0.8em;border-collapse:collapse;">
                <tr>
                    <td>
                        <table border="0" cellpadding="0">
                            <tr>
                                <td align="center" colspan="2" 
                                    style="color:White;background-color:#5D7B9D;font-size:0.9em;font-weight:bold;">
                                    Change Your Password</td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="CurrentPasswordLabel" runat="server" 
                                        AssociatedControlID="txtCurrentPassword">Password:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCurrentPassword" runat="server" Font-Size="0.8em" 
                                        TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" 
                                        ControlToValidate="txtCurrentPassword" ErrorMessage="Password is required." 
                                        ToolTip="Password is required." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="NewPasswordLabel" runat="server" 
                                        AssociatedControlID="txtNewPassword">New Password:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtNewPassword" runat="server" Font-Size="0.8em" 
                                        TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" 
                                        ControlToValidate="txtNewPassword" ErrorMessage="New Password is required." 
                                        ToolTip="New Password is required." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="ConfirmNewPasswordLabel" runat="server" 
                                        AssociatedControlID="txtConfirmNewPassword">Confirm New Password:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtConfirmNewPassword" runat="server" Font-Size="0.8em" 
                                        TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" 
                                        ControlToValidate="txtConfirmNewPassword" 
                                        ErrorMessage="Confirm New Password is required." 
                                        ToolTip="Confirm New Password is required." 
                                        ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:CompareValidator ID="NewPasswordCompare" runat="server" 
                                        ControlToCompare="txtNewPassword" ControlToValidate="txtConfirmNewPassword" 
                                        Display="Dynamic" 
                                        ErrorMessage="The Confirm New Password must match the New Password entry." 
                                        ValidationGroup="ChangePassword1"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red;">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Button ID="btnChangePasswordPush" runat="server" BackColor="#FFFBFF" 
                                        BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
                                        CommandName="ChangePassword" Font-Names="Verdana" Font-Size="0.8em" 
                                        ForeColor="#284775" Text="Change Password" 
                                        ValidationGroup="ChangePassword1" />
                                </td>
                                <td>
                                    <asp:Button ID="btnCancel" runat="server" BackColor="#FFFBFF" 
                                        BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
                                        CausesValidation="False" CommandName="Cancel" Font-Names="Verdana" 
                                        Font-Size="0.8em" ForeColor="#284775" Text="Cancel" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
</asp:Content>

