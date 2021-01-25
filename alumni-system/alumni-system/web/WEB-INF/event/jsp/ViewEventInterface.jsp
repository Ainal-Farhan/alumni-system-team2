<%-- 
    Document   : ViewEventInterface
    Created on : Dec 29, 2020, 5:54:51 PM
    Author     : Amir Syafiq
--%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Base64"%>
<%@page import="Model.*"%>
<%@page import="Control.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! ManageEventControl MEC = new ManageEventControl(); %>
<%! Event event = new Event(); %>


<%!public interface ViewEventInterface {

	public void returnAllSavedEvent();

	public void selectEvent();

	public void returnSavedEvent();

}%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' href='style.css'/>
        <title>View Event</title>
    </head>
    <body>
        <h2 align="center"><font><strong>View Event</strong></font></h2>
        <% 
        String message = (String)session.getAttribute("alertMsg");
        %>

        <% if(!message.equals("no")){ %>
            <script type="text/javascript">
            var msg = "<%=message%>";
            alert(msg);
        </script>
        <%}%>
            <%ArrayList<Event> eventlist = (ArrayList<Event>)session.getAttribute("eventlistupdate");%>

          
            <div class="viewEvent3">
            <%
                int i=0;
            %>
                <form  name="ViewEventInterface" action="${pageContext.request.contextPath}/ViewPageControl" method="post">
                    <div class="viewEvent4">
                        <h1><%=((Event)eventlist.get(i)).getEventTitle()%></h1><br>
                    </div>
                    <div style="display: flex; justify-content: center;">
                        <%
                            byte eventImage2[] =((Event)eventlist.get(i)).getEventImage2();
                            String imgDataBase64=new String(Base64.getEncoder().encode(eventImage2));
                            if(imgDataBase64!=null)
                            {
                        %>
                                <img src="data:image/gif;base64,<%= imgDataBase64 %>" alt="No images" max-width="200px" max-height="500px"/><br>
                        <%
                            }
                            else
                            {   
                        %>
                                 <img src="images\No_Image_Available.jpg" alt="No images2" max-width="200px" max-height="500px"/><br>
                        <%}%>
                    </div>

                    <div class="viewEvent4">
                        <p style="color: blue;">Category: <%=((Event)eventlist.get(i)).getEventCategory()%></p><br>
                    </div>
                    <div class="viewEvent4">
                        <div style="margin-right: 20px;">
                            <b>Date:</b> <%=((Event)eventlist.get(i)).getEventDate()%><br>
                            <b>Time:</b> <%=((Event)eventlist.get(i)).getEventTime()%><br>
                            <b>Venue:</b> <%=((Event)eventlist.get(i)).getEventVenue()%><br>
                            <b>Fee:</b>RM<%=((Event)eventlist.get(i)).getEventFee()%><br>
                        </div>
                        <div>
                            <b>Organizer</b> <%=((Event)eventlist.get(i)).getEventOrganizer()%><br>
                            <b>Website:</b> <a href="<%=((Event)eventlist.get(i)).getEventWebsite()%>"><%=((Event)eventlist.get(i)).getEventWebsite()%></a><br>
                            <b>Capacity:</b> <%=((Event)eventlist.get(i)).getEventCapacity()%><br>
                        </div>
                    </div>
                   
                    <div class="viewEvent4">
                        <p><%=((Event)eventlist.get(i)).getEventDescription()%></p><br>
                    </div>
                
                
                
                            <% int eventID =((Event)eventlist.get(i)).getEventID(); %>
                    <div class="viewEvent5"> 
                        <div style="margin-right: 20px;"> 
                            <label>  
                                 <%if(((Event)eventlist.get(i)).getEventCapacity()>0){%>
                                <input type="hidden" name="eventID" value=<%=eventID %> >
                                <input type="submit" name="buttonJoin" id="Join" value="Join Event">
                                <%}%>  
                            </label>
                        </div>
                        <div> 
                            <label>
                                <%if(((Event)eventlist.get(i)).isEventSponsor()){%> 
                                
                                <input type="hidden" name="eventID" value=<%=eventID %> >
                                <input type="submit" name="buttonSponsor" id="Sponsor" value="Sponsor">
                                <%}%>  
                            </label>
                        </div>
                    </div>
        </form>
            
            </div>
            <div>
                <form action="ViewPageInterface.jsp">
                <table border="0" align="center">
                  <tr>
                    <td><input type="submit" value="Main Menu" /></td>
                  </tr>
                </table>
                </form>
            </div>
    </body>
</html>
