<%-- 
    Document   : DeleteEventInterface
    Created on : Dec 29, 2020, 5:51:17 PM
    Author     : Amir Syafiq
--%>
<%@page import="java.util.Base64"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.controllers.event.*"%>
<%@page import="com.models.event.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! ManageEventControl MEC = new ManageEventControl(); %>
<%! Event event = new Event(); %>
<%-- MEC.fetchAllSavedEvent(request, response); --%> 
<%--  event.searchAllSavedEvent(request, response); --%>
<%!public interface DeleteEventInterface {

	public void deleteEventID();

	public void eventDeleteConfirmation();

	public void eventDeleteFailed();
 
        public void displayAllSavedEvent();
}%>

            
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update & Delete Event</title>
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

        
        
        
                <div class="jumbotron">
                    <!-- Header/Home -->
                    <header class="header-home">
                        <img src="https://brand.utm.my/files/2016/08/LOGO-UTM.png" style="width:30%"><br>
                        <br><p>FACULTY OF BUILT ENVIRONMENT, UNIVERSITI TEKNOLOGI MALAYSIA</p><br>
                    </header>
        
        <div class="row align-items-start justify-content-center"><h4><b>Update and Delete Event</b></h4></div>
        
        <% String message = (String)session.getAttribute("alertMsg");%>

        <% if(!message.equals("no")){ %>
            <script type="text/javascript">
            var msg = "<%=message%>";
            alert(msg);
        </script>
        <%}%>
        <table class="table table-hover table-info table-striped">
        <head>
        <tr>
            <td><b>Title</b></td>
            <td><b>Description</b></td>
            <td><b>Category</b></td>
            <td><b>Date</b></td>
            <td><b>Time</b></td>
            <td><b>Venue</b></td>
            <td><b>Participant Capacity</b></td>
            <td><b>Fee (RM)</b></td>
            <td><b>Organizer</b></td>
            <td><b>Image</b></td>
            <td><b>Web Site</b></td>
            <td><b>Sponsor</b></td>
            <td><b>Sponsor Package </b></td>
            <td><b>Sponsor Gathered Amount</b></td>
            <td colspan="2"><b>Action</b></td>
        </tr>
        

            <%
                //Event event = new Event();
                //event=(Event)session.getAttribute("event");
            %>
            <%ArrayList<Event> eventlist = (ArrayList<Event>)session.getAttribute("eventlist");%>

          
            
            <%
                for(int i=0; i<eventlist.size();i++)
                {
            %>
        <form  name="DeleteEventForm" action="${pageContext.request.contextPath}/ManageEventControl" method="post">
                <tr>
                <td><%=((Event)eventlist.get(i)).getEventTitle()%></td>
                <td><%=((Event)eventlist.get(i)).getEventDescription()%></td>
                <td><%=((Event)eventlist.get(i)).getEventCategory()%></td>
                <td><%=((Event)eventlist.get(i)).getEventDate()%></td>
                <td><%=((Event)eventlist.get(i)).getEventTime()%></td>
                <td><%=((Event)eventlist.get(i)).getEventVenue()%></td>
                <td><%=((Event)eventlist.get(i)).getEventCapacity()%></td>
                <td><%=((Event)eventlist.get(i)).getEventFee()%></td>
                <td><%=((Event)eventlist.get(i)).getEventOrganizer()%></td>
                <td>
                    <%
                        byte eventImage2[] =((Event)eventlist.get(i)).getEventImage2();
                        String imgDataBase64=new String(Base64.getEncoder().encode(eventImage2));
                    %>
                    <img src="data:image/gif;base64,<%= imgDataBase64 %>" alt="No images" width="100px" height="100px"/>
                </td>
                <td><a href="<%=((Event)eventlist.get(i)).getEventWebsite()%>"><%=((Event)eventlist.get(i)).getEventWebsite()%></a></td>
                <td><%=((Event)eventlist.get(i)).isEventSponsor()%></td>
                <td><%=((Event)eventlist.get(i)).getEventSponsorPackageAmt()%></td>
                <td><%=((Event)eventlist.get(i)).getEventSponsorGatheredAmt()%></td>
                <% int eventID =((Event)eventlist.get(i)).getEventID(); %>

                <td> <label>       
                    <input type="hidden" name="eventID" value=<%=eventID %> >
                    <input class="btn btn-primary btn-sm" type="submit" name="button5" id="update" value="Update">
                </label></td>    
                <td> <label>
                    
                    <input class="btn btn-danger btn-sm" type="submit" name="button6" id="delete" value="Delete">
                </label></td></tr>
        </form>
            <%--}--%>  
            <%
                
                }
                
            %>
    
    
    <table border="0" align="center">
      <div class="d-grid gap-2 col-1 mx-auto pb-4">
        <a href="ManageEventControl?option=Event Menu" class="btn btn-success">                           
            Event Menu
        </a>       
      </div>
    </table>
                </div>
 
    <div class="fixed p-3 mb-0 bg-light text-dark">
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
<%  } %>   
    </body>
</html>
