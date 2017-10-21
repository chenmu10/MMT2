﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanyView.aspx.cs" Inherits="gui.Gui.CompanyView" %>

<%@ Register Src="../Documents/nav.ascx" TagName="nav" TagPrefix="uc1" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
    <link href="../../css/bootstrap-rtl.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

        <uc1:nav ID="nav1" runat="server" />
        <br />

        <div class="container">
            <h2>חברות</h2>
            <hr />
            <p>
                <asp:Button runat="server" ID="approve" class="btn btn-link" OnClick="newComapnyWorkshopBtn_Click" Text="יצירת חברה חדשה" />
            </p>
            <div class="row">
                <!-- Filter -->
                <div class="col-md-4">
                    <div class="form-inline">

                        <asp:DropDownList class="form-control" runat="server" ID="DropDownListAreas">
                            <asp:ListItem>אזור</asp:ListItem>
                        </asp:DropDownList>

                        <asp:Button runat="server" ID="filter" class="btn btn-info" Text="סינון" />

                    </div>
                </div>
                <!-- Search-->
                <div class="col-md-8">
                    <div class="form-inline">

                        <asp:TextBox ID="name" runat="server" type="text" class="form-control" placeholder="שם" Width="100px"> </asp:TextBox>

                        <asp:Button runat="server" ID="search" class="btn btn-info" Text="חיפוש" />
                    </div>
                    <br />
                </div>

            </div>
            <%--end row--%>
            <br />
            <!-- Table-->
            <asp:Table ID="companyTable" runat="server" CssClass="table table-hover">
                <asp:TableRow>
                    <asp:TableCell Font-Bold="true">שם החברה</asp:TableCell>
                    <asp:TableCell Font-Bold="true">כתובת</asp:TableCell>
                    <asp:TableCell Font-Bold="true">
                        <asp:LinkButton ForeColor="Black" runat="server" ID="LinkButton1">אזור 
                            <span class="glyphicon glyphicon-sort"></span>
                        </asp:LinkButton>
                    </asp:TableCell>
                    <asp:TableCell Font-Bold="true"> איש קשר</asp:TableCell>
                    <asp:TableCell Font-Bold="true"> טלפון</asp:TableCell>
                    <asp:TableCell Font-Bold="true"> אימייל </asp:TableCell>
                    <asp:TableCell Font-Bold="true">פעולות</asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:Label runat="server" ID="Sum"></asp:Label>
        </div>
    </form>
    <script>   $(" .navbar a:contains('חברות')").parent().addClass('active');</script>
</body>
</html>
