<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="Help.aspx.vb" Inherits="_Help" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style2
    {
        font-size: x-large;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentplace1" Runat="Server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            
            <span class="style2">Help Contents<br />
            </span>
            
        </asp:View><asp:View ID="View2" runat="server">
            <span class="style2">Need Support!</span><br />
            </asp:View>
    </asp:MultiView>
</asp:Content>

