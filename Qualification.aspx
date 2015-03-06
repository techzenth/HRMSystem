<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="Qualification.aspx.vb"
    Inherits="_Qualification" Title="" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
    <script language="javascript" type="text/javascript" src="js/common.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentplace1" runat="Server">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <table runat="server" 
                style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" 
                id="frmQualEducation" class="textLeft">
                <tr >
                    <td colspan="3" style="background-color: #00FFFF; border-color: #00FFFF" class="textLeft">
                        <span style="text-align: left;" lang="en-us">Qualification :&nbsp; </span><span style="text-align: left;">
                            Edu</span><span style="text-align: left;">cation</span>
                    </td>
                </tr>
                <tr ID="eduCode" runat="server">
                    <td class="textRight">
                        Code</td>
                    <td colspan="2" class="textLeft">
                        <asp:Label ID="editEducationID" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td >
                        Institute<asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                            runat="server" ControlToValidate="txtEducationInstitute" 
                            ErrorMessage="The Institute is required.">*</asp:RequiredFieldValidator>
                        &nbsp;</td>
                    <td class="textLeft" colspan="2">
                        <asp:TextBox ID="txtEducationInstitute" runat="server" CssClass="txtLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="textRight">
                        Course<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEducationCourse"
                            ErrorMessage="The Course is required.">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="textLeft">
                        <asp:TextBox ID="txtEducationCourse" runat="server" CssClass="txtLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="textCenter">
                        <asp:Button ID="btnEducationEditSave" runat="server" Text="Edit" />
                        <input id="cmdReset" type="reset" value="Reset" />
                        <asp:HiddenField ID="newEducationID" runat="server" />
                    </td>
                </tr>
            </table>
            <asp:ValidationSummary ID="ValidationSummary2" runat="server" />
            <table runat="server" visible="false" style="text-align: right; border: solid 2px #def;
                border-bottom-color: #0ff; border-top-color: #0ff; border-right-color: #0ff;
                border-left-color: #0ff;" id="frmEducation" width="100%">
                <tr>
                    <td colspan="4" style="background-color: #00FFFF; border-color: #00FFFF" class="textLeft">
                        <span lang="en-us" style="text-align: left;">Qualification :&nbsp; </span><span style="text-align: left;">
                            Education</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" class="textLeft">
                        &nbsp;Search By:
                        <asp:DropDownList ID="cmbEducationSearchBy" runat="server">
                            <asp:ListItem>-Select-</asp:ListItem>
                            <asp:ListItem>ID</asp:ListItem>
                            <asp:ListItem>Course</asp:ListItem>
                            <asp:ListItem>Institute</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;Search for:
                        <asp:TextBox ID="txtEducationSearch" runat="server" CssClass="txtLine"></asp:TextBox>
                        &nbsp;&nbsp;
                        <asp:Button ID="btnEducationSearch" runat="server" Text="Search" />
                        <input id="cmdReset1" type="reset" value="Reset" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" class="textLeft">
                        <asp:Button ID="btnEducationAdd" runat="server" Text="Add" />
                        <asp:Button ID="btnEducationDelete" runat="server" Text="Delete" />
                    </td>
                </tr>
                <tr>
                    <td>
                    <asp:Repeater ID="rptEducation" runat="server" DataSourceID="adsEducation"><HeaderTemplate>
                        <table width="100%">
                            <tr style="background-color: #00FFFF; border-spacing: 0px;">
                                <td class="textLeft">
                                    <input name="allCheck" type="checkbox" onclick="doHandleAll()" />
                                </td>
                                <td class="textLeft">
                                    Education ID
                                </td>
                                <td class="textLeft">
                                    Course
                                </td>
                                <td class="textLeft">
                                    Institute
                                </td>
                            </tr></HeaderTemplate><ItemTemplate>
                            <tr style="background-color: #CCFFFF">
                                <td class="textLeft">
                                    <input name="education[]" type="checkbox" value="<%#Container.DataItem(0) %>" />
                                </td>
                                <td class="textLeft">
                                    <a class="updatelink" href="Qualification.aspx?Page=Education&id=<%# Container.DataItem(0) %>"><%#Container.DataItem(0) %></a>
                                </td>
                                <td class="textLeft">
                                    <a class="updatelink" href="Qualification.aspx?Page=Education&id=<%# Container.DataItem(0) %>"><%#Container.DataItem(1)%></a>
                                </td>
                                <td class="textLeft">
                                    <%#Container.DataItem(2)%>
                                </td>
                            </tr></ItemTemplate><AlternatingItemTemplate>
                            <tr style="background-color: #CCCCFF">
                               <td class="textLeft">
                                    <input name="education[]" type="checkbox" value="<%#Container.DataItem(0) %>" />
                                </td>
                                <td class="textLeft">
                                    <a class="updatelink" href="Qualification.aspx?Page=Education&id=<%# Container.DataItem(0) %>"><%#Container.DataItem(0) %></a>
                                </td>
                                <td class="textLeft">
                                    <a class="updatelink" href="Qualification.aspx?Page=Education&id=<%# Container.DataItem(0) %>"><%#Container.DataItem(1)%></a>
                                </td>
                                <td class="textLeft">
                                    <%#Container.DataItem(2)%>
                                </td>
                            </tr></AlternatingItemTemplate><FooterTemplate>
                        </table></FooterTemplate></asp:Repeater>
                        <asp:AccessDataSource ID="adsEducation" runat="server" 
                            DataFile="~/App_Data/hrmsystem.mdb" 
                            SelectCommand="SELECT edu_code, edu_deg, edu_uni  FROM hr_education" 
                            
                            InsertCommand="INSERT INTO hr_education (edu_code, edu_uni, edu_deg) VALUES (@edu_code, @edu_uni, @edu_deg)">
                            <InsertParameters>
                                <asp:ControlParameter ControlID="newEducationID" Name="@edu_code" 
                                    PropertyName="Value" />
                                <asp:ControlParameter ControlID="txtEducationInstitute" Name="@edu_uni" 
                                    PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtEducationCourse" Name="@edu_deg" 
                                    PropertyName="Text" />
                            </InsertParameters>
                        </asp:AccessDataSource>
                    </td>
                </tr>
            </table>
            
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" id="frmQualLicenses"
                runat="server">
                <tr>
                    <td class="textLeft" colspan="2" style="background-color: #00FFFF">
                        Qualification : Licenses
                    </td>
                </tr>
                <tr ID="licenseCode" runat="server">
                    <td class="textRight">
                        Code</td>
                    <td class="textLeft">
                        <asp:Label ID="editLicenseID" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="textRight">
                        Description<asp:RequiredFieldValidator ID="RequiredFieldValidator5" 
                            runat="server" ControlToValidate="txtLicenseDescription" 
                            ErrorMessage="Property Name is required">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="textLeft">
                        <asp:TextBox ID="txtLicenseDescription" runat="server" Height="47px" 
                            TextMode="MultiLine" Width="201px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="textCenter" colspan="2">
                        <asp:Button ID="btnLicenseEditSave" runat="server" Text="Edit" />
                        <input id="cmdReset" type="reset" value="Reset" />
                        <asp:HiddenField ID="newLicenseID" runat="server" />
                    </td>
                </tr>
            </table>
            <asp:ValidationSummary ID="ValidationSummary3" runat="server" />
            <table runat="server" style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" width="100%"
                id="frmLicenses" visible="False">
                <tr>
                    <td colspan="3" style="background-color: #00FFFF; border-color: #00FFFF" class="textLeft">
                        <span lang="en-us" style="text-align: left;">Qualification :&nbsp; </span><span style="text-align: left;">
                            Licenses</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="textLeft">
                        &nbsp;Search By:
                        <asp:DropDownList ID="cmbLicenseSearchBy" runat="server">
                            <asp:ListItem>-Select-</asp:ListItem>
                            <asp:ListItem>ID</asp:ListItem>
                            <asp:ListItem>Name</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;Search for:
                        <asp:TextBox ID="txtLicenseSearch" runat="server" CssClass="txtLine"></asp:TextBox>
                        &nbsp;&nbsp;
                        <asp:Button ID="btnLicenseSearch" runat="server" Text="Search" />
                        <input id="Reset1" type="reset" value="Reset" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="textLeft">
                        <asp:Button ID="btnLicenseAdd" runat="server" Text="Add" />
                        <asp:Button ID="btnLicenseDelete" runat="server" Text="Delete" />
                    </td>
                </tr>
                <tr><td>
                <asp:Repeater ID="rptLicense" runat="server" DataSourceID="adsLicenses"><HeaderTemplate>
                <table width="100%">
                <tr style=" background-color: #00FFFF; border-color: #00FFFF">
                    <td  class="textLeft">
                        <input name="allCheck" type="checkbox" onclick="doHandleAll()" /></td>
                    <td  class="textLeft">
                        License ID
                    </td>
                    <td class="textLeft">
                        License Description
                    </td>
                </tr></HeaderTemplate><ItemTemplate>
                <tr style="background-color: #CCFFFF">
                    <td class="textLeft">
                        <input name="licenses[]" type="checkbox" value="<%# Container.DataItem(0) %>" /></td>
                    <td class="textLeft">
                        <a class="updatelink" href="Qualification.aspx?Page=Licenses&id=<%# Container.DataItem(0) %>"><%# Container.DataItem(0) %></a>
                    </td>
                    <td class="textLeft">
                        <a class="updatelink" href="Qualification.aspx?Page=Licenses&id=<%# Container.DataItem(0) %>"><%#Container.DataItem(1)%></a>
                    </td>
                </tr></ItemTemplate><AlternatingItemTemplate>
                <tr style="background-color: #CCCCFF">
                     <td class="textLeft">
                        <input name="licenses[]" type="checkbox" value="<%# Container.DataItem(0) %>" /></td>
                    <td class="textLeft">
                        <a class="updatelink" href="Qualification.aspx?Page=Licenses&id=<%# Container.DataItem(0) %>"><%# Container.DataItem(0) %></a>
                    </td>
                    <td class="textLeft">
                        <a class="updatelink" href="Qualification.aspx?Page=Licenses&id=<%# Container.DataItem(0) %>"><%#Container.DataItem(1)%></a>
                    </td>
                </tr></AlternatingItemTemplate><FooterTemplate>
                </table></FooterTemplate></asp:Repeater>
                    <asp:AccessDataSource ID="adsLicenses" runat="server" 
                        DataFile="~/App_Data/hrmsystem.mdb" 
                        SelectCommand="SELECT licenses_code, licenses_desc FROM hr_licenses" 
                        InsertCommand="INSERT INTO hr_licenses(licenses_code, licenses_desc) VALUES (@licenses_code, @licenses_desc)">
                        <InsertParameters>
                            <asp:ControlParameter ControlID="newLicenseID" Name="@licenses_code" 
                                PropertyName="Value" />
                            <asp:ControlParameter ControlID="txtLicenseDescription" Name="@licenses_desc" 
                                PropertyName="Text" />
                        </InsertParameters>
                    </asp:AccessDataSource>
                    </td></tr>
            </table>
        </asp:View>
        <asp:View ID="View3" runat="server">
        </asp:View>
    </asp:MultiView>
</asp:Content>
