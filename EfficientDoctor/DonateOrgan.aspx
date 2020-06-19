<%@ Page Title="" Language="C#" Theme="ITC_Theme" MasterPageFile="~/SiteEmp.Master" AutoEventWireup="true" CodeBehind="DonateOrgan.aspx.cs" Inherits="EfficientDoctor.DonateOrgan" %>

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


    

   
           <div class="container text-center" style="position:relative;" id="apps">


        <div class="main_appsi" id="apps">

            <center>
            <table>
                <tr>
                    <td>
                        <span>
                            Name
                        </span>
                        <%--<dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Name">
                            <DisabledStyle Font-Bold="True" Font-Size="Larger" ForeColor="Black">
                            </DisabledStyle>
                        </dx:ASPxLabel>--%>
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtName" runat="server" Width="170px"></dx:ASPxTextBox>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <span>
                            Mobile
                        </span>
                       <%-- <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Mobile">
                             <DisabledStyle Font-Bold="True" Font-Size="Larger" ForeColor="Black">
                            </DisabledStyle>
                        </dx:ASPxLabel>--%>
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtMobile" runat="server" Width="170px"></dx:ASPxTextBox>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <span>
                            Blood Group
                        </span>
                       <%-- <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Blood Group">
                             <DisabledStyle Font-Bold="True" Font-Size="Larger" ForeColor="Black">
                            </DisabledStyle>
                        </dx:ASPxLabel>--%>
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtBloodGroup" runat="server" Width="170px"></dx:ASPxTextBox>
                    </td>
                </tr>
                
                 <tr >
                    <td >
                        <span>
                            Organ Type
                        </span>
                        <%--<dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Organ Type">
                            <DisabledStyle Font-Bold="True" Font-Size="Larger">
                            </DisabledStyle>
                        </dx:ASPxLabel>--%>
                    </td>
                    <td>
<dx:ASPxComboBox ID="comboType" runat="server" OnSelectedIndexChanged="ASPxComboBox1_SelectedIndexChanged" TextField="Name" ValueField="ID" >
    <Items>
        <dx:ListEditItem Text="Eye" Value="Eye" />
        <dx:ListEditItem Text="Liver" Value="Liver" />
        <dx:ListEditItem Text="Kidney" Value="Kidney" />
        <dx:ListEditItem Text="Brain" Value="Brain" />
    </Items>
                        </dx:ASPxComboBox>
                    </td>
                </tr>
               
                          
                   
            </table></center>
            <br />
            <br />
            <br />
            <center>
<dx:ASPxButton ID="btn_delete" runat="server" AutoPostBack="False" CssClass="btn_delete" Cursor="pointer" EnableTheming="True" RenderMode="Link" ToolTip="Submit" UseSubmitBehavior="False" Height="100px" OnClick="btn_delete_Click" Width="300" ForeColor="Black">
                    <Image Url="~/App_Themes/ITC_Theme/Images/images.png" Width="300px" Height="100px">
                    </Image>
                    <DisabledStyle BackColor="#CCCCCC" Font-Bold="False" ForeColor="White">
                    </DisabledStyle>
                                       
                                    </dx:ASPxButton>
            </center>

        </div>
    </div>
    
    <asp:SqlDataSource ID="DS_Organ" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"  InsertCommand="INSERT INTO [Organ] ([Name], [Mobile], [BloodGroup], [CusID], [OrganType]) VALUES (@Name, @Mobile, @BloodGroup, @CusID, @OrganType)">
        
        <InsertParameters>
            <asp:ControlParameter ControlID="txtName" Name="Name" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtMobile" Name="Mobile" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtBloodGroup" Name="BloodGroup" PropertyName="Text" Type="String" />
            <asp:CookieParameter CookieName="UserIdP" Name="CusID" Type="Int32" />
            <asp:ControlParameter ControlID="comboType" Name="OrganType" PropertyName="Value" Type="String" />
        </InsertParameters>
       
        
    </asp:SqlDataSource>
    <dx:ASPxPopupControl ID="pop_del0" runat="server" ClientInstanceName="pop_del0" CloseAction="CloseButton" HeaderText="Submit Donate Organ" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" SkinID="popControl">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server" SupportsDisabledAttribute="True">
                <div class="popup_content">
                    <h3>Donate Organ Submit Sucssessfuly </h3>
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
    <br />
    
    </asp:Content>
