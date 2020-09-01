<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="ProjectJobPortal.profile" %>
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
            <h1>PROFILE</h1>
        </div>
  
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <hr />
                <div class="profile-item">
                    <h4>First Name:</h4>
                    <p class="profile-data"><%# Eval("firstname").ToString().ToUpper() %></p>
                </div>
                <hr />
                <div class="profile-item">
                    <h4>Last Name:</h4>
                    <p class="profile-data"><%# Eval("lastname").ToString().ToUpper() %></p>
                </div>
                <hr />
                <div class="profile-item">
                    <h4>Email:</h4>
                    <p class="profile-data"><%# Eval("email") %></p>
                </div>
                <hr />
                <div class="profile-item">
                    <h4>Gender:</h4>
                    <p class="profile-data"><%# Eval("gender").ToString().ToUpper() %></p>
                </div>
                <hr />
                <div class="profile-item">
                    <h4>Resume:</h4>
                    <asp:HyperLink ID="HyperLink1" runat="server" cssClass="profile-data" NavigateUrl=<%#Eval("resumelocation")%> Target="_blank">View/Download</asp:HyperLink>
                </div>
                <hr />
            </ItemTemplate>
        </asp:Repeater>
  </div>
</asp:Content>