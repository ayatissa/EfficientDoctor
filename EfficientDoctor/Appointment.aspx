<%@ Page Title="" Language="C#" Theme="ITC_Theme" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Appointment.aspx.cs" Inherits="EfficientDoctor.Appointment" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <style type="text/css">
        .menu_reg a {
            color: #fff !important;
        }

        .slider_main {
            display: none !important;
        }
    </style>


    <script type="text/javascript">
        var Check_MyGrid = 0;
        var Check_MyGrid_Delete = 0;
        var MyIndex = 0;


        function OnCancel(s, e) {
            gvAppointment.CancelEdit();
        }

        function gotoEditRow(s, e) {
            Check_MyGrid = 1;
        }
        function gotoDelete() {
            Check_MyGrid_Delete = 1;
            popConfirmDelete.Show();
        }

        function OnRowClick(e) {
            MyIndex = e.visibleIndex;
            if (Check_MyGrid) {
                gvAppointment.StartEditRow(MyIndex);
                Check_MyGrid = 0;
            }
            if (Check_MyGrid_Delete) {
                Check_MyGrid_Delete = 0;
            }
        }

        function OnDelete() {
            if (MyIndex != 'undefined') {
                popConfirmDelete.Hide();
                gvAppointment.DeleteRow(MyIndex);
            }
            else {
                popConfirmDelete.Show();
            }
        }

        function OnCancelDelete(s, e) {
            popConfirmDelete.Hide();
        }

        function OnSave(s, e) {
            if (ASPxClientEdit.ValidateGroup('Book')) {
                gvAppointment.UpdateEdit();
            }
        }


    </script>

    <div class="topy_bar">
        <div class="container topy">

            <h1 style="direction: ltr;color:black;">Appointment
            </h1>
        </div>
    </div>
           <div class="container text-center" style="position:relative; top: 0px; left: 0px;" id="apps">



<br />


        <div class="main_appsi" id="apps">

            <div class="grid_title_main">

                <span style="direction: ltr;color:black;">Appointment
                </span>

            </div>

            <dx:ASPxGridView ID="gvAppointment" ClientInstanceName="gvAppointment" runat="server" AutoGenerateColumns="False" Width="100%"
                Style="text-align: center" SkinID="GridView"
                EnableRowsCache="False" DataSourceID="DS_Appo">

                <SettingsEditing Mode="EditForm">
                </SettingsEditing>
                <Settings ShowFilterRow="True" />
                <SettingsBehavior ConfirmDelete="True" />
                <SettingsText EmptyDataRow="There are no data" CommandCancel=" " CommandEdit=" " CommandNew="  " CommandSelect=" " CommandUpdate=" " CommandClearFilter="مسح"></SettingsText>
                <Columns>
                    <dx:GridViewDataDateColumn FieldName="Date" VisibleIndex="0">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="Time" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn CellStyle-Font-Names="ITC" VisibleIndex="2" FieldName="doctor">

<CellStyle Font-Names="ITC"></CellStyle>

                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="customer" VisibleIndex="3" Caption="Patient">
                    </dx:GridViewDataTextColumn>

                </Columns>
            </dx:ASPxGridView>

        </div>
    </div>

    <asp:SqlDataSource ID="DS_Appo" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Appointment] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Appointment] ([CusID], [DocID], [Date], [Time]) VALUES (@CusID, @DocID, @Date, @Time)" SelectCommand="SELECT A.[Date],a.[Time],D.Name As doctor , c.Name as customer FROM Appointment A,doctors D,Customer C where A.CusID=C.CusID and A.DocID=D.DocID" UpdateCommand="UPDATE [Appointment] SET [CusID] = @CusID, [DocID] = @DocID, [Date] = @Date, [Time] = @Time WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CusID" Type="Int32" />
            <asp:Parameter Name="DocID" Type="Int32" />
            <asp:Parameter Name="Date" Type="DateTime" />
            <asp:Parameter Name="Time" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CusID" Type="Int32" />
            <asp:Parameter Name="DocID" Type="Int32" />
            <asp:Parameter Name="Date" Type="DateTime" />
            <asp:Parameter Name="Time" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </asp:Content>
