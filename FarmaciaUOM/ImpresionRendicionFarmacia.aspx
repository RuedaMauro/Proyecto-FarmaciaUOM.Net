﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImpresionRendicionFarmacia.aspx.cs" Inherits="Impresiones_ImpresionRendicionFarmacia" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%" 
            Font-Names="Verdana" Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
            WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
            <LocalReport ReportPath="Impresiones\ImpresionRendicionFarmacia.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="SqlDataSource1" Name="DataSet1" />
                    <rsweb:ReportDataSource DataSourceId="SqlDataSource2" Name="DataSet2" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HospitalConnectionString %>" 
            SelectCommand="H2_Turnos_Centro_Unico" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HospitalConnectionString %>" 
            SelectCommand="H2_PEDIDOS_PUBLICO_RENDICION" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="Fecha" QueryStringField="Desde" 
                    Type="DateTime" />
                <asp:QueryStringParameter Name="Usuario" QueryStringField="Usuario" 
                    Type="String" />
                <asp:QueryStringParameter Name="FechaHasta" QueryStringField="Hasta" 
                    Type="DateTime" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <%pdf_Click(); %>
    </form>
</body>
</html>
