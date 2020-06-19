<%@ Page Title="" Language="C#" Theme="ITC_Theme" MasterPageFile="~/Site.Mobile.master" AutoEventWireup="true" CodeBehind="MyAppiontment.aspx.cs" Inherits="EfficientDoctor.MyAppiontment" %>

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
            gvCustomer.CancelEdit();
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
                gvCustomer.StartEditRow(MyIndex);
                Check_MyGrid = 0;
            }
            if (Check_MyGrid_Delete) {
                Check_MyGrid_Delete = 0;
            }
        }

        function OnDelete() {
            if (MyIndex != 'undefined') {
                popConfirmDelete.Hide();
                gvCustomer.DeleteRow(MyIndex);
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
                gvCustomer.UpdateEdit();
            }
        }


    </script>

    <div class="topy_bar">
        <div class="container topy">

            <h1 style="direction: ltr;color:black;">Customer
            </h1>
        </div>
    </div>
           <div class="container text-center" style="position:relative; top: 0px; left: 0px;" id="apps">



<br />


        <div class="main_appsi" id="apps">
             <center>
            <div class="grid_title_main">

                <span style="direction: ltr;color:black;">My Appiontment
                </span>

            </div>
           <br />
                
            <dx:ASPxGridView ID="gvBooking" ClientInstanceName="gvBooking" runat="server" AutoGenerateColumns="False" width="50%" 
      
          Style="text-align: center" SkinID="GridView"  
         EnableRowsCache="False" DataSourceID="DS_Cust" KeyFieldName="AppointmentID">
         <ClientSideEvents RowClick="function(s, e) {
                  MyIndex = e.visibleIndex;
                }" Init="function(s, e) {
	gvBooking.Refresh();
}"></ClientSideEvents>
         <SettingsEditing Mode="EditForm">
            </SettingsEditing>
                <Settings ShowFilterRow="True" />
                <SettingsBehavior ConfirmDelete="True" />
            <SettingsText EmptyDataRow="There are no data" CommandCancel=" " CommandEdit=" Edit" CommandNew="Add" CommandSelect=" " CommandUpdate=" " CommandClearFilter="Delete"></SettingsText>
        <Columns>
            <dx:GridViewDataDateColumn FieldName="Date" Name="Date" VisibleIndex="2">
                
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataComboBoxColumn FieldName="Time" Name="Time" VisibleIndex="3">
                <PropertiesComboBox>
                    <Items>
                        <dx:ListEditItem Text="10 am" Value="10 am" />
                        <dx:ListEditItem Text="11 am" Value="11 am" />
                        <dx:ListEditItem Text="12 pm" Value="12 pm" />
                        <dx:ListEditItem Text="01 pm" Value="01 pm" />
                        <dx:ListEditItem Text="02 pm" Value="02 pm" />
                        <dx:ListEditItem Text="03 pm" Value="03 pm" />
                        <dx:ListEditItem Text="04 pm" Value="04 pm" />
                        <dx:ListEditItem Text="05 pm" Value="05 pm" />
                        <dx:ListEditItem Text="06 pm" Value="06 pm" />
                    </Items>
                    
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="Patient ID" FieldName="CusID" Name="CusID" VisibleIndex="1">
               
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
</center>
        </div>
    </div>

    <asp:SqlDataSource ID="DS_Cust" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Date], [Time], [CusID] FROM [Appointment]">
    </asp:SqlDataSource>
    </asp:Content>
