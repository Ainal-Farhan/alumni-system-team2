<%-- 
    Document   : ViewNewsInterface
    Created on : Dec 29, 2020, 5:55:07 PM
    Author     : Amir Syafiq
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Base64"%>
<%@page import="com.models.event.*"%>
<%@page import="com.controllers.event.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! ManageNewsControl MCC = new ManageNewsControl(); %>
<%! News news = new News(); %>

<%!public interface ViewNewsInterface {

	public void returnAllSavedNews();

	public void selectNews();

	public void returnSavedNews();

}%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' href='style.css'/>
        <title>View News</title>
        <link rel='stylesheet' href='style.css'/>
        
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="assets/css/main.css">
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
        
        <% 
        String message = (String)session.getAttribute("alertMsg");
        %>

        <% if(!message.equals("no")){ %>
            <script type="text/javascript">
            var msg = "<%=message%>";
            alert(msg);
        </script>
        <%}%>
            <%ArrayList<News> newslist = (ArrayList<News>)session.getAttribute("newslistupdate");%>
            
            <%
                int i=0;
            %>
            
        <form  name="ViewNewsInterface" action="${pageContext.request.contextPath}/ViewPageControl" method="post">
        <div class="container pb-5">
            <div class="row align-items-start justify-content-center"><h2>View News</h2></div>
            <div class="row align-items-center pt-4 justify-content-center">
                <div class="col">
                    <div class="card p-3 mb-2 bg-light text-dark justify-content-center" style="width: auto;">
                        <div class="card-body">
                            <h5 class="card-title" style="color: blue"><b><%=((News)newslist.get(i)).getNewsTitle()%></b></h5>
                            <p class="card-text"><b>Category:</b> <%=((News)newslist.get(i)).getNewsCategory()%></p>
                            <p class="card-text"><b>Article:</b> <%=((News)newslist.get(i)).getNewsArticle()%></p>
                            <p class="card-text"><b>Website:</b> <a href="<%=((News)newslist.get(i)).getNewsWebsite()%>" >Go to Website</a></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row align-items-end">
                <div class="d-grid gap-2 col-1 mx-auto pt-2">
                    <form action="${pageContext.request.contextPath}/ViewPageControl" method="post">
                        <input type="submit" class="btn btn-success btn-lg" name="button" value="Main Menu" />
                    </form>                                         
                </div>
            </div>
        </div>
        </form>
    </div>
</div>      
<%--            <div class="viewEvent3">
            <%
                int i=0;
            %>
                <form  name="ViewNewsInterface" action="${pageContext.request.contextPath}/ViewPageControl" method="post">
                    <div class="viewEvent4">
                        <h1><%=((News)newslist.get(i)).getNewsTitle()%></h1><br>
                    </div>
                    <div class="viewEvent4">
                        <b>Category</b> <%=((News)newslist.get(i)).getNewsCategory()%><br>
                    </div>
                    <div class="viewEvent4">
                        <p><%=((News)newslist.get(i)).getNewsArticle()%></p><br>
                    </div>
                    <div class="viewEvent4">
                        <p>Website:<p> <a href="<%=((News)newslist.get(i)).getNewsWebsite()%>" >Go to website</a><br>
                    </div>

                     
                   
        </form>
            
            </div>--%>
<%--            <div>
                <form action="${pageContext.request.contextPath}/ViewPageControl" method="post">
                <table border="0" align="center">
                  <tr>
                    <td><input type="submit" name="button" value="Main Menu" /></td>
                  </tr>
                </table>
                </form>
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