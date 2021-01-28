<%-- 
    Document   : MainStaffInterface
    Created on : Dec 29, 2020, 5:52:17 PM
    Author     : Amir Syafiq
--%>

<%@page import="com.models.user.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!public interface MainStaffInterface {

	public void manageEvent();

	public void manageNews();

	public void manageCharity();

}%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Manage Interface</title>
        <link rel='stylesheet' href='style.css'/>
        
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="assets/css/bootstrap-theme.min.css"/>
        <link rel="stylesheet" href="assets/css/main.css"/>
        <script src="assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
        
        <style>
            .custom-shadow {
                box-shadow: rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
            }
            .center {
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .container-custom {
                display: block;
                margin-right: auto;
                margin-left: auto;
                width: 80%;
                padding: 10px 0 10px 150px;
            }
            .header-home {
                text-align: center;
            }
            @media only screen and (max-width: 600px) {.container-custom {padding-left: 10px; padding-top: 110px;}}
        </style>
    </head>
    <body>
        <%  if(session.getAttribute("user") != null) { %>

        <jsp:include page="../../allModules/sideNavigationBar.jsp" />
        
        <div class="container-custom">
                <div class="jumbotron">
                    <!-- Header/Home -->
                    <header class="header-home">
                        <img src="https://brand.utm.my/files/2016/08/LOGO-UTM.png" style="width:30%"><br>
                        <br><p>FACULTY OF BUILT ENVIRONMENT, UNIVERSITI TEKNOLOGI MALAYSIA</p><br>
                    </header>

        
        <%--<div class="menu-container">
            <img class="menu-container-pic" src="assets/images\UTMFabu.png">
        </div>--%>
        
        <div class="container pb-5">
            <div class="row align-items-start">
                <div class="col">
                    <div class="card p-3 mb-2 bg-light text-dark" style="width: 18rem;">
                        <img src="assets/images/forest1.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Event Management</h5>
                            <p class="card-text">Manage event page to adding, deleting or updating any event.</p>
                            <a href="ManageEventControl?option=Manage Event" class="btn btn-outline-primary">                           
                                Manage Event
                            </a>
                            <%--<form action="ManageEventControl" method="post" name="manage-event">
                                <input type="submit" class="btn btn-outline-primary btn-lg" name="button" value="Manage Event" />
                            </form>--%>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card p-3 mb-2 bg-light text-dark" style="width: 18rem;">
                        <img src="assets/images/forest1.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">News Management</h5>
                            <p class="card-text">Manage news page to adding, deleting or updating any news.</p>
                            <a href="ManageNewsControl?option=Manage News" class="btn btn-outline-primary">                           
                                Manage News
                            </a>
                            <%--<form action="ManageNewsInterface.jsp" method="post">
                                <input type="submit" class="btn btn-outline-warning btn-lg" name="button" value="Manage News" />
                            </form>--%>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card p-3 mb-2 bg-light text-dark" style="width: 18rem;">
                        <img src="assets/images/forest1.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Charity Management</h5>
                            <p class="card-text">Manage charity page to adding, deleting or updating any charity.</p>
                            <a href="ManageCharityControl?option=Manage Charity" class="btn btn-outline-primary">                           
                                Manage Charity
                            </a>
                            <%--<form action="ManageCharityInterface.jsp" method="post">
                                <input type="submit" class="btn btn-outline-success btn-lg" name="button" value="Manage Charity" />
                            </form>--%>
                        </div>
                    </div>
                </div>
                <%---<div class="col">
                    <div class="card p-3 mb-2 bg-light text-dark" style="width: 18rem;">
                        <img src="assets/images/forest1.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Charity Management</h5>
                            <p class="card-text">Manage charity page to adding, deleting or updating any charity.</p>
                            <form  action="${pageContext.request.contextPath}/ViewPageControl" method="post">
                                <input type="submit" class="btn btn-outline-success btn-lg" name="button" value="View" />
                            </form>
                        </div>
                    </div>
                </div>--%>
            </div>
            <div class="row align-items-end"></div>
        </div>

        <table border="0" align="center">
            <div class="d-grid gap-2 col-2 mx-auto pb-4">
              <a href="ViewPageControl?option=Main Menu" class="btn btn-success btn-lg">                           
                  Homepage
              </a>       
            </div>
        </table>
    </div>
</div>   
                
<%--        <div class="menu event"> 
                <div class="menu-item">
                    <form action="ManageEventInterface.jsp" method="post">
                        <input type="submit" class="buttonevent buttonhover" name="button" value="Manage Event" />
                    </form>
                    <div class="menupara">
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</p>
                    </div>
                </div>    
        </div>
        <div class="menu news">
                <div class="menu-item">
                    <form action="ManageNewsInterface.jsp" method="post">
                        <input type="submit" class="buttonnews buttonhover" name="button" value="Manage News" />
                    </form>
                    <div class="menupara">
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</p>
                    </div>
                </div>
        </div>
        <div class="menu charity">
                <div class="menu-item">
                    <form action="ManageCharityInterface.jsp" method="post">
                        <input type="submit" class="buttoncharity buttonhover" name="button" value="Manage Charity" />
                    </form>
                    <div class="menupara">
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</p>
                    </div>
                </div>   
        </div>
        <div class="menu charity">
                <div class="menu-item">
                    <form action="${pageContext.request.contextPath}/ViewPageControl" method="post">
                        <input type="submit" class="buttoncharity buttonhover" name="button" value="View" />
                    </form>
                    <div class="menupara">
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</p>
                    </div>
                </div>   
        </div>





        <div class="footer">
            <div class="footer-item footer-m">
                <div class="address">
                    <p>Faculty of Built Environment and Surveying,<br>Universiti Teknologi Malaysia,<br>UTM Skudai, 81310 Johor,<br>Malaysia.</p>
                </div>
                <div class="telephone">
                    <p>Tel: +6075557351<br>Fax: +6075566155<br>Email: fabu@utm.my</p>
                </div>
                <div class="logo">
                    <a href="https://www.facebook.com/built.surveyUTM/"><img class="sizelogo" src="images\facebook.png"></a>
                    <a href="https://www.flickr.com/photos/126408255@N08/"><img class="sizelogo" src="images\flickr.png"></a>
                    <a href="https://www.pinterest.com/fabutm/"><img class="sizelogo" src="images\Pinterest.png"></a>
                    <a href="http://www.youtube.com/user/fabutmskudai"><img class="sizelogo" src="images\Youtube.png"></a>
                </div>
            </div>
          <div class="footer-item footer-one"></div>
          <div class="footer-item footer-one"></div>
        </div>--%>
        
    <div class="fixed p-3 mb-0 bg-light text-dark">
        <div class="container">
            <div class="row">
                <div class="col-sm-9">
                    <p><b>Faculty of Built Environment and Surveying,
                    <br>Universiti Teknologi Malaysia,
                    <br>UTM Skudai, 81310 Johor,
                    <br>Malaysia.</b></p>
                </div>
                <div class="col-sm-3">
                    <p><b>Tel: +6075557351
                    <br>Fax: +6075566155
                    <br>Email: fabu@utm.my</b></p>                                             
                <div class="logo">
                    <a href="https://www.facebook.com/built.surveyUTM/"><img class="sizelogo" src="assets/images\facebook.png" width="35px" height="35px"></a>
                    <a href="https://www.flickr.com/photos/126408255@N08/"><img class="sizelogo" src="assets/images\flickr.png" width="35px" height="35px"></a>
                    <a href="https://www.pinterest.com/fabutm/"><img class="sizelogo" src="assets/images\Pinterest.png" width="35px" height="35px"></a>
                    <a href="http://www.youtube.com/user/fabutmskudai"><img class="sizelogo" src="assets/images\Youtube.png" width="35px" height="35px"></a>
                </div>
                </div>
            </div>
        </div>              
    </div>   
<%  } %>
    </body>
</html>
