<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="Skills.aspx.vb"
    Inherits="_Skills" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        
    </style>
    <script type="text/javascript" language="javascript" src="js/common.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentplace1" runat="Server">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <table runat="server" style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" id="frmSkillSkills">
                <tr style="padding: 0 0 0 0;">
                    <td colspan="3" style="background-color: #00FFFF; border-color: #00FFFF" class="textLeft">
                        <span style="text-align: left;" lang="en-us">Skills :&nbsp; </span><span style="text-align: left;">
                            Skills</span>
                    </td>
                </tr>
                <tr id="skillCode" runat="server">
                    <td class="textRight">
                        Code
                    </td>
                    <td colspan="2" class="textLeft">
                        <asp:Label ID="editSkillID" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="textRight">
                        Name<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSkillName"
                            ErrorMessage="The Skill Name is required.">*</asp:RequiredFieldValidator>
                        &nbsp;
                    </td>
                    <td class="textLeft" colspan="2">
                        <asp:TextBox ID="txtSkillName" runat="server" CssClass="txtLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="textRight">
                        Description
                    </td>
                    <td class="textLeft">
                        <asp:TextBox ID="txtSkillDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="textCenter">
                        <asp:Button ID="btnSkillEditSave" runat="server" Text="Edit" />
                        <input id="cmdReset" type="reset" value="Reset" />
                        <asp:HiddenField ID="newSkillID" runat="server" />
                    </td>
                </tr>
            </table>
            <asp:ValidationSummary ID="ValidationSummary2" runat="server" />
            <table runat="server" visible="false" style="text-align: right; border: solid 2px #def;
                border-bottom-color: #0ff; border-top-color: #0ff; border-right-color: #0ff;
                border-left-color: #0ff;" id="frmSkills" width="100%">
                <tr>
                    <td colspan="3" style="background-color: #00FFFF; border-color: #00FFFF" class="textLeft">
                        <span lang="en-us" style="text-align: left;">Skills :&nbsp; </span><span style="text-align: left;">
                            Skills</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="textLeft">
                        &nbsp;Search By:
                        <asp:DropDownList ID="cmbSkillSearchBy" runat="server">
                            <asp:ListItem>-Select-</asp:ListItem>
                            <asp:ListItem>ID</asp:ListItem>
                            <asp:ListItem>Name</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;Search for:
                        <asp:TextBox ID="txtSkillSearch" runat="server" CssClass="txtLine"></asp:TextBox>
                        &nbsp;&nbsp;
                        <asp:Button ID="btnSkillSearch" runat="server" Text="Search" />
                        <input id="cmdReset1" type="reset" value="Reset" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="textLeft">
                        <asp:Button ID="btnSkillAdd" runat="server" Text="Add" />
                        <asp:Button ID="btnSkillDelete" runat="server" Text="Delete" Style="height: 26px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Repeater ID="rptSkills" runat="server" DataSourceID="adsSkills">
                            <HeaderTemplate>
                                <table width="100%">
                                    <tr style="background-color: #00FFFF; border-spacing: 0px;">
                                        <td class="textLeft">
                                            <input name="allCheck" type="checkbox" />
                                        </td>
                                        <td class="textLeft">
                                            Skill ID
                                        </td>
                                        <td class="textLeft">
                                            Skill Name
                                        </td>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr style="background-color: #CCFFFF">
                                    <td class="textLeft">
                                        <input name="skills[]" type="checkbox" value="<%# Container.DataItem(0) %>" />
                                    </td>
                                    <td class="textLeft">
                                        <a class="updatelink" href="Skills.aspx?Page=Skills&id=<%#Container.DataItem(0)%>">
                                            <%#Container.DataItem(0)%></a>
                                    </td>
                                    <td class="textLeft">
                                        <a class="updatelink" href="Skills.aspx?Page=Skills&id=<%#Container.DataItem(0)%>">
                                            <%#Container.DataItem(1)%></a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr style="background-color: #CCCCFF">
                                    <td class="textLeft">
                                        <input name="skills[]" type="checkbox" value="<%# Container.DataItem(0) %>" />
                                    </td>
                                    <td class="textLeft">
                                        <a class="updatelink" href="Skills.aspx?Page=Skills&id=<%#Container.DataItem(0)%>">
                                            <%#Container.DataItem(0)%></a>
                                    </td>
                                    <td class="textLeft">
                                        <a class="updatelink" href="Skills.aspx?Page=Skills&id=<%#Container.DataItem(0)%>">
                                            <%#Container.DataItem(1)%></a>
                                    </td>
                                </tr>
                            </AlternatingItemTemplate>
                            <FooterTemplate>
                                </table></FooterTemplate>
                        </asp:Repeater>
                        <asp:AccessDataSource ID="adsSkills" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
                            SelectCommand="SELECT skill_code, skill_name FROM hr_skill" InsertCommand="INSERT INTO hr_skill (skill_code, skill_name, skill_description) VALUES (@skill_code, @skill_name, @skill_description)">
                            <InsertParameters>
                                <asp:ControlParameter ControlID="newSkillID" Name="@skill_code" PropertyName="Value" />
                                <asp:ControlParameter ControlID="txtSkillName" Name="@skill_name" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtSkillDescription" Name="@skill_description" PropertyName="Text" />
                            </InsertParameters>
                        </asp:AccessDataSource>
                    </td>
                </tr>
            </table>
            <div class="textRight">
                <br />
            </div>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" id="frmSkillLanguages"
                runat="server">
                <tr>
                    <td class="textLeft" colspan="2" style="background-color: #00FFFF">
                        Skills : Languages
                    </td>
                </tr>
                <tr ID="languageCode" runat="server">
                    <td class="textRight">
                        Code
                    </td>
                    <td class="textLeft">
                        <asp:Label ID="editLanguageID" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="textRight">
                        Name<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtLanguageName"
                            ErrorMessage="The Language Name is required">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="textLeft">
                        <asp:TextBox ID="txtLanguageName" runat="server" CssClass="txtLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="textCenter" colspan="2">
                        <asp:Button ID="btnLanguageEditSave" runat="server" Text="Edit" />
                        <input id="cmdReset" type="reset" value="Reset" />
                        <asp:HiddenField ID="newLanguageID" runat="server" />
                    </td>
                </tr>
            </table>
            <asp:ValidationSummary ID="ValidationSummary3" runat="server" />
            <table runat="server" style="border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" width="100%"
                id="frmLanguages" visible="False">
                <tr>
                    <td colspan="3" style="background-color: #00FFFF; border-color: #00FFFF" class="textLeft">
                        <span lang="en-us" style="text-align: left;">Skills :&nbsp; </span><span style="text-align: left;">
                            Languages</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="textLeft">
                        &nbsp;Search By:<asp:DropDownList ID="cmbLanguageSearchBy" runat="server">
                            <asp:ListItem>-Select-</asp:ListItem>
                            <asp:ListItem>ID</asp:ListItem>
                            <asp:ListItem>Name</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;Search for:
                        <asp:TextBox ID="txtLanguageSearch" runat="server" CssClass="txtLine"></asp:TextBox>
                        &nbsp;&nbsp;
                        <asp:Button ID="btnLanguageSearch" runat="server" Text="Search" />
                        <input ID="Reset1" type="reset" value="Reset" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="textLeft">
                        <asp:Button ID="btnLanguageAdd" runat="server" Text="Add" />
                        <asp:Button ID="btnLanguageDelete" runat="server" Text="Delete" />
                    </td>
                </tr>
                <tr>
                    <td>
                    <asp:Repeater ID="rptLanguage" runat="server" DataSourceID="adsLanguages">
                    <HeaderTemplate>
                        <table width="100%">
                            <tr>
                                <td style="text-align: left; background-color: #00FFFF; border-color: #00FFFF" class="style6">
                                    <input name="allCheck" type="checkbox" />
                                </td>
                                <td style="background-color: #00FFFF; border-color: #00FFFF" class="textLeft">
                                    Language ID
                                </td>
                                <td style="background-color: #00FFFF; border-color: #00FFFF" class="textLeft">
                                    Language Name
                                </td>
                            </tr></HeaderTemplate><ItemTemplate>
                            <tr style="background-color: #CCFFFF">
                                <td class="style7">
                                    <input name="languages[]" type="checkbox" value="<%# Container.DataItem(0) %>" />
                                </td>
                                <td class="textLeft">
                                  <a class="updatelink" href="Skills.aspx?Page=Languages&id=<%# Container.DataItem(0) %>"> <%# Container.DataItem(0) %></a>
                                </td>
                                <td class="textLeft">
                                    <a class="updatelink" href="Skills.aspx?Page=Languages&id=<%# Container.DataItem(0) %>"><%#Container.DataItem(1)%></a>
                                </td>
                            </tr></ItemTemplate><AlternatingItemTemplate>
                            <tr style="background-color: #CCCCFF">
                                <td class="style7">
                                    <input name="languages[]" type="checkbox" value="<%# Container.DataItem(0) %>" />
                                </td>
                                <td class="textLeft">
                                  <a class="updatelink" href="Skills.aspx?Page=Languages&id=<%# Container.DataItem(0) %>"> <%# Container.DataItem(0) %></a>
                                </td>
                                <td class="textLeft">
                                    <a class="updatelink" href="Skills.aspx?Page=Languages&id=<%# Container.DataItem(0) %>"><%#Container.DataItem(1)%></a>
                                </td>
                            </tr></AlternatingItemTemplate><FooterTemplate>
                        </table></FooterTemplate></asp:Repeater>
                        <asp:AccessDataSource ID="adsLanguages" runat="server" 
                            DataFile="~/App_Data/hrmsystem.mdb" 
                            SelectCommand="SELECT lang_code, lang_name FROM hr_language" 
                            InsertCommand="INSERT INTO hr_language (lang_code, lang_name) VALUES (@lang_code, @lang_name)">
                            <InsertParameters>
                                <asp:ControlParameter ControlID="newLanguageID" Name="@lang_code" 
                                    PropertyName="Value" />
                                <asp:ControlParameter ControlID="txtLanguageName" Name="@lang_name" 
                                    PropertyName="Text" />
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
