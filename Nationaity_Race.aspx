<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="Nationaity_Race.aspx.vb"
    Inherits="_Nationality_Race" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .textLeft
        {
            text-align: left;
        }
        .style2
        {
            text-align: center;
        }
        .style3
        {
            text-align: left;
            width: 313px;
        }
        .style5
        {
            text-align: left;
            width: 52px;
        }
        .style6
        {
            width: 17px;
        }
        .style7
        {
            text-align: left;
            width: 17px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentplace1" runat="Server">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <table runat="server" style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" id="frmNationality">
                <tr style="padding: 0 0 0 0;">
                    <td colspan="2" style="background-color: #00FFFF; border-color: #00FFFF" class="textLeft">
                        <span style="text-align: left;" lang="en-us">Nationality &amp; Race :&nbsp; </span>
                        <span style="text-align: left;">Nationality</span>
                    </td>
                </tr>
                <tr id="nationalityCode">
                    <td class="textLeft2">
                        Code
                    </td>
                    <td class="textLeft">
                        <asp:Label ID="editNationalityID" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Name<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNationalityName"
                            ErrorMessage="The Nationality Name is required.">*</asp:RequiredFieldValidator>
                        &nbsp;
                    </td>
                    <td class="textLeft">
                        <asp:TextBox ID="txtNationalityName" runat="server" CssClass="txtLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="style2">
                        <asp:Button ID="btnNationalityEditSave" runat="server" Text="Edit" />
                        <input id="cmdReset" type="reset" value="Reset" />
                        <asp:HiddenField ID="newNationalityID" runat="server" />
                    </td>
                </tr>
            </table>
            <asp:ValidationSummary ID="ValidationSummary2" runat="server" />
            <table runat="server" visible="false" style="text-align: right; border: solid 2px #def;
                border-bottom-color: #0ff; border-top-color: #0ff; border-right-color: #0ff;
                border-left-color: #0ff;" id="frmNationalities" width="100%">
                <tr>
                    <td colspan="3" style="background-color: #00FFFF; border-color: #00FFFF" class="textLeft">
                        <span lang="en-us" style="text-align: left;">Nationality & Race</span><span lang="en-us"
                            style="text-align: left;"> :&nbsp; </span><span style="text-align: left;">Nationality</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="textLeft">
                        &nbsp;Search By:
                        <asp:DropDownList ID="cmbNationalitySearchBy" runat="server">
                            <asp:ListItem>-Select-</asp:ListItem>
                            <asp:ListItem>ID</asp:ListItem>
                            <asp:ListItem>Name</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;Search for:
                        <asp:TextBox ID="txtNationalitySearch" runat="server" CssClass="txtLine"></asp:TextBox>
                        &nbsp;&nbsp;
                        <asp:Button ID="btnNationalitySearch" runat="server" Text="Search" />
                        <input id="cmdReset1" type="reset" value="Reset" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="textLeft">
                        <asp:Button ID="btnNationalityAdd" runat="server" Text="Add" />
                        <asp:Button ID="btnNationalityDelete" runat="server" Text="Delete" Style="height: 26px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Repeater ID="rptNationality" runat="server" DataSourceID="adsNationality">
                            <HeaderTemplate>
                                <table width="100%">
                                    <tr style="background-color: #00FFFF; border-spacing: 0px;">
                                        <td class="style5">
                                            <input name="allCheck" type="checkbox" />
                                        </td>
                                        <td class="textLeft">
                                            Nationality ID
                                        </td>
                                        <td class="textLeft">
                                            Nationality Name
                                        </td>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr style="background-color: #CCFFFF">
                                    <td class="style5">
                                        <input name="nationality[]" type="checkbox" value="<%# Container.DataItem(0) %>" />
                                    </td>
                                    <td class="style3">
                                        <a class="updatelink" href="Nationaity_Race.aspx?Page=Nationality&id=<%# Container.DataItem(0) %>">
                                            <%# Container.DataItem(0) %></a>
                                    </td>
                                    <td class="style3">
                                        <a class="updatelink" href="Nationaity_Race.aspx?Page=Nationality&id=<%# Container.DataItem(0) %>">
                                            <%#Container.DataItem(1)%></a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr style="background-color: #CCCCFF">
                                    <td class="style5">
                                        <input name="nationality[]" type="checkbox" value="<%# Container.DataItem(0) %>" />
                                    </td>
                                    <td class="style3">
                                        <a class="updatelink" href="Nationaity_Race.aspx?Page=Nationality&id=<%# Container.DataItem(0) %>">
                                            <%# Container.DataItem(0) %></a>
                                    </td>
                                    <td class="style3">
                                        <a class="updatelink" href="Nationaity_Race.aspx?Page=Nationality&id=<%# Container.DataItem(0) %>">
                                            <%#Container.DataItem(1)%></a>
                                    </td>
                                </tr>
                            </AlternatingItemTemplate>
                            <FooterTemplate>
                                </table></FooterTemplate>
                        </asp:Repeater>
                        <asp:AccessDataSource ID="adsNationality" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
                            SelectCommand="SELECT nat_code, nat_name FROM hr_nationality" InsertCommand="INSERT INTO hr_nationality(nat_code, nat_name) VALUES (@nat_code, @nat_name)">
                            <InsertParameters>
                                <asp:ControlParameter ControlID="newNationalityID" Name="@nat_code" PropertyName="Value" />
                                <asp:ControlParameter ControlID="txtNationalityName" Name="@nat_name" PropertyName="Text" />
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
            <table 
                style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" id="frmEthnicRace"
                runat="server">
                <tr>
                    <td class="textLeft" colspan="2" style="background-color: #00FFFF">
                        Nationality &amp; Race : Ethnic Races
                    </td>
                </tr>
                <tr ID="ethnicRaceCode" runat="server">
                    <td class="textLeft0">
                        Code</td>
                    <td class="textLeft">
                        <asp:Label ID="editEthnicRaceID" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="textLeft0">
                        Name<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="txtEthnicRaceName" 
                            ErrorMessage="The Ethnic Race Name is required">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="textLeft">
                        <asp:TextBox ID="txtEthnicRaceName" runat="server" CssClass="txtLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2" colspan="2">
                        <asp:Button ID="btnEthnicRaceEditSave" runat="server" Text="Edit" />
                        <input ID="cmdReset" type="reset" value="Reset" />
                        <asp:HiddenField ID="newEthnicRaceID" runat="server" />
                    </td>
                </tr>
            </table>
            <asp:ValidationSummary ID="ValidationSummary3" runat="server" />
            <table runat="server" 
                style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" width="100%"
                id="frmEthnicRaces" visible="False">
                <tr>
                    <td colspan="3" style="background-color: #00FFFF; border-color: #00FFFF" class="textLeft">
                        <span lang="en-us" style="text-align: left;">Nationality & Race</span><span lang="en-us"
                            style="text-align: left;"> :</span><span style="text-align: left;"> </span><span
                                lang="en-us" style="text-align: left;">&nbsp;</span><span style="text-align: left;">Ethnic</span><span
                                    lang="en-us" style="text-align: left;"> </span><span style="text-align: left;">Races</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="textLeft">
                        &nbsp;Search By:
                        <asp:DropDownList ID="cmbEthnicRaceSearchBy" runat="server">
                            <asp:ListItem>-Select-</asp:ListItem>
                            <asp:ListItem>ID</asp:ListItem>
                            <asp:ListItem>Name</asp:ListItem>
                            
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;Search for:
                        <asp:TextBox ID="txtEthnicRaceSearch" runat="server" CssClass="txtLine"></asp:TextBox>
                        &nbsp;&nbsp;
                        <asp:Button ID="btnEthnicRaceSearch" runat="server" Text="Search" />
                        <input id="Reset1" type="reset" value="Reset" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="textLeft">
                        <asp:Button ID="btnEthnicRaceAdd" runat="server" Text="Add" />
                        <asp:Button ID="btnEthnicRaceDelete" runat="server" Text="Delete" />
                    </td>
                </tr>
                <tr>
                    <td>
                    <asp:Repeater ID="rptEthnicRaces" runat="server" DataSourceID="adsEthnicRace">
                    <HeaderTemplate>
                        <table width="100%">
                            <tr>
                                <td style="text-align: left; background-color: #00FFFF; border-color: #00FFFF" class="style6">
                                    <input name="allCheck" type="checkbox" />
                                </td>
                                <td style="background-color: #00FFFF; border-color: #00FFFF" class="textLeft">
                                    Ethnic Race ID
                                </td>
                                <td style="background-color: #00FFFF; border-color: #00FFFF" class="textLeft">
                                    Ethnic Race Name
                                </td>
                            </tr></HeaderTemplate><ItemTemplate>
                            <tr style="background-color: #CCFFFF">
                                <td class="style7">
                                    <input name="races[]" type="checkbox" value="<%# Container.DataItem(0) %>" />
                                </td>
                                <td class="textLeft">
                                   <a class="updatelink" href="Nationaity_Race.aspx?Page=Ethnic Races&id=<%# Container.DataItem(0) %>"><%# Container.DataItem(0) %></a>
                                </td>
                                <td class="textLeft">
                                   <a class="updatelink" href="Nationaity_Race.aspx?Page=Ethnic Races&id=<%# Container.DataItem(0) %>"> <%#Container.DataItem(1)%></a>
                                </td>
                            </tr></ItemTemplate><AlternatingItemTemplate>
                            <tr style="background-color: #CCCCFF">
                                <td class="style7">
                                    <input name="races[]" type="checkbox" value="<%# Container.DataItem(0) %>" />
                                </td>
                                <td class="textLeft">
                                   <a class="updatelink" href="Nationaity_Race.aspx?Page=Ethnic Races&id=<%# Container.DataItem(0) %>"><%# Container.DataItem(0) %></a>
                                </td>
                                <td class="textLeft">
                                   <a class="updatelink" href="Nationaity_Race.aspx?Page=Ethnic Races&id=<%# Container.DataItem(0) %>"> <%#Container.DataItem(1)%></a>
                                </td>
                            </tr></AlternatingItemTemplate>
                            <FooterTemplate>
                        </table></FooterTemplate></asp:Repeater>
                        <asp:AccessDataSource ID="adsEthnicRace" runat="server" 
                            DataFile="~/App_Data/hrmsystem.mdb" 
                            
                            SelectCommand="SELECT ethnic_race_code, ethinic_race_desc FROM hr_ethnic_race" 
                            InsertCommand="INSERT INTO hr_ethnic_race (ethnic_race_code, ethinic_race_desc) VALUES (@ethnic_race_code, @ethinic_race_desc)">
                            <InsertParameters>
                                <asp:ControlParameter ControlID="newEthnicRaceID" Name="@ethnic_race_code" 
                                    PropertyName="Value" />
                                <asp:ControlParameter ControlID="txtEthnicRaceName" Name="@ethnic_race_desc" 
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
