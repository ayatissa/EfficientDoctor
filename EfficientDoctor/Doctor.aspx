<%@ Page Title="" Language="C#" Theme="ITC_Theme" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Doctor.aspx.cs" Inherits="EfficientDoctor.Doctor" %>

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
            gvDoctor.CancelEdit();
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
                gvDoctor.StartEditRow(MyIndex);
                Check_MyGrid = 0;
            }
            if (Check_MyGrid_Delete) {
                Check_MyGrid_Delete = 0;
            }
        }

        function OnDelete() {
            if (MyIndex != 'undefined') {
                popConfirmDelete.Hide();
                gvDoctor.DeleteRow(MyIndex);
            }
            else {
                popConfirmDelete.Show();
            }
        }

        function OnCancelDelete(s, e) {
            popConfirmDelete.Hide();
        }

        function OnSave(s, e) {
            if (ASPxClientEdit.ValidateGroup('Doctor')) {
                gvDoctor.UpdateEdit();
            }
        }


    </script>

    <div class="topy_bar">
        <div class="container topy">

            <h1 style="direction: ltr;color:black;">Doctor
            </h1>
        </div>
    </div>
           <div class="container text-center" style="position:relative;" id="apps">



<br />


        <div class="main_appsi" id="apps">

            <div class="grid_title_main">

                <span style="direction: ltr;color:black;">Doctor
                </span>

            </div>

            <dx:ASPxGridView ID="gvDoctor" ClientInstanceName="gvDoctor" runat="server" AutoGenerateColumns="False" Width="100%"
                Style="text-align: center" SkinID="GridView"
                EnableRowsCache="False" DataSourceID="SqlDataSource1" KeyFieldName="DocID">
                 <ClientSideEvents RowClick="function(s, e) {
                  MyIndex = e.visibleIndex;
                }" Init="function(s, e) {
	gvDoctor.Refresh();
}"></ClientSideEvents>
                <SettingsEditing Mode="EditForm">
                </SettingsEditing>
                <Settings ShowFilterRow="True" />
                <SettingsBehavior ConfirmDelete="True" />
                <SettingsText EmptyDataRow="There are no data" CommandCancel=" " CommandEdit=" " CommandNew="  " CommandSelect=" " CommandUpdate=" " CommandClearFilter="مسح"></SettingsText>
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="DocID" VisibleIndex="0" Name="DocID" ReadOnly="True">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn CellStyle-Font-Names="ITC" VisibleIndex="8" Caption=" " Name="data">

                        <PropertiesTextEdit>
                            <ValidationSettings ValidationGroup="V_G">
                            </ValidationSettings>
                        </PropertiesTextEdit>

                        <DataItemTemplate>


                            <div class="icons">

                                <div style="float: right;">
                                    <dx:ASPxButton ID="btn_edit" CssClass="btn_edit" runat="server" AutoPostBack="False" Cursor="pointer" EnableTheming="True" RenderMode="Link" ToolTip="تعديل" UseSubmitBehavior="False">
                                        <ClientSideEvents Click="function (s, e) { 
  setTimeout(function(){gvDoctor.StartEditRow(MyIndex);},100);
}" />
                                        <Image Url="~/App_Themes/ITC_Theme/Images/edit.png" />

                                    </dx:ASPxButton>
                                    <div class="icon_line"></div>
                                </div>
                                <div style="float: right;">
                                    <dx:ASPxButton ID="btn_delete" runat="server" AutoPostBack="False" CssClass="btn_delete" Cursor="pointer" EnableTheming="True" RenderMode="Link" ToolTip="Delete" UseSubmitBehavior="False">
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
                                        <dx:ASPxButton ID="save_btn2" CssClass="btn_egate" runat="server" AutoPostBack="False" ClientInstanceName="save_btn2" Font-Bold="True" ForeColor="#666666" Text="Cancel" Theme="PlasticBlue" UseSubmitBehavior="False">
                                            <ClientSideEvents Click="function(s, e) {
    gvDoctor.CancelEdit();
}" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>&nbsp;

                                    </td>
                                    <td>

                                        <dx:ASPxButton ID="save_btn1" CssClass="btn_egate" runat="server" AutoPostBack="False"  ValidationGroup="V_G" ClientInstanceName="save_btn1" Font-Bold="True" ForeColor="#666666" Text="Save" Theme="PlasticBlue" UseSubmitBehavior="False">
                                            <ClientSideEvents Click="function(s, e) {
 

    gvDoctor.UpdateEdit();
    gvDoctor.EndUpdate();  
}" />
                                        </dx:ASPxButton>



                                    </td>
                                </tr>

                            </table>

                        </EditItemTemplate>

                        <CellStyle Font-Names="ITC"></CellStyle>
                        <HeaderCaptionTemplate>
                            <dx:ASPxButton ID="btnNew3" runat="server" AutoPostBack="False" Cursor="pointer" EnableTheming="True" RenderMode="Link" ToolTip="إضافة" UseSubmitBehavior="False" ValidationGroup="V_G">
                                <ClientSideEvents Click="function (s, e) { 
  gvDoctor.AddNewRow();
}" />
                                <Image Url="~/App_Themes/ITC_Theme/Images/add.png" />
                            </dx:ASPxButton>
                        </HeaderCaptionTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Name" Name="Name" VisibleIndex="1">
                        <PropertiesTextEdit>
                            <ValidationSettings CausesValidation="True" Display="Dynamic" EnableCustomValidation="True" SetFocusOnError="True" ValidationGroup="V_G">
                                <RequiredField ErrorText="PLease Enter Name" IsRequired="True" />
                            </ValidationSettings>
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Address" Name="Address" VisibleIndex="2">
                        <PropertiesTextEdit DisplayFormatString="yyyy">
                            <ValidationSettings CausesValidation="True" Display="Dynamic" EnableCustomValidation="True" SetFocusOnError="True" ValidationGroup="V_G">
                                <RequiredField ErrorText="Please Enter Address" IsRequired="True" />
                            </ValidationSettings>
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Email" Name="Email" VisibleIndex="6">
                        <PropertiesTextEdit>
                             <ValidationSettings Display="Dynamic" ValidationGroup="V_G" CausesValidation="True" EnableCustomValidation="True" SetFocusOnError="True">
                                <RegularExpression ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorText=" Email Error ( Email Must Be Like ___@___ . ___ )" />
                                <RequiredField IsRequired="True" ErrorText="Please Enter Email" />
                            </ValidationSettings>
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Mobile" Name="Mobile" VisibleIndex="3">
                        <PropertiesTextEdit>
                            <ValidationSettings CausesValidation="True" Display="Dynamic" EnableCustomValidation="True" SetFocusOnError="True" ValidationGroup="V_G">
                                <RequiredField ErrorText="Please Enter Mobile" IsRequired="True" />
                            </ValidationSettings>
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataComboBoxColumn FieldName="Sex" Name="Sex" VisibleIndex="4">
                        <PropertiesComboBox>
                            <Items>
                                <dx:ListEditItem Text="Male" Value="1" />
                                <dx:ListEditItem Text="FeMale" Value="2" />
                            </Items>
                            <ValidationSettings CausesValidation="True" Display="Dynamic" EnableCustomValidation="True" SetFocusOnError="True" ValidationGroup="V_G">
                                <RequiredField ErrorText="Please Enter Sex" IsRequired="True" />
                            </ValidationSettings>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="Gategorise" Name="Gategorise" VisibleIndex="7">
                        <PropertiesComboBox DataSourceID="DS_Gategorise" TextField="Name" ValueField="ID">
                            <ValidationSettings CausesValidation="True" Display="Dynamic" EnableCustomValidation="True" SetFocusOnError="True" ValidationGroup="V_G">
                                <RequiredField ErrorText="Please Enter Gategorise" IsRequired="True" />
                            </ValidationSettings>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn FieldName="Age" Name="Age" VisibleIndex="5">
                        <PropertiesTextEdit DisplayFormatString="g">
                             <ValidationSettings Display="Dynamic" ValidationGroup="V_G" CausesValidation="True" EnableCustomValidation="True" SetFocusOnError="True">
                              <RegularExpression ValidationExpression="^\d{1,2}$" ErrorText="Only 2 digit numbers are valid" />                                <RequiredField IsRequired="True" ErrorText="Please Enter Age" />
                            </ValidationSettings>
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
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
    setTimeout(function(){gvDoctor.DeleteRow(MyIndex);},100);
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
    <asp:SqlDataSource ID="DS_Doc" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DeleteDoctor" DeleteCommandType="StoredProcedure" InsertCommand="InsertDoctor" InsertCommandType="StoredProcedure" SelectCommand="GetAllDoctor" SelectCommandType="StoredProcedure" UpdateCommand="UpdateDoctor" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="DocID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DocID" Type="Int32" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Mobile" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Sex" Type="Int32" />
            <asp:Parameter Name="Age" Type="Int32" />
            <asp:Parameter Name="Gategorise" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="DocID" Type="Int32" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Mobile" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Sex" Type="Int32" />
            <asp:Parameter Name="Age" Type="Int32" />
            <asp:Parameter Name="Gategorise" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Doctors] WHERE [DocID] = @DocID" InsertCommand="INSERT INTO [Doctors] ([Name], [Address], [Mobile], [Email], [Sex], [Age], [Gategorise]) VALUES (@Name, @Address, @Mobile, @Email, @Sex, @Age, @Gategorise)" SelectCommand="SELECT * FROM [Doctors]" UpdateCommand="UPDATE [Doctors] SET [Name] = @Name, [Address] = @Address, [Mobile] = @Mobile, [Email] = @Email, [Sex] = @Sex, [Age] = @Age, [Gategorise] = @Gategorise WHERE [DocID] = @DocID">
        <DeleteParameters>
            <asp:Parameter Name="DocID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Mobile" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Sex" Type="Int32" />
            <asp:Parameter Name="Age" Type="Int32" />
            <asp:Parameter Name="Gategorise" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Mobile" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Sex" Type="Int32" />
            <asp:Parameter Name="Age" Type="Int32" />
            <asp:Parameter Name="Gategorise" Type="Int32" />
            <asp:Parameter Name="DocID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="DS_Gategorise" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="GetAllGategorise" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
