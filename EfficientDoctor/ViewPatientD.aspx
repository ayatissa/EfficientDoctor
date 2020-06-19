<%@ Page Title="" Language="C#" Theme="ITC_Theme" MasterPageFile="~/Site.Mobile.master" AutoEventWireup="true" CodeBehind="ViewPatientD.aspx.cs" Inherits="EfficientDoctor.ViewPatientD" %>

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

            <div class="grid_title_main">

                <span style="direction: ltr;color:black;">Patient
                </span>

            </div>

            <dx:ASPxGridView ID="gvCustomer" ClientInstanceName="gvCustomer" runat="server" AutoGenerateColumns="False" Width="100%"
                Style="text-align: center" SkinID="GridView"
                EnableRowsCache="False" DataSourceID="DS_Cust" KeyFieldName="AppointmentID">

                <SettingsEditing Mode="EditForm">
                </SettingsEditing>
                <Settings ShowFilterRow="True" />
                <SettingsBehavior ConfirmDelete="True" />
                <SettingsText EmptyDataRow="There are no data" CommandCancel=" " CommandEdit=" " CommandNew="  " CommandSelect=" " CommandUpdate=" " CommandClearFilter="مسح"></SettingsText>
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="CusID" VisibleIndex="0" Name="CusID" ReadOnly="True" Caption="Paient ID">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn CellStyle-Font-Names="ITC" VisibleIndex="8" Caption=" " Name="data" Visible="False">

                        <EditFormSettings Visible="False" />

                        <DataItemTemplate>


                            <div class="icons">

                                <div style="float: right;">
                                    <dx:ASPxButton ID="btn_edit" CssClass="btn_edit" runat="server" AutoPostBack="False" Cursor="pointer" EnableTheming="True" RenderMode="Link" ToolTip="تعديل" UseSubmitBehavior="False">
                                        <ClientSideEvents Click="function (s, e) { 
  setTimeout(function(){gvCustomer.StartEditRow(MyIndex);},100);
}" />
                                        <Image Url="~/App_Themes/ITC_Theme/Images/edit.png" />

                                    </dx:ASPxButton>
                                    <div class="icon_line"></div>
                                </div>
                                <div style="float: right;">
                                    <dx:ASPxButton ID="btn_delete" runat="server" AutoPostBack="False" CssClass="btn_delete" Cursor="pointer" EnableTheming="True" RenderMode="Link" ToolTip="حذف" UseSubmitBehavior="False">
                                        <ClientSideEvents Click="function (s, e) { 
                                   
  pop_del0.Show();
}" />
                                        <Image Url="~/App_Themes/ITC_Theme/Images/del.png" />
                                    </dx:ASPxButton>
                                </div>

                            </div>


                        </DataItemTemplate>
                        <EditItemTemplate>
                            <br />
                            <br />
                            <br />
                            <table style="direction: ltr; width: 260px;">
                                <tr>
                                    <td>
                                        <dx:ASPxButton ID="save_btn2" CssClass="btn_egate" runat="server" AutoPostBack="False" ClientInstanceName="save_btn2" Font-Bold="True" ForeColor="#666666" Text="إلغاء" Theme="PlasticBlue" UseSubmitBehavior="False">
                                            <ClientSideEvents Click="function(s, e) {
    gvCustomer.CancelEdit();
}" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>&nbsp;

                                    </td>
                                    <td>

                                        <dx:ASPxButton ID="save_btn1" CssClass="btn_egate" runat="server" AutoPostBack="False" ClientInstanceName="save_btn1" Font-Bold="True" ForeColor="#666666" Text="حفظ" Theme="PlasticBlue" UseSubmitBehavior="False">
                                            <ClientSideEvents Click="function(s, e) {
 

    gvCustomer.UpdateEdit();
    gvCustomer.EndUpdate();  
}" />
                                        </dx:ASPxButton>



                                    </td>
                                </tr>

                            </table>

                        </EditItemTemplate>

                        <CellStyle Font-Names="ITC"></CellStyle>
                        <HeaderCaptionTemplate>
                            <dx:ASPxButton ID="btnNew3" runat="server" AutoPostBack="False" Cursor="pointer" EnableTheming="True" RenderMode="Link" ToolTip="إضافة" UseSubmitBehavior="False">
                                <ClientSideEvents Click="function (s, e) { 
  gvCustomer.AddNewRow();
}" />
                                <Image Url="~/App_Themes/ITC_Theme/Images/add.png" />
                            </dx:ASPxButton>
                        </HeaderCaptionTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Name" Name="Name" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Address" Name="Address" VisibleIndex="2">
                        <PropertiesTextEdit DisplayFormatString="yyyy">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Email" Name="Email" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Mobile" Name="Mobile" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataComboBoxColumn FieldName="Sex" Name="Sex" VisibleIndex="4">
                        <PropertiesComboBox>
                            <Items>
                                <dx:ListEditItem Text="Male" Value="Male" />
                                <dx:ListEditItem Text="FeMale" Value="FeMale" />
                            </Items>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataSpinEditColumn FieldName="Age" Name="Age" VisibleIndex="5">
                        <PropertiesSpinEdit DisplayFormatString="g">
                        </PropertiesSpinEdit>
                    </dx:GridViewDataSpinEditColumn>
                </Columns>
            </dx:ASPxGridView>

        </div>
    </div>

    <dx:ASPxPopupControl runat="server" SkinID="popControl"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        Modal="True" CloseAction="CloseButton" ClientInstanceName="pop_del0"
        HeaderText="Sure Delete" ID="pop_del0">


        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server" SupportsDisabledAttribute="True">



                <div class="popup_content">
                    <h3>Are you Sure?
                    </h3>
                </div>

                <div class="popup_buttons">

                    <table>
                        <tr>
                            <td class="popup_td">
                                <dx:ASPxButton runat="server" AutoPostBack="False" UseSubmitBehavior="False"
                                    Text="OK" CssClass="btn_egate" EnableTheming="True" ID="del_btn0">
                                    <ClientSideEvents Click="function(s, e) {
    setTimeout(function(){gvCustomer.DeleteRow(MyIndex);},100);
    pop_del0.Hide();
}"></ClientSideEvents>
                                </dx:ASPxButton>
                            </td>
                            <td class="popup_td">
                                <dx:ASPxButton runat="server" AutoPostBack="False" UseSubmitBehavior="False"
                                    Text="Cancel" CssClass="btn_egate" ID="del_cancel0">
                                    <ClientSideEvents Click="function(s, e) {
	pop_del0.Hide();
}"></ClientSideEvents>
                                </dx:ASPxButton>
                            </td>
                        </tr>
                    </table>

                </div>


            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <asp:SqlDataSource ID="DS_Cust" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DeleteCustomer" DeleteCommandType="StoredProcedure" InsertCommand="InsertCustomer" InsertCommandType="StoredProcedure" SelectCommand="GetAllCustomer" SelectCommandType="StoredProcedure" UpdateCommand="UpdateCustomer" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="CusID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CusID" Type="Int32" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Mobile" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Sex" Type="Int32" />
            <asp:Parameter Name="Age" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CusID" Type="Int32" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Mobile" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Sex" Type="Int32" />
            <asp:Parameter Name="Age" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </asp:Content>
