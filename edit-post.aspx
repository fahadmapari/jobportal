<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="edit-post.aspx.cs" Inherits="ProjectJobPortal.edit_post" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="./style/post-job.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    

    <div class="post-job-container">
        <div class="post-job-header">
            <h1>Edit Job</h1>
        </div>
        <div class="post-job-div">
            <h3>Job Title:</h3>
            <asp:TextBox ID="titleJob" runat="server" CssClass="post-job-input" ></asp:TextBox>
            <asp:Label ID="jobTitleErr" runat="server" Text="Label" ForeColor="Red" Visible="False"></asp:Label>
        </div>
        <div class="post-job-div">
            <h3>Salary:</h3>
            <asp:TextBox ID="salaryOne" runat="server" TextMode="Number" placeholder="from" CssClass="post-job-input post-job-input--salary"></asp:TextBox>
            
            <asp:TextBox ID="salaryTwo" runat="server" TextMode="Number" placeholder="to" CssClass="post-job-input post-job-input--salary"></asp:TextBox>
           <br /><asp:Label ID="jobSalaryErr" runat="server" Text="Label" ForeColor="Red" Visible="False"></asp:Label>
        </div>

        <div class="post-job-div">
            <h3>Minimum Experience: <span style="font-size: small;">(years)</span></h3>
            <asp:DropDownList ID="experienceYears" runat="server" CssClass="post-job-input">
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
        <div class="post-job-div">
            <h3>Industry:</h3>
            <asp:DropDownList ID="jobIndustry" runat="server" CssClass="post-job-input">
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
         <div class="post-job-div">
            <h3>Location:</h3>
             <asp:DropDownList ID="jobLocation" runat="server" CssClass="post-job-input"></asp:DropDownList>
        
         </div>
        <div class="post-job-div">
            <h3>About Job:</h3>
            <asp:TextBox ID="jobAbout" runat="server" TextMode="MultiLine" CssClass="post-job-input post-job-about" placeholder="Job requirements and details goes here"></asp:TextBox>
            <asp:Label ID="jobAboutErr" runat="server" Text="Label" ForeColor="Red" Visible="False"></asp:Label>
        </div>

        <div class="post-job-div">
            <asp:Button ID="postJobBtn" runat="server" CssClass="header-getstarted post-job-btn" Text="Submit Changes" OnClick="postJobBtn_Click" />
        </div>
    </div>

</asp:Content>
