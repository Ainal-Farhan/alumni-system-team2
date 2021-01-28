<%-- 
    Document   : ViewPageInterface
    Created on : Dec 29, 2020, 5:55:31 PM
    Author     : Amir Syafiq
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Base64"%>
<%@page import="com.models.event.*"%>
<%@page import="com.controllers.event.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! ManageEventControl MEC = new ManageEventControl(); %>
<%! Event event = new Event(); %>

<%!public interface ViewPageInterface {

	/**
	 * 
	 * @param pageAction
	 */
	public void selectPageAction(String pageAction);

}%>

<!DOCTYPE html>
<html>
    <head>
<%--        <style>
            body{
                background-image: url('bangunanfabu.jpg');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: 100% 100%;
            }
        </style>--%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Page</title>
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
<%--        <link rel='stylesheet' href='lightslider.css'/>
        <script src="js/JQuery3.3.1.js"></script>
        <script src="js/lightslider.js"></script>--%>
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
        
        <div class="container pb-5 pt-5 pl-3 pr-3 bg-light">
            <div class="row  justify-content-center">
                <%ArrayList<Event> eventlist = (ArrayList<Event>)session.getAttribute("eventlist");%>
                <div class="row pt-0 pb-0"><h4>Event</h4></div>
                <div class="row pt-1 pl-5">
                <%
                    for(int i=0; i<eventlist.size();i++)
                    {
                %>
                <form  name="ViewEventInterface" action="${pageContext.request.contextPath}/ViewPageControl" method="post">
                <div class="col">
                    <div class="card p-3 mb-2 bg-primary text-white" style="width: 15rem;">
                        <%
                            byte eventImage2[] =((Event)eventlist.get(i)).getEventImage2();
                            String imgDataBase64=new String(Base64.getEncoder().encode(eventImage2));
                            if(imgDataBase64!=null)
                            {
                        %>
                                <img src="data:image/gif;base64,<%= imgDataBase64 %>" class="card-img-top" alt="No images">
                        <%
                            }
                            else
                            {   
                        %>
                                 <img src="../../../assets/images/no-image.png" class="card-img-topno_Image_Available" alt="No images2">
                        <%}%>
                        
                        <div class="card-body">
                            <h6 class="card-title"><b><%=((Event)eventlist.get(i)).getEventTitle()%></b></h6>
                            <p class="card-text"><b>Category:</b> <%=((Event)eventlist.get(i)).getEventCategory()%></p>
                            <p class="card-text"><b>Date:</b> <%=((Event)eventlist.get(i)).getEventDate()%></p>
                            <p class="card-text"><b>Time:</b> <%=((Event)eventlist.get(i)).getEventTime()%></p>
                            <% int eventID =((Event)eventlist.get(i)).getEventID(); %>
                            <% int eventCapacity =((Event)eventlist.get(i)).getEventCapacity(); %>
                            <input type="hidden" name="eventCapacity" value=<%=eventCapacity %> >
                            <input type="hidden" name="eventID" value=<%=eventID %> >
                            <input type="submit" class="btn btn-outline-dark btn-sm" id="See_more" name="button5" value="See More" />
                        </div>
                    </div>
                </div>
                </form>
                <%
                    }
                %>
                </div>
            </div>
            <div class="row pt-4  justify-content-center">
                <%ArrayList<News> newslist = (ArrayList<News>)session.getAttribute("newslist");%>
                <div class="row pt-2 pb-5"><h4>News</h4></div>
                <div class="row pt-5">
                <%
                    for(int i=0; i<newslist.size();i++)
                        {
                %>
                <form  name="ViewEventInterface" action="${pageContext.request.contextPath}/ViewPageControl" method="post">
                <div class="col">
                    <div class="card p-3 mb-2 bg-warning text-dark" style="width: 15rem;">
                        <div class="card-body">
                            <h6 class="card-title"><b><%=((News)newslist.get(i)).getNewsTitle()%></b></h6>
                            <p class="card-text"><b>Category:</b> <%=((News)newslist.get(i)).getNewsCategory()%></p>
                            <p class="card-text"><b>Link:</b> <a href="<%=((News)newslist.get(i)).getNewsWebsite()%>">Link</a></p>
                            <p class="card-text"><b>Time:</b> <%=((Event)eventlist.get(i)).getEventTime()%></p>
                            <% int newsID =((News)newslist.get(i)).getNewsID(); %>
                            <input type="hidden" name="newsID" value=<%=newsID %> >
                            <input type="submit" class="btn btn-outline-dark btn-sm" id="See_more" name="button6" value="See More" />
                        </div>
                    </div>
                </div>
                </form>
                <%
                    }
                %>
                </div>
            </div>
            <div class="row pt-4 justify-content-center">
                <%ArrayList<Charity> charitylist = (ArrayList<Charity>)session.getAttribute("charitylist");%>
                <div class="row pt-2 pb-5"><h4>Charity</h4></div>
                <div class="row pt-5">
                <%
                    for(int i=0; i<charitylist.size();i++)
                    {
                %>
                <form  name="ViewEventInterface" action="${pageContext.request.contextPath}/ViewPageControl" method="post">
                <div class="col">
                    <div class="card p-3 mb-2 bg-success text-white" style="width: 15rem;">
                        <%
                            byte charityImage2[] =((Charity)charitylist.get(i)).getCharityImage2();
                            String imgDataBase64=new String(Base64.getEncoder().encode(charityImage2));
                            if(imgDataBase64!=null)
                            {
                        %>
                                <img src="data:image/gif;base64,<%= imgDataBase64 %>" class="card-img-top" alt="No images">
                        <%
                            }
                            else
                            {   
                        %>
                                 <img src="assets/images\No_Image_Available.jpg" class="card-img-top" alt="No images2">
                        <%}%>
                        <div class="card-body">
                            <h6 class="card-title"><b><%=((Charity)charitylist.get(i)).getCharityTitle()%></b></h6>
                            <p class="card-text"><b>Dateline:</b> <%=((Charity)charitylist.get(i)).getCharityDateline()%></p>
                            <p class="card-text"><b>Amount Gathered:</b> RM<%=((Charity)charitylist.get(i)).getCharityGatheredAmt()%> / RM<%=((Charity)charitylist.get(i)).getCharityTargetAmt()%></p>
                            <% int charityID =((Charity)charitylist.get(i)).getCharityID(); %>
                            <input type="hidden" name="charityID" value=<%=charityID %> >
                            <input type="submit" class="btn btn-outline-dark btn-sm" id="See_more" name="button7" value="See More" />
                        </div>
                    </div>
                </div>
                </form>
                <%
                    }
                %>
                </div>
            </div>
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
<%--        <div class="menu-container">
            <img class="menu-container-pic" src="images\UTMFabu.png">
        </div>
        <h1 style="text-align: center">Event</h1>
        
    
        <%ArrayList<Event> eventlist = (ArrayList<Event>)session.getAttribute("eventlist");%>
        <script type="text/javascript">
                  $(document).ready(function() {
        $('#autoWidth,#autoWidth2,#autoWidth3').lightSlider({
            autoWidth:true,
            loop:true,
            onSliderLoad: function() {
                $('#autoWidth,#autoWidth2,#autoWidth3').removeClass('cS-hidden');
            } 
        });  
      });
        </script>
         
        <div class="viewEvent1">
            <ul id="autoWidth" class="cS-hidden"> 
        <%
            for(int i=0; i<eventlist.size();i++)
            {
        %>  
        <li>
            <div class="viewEvent2">
                <form  name="ViewEventInterface" action="${pageContext.request.contextPath}/ViewPageControl" method="post">
                    <div>
                        <%
                            byte eventImage2[] =((Event)eventlist.get(i)).getEventImage2();
                            String imgDataBase64=new String(Base64.getEncoder().encode(eventImage2));
                            if(imgDataBase64!=null)
                            {
                        %>
                                <img src="data:image/gif;base64,<%= imgDataBase64 %>" alt="No images" width="100px" height="100px"/><br>
                        <%
                            }
                            else
                            {   
                        %>
                                 <img src="images\No_Image_Available.jpg" alt="No images2" width="100px" height="100px"/><br>
                        <%}%>
                    </div>
                    <div>
                        <b><%=((Event)eventlist.get(i)).getEventTitle()%></b><br>
                    </div>
                    <div>
                        Category: <%=((Event)eventlist.get(i)).getEventCategory()%><br>
                    </div>
                    <div>
                        Date: <%=((Event)eventlist.get(i)).getEventDate()%><br>
                    </div>
                    <div>
                        Time: <%=((Event)eventlist.get(i)).getEventTime()%><br>
                    </div>
                    <% int eventID =((Event)eventlist.get(i)).getEventID(); %>
                    <% int eventCapacity =((Event)eventlist.get(i)).getEventCapacity(); %>
                    <div>
                        <label>       
                            <input type="hidden" name="eventCapacity" value=<%=eventCapacity %> >
                            <input type="hidden" name="eventID" value=<%=eventID %> >
                            <input type="submit" name="button5" id="See_more" value="See more">
                        </label><br>
                    </div>
                </form>
            </div>
        </li>
        <%

            }

        %>
        </ul></div>
        
        <h1 style="text-align: center">News</h1>
        <%ArrayList<News> newslist = (ArrayList<News>)session.getAttribute("newslist");%>

          
        <div class="viewEvent1">
            <ul id="autoWidth2" class="cS-hidden">
        <%
            for(int i=0; i<newslist.size();i++)
            {
        %>
        <li>
            <div class="viewEvent2">
                <form  name="ViewEventInterface" action="${pageContext.request.contextPath}/ViewPageControl" method="post">

                <div>
                    <b><%=((News)newslist.get(i)).getNewsTitle()%></b><br>
                </div>
                <div>
                    Link: <a href="<%=((News)newslist.get(i)).getNewsWebsite()%>">Link</a><br>
                </div>
                <div>
                    Category: <%=((News)newslist.get(i)).getNewsCategory()%><br>
                </div>
                <% int newsID =((News)newslist.get(i)).getNewsID(); %>
                <div>
                    <label>       
                        <input type="hidden" name="newsID" value=<%=newsID %> >
                        <input type="submit" name="button6" id="See_more" value="See more">
                    </label><br>
                </div>
                </form>
            </div>
        </li>
        <%

            }

        %>
        </ul></div>
        
        <h1 style="text-align: center">Charity</h1>
        <%ArrayList<Charity> charitylist = (ArrayList<Charity>)session.getAttribute("charitylist");%>

          
        <div class="viewEvent1">
            <ul id="autoWidth3" class="cS-hidden">
        <%
            for(int i=0; i<charitylist.size();i++)
            {
        %>
        <li>
            <div class="viewEvent2">
                <form  name="ViewEventInterface" action="${pageContext.request.contextPath}/ViewPageControl" method="post">

                
                <div>
                        <%
                            byte charityImage2[] =((Charity)charitylist.get(i)).getCharityImage2();
                            String imgDataBase64=new String(Base64.getEncoder().encode(charityImage2));
                            if(imgDataBase64!=null)
                            {
                        %>
                                <img src="data:image/gif;base64,<%= imgDataBase64 %>" alt="No images" width="100px" height="100px"/><br>
                        <%
                            }
                            else
                            {   
                        %>
                                 <img src="images\No_Image_Available.jpg" alt="No images2" width="100px" height="100px"/><br>
                        <%}%>
                </div>
                <div>
                    <b><%=((Charity)charitylist.get(i)).getCharityTitle()%></b><br>
                </div>
                <div>
                    Date: <%=((Charity)charitylist.get(i)).getCharityDateline()%><br>
                </div>
                <div>
                    <p style="color:darkgreen;"><%=((Charity)charitylist.get(i)).getCharityGatheredAmt()%></p><b>/</b><p><%=((Charity)charitylist.get(i)).getCharityTargetAmt()%></p><br>
                </div>
                <% int charityID =((Charity)charitylist.get(i)).getCharityID(); %>
                <div>
                    <label>       
                        <input type="hidden" name="charityID" value=<%=charityID %> >
                        <input type="submit" name="button7" id="See_more" value="See more">
                    </label><br>
                </div>
                </form>
            </div>
        </li>
        <%

            }

        %>
        </ul></div>--%>

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