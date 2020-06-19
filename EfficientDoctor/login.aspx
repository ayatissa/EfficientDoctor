<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="EfficientDoctor.login" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="dx" %>
<%@ Register Src="~/uc_Login.ascx" TagPrefix="uc1" TagName="uc_Login" %>




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

        .topy_bar {
            background-color: #17b290;
            height: 116px;
            margin-top: 66px !important;
        }

        .boxy {
            position: relative;
            text-align: right;
            color: rgb(0, 0, 0);
            padding: 10px;
            border: 1px solid rgb(23, 178, 144) !important;
            margin-bottom: 52px;
        }
    </style>





    <div class="container text-center" style="position: relative; min-height: 400px;" id="login">

        <br />
        <br />
        <br />



        <div class="grid_title_main loginso" dir="ltr" style="width: 80%; margin: 0px auto;">

            <img class="lock1" src="App_Themes/ITC_Theme/Images/lock1.png" />
            <span style="color: black; font-size: x-large;">LOG IN
            </span>
        </div>


        <div class="login_boxx">
            
                        <table style="width: 100%; direction: ltr;" class="loginsa">
                            <tr>
                                <td style="padding: 5px;" width="150" class="auto-style1"></td>
                                <td style="padding: 5px;" class="auto-style1">
                                    <dx:ASPxComboBox ID="cmbGroup" runat="server" SkinID="Combo" ValueType="System.Int32" Width="300px" HorizontalAlign="left" RightToLeft="true" SelectedIndex="0">
                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {
	
}" />
                                        <Items>
                                            <dx:ListEditItem Text="Admin" Value="1" Selected="True" />
                                            <dx:ListEditItem Text="Patient" Value="2" />
                                            <dx:ListEditItem Text="Doctor" Value="3" />
                                        </Items>
                                        <ItemStyle HorizontalAlign="Right" />
                                        <ValidationSettings Display="Dynamic">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </td>

                                <td style="padding: 5px;" class="auto-style1"></td>
                            </tr>
                            <tr>
                                <td style="padding: 5px;" width="150"><span style="color: black; font-size: x-large;">UserName
                                </span></td>
                                <td style="padding: 5px;">
                                    <dx:ASPxTextBox SkinID="Text" ID="txtUserName" runat="server" Width="300px" ClientInstanceName="txtUserName">
                                        <ValidationSettings Display="Dynamic" ValidationGroup="V_G">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>

                                <td style="padding: 5px;">
                                    <img src="App_Themes/ITC_Theme/Images/avatar.png" style="position: absolute; left: 600px; top: 20px;" class="lock2" />

                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 5px;" width="150"><span style="color: black; font-size: x-large;">Password
                                </span></td>
                                <td style="padding: 5px;">
                                    <dx:ASPxTextBox SkinID="Text" ID="txtPassword" runat="server" Password="True" Width="300px" ClientInstanceName="txtPassword">
                                        <ValidationSettings Display="Dynamic" ValidationGroup="V_G">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td style="padding: 5px;">&nbsp;</td>
                            </tr>

                            <tr>


                                <td style="padding: 5px;" width="150">
                                    <dx:ASPxButton ID="btnSave" CssClass="egateactive" runat="server" Text="Login" AutoPostBack="False" ClientInstanceName="btnSave" ValidationGroup="V_G" OnClick="btnSave_Click" UseSubmitBehavior="False">
                                       
                                    </dx:ASPxButton>

                                </td>
                                <td style="padding: 60px;">
                                    <dx:ASPxLabel SkinID="Label" ID="lblError" runat="server" ForeColor="Red" Text="An error in the user name or password" ClientInstanceName="lblError" Visible="false">
                                    </dx:ASPxLabel>
                                </td>
                                <td style="padding: 5px;">&nbsp;</td>


                            </tr>

                        </table>


                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="LogInAdmin" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtUserName" Name="UserName" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtPassword" Name="Passward" PropertyName="Text" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="LogInCus" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtUserName" Name="UserName" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtPassword" Name="Passward" PropertyName="Text" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="LogInDoctors" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtUserName" Name="UserName" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtPassword" Name="Passward" PropertyName="Text" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                   
            <dx:ASPxPopupControl runat="server" SkinID="popControl"
                PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
                Modal="True" CloseAction="CloseButton" ClientInstanceName="pop_del0"
                HeaderText="Error" ID="pop_del0">


                <ContentCollection>
                    <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server" SupportsDisabledAttribute="True">



                        <div class="popup_content">
                            <h3>An error in the user name or password
                            </h3>
                        </div>

                        <div class="popup_buttons">

                            <table>
                                <tr>

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
        </div>

    </div>

</asp:Content>
