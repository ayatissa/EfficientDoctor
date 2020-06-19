<%@ Page Title="" Language="C#" Theme="ITC_Theme" MasterPageFile="~/Site.Mobile.master" AutoEventWireup="true" CodeBehind="MyDetailsD.aspx.cs" Inherits="EfficientDoctor.MyDetailsD" %>

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
            gvDetails.CancelEdit();
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
                gvDetails.StartEditRow(MyIndex);
                Check_MyGrid = 0;
            }
            if (Check_MyGrid_Delete) {
                Check_MyGrid_Delete = 0;
            }
        }

        function OnDelete() {
            if (MyIndex != 'undefined') {
                popConfirmDelete.Hide();
                gvDetails.DeleteRow(MyIndex);
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
                gvDetails.UpdateEdit();
            }
        }


    </script>

    <div class="topy_bar">
        <div class="container topy">

            <h1 style="direction: ltr">My Details
            </h1>
        </div>
    </div>
           <div class="container text-center" style="position:relative;" id="apps">



<br />


        <div class="main_appsi" id="apps">

            <div class="grid_title_main">

                <span style="direction: ltr">My Details
                </span>

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
    setTimeout(function(){gvDetails.DeleteRow(MyIndex);},100);
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

            <dx:ASPxGridView ID="gvDetails" ClientInstanceName="gvDetails" runat="server" AutoGenerateColumns="False" Width="100%"
                Style="text-align: center" SkinID="GridView"
                EnableRowsCache="False" DataSourceID="DS_Details" KeyFieldName="DocID">
                 <ClientSideEvents RowClick="function(s, e) {
                  MyIndex = e.visibleIndex;
                }" Init="function(s, e) {
	gvDetails.Refresh();
}"></ClientSideEvents>
                <SettingsEditing Mode="EditForm">
                </SettingsEditing>
                <SettingsBehavior ConfirmDelete="True" />
                <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
                <SettingsText EmptyDataRow="There are no data" CommandCancel=" " CommandEdit=" " CommandNew="  " CommandSelect=" " CommandUpdate=" " CommandClearFilter="مسح"></SettingsText>
                <Columns>
                    <dx:GridViewCommandColumn VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="DocID" VisibleIndex="1" ReadOnly="True">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn CellStyle-Font-Names="ITC" VisibleIndex="8" Caption=" " Name="data">

                        <DataItemTemplate>


                            <div class="icons">

                                <div style="float: right;">
                                    <dx:ASPxButton ID="btn_edit" CssClass="btn_edit" runat="server" AutoPostBack="False" Cursor="pointer" EnableTheming="True" RenderMode="Link" ToolTip="تعديل" UseSubmitBehavior="False">
                                        <ClientSideEvents Click="function (s, e) { 
  setTimeout(function(){gvDetails.StartEditRow(MyIndex);},100);
}" />
                                        <Image Url="~/App_Themes/ITC_Theme/Images/edit.png" />

                                    </dx:ASPxButton>
                                    <div class="icon_line"></div>
                                </div>
                                <div style="float: right;">
                                    <dx:ASPxButton ID="btn_delete" runat="server" AutoPostBack="False" CssClass="btn_delete" Cursor="pointer" EnableTheming="True" RenderMode="Link" ToolTip="Delete" UseSubmitBehavior="False" Visible="False">
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
    gvDetails.CancelEdit();
}" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>&nbsp;

                                    </td>
                                    <td>

                                        <dx:ASPxButton ID="save_btn1" CssClass="btn_egate" runat="server" AutoPostBack="False" ClientInstanceName="save_btn1" Font-Bold="True" ForeColor="#666666" Text="Save" Theme="PlasticBlue" UseSubmitBehavior="False">
                                            <ClientSideEvents Click="function(s, e) {
 

    gvDetails.UpdateEdit();
    gvDetails.EndUpdate();  
}" />
                                        </dx:ASPxButton>



                                    </td>
                                </tr>

                            </table>

                        </EditItemTemplate>

                        <CellStyle Font-Names="ITC"></CellStyle>
                        <HeaderCaptionTemplate>
                            <dx:ASPxButton ID="btnNew3" runat="server" AutoPostBack="False" Cursor="pointer" EnableTheming="True" RenderMode="Link" ToolTip="إضافة" UseSubmitBehavior="False" Visible="False">
                                <ClientSideEvents Click="function (s, e) { 
  gvDetails.AddNewRow();
}" />
                                <Image Url="~/App_Themes/ITC_Theme/Images/add.png" />
                            </dx:ASPxButton>
                        </HeaderCaptionTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn CellStyle-Font-Names="ITC" VisibleIndex="2" FieldName="Name">

<CellStyle Font-Names="ITC"></CellStyle>

                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn CellStyle-Font-Names="ITC" VisibleIndex="3" FieldName="Address">

<CellStyle Font-Names="ITC"></CellStyle>

                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Mobile" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="Gategorise" VisibleIndex="7">
                        <PropertiesComboBox DataSourceID="DS_Gategorise" TextField="Name" ValueField="ID">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                </Columns>
            </dx:ASPxGridView>

        </div>
    </div>

    <asp:SqlDataSource ID="DS_Details" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [DocID], [Name], [Address], [Mobile], [Gategorise] FROM [Doctors] where DocID=@DocID" DeleteCommand="DELETE FROM [Doctors] WHERE [DocID] = @DocID" InsertCommand="INSERT INTO [Doctors] ([Name], [Address], [Mobile], [Gategorise]) VALUES (@Name, @Address, @Mobile, @Gategorise)" UpdateCommand="UPDATE [Doctors] SET [Name] = @Name, [Address] = @Address, [Mobile] = @Mobile, [Gategorise] = @Gategorise WHERE [DocID] = @DocID">
        <DeleteParameters>
            <asp:Parameter Name="DocID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Mobile" Type="String" />
            <asp:Parameter Name="Gategorise" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:CookieParameter CookieName="UserIdD" Name="DocID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Mobile" Type="String" />
            <asp:Parameter Name="Gategorise" Type="Int32" />
            <asp:Parameter Name="DocID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="DS_Gategorise" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="GetAllGategorise" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <br />
    </asp:Content>
