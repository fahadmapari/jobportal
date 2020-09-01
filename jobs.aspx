<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="jobs.aspx.cs" Inherits="ProjectJobPortal.jobs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/style/jobs.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <a name="top"></a>
    <div class="filtre-container">
        <div class="filtre-item">
            <h4>Filter:</h4>
        </div>
        <div class="filtre-item">
            <h4>Minimum Salary</h4>
            <asp:TextBox ID="salaryTxt" runat="server" TextMode="Number" CssClass="filtre-input"></asp:TextBox>
        </div>
        <div class="filtre-item">
            <h4>Location</h4>
            <asp:DropDownList ID="locationList" runat="server" CssClass="filtre-input">
                <asp:ListItem>Select</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="filtre-item">
            <h4>Industry</h4>
            <asp:DropDownList ID="industryList" runat="server" CssClass="filtre-input">
                <asp:ListItem>Select</asp:ListItem>
                <asp:ListItem>Automotive/Automobile/Ancillaries</asp:ListItem>
                <asp:ListItem>Banking/Accounting/Financial Services</asp:ListItem>
                <asp:ListItem>Bio Technology</asp:ListItem>
                <asp:ListItem>Chemicals and Petrochem</asp:ListItem>
                <asp:ListItem>Construction &amp; Engineering</asp:ListItem>
                <asp:ListItem>FMCG</asp:ListItem>
                <asp:ListItem>Education</asp:ListItem>
                <asp:ListItem>Entertainment/Media/Publishing</asp:ListItem>
                <asp:ListItem>Insurance</asp:ListItem>
                <asp:ListItem>ITES and BPO</asp:ListItem>
                <asp:ListItem>IT/Computers - Hardware &amp; Networking</asp:ListItem>
                <asp:ListItem>IT/Computers - Software</asp:ListItem>
                <asp:ListItem>KPO/Research/Analytics</asp:ListItem>
                <asp:ListItem>Machinery/Equipment Mfg.</asp:ListItem>
                <asp:ListItem>Oil/Gas/Petroleum</asp:ListItem>
                <asp:ListItem>Pharmaceuticals</asp:ListItem>
                <asp:ListItem>Plastic/Rubber</asp:ListItem>
                <asp:ListItem>Power and Energy</asp:ListItem>
                <asp:ListItem>Real Estate</asp:ListItem>
                <asp:ListItem>Recruitment and Staffing</asp:ListItem>
                <asp:ListItem>Retailing</asp:ListItem>
                <asp:ListItem>Telecom</asp:ListItem>
                <asp:ListItem>Advertising/PR/Events</asp:ListItem>
                <asp:ListItem>Agriculture/Dairy/Forestry/Fishing</asp:ListItem>
                <asp:ListItem>Airlines/Aviation/Aerospace</asp:ListItem>
                <asp:ListItem>Animation</asp:ListItem>
                <asp:ListItem>Architecture/Interior Design</asp:ListItem>
                <asp:ListItem>Engineering &amp; Design</asp:ListItem>
                <asp:ListItem>Escalators/Elevators</asp:ListItem>
                <asp:ListItem>Fashion/Apparels</asp:ListItem>
                <asp:ListItem>Legal/Law Firm</asp:ListItem>
                <asp:ListItem>Wellness/Fitness/Sports</asp:ListItem>
                <asp:ListItem>Beverages/Liquor</asp:ListItem>
                <asp:ListItem>Cement/Concrete/Readymix</asp:ListItem>
                <asp:ListItem>Ceramics &amp; Sanitary Ware</asp:ListItem>
                <asp:ListItem>Consulting/Advisory Services</asp:ListItem>
                <asp:ListItem>Courier/Freight/Transportation</asp:ListItem>
                <asp:ListItem>Internet/E-commerce</asp:ListItem>
                <asp:ListItem>E-Learning</asp:ListItem>
                <asp:ListItem>Electrical/Switchgears</asp:ListItem>
                <asp:ListItem>Engineering/Procurement/Construction</asp:ListItem>
                <asp:ListItem>Environmental Service</asp:ListItem>
                <asp:ListItem>Facility management</asp:ListItem>
                <asp:ListItem>Fertilizer/Pesticides</asp:ListItem>
                <asp:ListItem>Food &amp; Packaged Food</asp:ListItem>
                <asp:ListItem>Textiles/Yarn/Fabrics/Garments</asp:ListItem>
                <asp:ListItem>Gems &amp; Jewellery</asp:ListItem>
                <asp:ListItem>Glass</asp:ListItem>
                <asp:ListItem>Government/PSU/Defence</asp:ListItem>
                <asp:ListItem>Consumer Electronics/Durables/Appliances</asp:ListItem>
                <asp:ListItem>Hospitals/Healthcare/Diagnostics</asp:ListItem>
                <asp:ListItem>Heat Ventilation Air Conditioning (HVAC)</asp:ListItem>
                <asp:ListItem>Hotels/Hospitality/Restaurant</asp:ListItem>
                <asp:ListItem>General Trading/Import/Export</asp:ListItem>
                <asp:ListItem>Iron/Steel</asp:ListItem>
                <asp:ListItem>ISP</asp:ListItem>
                <asp:ListItem>Law Enforcement/Security Services</asp:ListItem>
                <asp:ListItem>Leather</asp:ListItem>
                <asp:ListItem>Market Research</asp:ListItem>
                <asp:ListItem>Medical Transcription</asp:ListItem>
                <asp:ListItem>Mining</asp:ListItem>
                <asp:ListItem>NGO/Social Services</asp:ListItem>
                <asp:ListItem>Non-Ferrous Metals (Aluminium/Zinc etc.)</asp:ListItem>
                <asp:ListItem>Office Equipment/Automation</asp:ListItem>
                <asp:ListItem>Paints</asp:ListItem>
                <asp:ListItem>Paper</asp:ListItem>
                <asp:ListItem>Printing/Packaging</asp:ListItem>
                <asp:ListItem>Public Relations (PR)</asp:ListItem>
                <asp:ListItem>Shipping/Marine Services</asp:ListItem>
                <asp:ListItem>Semiconductor</asp:ListItem>
                <asp:ListItem>Social Media</asp:ListItem>
                <asp:ListItem>Sugar</asp:ListItem>
                <asp:ListItem>Travel/Tourism</asp:ListItem>
                <asp:ListItem>Tyres</asp:ListItem>
                <asp:ListItem>Wood</asp:ListItem>
                <asp:ListItem>others</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="filtre-item">
            <h4>Minimum Experience</h4>
            <asp:DropDownList ID="experienceList" runat="server" CssClass="filtre-input">
                <asp:ListItem>0</asp:ListItem>
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>8</asp:ListItem>
                <asp:ListItem>9</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div>
            <h4 style="opacity: 0;">hello</h4>
            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="filtre-input filtre-btn-search" OnClick="LinkButton2_Click"><i class="fas fa-search"></i> Search</asp:LinkButton>
        </div>
    </div>

    <asp:Panel ID="flashPanel2" runat="server" Visible="False">
        <div class="flash-message-container flash-danger">
            <h4 class="flash-message"> No jobs found. </h4>
        </div>
    </asp:Panel>

    <div class="job-list-container">
        <asp:Repeater ID="Repeater1" runat="server" >
            <ItemTemplate>
                <div class="job-container">
            <div class="job-item">
                <asp:LinkButton ID="LinkButton1" runat="server" onClick="viewbtntwo_Click" class="job-item--jobtitle"><%#Eval("jobtitle")%></asp:LinkButton>
            </div>
            <div class="job-item salary-container">
                <h5>Salary: </h5>
                <p><i class="fas fa-rupee-sign"></i> <%#Eval("salaryFrom")%> - <i class="fas fa-rupee-sign"></i> <%#Eval("salaryTo")%></p>
              
                </div>
            
            <div class="job-item">
                <h5>job location:</h5>
                <p><%#Eval("joblocation")%></p>
            </div>
            <div class="job-item">
                <h5>Job Description:</h5>
                <p><%#Eval("aboutjob").ToString().Length>=200?Eval("aboutjob").ToString().Substring(0,199):Eval("aboutjob").ToString() %>...</p>
            </div>
            <div class="job-item">
                <h5>posted date:</h5>
                <p class="posted-date"><%#Eval("postdate")%></p>
                <asp:Label ID="Label1" runat="server" Text=<%# Eval("jobid") %> Visible="False"></asp:Label>
            </div>
            <div class="job-item view-btn-container">
                <div>
                    <asp:Button ID="Button1" runat="server" Text="View Job" cssClass="header-getstarted view-more" onClick="viewbtn_Click"/>
                </div>
            </div>
        </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <a href="#top" id="top-btn"><i class="fas fa-arrow-up"></i></a>
</asp:Content>
