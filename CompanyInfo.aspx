<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="CompanyInfo.aspx.vb"
    Inherits="_CompanyInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
     
        .auto-style1 {
            text-align: left;
            height: 34px;
        }
     
    </style>

    <script type="text/javascript" src="js/common.js">
    
    </script>
<script type="text/javascript" language="javascript">
function selectCheckbox(){
    alert("Checkbox selected");
}
function saveEmployee() {
    //alert("No function active");
    
}
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentplace1" runat="Server">
    <asp:AccessDataSource ID="adsCountries" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
        SelectCommand="SELECT [cou_code], [cou_name] FROM [hr_country]"></asp:AccessDataSource>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <table id="frmGeneral" runat="server" style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;">
                <tr>
                    <td colspan="4" style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                        <span lang="en-us" style="text-align: left;">Company Info :&nbsp; General</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span lang="en-us">Company Name</span><asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                            runat="server" ControlToValidate="txtCompanyName" ErrorMessage="The Company Name is required.">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="textLeft">
                        <asp:TextBox ID="txtCompanyName" runat="server" CssClass="txtLine"></asp:TextBox>
                    </td>
                    <td class="textRight">
                        <span lang="en-us">Number of Employees</span>
                    </td>
                    <td class="textLeft">
                        <asp:Label ID="lblNumEmployees" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span lang="en-us">Tax ID</span>
                    </td>
                    <td class="textLeft">
                        <asp:TextBox ID="txtTaxID" runat="server" CssClass="txtLine" Enabled="False"></asp:TextBox>
                    </td>
                    <td class="textRight">
                        <span lang="en-us">NAICS</span>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNAICS" runat="server" CssClass="txtLine" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span lang="en-us">Phone</span>
                    </td>
                    <td class="textLeft">
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="txtLine" Enabled="False"></asp:TextBox>
                    </td>
                    <td class="textRight">
                        <span lang="en-us">Fax</span>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFax" runat="server" CssClass="txtLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span lang="en-us">Country</span>
                    </td>
                    <td class="textLeft">
                        <asp:DropDownList ID="cmbCountry" runat="server" Height="21px" SelectionMode="Single"
                            DataSourceID="adsCountries" DataTextField="cou_name" DataValueField="cou_code" Width="50"
                            AppendDataBoundItems="true">
                            <asp:ListItem Value="">Select Country</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td colspan="2">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <span lang="en-us">Address1</span>
                    </td>
                    <td class="textLeft">
                        <asp:TextBox ID="txtAddress1" runat="server" CssClass="txtLine" Enabled="False"></asp:TextBox>
                    </td>
                    <td class="textRight">
                        <span lang="en-us">Address2</span>
                    </td>
                    <td>
                        <asp:TextBox ID="txtAddress2" runat="server" CssClass="txtLine" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span lang="en-us">City</span>
                    </td>
                    <td class="textLeft">
                        <asp:TextBox ID="txtCity" runat="server" CssClass="txtLine" Enabled="False"></asp:TextBox>
                    </td>
                    <td class="textRight" visible="False">
                        <span lang="en-us">State/Province</span>
                    </td>
                    <td visible="False">
                        <asp:TextBox ID="txtState" runat="server" CssClass="txtLine" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
                <tr visible="False">
                    <td>
                        Parish</td>
                    <td class="textLeft">
                        <asp:TextBox ID="txtZipCode" runat="server" CssClass="txtLine" Enabled="False"></asp:TextBox>
                    </td>
                    <td class="textRight">
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <span lang="en-us">Comments</span>
                    </td>
                    <td colspan="3" style="text-align: left;">
                        <asp:TextBox ID="txtComments" runat="server" Enabled="False" Height="49px" TextMode="MultiLine"
                            Width="173px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center;">
                        <asp:Button ID="btnCompanyEditSave" runat="server" Text="Edit" />
                        <input id="cmdReset0" type="reset" value="Reset" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:AccessDataSource ID="adsGenifo" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
                SelectCommand="SELECT geninfo_keys, geninfo_values FROM hr_geninfo WHERE (code = '001')"
                UpdateCommand="UPDATE hr_geninfo SET [geninfo_keys] = @geninfo_keys , [geninfo_values] =@geninfo_values WHERE code =001">
            </asp:AccessDataSource>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table runat="server" style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" id="frmLocEntry">
                <tr style="padding: 0 0 0 0;">
                    <td colspan="3" style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                        <span style="text-align: left;" lang="en-us">Company Info :&nbsp; </span><span style="text-align: left;">
                            Location</span>
                    </td>
                </tr>
                <tr runat="server" id="locCode">
                    <td>
                        Code
                    </td>
                    <td class="textLeft">
                        <asp:Label ID="editID" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Name<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLocName"
                            ErrorMessage="The Location Name is required.">*</asp:RequiredFieldValidator>
                        &nbsp;
                    </td>
                    <td colspan="2" class="textLeft">
                        <asp:TextBox ID="txtLocName" runat="server" CssClass="txtLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Country
                    </td>
                    <td class="textLeft">
                        <asp:DropDownList runat="server" ID="cmbLocCountry" SelectionMode="Single" Height="21px"
                            AppendDataBoundItems="True" DataSourceID="adsCountries" DataTextField="cou_name"
                            DataValueField="cou_code">
                            <asp:ListItem Value="">Select Country</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        State/Province
                    </td>
                    <td class="textLeft">
                        <asp:TextBox ID="txtLocState" runat="server" CssClass="txtLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        City
                    </td>
                    <td class="textLeft">
                        <asp:TextBox ID="txtLocCity" runat="server" CssClass="txtLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Address<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLocAddress"
                            ErrorMessage="The Location Address is required.">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="textLeft">
                        <asp:TextBox ID="txtLocAddress" runat="server" Enabled="False" Height="49px" TextMode="MultiLine"
                            Width="173px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Parish</td>
                    <td class="textLeft">
                        <asp:TextBox ID="txtLocZipCode" runat="server" CssClass="txtLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Phone
                    </td>
                    <td class="textLeft">
                        <asp:TextBox ID="txtLocPhone" runat="server" CssClass="txtLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Fax
                    </td>
                    <td class="textLeft">
                        <asp:TextBox ID="txtLocFax" runat="server" CssClass="txtLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Comments
                    </td>
                    <td class="textLeft">
                        <asp:TextBox ID="txtLocComments" runat="server" Enabled="False" Height="49px" TextMode="MultiLine"
                            Width="173px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align: center;">
                        <asp:Button ID="btnLocEditSave" runat="server" Text="Edit" />
                        <input id="cmdReset" type="reset" value="Reset" />
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="newID" runat="server" />
            <asp:ValidationSummary ID="ValidationSummary2" runat="server" />
            <table runat="server" visible="True" style="text-align: right; border: solid 2px #def;
                border-bottom-color: #0ff; border-top-color: #0ff; border-right-color: #0ff;
                border-left-color: #0ff;" id="frmLocation" width="100%">
                <tr>
                    <td style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                        <span lang="en-us" style="text-align: left;">Company Info :&nbsp; </span><span style="text-align: left;">
                            Location</span>
                    </td>
                </tr>
                <tr>
                    <td class="textLeft">
                        &nbsp;Search By:
                        <asp:DropDownList ID="cmbSearchBy" runat="server">
                            <asp:ListItem>-Select-</asp:ListItem>
                            <asp:ListItem>ID</asp:ListItem>
                            <asp:ListItem>Name</asp:ListItem>
                            <asp:ListItem>City Name</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;Search for:
                        <asp:TextBox ID="txtSearchBy" runat="server" CssClass="txtLine"></asp:TextBox>
                        &nbsp;&nbsp;
                        <asp:Button ID="btnLocSearch" runat="server" Text="Search" />
                        <input id="cmdReset1" type="reset" value="Reset" />
                    </td>
                </tr>
                <tr>
                    <td class="textLeft">
                        <asp:Button ID="btnLocAdd" runat="server" Text="Add" />
                        <asp:Button ID="btnLocDelete" runat="server" Text="Delete" 
                            onclientclick="return doDelete();" />
                    </td>
                </tr>
                <tr>
                    <td class="textLeft">
                        <asp:Repeater ID="rptLocation" runat="server" DataSourceID="adsLocation">
                            <HeaderTemplate>
                                <table width="100%">
                                <thead>
                                    <tr style="background-color: #00FFFF; border-spacing: 0px;">
                                        <td class="textLeft" width="5">
                                            <input name="allCheck" type="checkbox" onclick="doHandleAll()" />
                                        </td>
                                        <td class="textLeft">
                                            Location ID
                                        </td>
                                        <td class="textLeft">
                                            Location Name
                                        </td>
                                        <td class="textLeft">
                                            City Name
                                        </td>
                                    </tr>
                                    </thead>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr style="background-color: #CCFFFF">
                                    <td class="textLeft" width="5">
                                        <input name="location[]" type="checkbox" value="<%#Container.DataItem(0)%>" />
                 
                                    </td>
                                    <td class="textLeft">
                                        <a class="updatelink" href="CompanyInfo.aspx?Page=Location&loc_code=<%#Container.DataItem(0)%>"
                                            style="text-decoration: none">
                                            <%#Container.DataItem(0)%></a>
                                    </td>
                                    <td class="textLeft">
                                        <a class="updatelink" href="CompanyInfo.aspx?Page=Location&loc_code=<%#Container.DataItem(0)%>"
                                            style="text-decoration: none">
                                            <%#Container.DataItem(1)%></a>
                                    </td>
                                    <td class="textLeft">
                                        <%#Container.DataItem(2)%>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr style="background-color: #CCCCFF">
                                    <td class="textLeft" width="5">
                                        <input name="location[]" type="checkbox" value="<%#Container.DataItem(0)%>" />
                                    </td>
                                    <td class="textLeft">
                                        <a class="updatelink" href="CompanyInfo.aspx?Page=Location&loc_code=<%#Container.DataItem(0)%>"
                                            style="text-decoration: none">
                                            <%#Container.DataItem(0)%></a>
                                    </td>
                                    <td class="textLeft">
                                        <a class="updatelink" href="CompanyInfo.aspx?Page=Location&loc_code=<%#Container.DataItem(0)%>"
                                            style="text-decoration: none">
                                            <%#Container.DataItem(1)%></a>
                                    </td>
                                    <td class="textLeft">
                                        <%#Container.DataItem(2)%>
                                    </td>
                                </tr>
                            </AlternatingItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </td>
                </tr>
            </table>
            <asp:AccessDataSource ID="adsLocation" runat="server" DataFile="~/App_Data/hrmsystem.mdb"
                SelectCommand="SELECT [loc_code], [loc_name], [loc_city] FROM [hr_locations]"
                InsertCommand="INSERT INTO hr_locations([loc_code],[loc_name],[loc_country],[loc_state],[loc_city],[loc_add],[loc_zip],[loc_phone],[loc_fax],[loc_comments]) VALUES (@loc_code,@loc_name,@loc_country,@loc_state,@loc_city,@loc_add,@loc_zip,@loc_phone,@loc_fax,@loc_comments)"
                UpdateCommand="UPDATE hr_locations SET loc_name = @loc_name, loc_country = @loc_country, loc_state = @loc_state, loc_city = @loc_city, loc_zip = @loc_zip, loc_phone = @loc_phone, loc_add = @loc_add, loc_fax = @loc_fax, loc_comments = @loc_comments WHERE (loc_code = @loc_code)">
                <InsertParameters>
                    <asp:ControlParameter ControlID="newID" Name="loc_code" PropertyName="value" />
                    <asp:ControlParameter ControlID="txtLocName" Name="loc_name" PropertyName="Text" />
                    <asp:ControlParameter ControlID="cmbLocCountry" Name="loc_country" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="txtLocState" Name="loc_state" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtLocCity" Name="loc_city" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtLocAddress" Name="loc_add" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtLocZipCode" Name="loc_zip" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtLocPhone" Name="loc_phone" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtLocFax" Name="loc_fax" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtLocComments" Name="loc_comments" PropertyName="Text" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="editID" Name="@loc_code" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtLocName" Name="@loc_name" 
                        PropertyName="Text" />
                    <asp:ControlParameter ControlID="cmbLocCountry" Name="@loc_country" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="txtLocState" Name="@loc_state" 
                        PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtLocCity" Name="@loc_city" 
                        PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtLocAddress" Name="@loc_add" 
                        PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtLocZipCode" Name="@loc_zip" 
                        PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtLocPhone" Name="@loc_phone" 
                        PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtLocFax" Name="@loc_fax" 
                        PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtLocComments" Name="@loc_comments" 
                        PropertyName="Text" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <br />
        </asp:View>
        <asp:View ID="View3" runat="server">
            <table cellpadding="0px" cellspacing="0px" style="text-align: right; border: solid 2px #def;
                border-bottom-color: #0ff; border-top-color: #0ff; border-right-color: #0ff;
                border-left-color: #0ff;">
                <tr>
                    <td style="text-align: left; background-color: #00FFFF; border-color: #00FFFF" colspan="1">
                        <span lang="en-us" style="text-align: left;">Company Info :&nbsp; </span><span style="text-align: left;">
                            Company Structure</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table runat="server" id="tblStructure" visible="false">
                            <tr>
                                <td>Unit Id</td>
                                <td class="textLeft">
                                    <asp:TextBox ID="txtUnitId" runat="server" CssClass="txtLine"></asp:TextBox>
                                </td>
                            </tr>
                            <tr><td>
                                Name
                                </td>
                                <td class="textLeft">
                                    <asp:TextBox ID="txtStructName" runat="server" CssClass="txtLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="The Name is required" ControlToValidate="txtStructName">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr><td>Description</td><td class="textLeft">
                                <asp:TextBox ID="txtStructDescription" runat="server" Height="68px" TextMode="MultiLine" Width="181px"></asp:TextBox>
                                </td></tr>
                            <tr>
                                <td colspan="3" style="text-align: center;">
                        <asp:Button ID="btnStructure" runat="server" Text="Edit" />
                        <input id="cmdReset" type="reset" value="Reset" />
                                    <asp:HiddenField ID="newStructID" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="textLeft">
                        &nbsp;
                        <asp:TreeView ID="tvCompStructures" runat="server" ShowLines="True">
                            <Nodes>
                                <asp:TreeNode Text="Location 1 + x" Value="Location 1">
                                    <asp:TreeNode Text="Location 1A + x" Value="Location 1A"></asp:TreeNode>
                                    <asp:TreeNode Text="Location 1B + x" Value="Location 1B"></asp:TreeNode>
                                </asp:TreeNode>
                                <asp:TreeNode Text="Location 2 + x" Value="Location 2"></asp:TreeNode>
                            </Nodes>
                        </asp:TreeView>
                    </td>
           
                </tr>
            </table>
            <asp:AccessDataSource ID="adsStructures" runat="server" DataFile="~/App_Data/hrmsystem.mdb" SelectCommand="SELECT [title], [description], [loc_code], [id], [parnt], [dept_id] FROM [hr_compstructtree]"></asp:AccessDataSource>
            <asp:ValidationSummary ID="ValidationSummary4" runat="server" />
        </asp:View>
        <asp:View ID="View4" runat="server">
            <table runat="server" style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" id="frmProperty">
                <tr>
                    <td class="textLeft" colspan="2" style="background-color: #00FFFF">
                        Company Info : Company Property
                    </td>
                </tr>
                <tr>
                    <td class="textLeft">
                        Property Name<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                            ErrorMessage="Property Name is required" ControlToValidate="txtPropertyName">*</asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPropertyName" runat="server" CssClass="txtLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="textCenter" colspan="2">
                        <asp:Button ID="btnPropertySave" runat="server" Text="Save" />
                        <input id="cmdReset" type="reset" value="Reset" />
                        <asp:HiddenField ID="newPropID" runat="server" />
                        <asp:HiddenField ID="editPropID" runat="server" />
                    </td>
                </tr>
            </table>
            <asp:ValidationSummary ID="ValidationSummary3" runat="server" />
            <table runat="server" style="text-align: right; border: solid 2px #def; border-bottom-color: #0ff;
                border-top-color: #0ff; border-right-color: #0ff; border-left-color: #0ff;" width="100%"
                id="frmCompProperty" visible="False">
                <tr>
                    <td colspan="3" style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                        <span lang="en-us" style="text-align: left;">Company Info :&nbsp; </span><span style="text-align: left;">
                            Company Property</span>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" colspan="3">
                        &nbsp;<asp:Button ID="btnProAdd" runat="server" Text="Add" />
                        <asp:Button ID="btnProSave" runat="server" Text="Save" OnClientClick="saveEmployee();" />
                        <asp:Button ID="btnProDelete" runat="server" Text="Delete" />
                    </td>
                </tr>
                <tr><td>
                    <asp:AccessDataSource ID="adsEmployee" runat="server" 
                        DataFile="~/App_Data/hrmsystem.mdb" 
                        
                        SelectCommand="SELECT employee_id, [emp_firstname]+', '+[emp_lastname] AS fullname FROM [hr_employee] ORDER BY [emp_firstname], [emp_lastname]"></asp:AccessDataSource>
                <asp:Repeater ID="rptProperty" runat="server" DataSourceID="adsProperty">
                <HeaderTemplate>
                <table width="100%">
                <tr>
                    <td style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                        <input name="allCheck" type="checkbox" onclick="doHandleAll()" />
                    </td>
                    <td style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                        Property Name
                    </td>
                    <td style="text-align: left; background-color: #00FFFF; border-color: #00FFFF">
                        Employee
                    </td>
                </tr>
                </HeaderTemplate>
                <ItemTemplate>
                <tr style="background-color: #CCFFFF">
                    <td class="textLeft">
                       <input name="property[]" type="checkbox" value="<%# Container.DataItem(0) %>"  />
                    <asp:HiddenField ID="ePropID" runat="server" Value="<%# Container.DataItem(0)%>" />
                    </td>
                    <td class="textLeft">
                       <a class="updatelink" href="CompanyInfo.aspx?Page=Company Property&id=<%# Container.DataItem(0) %>"><%#Container.DataItem(1)%></a>
                    </td>
                    <td class="textLeft">
                        <asp:DropDownList ID="cmbEmployee" runat="server" AppendDataBoundItems="True"  DataSourceID="adsEmployee" DataTextField="fullname" DataValueField="employee_id"  ><asp:ListItem Value="0000">Not Assigned</asp:ListItem></asp:DropDownList>
                    </td>
                </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                <tr style="background-color: #CCCCFF">
                     <td class="textLeft">
                       <input name="property[]" type="checkbox" value="<%# Container.DataItem(0) %>"  />
                         <asp:HiddenField ID="ePropID" runat="server" Value="<%# Container.DataItem(0)%>" />
                    </td>
                    <td class="textLeft">
                       <a class="updatelink" href="CompanyInfo.aspx?Page=Company Property&id=<%# Container.DataItem(0) %>"><%#Container.DataItem(1)%></a>
                    </td>
                    <td class="textLeft">
                        <asp:DropDownList ID="cmbEmployee" runat="server" AppendDataBoundItems="True" DataSourceID="adsEmployee" DataTextField="fullname" DataValueField="employee_id" ><asp:ListItem Value="0000">Not Assigned</asp:ListItem></asp:DropDownList>
                    </td>
                </tr>
                </AlternatingItemTemplate>
                <FooterTemplate>
                </table>
                </FooterTemplate>
                </asp:Repeater>
                    <asp:AccessDataSource ID="adsProperty" runat="server" 
                        DataFile="~/App_Data/hrmsystem.mdb" 
                        
                        SelectCommand="SELECT  [prop_id],[prop_name], [emp_id] FROM [hr_comp_property]" 
                        
                        InsertCommand="INSERT INTO hr_comp_property ([prop_name], [prop_id],[emp_id]) VALUES (@prop_name, @prop_id,@emp_id)">
                        <InsertParameters>
                            <asp:ControlParameter ControlID="newPropID" Name="@prop_id" 
                                PropertyName="Value" />
                            <asp:ControlParameter ControlID="txtPropertyName" Name="@prop_name" 
                                PropertyName="Text" />
                            <asp:Parameter Name="@emp_id" DefaultValue="0" />
                        </InsertParameters>
                    </asp:AccessDataSource>
                </td></tr>
            </table>
        </asp:View>
        <asp:View ID="View5" runat="server">
        </asp:View>
    </asp:MultiView>
    <br />
</asp:Content>
