<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="posted-jobs.aspx.cs" Inherits="ProjectJobPortal.posted_jobs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/style/applicants.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <asp:Panel ID="flashPanel2" runat="server" Visible="False">
        <div class="flash-message-container flash-danger">
            <h4 class="flash-message"> You have not posted any jobs. </h4>
        </div>
    </asp:Panel>
    
    <div class="table-container">
        <table class="applicants-table">
            <tr>
                <th>Job Title</th>
                <th>Posted Date</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        
        <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
            <ItemTemplate>
                    <tr>
                        <td>
                            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl=<%# Eval("jobid")%> ><%# Eval("jobtitle")%></asp:HyperLink>
                        </td>
                        
                        <td>
                            <asp:Label ID="Label2" runat="server" Text=<%# Eval("postdate")%>></asp:Label>
                        </td>
                        <td>
                            <asp:HyperLink ID="HyperLink1" runat="server"><i class="fas fa-edit" style="color: green;"></i></asp:HyperLink>
                        </td>
                        <td>
                            <asp:HyperLink ID="HyperLink2" runat="server"><i class="fas fa-trash-alt" style="color: red;"></i></asp:HyperLink> 
                        </td>
                    </tr>
            </ItemTemplate>
        </asp:Repeater>
         </table>

        <div class="view-other-jobs">
            <a href="/jobs.aspx">view jobs by others</a>
        </div>
    </div>


</asp:Content>
