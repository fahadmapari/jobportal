<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ProjectJobPortal.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="./style/login.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="flashPanel" runat="server" Visible="False">
        <div class="flash-message-container">
            <h4 class="flash-message">Signup Successful! Now You Can Login</h4>
        </div>
    </asp:Panel>
    
    <div class="login-container">
        <div class="login-applicant--box">
            <div class="login-header">
                <h1>Applicant Login</h1>
            </div>
            <div class="login-div">
                <h2>Username:</h2>
                <asp:TextBox ID="applicantUsernametxt" runat="server" CssClass="login-input" TextMode="SingleLine"></asp:TextBox>
                <br />
                <asp:Label ID="applicantUsernameErr" runat="server" ForeColor="Red" Visible="False"></asp:Label>
            </div>
            <div class="login-div">
                <h2>Password:</h2>
                <asp:TextBox ID="applicantPasswordtxt" runat="server" CssClass="login-input" TextMode="Password"></asp:TextBox>
                <br />
                <asp:Label ID="applicantPasswordErr" runat="server" ForeColor="Red" Visible="False"></asp:Label>
            </div>
            <div class="signup-div">
            <asp:Button ID="Button1" runat="server" CssClass="header-getstarted login-btn" Text="Login" OnClick="Button1_Click" />
        </div>
        </div>
        <div class="login-employer--box">
            <div class="login-header">
                <h1>Employer Login</h1>
            </div>
            <div class="login-div">
                <h2>Username:</h2>
                <asp:TextBox ID="employerUsernametxt" runat="server" CssClass="login-input" TextMode="SingleLine"></asp:TextBox>
                <br />
                <asp:Label ID="employerUsernameErr" runat="server" ForeColor="Red" Visible="False"></asp:Label>
            </div>
            <div class="login-div">
                <h2>Password:</h2>
                <asp:TextBox ID="employerPasswordtxt" runat="server" CssClass="login-input" TextMode="Password"></asp:TextBox>
                <br />
                <asp:Label ID="employerPasswordErr" runat="server" ForeColor="Red" Visible="False"></asp:Label>
            </div>
            <div class="signup-div">
            <asp:Button ID="Button2" runat="server" CssClass="header-getstarted login-btn" Text="Login" OnClick="Button2_Click" />
        </div>
        </div>
    </div>
    
</asp:Content>
