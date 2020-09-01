<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="ProjectJobPortal.contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/style/contact.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:Panel ID="flashPanel" runat="server" Visible="False">
        <div class="flash-message-container">
            <h4 class="flash-message"> Message Sent! </h4>
        </div>
    </asp:Panel>
    
    <h1>Need Some Help?</h1>
    <div class="contact-container">
        <div class="contact-content">
            <div class="contact-address">
                <h3>Address</h3>
                <p>2nd Floor, Navrang Arcade, Gokhale Rd, opposite Mc Donalds, Ambedkar Chowk, Naik Wadi, Naupada, Thane West, Thane, Maharashtra 400602</p>
            </div>
            <div class="contact-map">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6337.334087324645!2d72.97720345312436!3d19.18640412343605!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7b91ff59cd4b7%3A0x82febff8be9efdb4!2sAptech%20Computer%20Education!5e0!3m2!1sen!2sin!4v1580988792742!5m2!1sen!2sin" width="500" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>

            </div>
        </div>
        <div class="vl">

        </div>
        <div class="contact-form-container">
            <div class="contact-item">
                <h2>Contact Us</h2>
            </div>
            <div class="contact-item">
                <h4>Your Email</h4>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="contact-input" TextMode="Email"></asp:TextBox><br />
                <asp:Label ID="Label1" runat="server" Text="Label" Visible="False" ForeColor="Red"></asp:Label>
            </div>
            <div class="contact-item">
                <h4>Message: </h4>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="contact-input contact-input-msg" TextMode="MultiLine"></asp:TextBox><br />
                <asp:Label ID="Label2" runat="server" Text="Label" Visible="False" ForeColor="Red"></asp:Label>
            </div>
            <div>
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="header-getstarted send-btn" OnClick="LinkButton1_Click">Send</asp:LinkButton>
            </div>
        </div>
    </div>
</asp:Content>
