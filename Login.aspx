<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>NWC HRMSystem - Login</title>
    <link href="css/StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .contentWidth
        {
            width: 100%;
        }
       
        .imageStyle
        {
            width: 105px;
            height: 105px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table class="contentWidth" style="table-layout: auto">
            <tr>
                <td colspan="3" style="background-color: #345BE2;; border-bottom-style: outset; border-bottom-color: #0033CC;
                    border-top-style: inset; border-top-color: #0033CC">
                    <span style="color: #fff; font-size: xx-large;">
                    <img alt="" class="style3" src="images/NWCLogo.JPG" /> HRM System</span>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 20%">
                    &nbsp;</td>
                <td>
                    <table >
                        <tr>
                            <td rowspan="2">
                    <br />
  <table cellspacing="0" cellpadding="4" border="0" runat="server" id="login" style="background-color:#EFF3FB;border-color:#B5C7DE;border-width:1px;border-style:Solid;border-collapse:collapse;">
	<tr>
		<td><table cellpadding="0" border="0" runat="server" id="frm" style="color:#333333;font-family:Verdana;font-size:0.8em;">
			<tr>
				<td align="center" colspan="2" style="color:White;background-color:#507CD1;font-size:0.9em;font-weight:bold;">Log In</td>
			</tr><tr>
				<td align="right" valign="top"><label for="UserName">User Name:</label></td><td><asp:textbox id="UserName" style="font-size:0.8em;" runat="server" />
                                                        <asp:requiredfieldvalidator id="UserNameRequired" 
                                                            errormessage="User Name is required."  runat="server" Text="*" 
                                                            ControlToValidate="UserName" ToolTip="User Name is required."/></td>
			</tr><tr>

				<td align="right" valign="top"><label for="Password">Password:</label></td><td><asp:textbox id="Password" 
                                                            style="font-size:0.8em;" runat="server" TextMode="Password" />
                                                        <asp:requiredfieldvalidator id="PasswordRequired" 
                                                            errormessage="Password is required." Text="*" runat="server" 
                                                            ControlToValidate="Password" ToolTip="Password is required."/></td>
			</tr><tr>
				<td colspan="2"><asp:checkbox id="RememberMe" runat="server" text="Remember me next time." /></td>
			</tr><tr>
				<td colspan="2" class="textCenter" style="color:Red;"><asp:Literal ID="FailureText" runat="server" EnableViewState="False" Mode="PassThrough"></asp:Literal></td>
			</tr><tr>
				<td align="right" colspan="2">
                    <asp:Button ID="LoginButton" text="Log In" 
                        Style="border: 1px Solid #507CD1; color: #284E98; background-color: White; font-family: Verdana; font-size: 0.8em; " 
                        runat="server" /></td>
			</tr>
		</table></td>

	</tr>
</table>

                            </td>
                            <td >
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <span lang="en-us">The NWC HRMSystem comes as comprehensive solution for the 
                                effiencent management and development of your Human Resource. It will assit you 
                                in the complex and strategic process of managing this crucial resource of your 
                                enterprise. Based on modular architecture, it facilitates a vast range of HR 
                                activites, with features that reflect the main HR management activites.</span></td>
                        </tr>
                    </table>
                </td>
                <td style="width:20%">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" class="textCenter">
                    <span lang="en-us" style="text-align: center;">&copy NWC HRMSystem 2010. All rights reserved.</span>
                </td>
            </tr>
        </table>
    </div>
    <asp:AccessDataSource ID="adsUsers" runat="server" 
        DataFile="~/App_Data/hrmsystem.mdb" 
        >
    </asp:AccessDataSource>
    </form>
</body>
</html>
