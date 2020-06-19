<%@ Page Title="" Language="C#" Theme="ITC_Theme" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="SearchOrgan.aspx.cs" Inherits="EfficientDoctor.SearchOrgan" %>

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
            gvSearchOrgan.CancelEdit();
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
                gvSearchOrgan.StartEditRow(MyIndex);
                Check_MyGrid = 0;
            }
            if (Check_MyGrid_Delete) {
                Check_MyGrid_Delete = 0;
            }
        }

        function OnDelete() {
            if (MyIndex != 'undefined') {
                popConfirmDelete.Hide();
                gvSearchOrgan.DeleteRow(MyIndex);
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
                gvSearchOrgan.UpdateEdit();
            }
        }


    </script>

    <div class="topy_bar">
        <div class="container topy">

        </div>
    </div>
           <div class="container text-center" style="position:relative; top: 0px; left: 0px;" id="apps">



<br />


        <div class="main_appsi" id="apps">

            <div class="grid_title_main">

                <span style="direction: ltr">Search Organ
                </span>

            </div>

            <dx:ASPxGridView ID="gvSearchOrgan" ClientInstanceName="gvSearchOrgan" runat="server" AutoGenerateColumns="False" Width="100%"
                Style="text-align: center" SkinID="GridView"
                EnableRowsCache="False" DataSourceID="DS_Organ">

                <SettingsEditing Mode="EditForm">
                </SettingsEditing>
                <Settings ShowFilterRow="True" />
                <SettingsBehavior ConfirmDelete="True" />
                <SettingsText EmptyDataRow="There are no data" CommandCancel=" " CommandEdit=" " CommandNew="  " CommandSelect=" " CommandUpdate=" " CommandClearFilter="مسح"></SettingsText>
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="BloodGroup" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Mobile" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="OrganType" VisibleIndex="3">
                        <PropertiesComboBox>
                            <Items>
                                <dx:ListEditItem Text="Eye" Value="Eye" />
                                <dx:ListEditItem Text="Liver" Value="Liver" />
                                <dx:ListEditItem Text="Kidney" Value="Kidney" />
                                <dx:ListEditItem Text="Brain" Value="Brain" />
                            </Items>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                </Columns>
            </dx:ASPxGridView>

        </div>
    </div>

    <asp:SqlDataSource ID="DS_Organ" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Name], [Mobile], [BloodGroup], [OrganType] FROM [Organ]">
    </asp:SqlDataSource>
    </asp:Content>
