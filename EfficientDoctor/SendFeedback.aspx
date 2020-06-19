<%@ Page Title="" Language="C#" Theme="ITC_Theme" MasterPageFile="~/SiteEmp.Master" AutoEventWireup="true" CodeBehind="SendFeedback.aspx.cs" Inherits="EfficientDoctor.SendFeedback" %>

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
            <center>
            <dx:ASPxMemo ID="ASPxMemo1" runat="server" Height="200px" Width="500px"></dx:ASPxMemo>
                
                <dx:ASPxButton ID="btn_delete" runat="server" AutoPostBack="False" CssClass="btn_delete" Cursor="pointer" EnableTheming="True" RenderMode="Link" ToolTip="Send Feedback" UseSubmitBehavior="False" Height="30px" OnClick="btn_delete_Click" Width="100px" ForeColor="Black">
                    <Image Url="~/App_Themes/ITC_Theme/Images/send_feedback.png">
                    </Image>
                    <DisabledStyle BackColor="#CCCCCC" Font-Bold="False" ForeColor="White">
                    </DisabledStyle>
                                       
                                    </dx:ASPxButton>
            </center>

        </div>
    </div>
    
    <asp:SqlDataSource ID="DS_Feedback" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [FeedBack]" DeleteCommand="DELETE FROM [FeedBack] WHERE [ID] = @ID" InsertCommand="INSERT INTO [FeedBack] ([CusID], [Feed], [Date]) VALUES (@CusID, @Feed, @Date)" UpdateCommand="UPDATE [FeedBack] SET [CusID] = @CusID, [Feed] = @Feed, [Date] = @Date WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:CookieParameter CookieName="UserIdP" Name="CusID" Type="Int32" />
            <asp:ControlParameter ControlID="ASPxMemo1" Name="Feed" PropertyName="Text" Type="String" />
            <asp:Parameter Name="Date" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CusID" Type="Int32" />
            <asp:Parameter Name="Feed" Type="String" />
            <asp:Parameter Name="Date" Type="DateTime" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <dx:ASPxPopupControl ID="pop_del0" runat="server" ClientInstanceName="pop_del0" CloseAction="CloseButton" HeaderText="Send Feedback" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" SkinID="popControl">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server" SupportsDisabledAttribute="True">
                <div class="popup_content">
                    <h3>Feedback Send Sucssessfuly </h3>
                </div>
                <div class="popup_buttons">
                    <table>
                        <tr>
                            <td class="popup_td">
                             
                            </td>
                        </tr>
                    </table>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    </asp:Content>
