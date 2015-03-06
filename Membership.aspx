<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="Membership.aspx.vb"
    Inherits="_Membership" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
       
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentplace1" runat="Server">
    &nbsp;&nbsp;&nbsp;
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <table runat="server" style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" id="frmMembershipMembershipType">
                <tr style="padding: 0 0 0 0;">
                    <td colspan="2" style="background-color: #00FFFF; border-color: #00FFFF" class="textLeft">
                        <span style="text-align: left;" lang="en-us">Membership</span><span style="text-align: left;">s</span><span
                            lang="en-us" style="text-align: left;"> :&nbsp; </span><span style="text-align: left;">
                                Membership Types</span>
                    </td>
                </tr>
                <tr id="membershipTypeCode">
                    <td class="textLeft2">
                        Code
                    </td>
                    <td class="textLeft">
                        <asp:Label ID="editMembershipTypeID" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="textLeft2">
                        Name<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMembershipTypeName"
                            ErrorMessage="The Membership Type Name is required.">*</asp:RequiredFieldValidator>
                        &nbsp;
                    </td>
                    <td class="textLeft">
                        <asp:TextBox ID="txtMembershipTypeName" runat="server" CssClass="txtLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="textCenter">
                        <asp:Button ID="btnMembershipTypeEditSave" runat="server" Text="Edit" />
                        <input id="cmdReset" type="reset" value="Reset" />
                        <asp:HiddenField ID="newMembershipTypeID" runat="server" />
                    </td>
                </tr>
            </table>
            <asp:ValidationSummary ID="ValidationSummary2" runat="server" />
            <table runat="server" visible="false" style="text-align: right; border: solid 2px #def;
                border-bottom-color: #0ff; border-top-color: #0ff; border-right-color: #0ff;
                border-left-color: #0ff;" id="frmMembershipType" width="100%">
                <tr>
                    <td colspan="3" style="background-color: #00FFFF; border-color: #00FFFF" class="textLeft">
                        <span lang="en-us" style="text-align: left;">Membership</span><span style="text-align: left;">s</span><span
                            lang="en-us" style="text-align: left;"> :&nbsp; </span><span style="text-align: left;">
                                Membership</span>&nbsp; Types
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="textLeft">
                        &nbsp;Search By:
                        <asp:DropDownList ID="cmbMembershipTypeSearchBy" runat="server">
                            <asp:ListItem>-Select-</asp:ListItem>
                            <asp:ListItem>ID</asp:ListItem>
                            <asp:ListItem>Name</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;Search for:
                        <asp:TextBox ID="txtMembershipTypeSearch" runat="server" CssClass="txtLine"></asp:TextBox>
                        &nbsp;&nbsp;
                        <asp:Button ID="btnMembershipTypeSearch" runat="server" Text="Search" />
                        <input id="cmdReset1" type="reset" value="Reset" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="textLeft">
                        <asp:Button ID="btnMembershipTypeAdd" runat="server" Text="Add" />
                        <asp:Button ID="btnMembershipTypeDelete" runat="server" Text="Delete" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Repeater ID="rptMembershipType" runat="server" DataSourceID="adsMembershipTypes">
                            <HeaderTemplate>
                                <table width="100%">
                                    <tr style="background-color: #00FFFF; border-spacing: 0px;">
                                        <td class="textLeft">
                                            <input name="allCheck" type="checkbox" />
                                        </td>
                                        <td class="textLeft">
                                            Membership Type ID
                                        </td>
                                        <td class="textLeft">
                                            Membership Type Name
                                        </td>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr style="background-color: #CCFFFF">
                                    <td class="textLeft">
                                        <input name="membershipType[]" type="checkbox" value="<%# Container.DataItem(0) %>" />
                                    </td>
                                    <td class="textLeft">
                                        <a class="updatelink" href="Membership.aspx?Page=Membership Types&id=<%#Container.DataItem(0)%>">
                                            <%#Container.DataItem(0)%></a>
                                    </td>
                                    <td class="textLeft">
                                        <a class="updatelink" href="Membership.aspx?Page=Membership Types&id=<%#Container.DataItem(0)%>">
                                            <%#Container.DataItem(1)%></a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr style="background-color: #CCCCFF">
                                    <td class="textLeft">
                                        <input name="membershipType[]" type="checkbox" value="<%# Container.DataItem(0) %>" />
                                    </td>
                                    <td class="textLeft">
                                        <a class="updatelink" href="Membership.aspx?Page=Membership Types&id=<%#Container.DataItem(0)%>">
                                            <%#Container.DataItem(0)%></a>
                                    </td>
                                    <td class="textLeft">
                                        <a class="updatelink" href="Membership.aspx?Page=Membership Types&id=<%#Container.DataItem(0)%>">
                                            <%#Container.DataItem(1)%></a>
                                    </td>
                                </tr>
                            </AlternatingItemTemplate>
                            <FooterTemplate>
                                </table></FooterTemplate>
                        </asp:Repeater>
                        <asp:AccessDataSource ID="adsMembershipTypes" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
                            SelectCommand="SELECT membtype_code, membtype_name FROM hr_membership_type" InsertCommand="INSERT INTO hr_membership_type (membtype_code, membtype_name) VALUES (@membtype_code, @membtype_name)">
                            <InsertParameters>
                                <asp:ControlParameter ControlID="newMembershipTypeID" Name="@membtype_code" PropertyName="Value" />
                                <asp:ControlParameter ControlID="txtMembershipTypeName" Name="@membtype_name" PropertyName="Text" />
                            </InsertParameters>
                        </asp:AccessDataSource>
                    </td>
                </tr>
            </table>
            <div class="textLeft2">
                <br />
            </div>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" id="frmMembership"
                runat="server">
                <tr>
                    <td class="textLeft" colspan="2" style="background-color: #00FFFF">
                        Memberships : Memberships
                    </td>
                </tr>
                <tr id="membershipCode" runat="server">
                    <td class="textLeft0">
                        Code
                    </td>
                    <td class="textLeft">
                        <asp:Label ID="editMembershipID" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="textLeft0">
                        Name<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtMembershipName"
                            ErrorMessage="The Membership Name is required">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="textLeft">
                        <asp:TextBox ID="txtMembershipName" runat="server" CssClass="txtLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="textLeft0">
                        Membership Type<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                            ControlToValidate="cmbMembershipMembershipType" ErrorMessage="The Membership Type is required">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="textLeft">
                        <asp:DropDownList ID="cmbMembershipMembershipType" runat="server" AppendDataBoundItems="True"
                            DataSourceID="adsMembershipsType" DataTextField="membtype_name" DataValueField="membtype_code">
                            <asp:ListItem Value="">Select Membership</asp:ListItem>
                        </asp:DropDownList>
                        <asp:AccessDataSource ID="adsMembershipsType" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
                            SelectCommand="SELECT membtype_name, membtype_code FROM hr_membership_type">
                        </asp:AccessDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="textCenter" colspan="2">
                        <asp:Button ID="btnMembershipEditSave" runat="server" Text="Edit" />
                        <input id="cmdReset" type="reset" value="Reset" />
                        <asp:HiddenField ID="newMembershipID" runat="server" />
                    </td>
                </tr>
            </table>
            <asp:ValidationSummary ID="ValidationSummary3" runat="server" />
            <table runat="server" style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" width="100%"
                id="frmMemberships" visible="False">
                <tr>
                    <td colspan="4" style="background-color: #00FFFF; border-color: #00FFFF" class="textLeft">
                        <span lang="en-us" style="text-align: left;">Membership</span><span style="text-align: left;">s</span><span
                            lang="en-us" style="text-align: left;"> :&nbsp; </span><span style="text-align: left;">
                                Memberships</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" class="textLeft">
                        &nbsp;Search By:
                        <asp:DropDownList ID="cmbMembershipSearchBy" runat="server">
                            <asp:ListItem>-Select-</asp:ListItem>
                            <asp:ListItem>ID</asp:ListItem>
                            <asp:ListItem>Name</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;Search for:
                        <asp:TextBox ID="txtMembershipSearch" runat="server" CssClass="txtLine"></asp:TextBox>
                        &nbsp;&nbsp;
                        <asp:Button ID="btnMembershipSearch" runat="server" Text="Search" />
                        <input id="Reset1" type="reset" value="Reset" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" class="textLeft">
                        <asp:Button ID="btnMembershipAdd" runat="server" Text="Add" />
                        <asp:Button ID="btnMembershipDelete" runat="server" Text="Delete" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Repeater ID="rptMembership" runat="server" DataSourceID="adsMemberships">
                            <HeaderTemplate>
                                <table width="100%">
                                    <tr>
                                        <td style="text-align: left; background-color: #00FFFF; border-color: #00FFFF" class="textLeft">
                                            <input id="Checkbox1" name="allCheck" type="checkbox" />
                                        </td>
                                        <td style="background-color: #00FFFF; border-color: #00FFFF" class="textLeft">
                                            Membership ID
                                        </td>
                                        <td style="background-color: #00FFFF; border-color: #00FFFF" class="textLeft">
                                            Membership Name
                                        </td>
                                        <td class="textLeft" style="background-color: #00FFFF; border-color: #00FFFF">
                                            Membership Type
                                        </td>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr style="background-color: #CCFFFF">
                                    <td class="textLeft">
                                        <input name="membership[]" type="checkbox" value="<%# Container.DataItem(0) %>" />
                                    </td>
                                    <td class="textLeft">
                                        <a class="updatelink" href="Membership.aspx?Page=Memberships&id=<%# Container.DataItem(0) %>">
                                            <%# Container.DataItem(0) %></a>
                                    </td>
                                    <td class="textLeft">
                                        <a class="updatelink" href="Membership.aspx?Page=Memberships&id=<%# Container.DataItem(0) %>">
                                            <%#Container.DataItem(1)%></a>
                                    </td>
                                    <td class="textLeft">
                                        <%# Container.DataItem(2) %>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr style="background-color: #CCCCFF">
                                    <td class="textLeft">
                                        <input name="membership[]" type="checkbox" value="<%# Container.DataItem(0) %>" />
                                    </td>
                                    <td class="textLeft">
                                        <a class="updatelink" href="Membership.aspx?Page=Memberships&id=<%# Container.DataItem(0) %>">
                                            <%# Container.DataItem(0) %></a>
                                    </td>
                                    <td class="textLeft">
                                        <a class="updatelink" href="Membership.aspx?Page=Memberships&id=<%# Container.DataItem(0) %>">
                                            <%#Container.DataItem(1)%></a>
                                    </td>
                                    <td class="textLeft">
                                        <%# Container.DataItem(2) %>
                                    </td>
                                </tr>
                            </AlternatingItemTemplate>
                            <FooterTemplate>
                                </table></FooterTemplate>
                        </asp:Repeater>
                        <asp:AccessDataSource ID="adsMemberships" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
                            SelectCommand="SELECT hr_membership.membership_code, hr_membership.membership_name, hr_membership_type.membtype_name FROM (hr_membership INNER JOIN hr_membership_type ON hr_membership.membtype_code = hr_membership_type.membtype_code) ORDER BY hr_membership.membership_code"
                            InsertCommand="INSERT INTO hr_membership(membership_code, membtype_code, membership_name) VALUES (@membership_code, @membtype_code, @membership_name)">
                            <InsertParameters>
                                <asp:ControlParameter ControlID="newMembershipID" Name="@membership_code" PropertyName="Value" />
                                <asp:ControlParameter ControlID="cmbMembershipMembershipType" Name="@membtype_code"
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="txtMembershipName" Name="@membership_name" PropertyName="Text" />
                            </InsertParameters>
                        </asp:AccessDataSource>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View3" runat="server">
        </asp:View>
    </asp:MultiView>
</asp:Content>
