<%@ Page Title="" Language="C#" Theme="ITC_Theme" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="EfficientDoctor.Feedback" %>

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

            <h1 style="direction: ltr;color:black;">Feedback
            </h1>
        </div>
    </div>
           <div class="container text-center" style="position:relative; top: 0px; left: 0px;" id="apps">



<br />


        <div class="main_appsi" id="apps">

            <div class="grid_title_main">

                <span style="direction: ltr;color:black;">Feedback
                </span>

            </div>

            <dx:ASPxGridView ID="gvSearchOrgan" ClientInstanceName="gvSearchOrgan" runat="server" AutoGenerateColumns="False" Width="100%"
                Style="text-align: center" SkinID="GridView"
                EnableRowsCache="False" DataSourceID="DS_Feedback">

                <SettingsEditing Mode="EditForm">
                </SettingsEditing>
                <Settings ShowFilterRow="True" />
                <SettingsBehavior ConfirmDelete="True" />
                <SettingsText EmptyDataRow="There are no data" CommandCancel=" " CommandEdit=" " CommandNew="  " CommandSelect=" " CommandUpdate=" " CommandClearFilter="مسح"></SettingsText>
                <Columns>
                    <dx:GridViewDataDateColumn FieldName="Date" VisibleIndex="0">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="Feed" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn CellStyle-Font-Names="ITC" VisibleIndex="2" FieldName="customer">

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
    setTimeout(function(){gvSearchOrgan.DeleteRow(MyIndex);},100);
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
    <asp:SqlDataSource ID="DS_Feedback" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="select f.[Date],f.Feed,c.Name as customer from Feedback F,Customer C where f.CusID=c.CusID
" DeleteCommand="DELETE FROM [FeedBack] WHERE [ID] = @ID" InsertCommand="INSERT INTO [FeedBack] ([CusID], [Feed], [Date]) VALUES (@CusID, @Feed, @Date)" UpdateCommand="UPDATE [FeedBack] SET [CusID] = @CusID, [Feed] = @Feed, [Date] = @Date WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CusID" Type="Int32" />
            <asp:Parameter Name="Feed" Type="String" />
            <asp:Parameter Name="Date" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CusID" Type="Int32" />
            <asp:Parameter Name="Feed" Type="String" />
            <asp:Parameter Name="Date" Type="DateTime" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </asp:Content>
