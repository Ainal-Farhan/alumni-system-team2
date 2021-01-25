<%-- 
    Document   : MainStaffInterface
    Created on : Dec 29, 2020, 5:52:17 PM
    Author     : Amir Syafiq
--%>

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
        
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="assets/css/main.css">
        <script src="assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    </head>
    <body>
        <nav class="navbar sticky-top navbar-dark bg-primary">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Staff Management</a>
            </div>
        </nav>
        <div class="menu-container">
            <img class="menu-container-pic" src="assets/images\UTMFabu.png">
        </div>
        
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
              <a href="ViewPageControl?option=Main Menu" class="btn btn-success">                           
                  Homepage
              </a>       
            </div>
        </table>
        
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
        
        <div class="p-3 mb-2 bg-primary text-dark">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-9">
                            <p><b>Faculty of Built Environment and Surveying,
                            <br>Universiti Teknologi Malaysia,
                            <br>UTM Skudai, 81310 Johor,
                            <br>Malaysia.</b></p>
                        </div>
                        <div class="col-sm-2">
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
    </body>
</html>
