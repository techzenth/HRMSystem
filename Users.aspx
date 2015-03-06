<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="Users.aspx.vb"
    Inherits="_Users" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
        .style7
        {
            text-align: left;
           
        }
       .style1
        {
            text-align: left;
        }
        .style2
        {
            text-align: center;
        }
        .style12
        {
            text-align: left;
            width: 92px;
        }
        .style14
        {
            text-align: left;
            width: 158px;
        }
        .style15
        {
            text-align: right;
            width: 92px;
        }
        .style16
        {
            text-align: left;
            width: 142px;
        }
        .style17
        {
            text-align: left;
            width: 92px;
            font-weight: bold;
        }
       
           
    </style>

    <script language="javascript" type="text/javascript" src="js/common.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentplace1" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        <Services>
            <asp:ServiceReference Path="~/hrmsystem.asmx" />
        </Services>
    </asp:ToolkitScriptManager>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <table id="frmAdminUsers" runat="server" style="text-align: right; border: solid 2px #def;
                border-bottom-color: #0ff; border-top-color: #0ff; border-right-color: #0ff;
                border-left-color: #0ff;">
                <tr>
                    <td colspan="4" style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                        <span lang="en-us" style="text-align: left;">Users :&nbsp; </span><span style="text-align: left;">
                            HR Admin Users</span>
                    </td>
                </tr>
                <tr id="AdminUserCode" runat="server">
                    <td>
                        Code
                    </td>
                    <td class="style4">
                        <asp:Label ID="editHRAdminUserID" runat="server"></asp:Label>
                    </td>
                    <td class="style5" colspan="2">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        User <span lang="en-us">Name</span><asp:RequiredFieldValidator ID="RequiredFieldValidator9"
                            runat="server" ControlToValidate="txtAdminUserName" ErrorMessage="The User Name is required.">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="style4">
                        <asp:TextBox ID="txtAdminUserName" runat="server" CssClass="txtLine"></asp:TextBox>
                    </td>
                    <td class="style5" colspan="2">
                        &nbsp;
                    </td>
                </tr>
                <tr id="passwordRow" runat="server">
                    <td>
                        Password<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtAdminPassword"
                            ErrorMessage="The Password is required.">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="style4">
                        <asp:TextBox ID="txtAdminPassword" runat="server" CssClass="txtLine" Enabled="False"
                            TextMode="Password"></asp:TextBox>
                    </td>
                    <td class="style6">
                        Confirm Password<asp:CompareValidator ID="CompareValidator9" runat="server" ControlToCompare="txtAdminPassword"
                            ControlToValidate="txtAdminConfirmPassword" ErrorMessage="The Password must match the Confirm Password">*</asp:CompareValidator>
                        &nbsp;
                    </td>
                    <td class="style4">
                        <asp:TextBox ID="txtAdminConfirmPassword" runat="server" CssClass="txtLine" Enabled="False"
                            TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Status
                    </td>
                    <td class="style4">
                        <asp:DropDownList ID="cmbAdminUserStatus" runat="server" Height="21px" SelectionMode="Single">
                            <asp:ListItem Value="enabled">Enabled</asp:ListItem>
                            <asp:ListItem Value="disabled">Disabled</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        Employee&nbsp;
                    </td>
                    <td class="style4">
                        <asp:UpdatePanel ID="ajaxPanel" runat="server">
                            <ContentTemplate>
                                <asp:TextBox ID="txtAdminEmployee" runat="server" CssClass="txtLine" Enabled="False"
                                    Width="179px"></asp:TextBox><asp:AutoCompleteExtender ID="AutoCompleteExtender1"
                                        runat="server" ServiceMethod="GetEmployeeList" ServicePath="hrmsystem.asmx" TargetControlID="txtAdminEmployee"
                                        UseContextKey="True" MinimumPrefixLength="1">
                                    </asp:AutoCompleteExtender>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span lang="en-us">Admin User Group</span><span lang="en-us"><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator8" runat="server" ControlToValidate="cmbAdminUserGroup"
                            ErrorMessage="The User Group is required.">*</asp:RequiredFieldValidator>
                        </span>&nbsp;
                    </td>
                    <td class="style4">
                        <asp:DropDownList ID="cmbAdminUserGroup" runat="server" Height="21px" SelectionMode="Single"
                            AppendDataBoundItems="True" DataSourceID="adsUserGroup" DataTextField="userg_name"
                            DataValueField="userg_id">
                            <asp:ListItem Value="">--Select User Group--</asp:ListItem>
                        </asp:DropDownList>
                        <asp:AccessDataSource ID="adsUserGroup" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
                            SelectCommand="SELECT [userg_id], [userg_name] FROM [hr_user_group]"></asp:AccessDataSource>
                    </td>
                    <td class="style5" colspan="2">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center;">
                        <asp:Button ID="btnHRAdminUsersEditSave" runat="server" Text="Edit" />
                        <input id="cmdReset2" type="reset" value="Reset" />
                        <asp:HiddenField ID="newAdminUserID" runat="server" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            <table id="frmHRAdminUsers" runat="server" style="text-align: right; border: solid 2px #def;
                border-bottom-color: #0ff; border-top-color: #0ff; border-right-color: #0ff;
                border-left-color: #0ff;" visible="false" width="100%">
                <tr>
                    <td style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                        <span lang="en-us" style="text-align: left;">Users :&nbsp; </span><span style="text-align: left;">
                            HR Admin Users</span>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        &nbsp;Search By:
                        <asp:DropDownList ID="cmbHRAdminUserSearchBy" runat="server">
                            <asp:ListItem>-Select-</asp:ListItem>
                            <asp:ListItem>ID</asp:ListItem>
                            <asp:ListItem>Name</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;Search for:
                        <asp:TextBox ID="txtHRAdminUserSearch" runat="server" CssClass="txtLine"></asp:TextBox>
                        &nbsp;&nbsp;
                        <asp:Button ID="btnHRAdminUserSearch" runat="server" Text="Search" />
                        <input id="cmdReset3" type="reset" value="Reset" />
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        <asp:Button ID="btnHRAdminUserAdd" runat="server" Text="Add" />
                        <asp:Button ID="btnHRAdminUserDelete" runat="server" Text="Delete" OnClientClick="return confirm(&quot;Deletion could make the system unusable. Do you want to delete&quot;);" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Repeater ID="rptAdminUser" runat="server" DataSourceID="adsAdminUsers">
                            <HeaderTemplate>
                                <table width="100%">
                                    <tr style="background-color: #00FFFF; border-spacing: 0px;">
                                        <td class="style7">
                                            <input name="allCheck" type="checkbox" onclick="doHandleAll()" />
                                        </td>
                                        <td class="style4">
                                            User ID
                                        </td>
                                        <td class="style4">
                                            User Name
                                        </td>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr style="background-color: #CCFFFF">
                                    <td class="style4">
                                        <input name="adminUsers[]" type="checkbox" value="<%# Container.DataItem(0) %>" />
                                    </td>
                                    <td class="style4">
                                        <a class="updatelink" href="Users.aspx?Page=HR Admin Users&id=<%# Container.DataItem(0) %>">
                                            <%# Container.DataItem(0) %></a>
                                    </td>
                                    <td class="style4">
                                        <a class="updatelink" href="Users.aspx?Page=HR Admin Users&id=<%# Container.DataItem(0) %>">
                                            <%#Container.DataItem(1)%></a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr style="background-color: #CCCCFF">
                                    <td class="style4">
                                        <input name="adminUsers[]" type="checkbox" value="<%# Container.DataItem(0) %>" />
                                    </td>
                                    <td class="style4">
                                        <a class="updatelink" href="Users.aspx?Page=HR Admin Users&id=<%# Container.DataItem(0) %>">
                                            <%# Container.DataItem(0) %></a>
                                    </td>
                                    <td class="style4">
                                        <a class="updatelink" href="Users.aspx?Page=HR Admin Users&id=<%# Container.DataItem(0) %>">
                                            <%#Container.DataItem(1)%></a>
                                    </td>
                                </tr>
                            </AlternatingItemTemplate>
                            <FooterTemplate>
                                </table></FooterTemplate>
                        </asp:Repeater>
                        <asp:AccessDataSource ID="adsAdminUsers" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
                            
                            SelectCommand="SELECT id, user_name FROM hr_users WHERE (is_admin = 'Yes')" InsertCommand="INSERT INTO hr_users (id, user_name, user_password, emp_number, is_admin, status, userg_id) VALUES (@id, @user_name, @user_password, @emp_number, @is_admin, @status, @userg_id)"
                            
                            UpdateCommand="UPDATE hr_users SET user_name =@user_name, emp_number =@emp_number, status =@status, userg_id =@userg_id WHERE id=@id">
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="txtAdminUserName" Name="@user_name" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtAdminEmployee" Name="@emp_number" PropertyName="Text" />
                                <asp:ControlParameter ControlID="cmbAdminUserStatus" Name="@status" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="cmbAdminUserGroup" Name="@userg_id" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="editHRAdminUserID" Name="@id" PropertyName="Text" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="newAdminUserID" Name="@id" PropertyName="Value" />
                                <asp:ControlParameter ControlID="txtAdminUserName" Name="@user_name" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtAdminPassword" Name="@user_password" PropertyName="Text" />
                                <asp:Parameter Name="@emp_number" />
                                <asp:Parameter DefaultValue="Yes" Name="@is_admin" />
                                <asp:ControlParameter ControlID="cmbAdminUserStatus" Name="@status" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="cmbAdminUserGroup" Name="@userg_id" PropertyName="SelectedValue" />
                            </InsertParameters>
                        </asp:AccessDataSource>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table id="frmUsersESSUsers" runat="server" style="text-align: right; border: solid 2px #def;
                border-bottom-color: #0ff; border-top-color: #0ff; border-right-color: #0ff;
                border-left-color: #0ff;">
                <tr>
                    <td colspan="4" style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                        <span lang="en-us" style="text-align: left;">Users :&nbsp; </span>ESS<span style="text-align: left;">
                            Users</span>
                    </td>
                </tr>
                <tr ID="ESSUserCode" runat="server">
                    <td>
                        Code</td>
                    <td class="style4">
                        <asp:Label ID="editESSUserID" runat="server"></asp:Label>
                    </td>
                    <td class="style5" colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        User <span lang="en-us">Name</span><asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtESSUserName" 
                            ErrorMessage="The User Name is required.">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="style4">
                        <asp:TextBox ID="txtESSUserName" runat="server" CssClass="txtLine"></asp:TextBox>
                    </td>
                    <td class="style5" colspan="2">
                        &nbsp;
                    </td>
                </tr>
                <tr ID="passwRow" runat="server">
                    <td>
                        Password<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"
                            ControlToValidate="txtESSPassword" ErrorMessage="The Password is required.">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="style4">
                        <asp:TextBox ID="txtESSPassword" runat="server" CssClass="txtLine" Enabled="False"
                            TextMode="Password"></asp:TextBox>
                    </td>
                    <td class="style6">
                        Confirm Password<asp:CompareValidator ID="CompareValidator8" runat="server" ControlToValidate="txtESSConfirmPassword"
                            ErrorMessage="The Password must match Confirm Password ." ControlToCompare="txtESSPassword">*</asp:CompareValidator>
                        &nbsp;
                    </td>
                    <td class="style4">
                        <asp:TextBox ID="txtESSConfirmPassword" runat="server" CssClass="txtLine" 
                            Enabled="False" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Status
                    </td>
                    <td class="style4">
                        <asp:DropDownList ID="cmbESSUserStatus" runat="server" Height="21px" SelectionMode="Single">
                            <asp:ListItem Value="enabled">Enabled</asp:ListItem>
                            <asp:ListItem Value="disabled">Disabled</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        Employee&nbsp;
                    </td>
                    <td class="style4">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:TextBox ID="txtESSEmployee" runat="server" CssClass="txtLine" Enabled="False"
                                    Width="179px"></asp:TextBox><asp:AutoCompleteExtender ID="AutoCompleteExtender2"
                                        runat="server" ServiceMethod="GetEmployeeList" ServicePath="hrmsystem.asmx" TargetControlID="txtESSEmployee"
                                        UseContextKey="True" MinimumPrefixLength="1">
                                    </asp:AutoCompleteExtender>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center;">
                        <asp:Button ID="btnESSEditSave" runat="server" Text="Edit" />
                        <input id="cmdReset4" type="reset" value="Reset" />
                        <asp:HiddenField ID="newESSUserID" runat="server" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:ValidationSummary ID="ValidationSummary2" runat="server" />
            <table runat="server" visible="false" style="text-align: right; border: solid 2px #def;
                border-bottom-color: #0ff; border-top-color: #0ff; border-right-color: #0ff;
                border-left-color: #0ff;" id="frmESSUsers" width="100%">
                <tr>
                    <td colspan="3" style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                        <span lang="en-us" style="text-align: left;">Users :&nbsp; </span><span style="text-align: left;">
                            ESS Users</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="style4">
                        &nbsp;Search By:
                        <asp:DropDownList ID="cmbESSUsersSearchBy" runat="server">
                            <asp:ListItem Value="">-Select-</asp:ListItem>
                            <asp:ListItem>ID</asp:ListItem>
                            <asp:ListItem>Name</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;Search for:
                        <asp:TextBox ID="txtESSUsersSearchBy" runat="server" CssClass="txtLine"></asp:TextBox>
                        &nbsp;&nbsp;
                        <asp:Button ID="btnESSUsersSearch" runat="server" Text="Search" />
                        <input id="cmdReset1" type="reset" value="Reset" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="style4">
                        <asp:Button ID="btnESSUsersAdd" runat="server" Text="Add" />
                        <asp:Button ID="btnESSUsersDelete" runat="server" Text="Delete" />
                    </td>
                </tr>
                <tr>
                    <td>
                    <asp:Repeater ID="rptEssUser" runat="server" DataSourceID="adsESSUsers"><HeaderTemplate>
                        <table width="100%">
                            <tr style="background-color: #00FFFF; border-spacing: 0px;" class="style4">
                                <td class="style9">
                                    <input id="allCheck" type="checkbox" />
                                </td>
                                <td class="style4">
                                    User ID
                                </td>
                                <td class="style4">
                                    User Name
                                </td>
                            </tr></HeaderTemplate><ItemTemplate>
                            <tr style="background-color: #CCFFFF">
                                <td class="style4">
                                    <input name="essUser" type="checkbox" value="<%# Container.DataItem(0) %>" />
                                </td>
                                <td class="style4">
                                   <a class="updatelink" href="Users.aspx?Page=ESS Users&id=<%# Container.DataItem(0) %>"> <%#Container.DataItem(0)%></a>
                                </td>
                                <td class="style4">
                                    <a class="updatelink" href="Users.aspx?Page=ESS Users&id=<%# Container.DataItem(0) %>"><%#Container.DataItem(1)%></a>
                                </td>
                            </tr></ItemTemplate><AlternatingItemTemplate>
                            <tr style="background-color: #CCCCFF">
                                <td class="style4">
                                    <input name="essUser" type="checkbox" value="<%# Container.DataItem(0) %>" />
                                </td>
                                <td class="style4">
                                   <a class="updatelink" href="Users.aspx?Page=ESS Users&id=<%# Container.DataItem(0) %>"> <%#Container.DataItem(0)%></a>
                                </td>
                                <td class="style4">
                                    <a class="updatelink" href="Users.aspx?Page=ESS Users&id=<%# Container.DataItem(0) %>"><%#Container.DataItem(1)%></a>
                                </td>
                            </tr></AlternatingItemTemplate><FooterTemplate>
                        </table></FooterTemplate></asp:Repeater>
                        <asp:AccessDataSource ID="adsESSUsers" runat="server" 
                            DataFile="~/App_Data/hrmsystem.mdb" 
                            SelectCommand="SELECT id, user_name FROM hr_users WHERE (is_admin = 'No')" 
                            InsertCommand="INSERT INTO hr_users (id, user_name, emp_number, user_password, is_admin, status) VALUES (@id, @user_name, @emp_number, @user_password, @is_admin,@status)">
                            <InsertParameters>
                                <asp:ControlParameter ControlID="newESSUserID" Name="@id" 
                                    PropertyName="Value" />
                                <asp:ControlParameter ControlID="txtESSUserName" Name="@user_name" 
                                    PropertyName="Text" />
                                <asp:Parameter Name="@emp_number" />
                                <asp:ControlParameter ControlID="txtESSPassword" Name="@user_password" 
                                    PropertyName="Text" />
                                <asp:Parameter DefaultValue="No" Name="@is_admin" />
                                <asp:ControlParameter ControlID="cmbESSUserStatus" Name="@status" 
                                    PropertyName="SelectedValue" />
                            </InsertParameters>
                        </asp:AccessDataSource>
                    </td>
                </tr>
            </table>
            <br />
        </asp:View>
        <asp:View ID="View3" runat="server">
            <table runat="server" style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" id="frmAdminUserGroup">
                <tr>
                    <td class="style4" colspan="2" style="background-color: #00FFFF">
                        Users : Admin User Group
                    </td>
                </tr>
                <tr id="usergroupCode" runat="server">
                    <td class="style6">
                        Code
                    </td>
                    <td class="style4">
                        <asp:Label ID="editAdminUserGroupID" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        Name<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtUserGroupName"
                            ErrorMessage="The User Group Name is required">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="style4">
                        <asp:TextBox ID="txtUserGroupName" runat="server" CssClass="txtLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style5" colspan="2">
                        <asp:Button ID="btnUserGroupEditSave" runat="server" Text="Edit" />
                        <input id="cmdReset" type="reset" value="Reset" />
                        <asp:HyperLink ID="lnkRights" runat="server" NavigateUrl="~/Users.aspx?Page=Assigned User Rights">Assign User Rights</asp:HyperLink>
                        <asp:HiddenField ID="newAdminUserGroupID" runat="server" />
                    </td>
                </tr>
            </table>
            <asp:ValidationSummary ID="ValidationSummary3" runat="server" />
            <table runat="server" visible="false" style="text-align: right; border: solid 2px #def;
                border-bottom-color: #0ff; border-top-color: #0ff; border-right-color: #0ff;
                border-left-color: #0ff;" id="frmAdminUserGroups" width="100%">
                <tr>
                    <td colspan="3" style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                        <span lang="en-us" style="text-align: left;">Users :&nbsp; </span><span style="text-align: left;">
                            Admin User Group</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="style4">
                        &nbsp;Search By:
                        <asp:DropDownList ID="cmbAdminUserGroupSearchBy" runat="server">
                            <asp:ListItem>-Select-</asp:ListItem>
                            <asp:ListItem>ID</asp:ListItem>
                            <asp:ListItem>Name</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;Search for:
                        <asp:TextBox ID="txtAdminUserGroupSearch" runat="server" CssClass="txtLine"></asp:TextBox>
                        &nbsp;&nbsp;
                        <asp:Button ID="btnAdminUserGroupSearch" runat="server" Text="Search" />
                        <input id="Reset1" type="reset" value="Reset" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="style4">
                        <asp:Button ID="btnAdminUserGroupAdd" runat="server" Text="Add" />
                        <asp:Button ID="btnAdminUserGroupDelete" runat="server" Text="Delete" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Repeater ID="rptUserGroup" runat="server" DataSourceID="adsAdminUserGroup">
                            <HeaderTemplate>
                                <table width="100%">
                                    <tr style="background-color: #00FFFF; border-spacing: 0px;" class="style4">
                                        <td class="style7">
                                            <input name="allCheck" type="checkbox" />
                                        </td>
                                        <td class="style4">
                                            User Group ID
                                        </td>
                                        <td class="style4">
                                            User Group Name
                                        </td>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr style="background-color: #CCFFFF">
                                    <td class="style4">
                                        <input name="adminUserGroup[]" type="checkbox" value="<%# Container.DataItem(0) %>" />
                                    </td>
                                    <td class="style4">
                                        <a class="updatelink" href="Users.aspx?Page=Admin User Groups&id=<%# Container.DataItem(0) %>">
                                            <%# Container.DataItem(0) %></a>
                                    </td>
                                    <td class="style4">
                                        <a class="updatelink" href="Users.aspx?Page=Admin User Groups&id=<%# Container.DataItem(0) %>">
                                            <%#Container.DataItem(1)%></a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr style="background-color: #CCCCFF">
                                    <td class="style4">
                                        <input name="adminUserGroup[]" type="checkbox" value="<%# Container.DataItem(0) %>" />
                                    </td>
                                    <td class="style4">
                                        <a class="updatelink" href="Users.aspx?Page=Admin User Groups&id=<%# Container.DataItem(0) %>">
                                            <%# Container.DataItem(0) %></a>
                                    </td>
                                    <td class="style4">
                                        <a class="updatelink" href="Users.aspx?Page=Admin User Groups&id=<%# Container.DataItem(0) %>">
                                            <%#Container.DataItem(1)%></a>
                                    </td>
                                </tr>
                            </AlternatingItemTemplate>
                            <FooterTemplate>
                                </table></FooterTemplate>
                        </asp:Repeater>
                        <asp:AccessDataSource ID="adsAdminUserGroup" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
                            SelectCommand="SELECT userg_id, userg_name FROM hr_user_group" UpdateCommand="UPDATE hr_user_group SET userg_name =@userg_name WHERE userg_id=@userg_id"
                            InsertCommand="INSERT INTO hr_user_group (userg_id, userg_name) VALUES (@userg_id, @userg_name)">
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="txtUserGroupName" Name="@userg_name" PropertyName="Text" />
                                <asp:ControlParameter ControlID="editAdminUserGroupID" Name="@userg_id" PropertyName="Text" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="newAdminUserGroupID" Name="@userg_id" PropertyName="Value" />
                                <asp:ControlParameter ControlID="txtUserGroupName" Name="@userg_name" PropertyName="Text" />
                            </InsertParameters>
                        </asp:AccessDataSource>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View4" runat="server">
            <table id="frmUserGroupID" runat="server" style="text-align: right; border: solid 2px #def;
                border-bottom-color: #0ff; border-top-color: #0ff; border-right-color: #0ff;
                border-left-color: #0ff;" >
                <tr >
                    <td class="style4" colspan="3" style="background-color: #00FFFF; border-color: #00FFFF">
                        Rights Assigned to User Groups
                    </td>
                </tr>
                <tr>
                    <td class="style12">
                        User Group ID&nbsp;
                    </td>
                    <td class="style4" colspan="2">
                        <asp:Label ID="editUserGroupRightsID" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style12" colspan="2">
                        Admin User Group
                    </td>
                    <td class="style4">
                        <asp:Label ID="editUserGroupRightsName" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <table id="frmModuleAdd" runat="server" style="text-align: right; border: solid 2px #def;
                border-bottom-color: #0ff; border-top-color: #0ff; border-right-color: #0ff;
                border-left-color: #0ff;">
                <tr>
                    <td class="style15">
                        Module<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Select a Module to assign rights to"
                            ControlToValidate="cmbModules">*</asp:RequiredFieldValidator>
                        &nbsp;
                    </td>
                    <td class="style1" colspan="3">
                        <asp:DropDownList ID="cmbModules" runat="server" AppendDataBoundItems="True" DataSourceID="adsModules"
                            DataTextField="name" DataValueField="mod_id">
                            <asp:ListItem>--Select Module--</asp:ListItem>
                        </asp:DropDownList>
                        <asp:AccessDataSource ID="adsModules" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
                            SelectCommand="SELECT mod_id, name FROM hr_module"></asp:AccessDataSource>
                        <asp:Label ID="lblModule" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style15">
                        Add
                    </td>
                    <td class="style16">
                        <asp:CheckBox ID="chkAdd" runat="server" />
                    </td>
                    <td class="style6">
                        Edit
                    </td>
                    <td class="style14">
                        <asp:CheckBox ID="chkEdit" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="style15">
                        Delete
                    </td>
                    <td class="style16">
                        <asp:CheckBox ID="chkDelete" runat="server" />
                    </td>
                    <td class="style6">
                        View
                    </td>
                    <td class="style14">
                        <asp:CheckBox ID="chkView" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="style2" colspan="4">
                        <asp:Button ID="btnAssignedRightsSave" runat="server" Text="Save" />
                        &nbsp;
                        <asp:HiddenField ID="flagSaveStatus" runat="server" Value="New" />
                        <asp:HiddenField ID="editModuleID" runat="server" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:AccessDataSource ID="adsAdminUserRights" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
                SelectCommand="SELECT hr_module.name, hr_rights.addition, hr_rights.editing, hr_rights.deletion, hr_rights.viewing, hr_rights.mod_id FROM (hr_module INNER JOIN hr_rights ON hr_module.mod_id = hr_rights.mod_id) WHERE hr_rights.userg_id = @userg_id"
                InsertCommand="INSERT INTO hr_rights (userg_id, mod_id, addition, editing, deletion, viewing) VALUES (@userg_id, @mod_id, @addition, @editing, @deletion, @viewing)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="editUserGroupRightsID" Name="@userg_id" PropertyName="Text" />
                </SelectParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="editUserGroupRightsID" Name="@userg_id" PropertyName="Text" />
                    <asp:ControlParameter ControlID="cmbModules" Name="@mod_id" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="chkAdd" Name="@addition" PropertyName="Checked" />
                    <asp:ControlParameter ControlID="chkEdit" Name="@editing" PropertyName="Checked" />
                    <asp:ControlParameter ControlID="chkDelete" Name="@deletion" PropertyName="Checked" />
                    <asp:ControlParameter ControlID="chkView" Name="@viewing" PropertyName="Checked" />
                </InsertParameters>
            </asp:AccessDataSource>
            <table id="frmAssignedRights" runat="server" style="text-align: right; border: solid 2px #def;
                border-bottom-color: #0ff; border-top-color: #0ff; border-right-color: #0ff;
                border-left-color: #0ff;">
                <tr style="padding: 0 0 0 0;">
                    <td class="style1" colspan="5" style="background-color: #00FFFF; border-color: #00FFFF">
                        Assigned Rights
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Repeater ID="rptUserRights" runat="server" DataSourceID="adsAdminUserRights">
                            <HeaderTemplate>
                                <table>
                                    <tr>
                                        <td class="style17">
                                            Module
                                        </td>
                                        <td class="style17">
                                            Add
                                        </td>
                                        <td class="style17">
                                            Edit
                                        </td>
                                        <td class="style12">
                                            <b>Delete</b>
                                        </td>
                                        <td class="style12">
                                            <b>View</b>
                                        </td>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td class="style12">
                                        <a class="updatelink" href="Users.aspx?Page=Assigned User Rights&id=<%=editUserGroupRightsID.Text %>&mod=<%#Container.DataItem(5) %>">
                                            <%#Container.DataItem(0) %></a>
                                    </td>
                                    <td class="style12">
                                        <%#convertYesNo(CInt(Container.DataItem(1)))%>
                                    </td>
                                    <td class="style12">
                                        <%#convertYesNo(CInt(Container.DataItem(2)))%>
                                    </td>
                                    <td class="style1">
                                        <%#convertYesNo(CInt(Container.DataItem(3)))%>
                                    </td>
                                    <td class="style1">
                                        <%#convertYesNo(CInt(Container.DataItem(4)))%>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table></FooterTemplate>
                        </asp:Repeater>
                    </td>
                </tr>
                <tr>
                    <td class="style2" colspan="5">
                        <asp:Button ID="btnAssignedRightsReset" runat="server" Text="Reset" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:ValidationSummary ID="ValidationSummary4" runat="server" />
        </asp:View>
        <asp:View ID="View5" runat="server">
        </asp:View>
    </asp:MultiView>
    <br />
</asp:Content>
