<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_Login.ascx.cs" Inherits="EfficientDoctor.uc_Login" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="dx" %>


<style type="text/css">
            /*----- Tabs -----*/
.tabs {
	width:80%;
	display:inline-block;
    margin:0 auto;
    position:relative;
}

	/*----- Tab Links -----*/
	/* Clearfix */
	.tab-links:after {
		display:block;
		clear:both;
		content:'';
	}

    .tab-links {
    direction: rtl;
    position: absolute;
    right: 190px;
    top: -46px;
}

	.tab-links li {
		margin:0px 5px;
		float:left;
		list-style:none;
	}

		.tab-links a {
    background: #74d1bc none repeat scroll 0 0;
    border-radius: 25px 25px 0 0;
    color: #ffffff;
    display: inline-block;
    font-size: 14px;
    font-weight: 100;
    padding: 11px 45px;
    transition: all 0.15s linear 0s;
}

		.tab-links a:hover {
			background:#74d1bc;
			text-decoration:none;
		}

	li.active a, li.active a:hover {
		background:#fff;
		color:#17B290;
	}

	/*----- Content of Tabs -----*/
	.tab-content {
		padding:15px;
		border-bottom-right-radius:25px;
        border-bottom-left-radius:25px;
		background:#fff;
        border-left:1px solid #17b290 !important;
        border-right:1px solid #17b290 !important;
        border-bottom:1px solid #17b290 !important;
	}

		.tab {
			display:none;
		}

		.tab.active {
			display:block;
		}

       






            @media screen and (max-width : 768px) {
                .lock2 {
                    display:none;
                }

                                .ul_sid li a {
                    color: #fff !important;
                }

                .tab-links a {
    font-size: 11px !important;
    padding: 6px 10px;
    position: relative;
    top: 10px;
}

                .loginso {
    margin-top: 40px !important;
    width: 80% !important;
}

                .grid_title_main loginso span {
                    display:none;
                }

                .lock1 {
                    display:none;
                }

                .tab-links a {
    font-size: 11px !important;
    padding: 6px 10px;
    position: relative;
    top: 10px;
}

            }
     
        </style>



    <div>

        <div class="login_boxx">


            <img src="App_Themes/ITC_Theme/Images/lock2.png" style="position: absolute; left: 100px; top: 20px;" class="lock2" />


            <table style="width: 100%; direction: rtl;" class="loginsa">
                <tr>
                    <td style="padding: 5px;" width="150"></td>
                    <td style="padding: 5px;">
                        <dx:ASPxComboBox ID="cmbGroup" runat="server" SkinID="Combo" ValueType="System.Int32" Width="300px" HorizontalAlign="Right" RightToLeft="True">
                            <Items>
                                <dx:ListEditItem Text="admin" Value="1" />
                                <dx:ListEditItem Text="doctor" Value="2" />
                                <dx:ListEditItem Text="patient" Value="3" />
                              
                            </Items>
                            <ItemStyle HorizontalAlign="Right" />
                            <ValidationSettings Display="Dynamic">
                                <RequiredField IsRequired="True" />
                            </ValidationSettings>
                        </dx:ASPxComboBox>
                    </td>

                    <td style="padding: 5px;">&nbsp;</td>
                </tr>
                
                 <tr>
                    <td style="padding: 5px;" width="150">username</td>
                    <td style="padding: 5px;">
                        <dx:ASPxTextBox SkinID="Text" ID="txtUserName" runat="server" Width="300px">
                            <ValidationSettings Display="Dynamic" ValidationGroup="V_G1">
                                <RequiredField IsRequired="True" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </td>

                    <td style="padding: 5px;">&nbsp;</td>
                </tr>
                <tr>
                    <td style="padding: 5px;" width="150">passward</td>
                    <td style="padding: 5px;">
                        <dx:ASPxTextBox SkinID="Text" ID="txtPassword" runat="server" Password="True" Width="300px">
                            <ValidationSettings Display="Dynamic" ValidationGroup="V_G1">
                                <RequiredField IsRequired="True" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </td>
                    <td style="padding: 5px;">&nbsp;</td>
                </tr>
                <tr>
                    <td style="padding: 5px;" colspan="3">
                        <dx:ASPxLabel SkinID="Label" ID="lblError" runat="server" ForeColor="Red">
                        </dx:ASPxLabel>
                    </td>


                </tr>
                <tr>

                    <td style="padding: 5px;" colspan="3">
                        <div style="float: right;">
                        <dx:ASPxButton ID="btnSave" CssClass="egateactive" runat="server" Text="login" AutoPostBack="True" ClientInstanceName="btnSave" ValidationGroup="V_G1" OnClick="btnSave_Click" UseSubmitBehavior="False">
                        </dx:ASPxButton>
                            </div>
                    </td>


                </tr>
            </table>


        </div>



    </div>