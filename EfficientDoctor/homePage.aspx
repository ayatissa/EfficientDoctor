<%@ Page Title="" Language="C#" Theme="ITC_Theme" MasterPageFile="~/SiteEmp.Master" AutoEventWireup="true" CodeBehind="homePage.aspx.cs" Inherits="EfficientDoctor.homePage" %>
<%@ Register assembly="DevExpress.Web.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <style type="text/css">
        .menu_reg a {
            color:#fff !important;
        }

        .slider_main {
            display:none !important;
        }
    </style>

  
    <script type="text/javascript">
     var Check_MyGrid = 0;
     var Check_MyGrid_Delete = 0;
     var MyIndex = 0;


     function OnCancel(s, e) {
         gvBooking.CancelEdit();
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
             gvBooking.StartEditRow(MyIndex);
             Check_MyGrid = 0;
         }
         if (Check_MyGrid_Delete) {
             Check_MyGrid_Delete = 0;
         }
     }

     function OnDelete() {
         if (MyIndex != 'undefined') {
             popConfirmDelete.Hide();
             gvBooking.DeleteRow(MyIndex);
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
             gvBooking.UpdateEdit();
         }
     }


    </script>

    <div class="topy_bar">
        <div class="container topy">

        <h1 style="direction:ltr">
            Booking
        </h1>
</div>
    </div>

   


            <div class="container text-center" style="position:relative;" id="apps">



<br />


<div class="main_appsi" id="apps">


  



  <div class="grid_title_main">

                <span style="direction:ltr">
                   Booking
                </span>

            </div>

<dx:ASPxGridView ID="gvBooking" ClientInstanceName="gvBooking" runat="server" AutoGenerateColumns="False" width="100%" 
      
          Style="text-align: center" SkinID="GridView"  
         EnableRowsCache="False" DataSourceID="DS_Book" KeyFieldName="AppointmentID">
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
            <dx:GridViewDataTextColumn FieldName="AppointmentID" VisibleIndex="0" Name="AppointmentID" ReadOnly="True">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataComboBoxColumn FieldName="Categorise" Name="Categorise" VisibleIndex="1">
                <PropertiesComboBox DataSourceID="DS_Gategorise" TextField="Name" ValueField="ID">
                    <ValidationSettings CausesValidation="True" Display="Dynamic" EnableCustomValidation="True" SetFocusOnError="True" ValidationGroup="V_G">
                        <RequiredField ErrorText="Please Enter Categorise" IsRequired="True" />
                    </ValidationSettings>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataDateColumn FieldName="Date" Name="Date" VisibleIndex="2">
                <PropertiesDateEdit>
                    <ValidationSettings CausesValidation="True" Display="Dynamic" EnableCustomValidation="True" SetFocusOnError="True" ValidationGroup="V_G">
                        <RequiredField ErrorText="Please Enter Date " IsRequired="True" />
                    </ValidationSettings>
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn CellStyle-Font-Names="ITC" VisibleIndex="4" Caption=" " Name="data">

                    <PropertiesTextEdit>
                        <ValidationSettings ValidationGroup="V_G">
                        </ValidationSettings>
                    </PropertiesTextEdit>

                    <DataItemTemplate>


                        <div class="icons">

                            <div style="float: right;">
                                <dx:ASPxButton ID="btn_edit" CssClass="btn_edit" runat="server" AutoPostBack="False" Cursor="pointer" EnableTheming="True" RenderMode="Link" ToolTip="Edit" UseSubmitBehavior="False">
                                    <ClientSideEvents Click="function (s, e) { 
  setTimeout(function(){gvBooking.StartEditRow(MyIndex);},100);
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
                        <table style="direction: ltr;width: 260px;">
                            <tr>
                                <td>
                                    <dx:ASPxButton ID="save_btn2" CssClass="btn_egate"  runat="server" AutoPostBack="False" ClientInstanceName="save_btn2" Font-Bold="True" ForeColor="#666666" Text="Cancel" Theme="PlasticBlue" UseSubmitBehavior="False">
                                        <ClientSideEvents Click="function(s, e) {
    gvBooking.CancelEdit();
}" />
                                    </dx:ASPxButton>
                                </td>
                                <td>&nbsp;

                                </td>
                                <td>

                                    <dx:ASPxButton ID="save_btn1" CssClass="btn_egate"  runat="server" AutoPostBack="False" ClientInstanceName="save_btn1" Font-Bold="True" ForeColor="#666666" Text="Save" Theme="PlasticBlue" UseSubmitBehavior="False" ValidationGroup="V_G">
                                        <ClientSideEvents Click="function(s, e) {
 

    gvBooking.UpdateEdit();
    gvBooking.EndUpdate();  
}" />
                                    </dx:ASPxButton>



                                </td>
                            </tr>

                        </table>

                    </EditItemTemplate>

                    <CellStyle Font-Names="ITC"></CellStyle>
                    <HeaderCaptionTemplate>
                        <dx:ASPxButton ID="btnNew3" runat="server" AutoPostBack="False" Cursor="pointer" EnableTheming="True" RenderMode="Link" ValidationGroup="V_G" ToolTip="إضافة" UseSubmitBehavior="False">
                            <ClientSideEvents Click="function (s, e) { 
  gvBooking.AddNewRow();
}" />
                            <Image Url="~/App_Themes/ITC_Theme/Images/add.png" />
                        </dx:ASPxButton>
                    </HeaderCaptionTemplate>
                </dx:GridViewDataTextColumn>
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
                    <ValidationSettings CausesValidation="True" Display="Dynamic" EnableCustomValidation="True" SetFocusOnError="True" ValidationGroup="V_G">
                        <RequiredField ErrorText="Please Enter Time" IsRequired="True" />
                    </ValidationSettings>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
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
                                        Text="OK" CssClass="btn_egate"  EnableTheming="True" ID="del_btn0">
                                        <ClientSideEvents Click="function(s, e) {
    setTimeout(function(){gvBooking.DeleteRow(MyIndex);},100);
    pop_del0.Hide();
}"></ClientSideEvents>
                                    </dx:ASPxButton>
                                </td>
                                <td class="popup_td">
                                    <dx:ASPxButton runat="server" AutoPostBack="False" UseSubmitBehavior="False"
                                        Text="Cancel" CssClass="btn_egate"  ID="del_cancel0">
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
    <asp:SqlDataSource ID="DS_Book" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Booking] WHERE [AppointmentID] = @AppointmentID" InsertCommand="IF EXISTS (SELECT 1 FROM [Booking] WHERE [Date]=@date and [Time]=@time and Categorise=@Categorise)
BEGIN
    RAISERROR ('this appiontment has book please choose another',
             16,1)
    Return
END


INSERT INTO [Booking] ([Categorise], [Date], [Time]) 
VALUES (@Categorise, @Date, @Time)" SelectCommand="SELECT * FROM [Booking]" UpdateCommand="UPDATE [Booking] SET [Categorise] = @Categorise, [Date] = @Date, [Time] = @Time WHERE [AppointmentID] = @AppointmentID">
        <DeleteParameters>
            <asp:Parameter Name="AppointmentID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Categorise" Type="String" />
            <asp:Parameter Name="Date" Type="DateTime" />
            <asp:Parameter Name="Time" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Categorise" Type="String" />
            <asp:Parameter Name="Date" Type="DateTime" />
            <asp:Parameter Name="Time" Type="String" />
            <asp:Parameter Name="AppointmentID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="DS_Gategorise" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="GetAllGategorise" SelectCommandType="StoredProcedure">       
    </asp:SqlDataSource>
    </asp:Content>
