<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="applicant-join.aspx.cs" Inherits="ProjectJobPortal.applicant_join" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="./style/sign-up.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="signup-box">

    <div class="signup-container">
      
        <div class="signup-header">
        <h1>Sign-up As Applicant</h1>
        </div>

        <div class="signup-div">
        <h3>Username:</h3>
        <asp:TextBox ID="usernameSignup" runat="server" CssClass="signup-input"></asp:TextBox>
            <asp:Label ID="usernameErr" runat="server" ForeColor="Red" Visible="False"></asp:Label> 
        </div>
        <div class="signup-div">
        <h3>First Name:</h3>
        <asp:TextBox ID="firstNameSignup" runat="server" CssClass="signup-input"></asp:TextBox>
        <asp:Label ID="firstNameErr" runat="server" ForeColor="Red" Visible="False"></asp:Label> 
        </div>
        <div class="signup-div">
        <h3>Last Name:</h3>
        <asp:TextBox ID="lastNameSignup" runat="server" CssClass="signup-input"></asp:TextBox>
        <asp:Label ID="lastNameErr" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        </div>
        <div class="signup-div">
        <h3>Email:</h3>
        <asp:TextBox ID="emailSignup" runat="server" TextMode="Email" CssClass="signup-input"></asp:TextBox>
        <asp:Label ID="emailErr" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        </div>
        <div class="signup-div">
        <h3>Gender:</h3>
            <asp:RadioButtonList ID="genderSignup" runat="server" CssClass="signup-gender" CellSpacing="10" RepeatDirection="Horizontal">
                <asp:ListItem>Male</asp:ListItem>
                <asp:ListItem>Female</asp:ListItem>
            </asp:RadioButtonList>
            <br />
        <asp:Label ID="genderErr" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        </div>
        <div class="signup-div">
        <h3>Resume: &nbsp <span style="font-size: small">(.pdf only)</span></h3>
        <asp:FileUpload ID="resumeSignup" runat="server" />
        <asp:Label ID="resumeErr" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        </div>
        <div class="signup-div">
        <h3>Password:</h3>
        <asp:TextBox ID="passwordSignup" runat="server" TextMode="Password" CssClass="signup-input"></asp:TextBox>
        <asp:Label ID="passwordErr" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        </div>
        <div class="signup-div">
            <asp:Button  ID="btnSignup" runat="server" CssClass="header-getstarted signup-btn" Text="Sign Up" OnClick="btnSignup_Click" />
        </div>
    </div>
        <div class="signup-image">
            <h2>Join Us Today For Better Tommorow</h2>
        </div>
     </div>

    <script>
        
    </script>
</asp:Content>
