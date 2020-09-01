<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="employer-join.aspx.cs" Inherits="ProjectJobPortal.employer_join" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="./style/sign-up.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="signup-box">

    <div class="signup-container">
      
        <div class="signup-header">
        <h1>Sign-up As Employer</h1>
        </div>

        <div class="signup-div">
        <h3>Username:</h3>
        <asp:TextBox ID="usernameSignup" runat="server" CssClass="signup-input"></asp:TextBox>
        <asp:Label ID="usernameErr" runat="server" Text="" Visible="False" ForeColor="Red"></asp:Label>
        </div>

        <div class="signup-div">
        <h3>Company Name:</h3>
        <asp:TextBox ID="companyNameSignup" runat="server" CssClass="signup-input"></asp:TextBox>
        <asp:Label ID="companyNameSignupErr" runat="server" Text="" Visible="False" ForeColor="Red"></asp:Label>
        </div>

        <div class="signup-div">
        <h3>About Company:</h3>
        <asp:TextBox ID="companyBioSignup" runat="server" CssClass="signup-input" TextMode="MultiLine"></asp:TextBox>
        <asp:Label ID="companyBioSignupErr" runat="server" Text="" Visible="False" ForeColor="Red"></asp:Label>
        </div>
       
        <div class="signup-div">
        <h3>Email:</h3>
        <asp:TextBox ID="emailSignup" runat="server" TextMode="Email" CssClass="signup-input"></asp:TextBox>
        <asp:Label ID="emailSignupErr" runat="server" Text="" Visible="False" ForeColor="Red"></asp:Label>
        </div>
     
        <div class="signup-div">
        <h3>Password:</h3>
        <asp:TextBox ID="passwordSignup" runat="server" TextMode="Password" CssClass="signup-input"></asp:TextBox>
        <asp:Label ID="passwordSignupErr" runat="server" Text="" Visible="False" ForeColor="Red"></asp:Label>
        </div>
        <div class="signup-div">
            <asp:Button ID="btnSignup" runat="server" CssClass="header-getstarted signup-btn" Text="Sign Up" OnClick="btnSignup_Click" />
        </div>
    </div>
        <div class="signup-image">
            <h2>Great Talents Are Waiting To Be Hired By You</h2>
        </div>
     </div>
</asp:Content>
