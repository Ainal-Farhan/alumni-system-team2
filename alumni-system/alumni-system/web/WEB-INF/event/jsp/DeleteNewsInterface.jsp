<%-- 
    Document   : DeleteNewsInterface
    Created on : Dec 29, 2020, 5:51:32 PM
    Author     : Amir Syafiq
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.controllers.event.*"%>
<%@page import="com.models.event.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! ManageNewsControl MNC = new ManageNewsControl(); %>
<%! News news = new News(); %>

<%!public interface DeleteNewsInterface {

	public void deleteNewsID();

	public void newsDeleteConfirmation();

	public void newsDeleteFailed();

}%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update & Delete News</title>
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
        
        <div class="row align-items-start justify-content-center"><h4><b>Update and Delete News</b></h4></div>
        
        <% String message = (String)session.getAttribute("alertMsg");%>

        <% if(!message.equals("no")){ %>
            <script type="text/javascript">
            var msg = "<%=message%>";
            alert(msg);
        </script>
        <%}%>
        <table class="table table-hover table-info table-striped">
            
        <tr>
            <td><b>Title</b></td>
            <td><b>Category</b></td>
            <td><b>Description</b></td>
            <td><b>Web Site</b></td>
            <td colspan="2"><b>Action</b></td>
            
        </tr>

            <%
                //Event event = new Event();
                //event=(Event)session.getAttribute("event");
            %>
            <%ArrayList<News> newslist = (ArrayList<News>)session.getAttribute("newslist");%>

            <%--<jsp:useBean id="event" class="Model.Event" scope="session" />
            <td><% event.getEventTitle();%></td>
            <td><jsp:getProperty name="event" property="eventTitle"/></td>
            <td><jsp:getProperty name="event" property="eventDescription"/></td>
            <td><jsp:getProperty name="event" property="eventCategory"/></td>
            <td><jsp:getProperty name="event" property="eventDate"/></td>
            <td><jsp:getProperty name="event" property="eventTime"/></td>
            <td><jsp:getProperty name="event" property="eventVenue"/></td>
            <td><jsp:getProperty name="event" property="eventCapacity"/></td>
            <td><jsp:getProperty name="event" property="eventFee"/></td>
            <td><jsp:getProperty name="event" property="eventOrganizer"/></td>
            <td><jsp:getProperty name="event" property="eventImage"/></td>
            <td><a href="<jsp:getProperty name="event" property="eventWebsite"/>">Link</a></td>
            <td><jsp:getProperty name="event" property="eventSponsor"/></td>
            <td><jsp:getProperty name="event" property="eventSponsorPackageAmt"/></td>
            <td><jsp:getProperty name="event" property="eventSponsorGatheredAmt"/></td>--%>
            
            <%
                for(int i=0; i<newslist.size();i++)
                {
            %>
        <form  name="DeleteNewstInterface" action="${pageContext.request.contextPath}/ManageNewsControl" method="post">
                <tr>
                <td><%=((News)newslist.get(i)).getNewsTitle()%></td>      
                <td><%=((News)newslist.get(i)).getNewsCategory()%></td>
                <td><%=((News)newslist.get(i)).getNewsArticle()%></td>
                <td><a href="<%=((News)newslist.get(i)).getNewsWebsite()%>"><%=((News)newslist.get(i)).getNewsWebsite()%></a></td>
              
                <% int newsID =((News)newslist.get(i)).getNewsID(); %>
 
            <td> <label>       
                <input type="hidden" name="newsID" value=<%=newsID %> >
                <input class="btn btn-primary btn-sm" type="submit" name="button5" id="update" value="Update">
            </label></td>    
            <td> <label>
             <%--untuk sponsor nnti--%>
             <%-- if(((Event)eventlist.get(i)).isEventSponsor()){--%> 
               
                <input type="hidden" name="newsID" value=<%=newsID %> >
                <input class="btn btn-danger btn-sm" type="submit" name="button6" id="delete" value="Delete">
              
            
            </label></td></tr>
        </form>
            <%--}--%>  
            <%
                
                }
            %>
    
    <table border="0" align="center">
      <div class="d-grid gap-2 col-2 mx-auto pb-4">
        <a href="ManageNewsControl?option=News Menu" class="btn btn-success">                           
            News Menu
        </a>       
      </div>
    </table>
    
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
