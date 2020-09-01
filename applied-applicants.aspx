<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="applied-applicants.aspx.cs" Inherits="ProjectJobPortal.applied_applicants" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/style/applicants.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:Panel ID="flashPanel2" runat="server" Visible="False">
        <div class="flash-message-container flash-danger">
            <h4 class="flash-message"> you don't have any applicants yet</h4>
        </div>
    </asp:Panel>
    
    <div class="table-container">
        <table class="applicants-table">
            <tr>
                <th>Job Title</th>
                <th>Applicant Name</th>
                <th>Email</th>
                <th>Gender</th>
                <th>Resume</th>
            </tr>
        
        <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
            <ItemTemplate>
                    <tr>
                        <td>
                            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl=<%# Eval("jobid")%> ><%# Eval("jobtitle")%></asp:HyperLink>
                        </td>
                        <td>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl=<%# Eval("username")%>><%# Eval("firstname")%>&nbsp<%# Eval("lastname")%></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text=<%# Eval("email")%>></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text=<%# Eval("gender")%>></asp:Label>
                        </td>
                        <td>
                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl=<%# Eval("resumelocation")%> Target="_blank">View/Download</asp:HyperLink>
                        </td>
                    </tr>
            </ItemTemplate>
        </asp:Repeater>
         </table>
    </div>
</asp:Content>
