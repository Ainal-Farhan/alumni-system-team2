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
        <style>
            body{
                background-image: url('bangunanfabu.jpg');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: 100% 100%;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Page</title>
        <link rel='stylesheet' href='style.css'/>
        <link rel='stylesheet' href='lightslider.css'/>
        <script src="assets/js/messages/JQuery3.3.1.js"></script>
        <script src="assets/js/messages/lightslider.js"></script>
    </head>
    <body >
        <div class="menu-container">
            <img class="menu-container-pic" src="assets/images\UTMFabu.png">
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
                                 <img src="assets/images\No_Image_Available.jpg" alt="No images2" width="100px" height="100px"/><br>
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
                                 <img src="assets/images\No_Image_Available.jpg" alt="No images2" width="100px" height="100px"/><br>
                        <%}%>
                </div>
                <div>
                    <b><%=((Charity)charitylist.get(i)).getCharityTitle()%></b><br>
                </div>
                <div>
                    Date: <%=((Charity)charitylist.get(i)).getCharityDateline()%><br>
                </div>
                <div>
                    <p style="color:greenyellow;"><%=((Charity)charitylist.get(i)).getCharityGatheredAmt()%></p><b>/</b><p><%=((Charity)charitylist.get(i)).getCharityTargetAmt()%></p><br>
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
        </ul></div>

    
    
    </body>
</html>
