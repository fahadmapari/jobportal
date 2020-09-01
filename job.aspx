<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="job.aspx.cs" Inherits="ProjectJobPortal.job" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/style/job.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:Panel ID="flashPanel" runat="server" Visible="False">
        <div class="flash-message-container">
            <h4 class="flash-message"> Applied to job successfully! </h4>
        </div>
    </asp:Panel>

    <asp:Panel ID="flashPanel2" runat="server" Visible="False">
        <div class="flash-message-container flash-danger">
            <h4 class="flash-message"> You have already applied to this job. </h4>
        </div>
    </asp:Panel>
    
    <div class="job-container-box">
            <asp:Repeater ID="Repeater1" runat="server" >
            <ItemTemplate>
                <div class="job-container">
                <div class="job-item">
                    <h1 class="job-item--jobtitle">
                    <%#Eval("jobtitle")%>
                    </h1>
                    <p><%#Eval("companyname")%></p>
                </div>
            <div class="job-item salary-container">
                <h4>Salary: </h4>
                <p><i class="fas fa-rupee-sign"></i> <%#Eval("salaryFrom")%> - <i class="fas fa-rupee-sign"></i> <%#Eval("salaryTo")%></p>
              
                </div>
            
            <div class="job-item">
                <h4>job location:</h4>
                <p><%#Eval("joblocation")%></p>
            </div>
            <div class="job-item">
                <h4>industry:</h4>
                <p><%#Eval("industry")%></p>
            </div>
            <div class="job-item">
                <h4>Minimum Experience Required:</h4>
                <p><%#Eval("experience")%> years</p>
            </div>
            <div class="job-item">
                <h4>Job Description:</h4>
                <p><%# ((string)Eval("aboutjob")).Replace("\n", "<br/>") %></p>
            </div>
            <div class="job-item">
                <h4>posted date: </h4>
                <p class="posted-date"><%#Eval("postdate")%></p>
                <asp:Label ID="Label1" runat="server" Text=<%# Eval("jobid") %> Visible="False"></asp:Label>
                <asp:Label ID="Label2" runat="server" Text=<%# Eval("postedby") %> Visible="False"></asp:Label>
            </div>
            <div class="job-item view-btn-container">
                <div>
                    <asp:Button ID="Button1" runat="server" Text="Apply" cssClass="header-getstarted view-more" onClick="applybtn_Click"/>
                </div>
            </div>
            </ItemTemplate>
            </asp:Repeater>
    </div>
</asp:Content>
