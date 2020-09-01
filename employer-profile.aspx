<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="employer-profile.aspx.cs" Inherits="ProjectJobPortal.employer_profile" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/style/profile.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="flashPanel2" runat="server" Visible="False">
        <div class="flash-message-container flash-danger">
            <h4 class="flash-message"> No user found. </h4>
        </div>
    </asp:Panel>
    <div class="profile-container">
        <div class="profile-item profile-heading">
            <h1>EMPLOYER PROFILE</h1>
        </div>
  
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <hr />
                <div class="profile-item">
                    <h4>Company Name:</h4>
                    <p class="profile-data"><%# Eval("companyname").ToString().ToUpper() %></p>
                </div>
                <hr />
                <div class="profile-item">
                    <h4>Email:</h4>
                    <p class="profile-data"><%# Eval("email") %></p>
                </div>
                <hr />
                <div class="profile-item">
                    <h4>About Company:</h4>
                    <p class="profile-data"><%# Eval("bio") %></p>
                </div>
                <hr />
                
                
            </ItemTemplate>
        </asp:Repeater>
  </div>

</asp:Content>
