<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ProjectJobPortal.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="./style/testimonial.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    


            <div class="header">
                <div class="background-header">
                    <div class="header-content">
                        <h1 class="header-tagline">Find Your Dream Job/Employee With Us!</h1>
                        <asp:HyperLink ID="HyperLink1" runat="server" CssClass="header-getstarted button" data-modal="modalOne">Get Started</asp:HyperLink>
                    </div>
                </div>
            </div>


            <section class="feature-section">
                <div class="feature-heading">
                    <h2>Why Choose Us?</h2>
                </div>

                <div class="feature-cards">
                    <div class="feature-card">
                        <div>
                            <img src="./asset/mirror.svg" alt="Alternate Text" />
                        </div>
                        <div>
                            <h3>Best Career Opportunities</h3>
                        </div>
                    </div>
                    <div class="feature-card">
                         <div>
                            <img src="./asset/task.svg" alt="Alternate Text" />
                        </div>
                        <div>
                            <h3>Great Talents To Hire</h3>
                        </div>
                    </div>
                    <div class="feature-card">
                         <div>
                            <img src="./asset/response.svg" alt="Alternate Text" />
                        </div>
                        <div>
                            <h3>Fast Response To Applicants</h3>
                        </div>
                    </div>
                </div>
            </section>
            <div class="testimonial-section">
                <div class="feature-section feature-heading testi-head">
                <h2> What Our Users Are Saying About Us </h2>
                </div>
                <section id="testim" class="testim">
	
            <div class="wrap">
                <span id="right-arrow" class="arrow right fa fa-chevron-right"></span>
                <span id="left-arrow" class="arrow left fa fa-chevron-left "></span>
                <ul id="testim-dots" class="dots">
                    <li class="dot active"></li><!--
                    --><li class="dot"></li><!--
                    --><li class="dot"></li><!--
                    --><li class="dot"></li><!--
                    --><li class="dot"></li>
                </ul>
                <div id="testim-content" class="cont">
                    
                    <div class="active">
                        <div class="img"><img src="https://image.ibb.co/hgy1M7/5a6f718346a28820008b4611_750_562.jpg" alt=""></div>
                        <h2>Zoya Khan</h2>
                        <p>The easily navigated website makes your entire job search feel and look very professional. The site gave me a sense of confidence and excitement in my search. The amount and variation of job openings were surprising and fun to see. I ended up with the perfect job for me within a month!</p>                    
                    </div>

                    <div>
                        <div class="img"><img src="https://image.ibb.co/cNP817/pexels_photo_220453.jpg" alt=""></div>
                        <h2>Mr. Parulkar</h2>
                        <p>I want to thank Indeed for not only helping me get a great job but a career. Although it did take some time, they really did help me. I also liked the fact that the jobs stayed relevant to the type of career I was seeking. Me and my family truly appreciate what they are doing for me and others.</p>                    
                    </div>

                    <div>
                        <div class="img"><img src="https://image.ibb.co/iN3qES/pexels_photo_324658.jpg" alt=""></div>
                        <h2>Geeta Choudary</h2>
                        <p>Great site! Easy to use, because you're able to narrow your job search, and not waste time with jobs that don't fit you. I was impressed by the number of jobs listed, the fact that I could sort by specialty and salary range, and the adequate descriptions for each job.</p>                    
                    </div>

                    <div>
                        <div class="img"><img src="https://image.ibb.co/kL6AES/Top_SA_Nicky_Oppenheimer.jpg" alt=""></div>
                        <h2>Faraz Sayyed</h2>
                        <p>As a small business we do not have a large recruiting budget. But this website's free service has found us many amazing new hires at no cost to us. Their site is easy to use! Best job site for hiring employees - much better candidate quality compared to some of the job boards</p>                    
                    </div>

                    <div>
                        <div class="img"><img src="https://image.ibb.co/gUPag7/image.jpg" alt=""></div>
                        <h2>Mr. Ajey</h2>
                        <p>The best to me by far to job hunt. One of my favorite parts of this site is the ease of access to apply for certain jobs with their "apply" option to jobs. had all the info I was looking for when I used the service or site for my last job. It is a convenient way to find many employers and find the best for your needs.</p>
                    </div>
                </div>
            </div>

</section>
</div>

    <section class="team-section">

        <div class="feature-section feature-heading testi-head">
                    <h2>Team Behind JobPortal</h2>
                </div>

        <div class="container">
  <div class="row">
    <div class="col-12 col-sm-6 col-md-4 col-lg-3">
      <div class="our-team">
        <div class="picture">
          <img class="img-fluid" src="/asset/profile-fahad.jpg">
        </div>
        <div class="team-content">
          <h3 class="name">Fahad Mapari</h3>
          <h4 class="title">Bca Student</h4>
        </div>
        <ul class="social">
          <li><a href="https://facebook.com/fahadmapari3"  aria-hidden="true" target="_blank"><i class="fab fa-facebook"></i></a></li>
          <li><a href="https://twitter.com/maparifahad"  aria-hidden="true" target="_blank"><i class="fab fa-twitter"></i></a></li>
          <li><a href="https://instagram.com/fahadmapari"  aria-hidden="true" target="_blank"> <i class="fab fa-instagram"></i> </a></li>
        </ul>
      </div>
            </div>
      <!-- new row  -->
      <div class="col-12 col-sm-6 col-md-4 col-lg-3">
      <div class="our-team">
        <div class="picture">
          <img class="img-fluid" src="https://picsum.photos/130/130?image=1027">
        </div>
        <div class="team-content">
          <h3 class="name">Humera</h3>
          <h4 class="title">Bca Student</h4>
        </div>
        <ul class="social">
          <li><a href="https://facebook.com/"  aria-hidden="true" target="_blank"><i class="fab fa-facebook"></i></a></li>
          <li><a href="https://twitter.com/"  aria-hidden="true" target="_blank"><i class="fab fa-twitter"></i></a></li>
          <li><a href="https://instagram.com/"  aria-hidden="true" target="_blank"> <i class="fab fa-instagram"></i> </a></li>
        </ul>
      </div>
            </div>
      </div>
</div>
    </section>


            <footer>
                <div class="footer-links">
                <p><a href="/contact.aspx">contact us</a> &nbsp - &nbsp <a href="/jobs.aspx">find jobs</a></p>
                </div>
                    <p>Copyright &copy 2020 JobPortal. All Rights Reserved</p>
            </footer>

            <div id="modalOne" class="modal">
                <div class="modal-content">
                        <div class="contact-form">
                            <a class="close">&times;</a><br/>
                            <h2 style="text-align: center; margin: 0.8rem auto;">Are You?</h2>

                            <div class="modal-buttons">
                                <div>
                            <asp:HyperLink ID="HyperLink2" CssClass="header-getstarted modal-button" runat="server" NavigateUrl="~/applicant-join.aspx">An Applicant</asp:HyperLink>
                                </div>
                                <div>
                            <asp:HyperLink ID="HyperLink3" CssClass="header-getstarted modal-button" runat="server" NavigateUrl="~/employer-join.aspx">An Employer</asp:HyperLink>
                                </div>
                            </div>                     
                            </div>
                 </div>
            </div>

   
    <script src="./frontend-js/testimonial.js"></script>
</asp:Content>
