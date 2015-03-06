Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
<System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class hrmsystem
    Inherits System.Web.Services.WebService

    <WebMethod()> _
    Public Function GetEmployeeList(ByVal prefixText As String, ByVal count As Integer) As String()
        Dim returnData As List(Of String)
        returnData = New List(Of String)
        Dim adsEmployeeName As AccessDataSource = New AccessDataSource("~/App_Data/hrmsystem.mdb", "SELECT employee_id, emp_firstname, emp_lastname FROM hr_employee WHERE emp_firstname LIKE '" + prefixText + "%' ORDER BY emp_number ASC")
        Dim dv As System.Data.DataView = adsEmployeeName.Select(DataSourceSelectArguments.Empty)
        For i As Integer = 0 To dv.ToTable.Rows.Count - 1
            Dim dr As System.Data.DataRow = dv.ToTable.Rows.Item(0)
            returnData.Add(dr.Item(0).ToString & " " & dr.Item(1).ToString & " " & dr.Item(2).ToString)
        Next
        Return returnData.ToArray
    End Function

    <WebMethod()> _
    Public Function GetTestValue() As String
        Return "Test"
    End Function
End Class
