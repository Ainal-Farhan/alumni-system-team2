<%-- 
    Document   : DeleteCharityInterface
    Created on : Dec 29, 2020, 5:51:05 PM
    Author     : Amir Syafiq
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.models.event.*"%>
<%@page import="com.controllers.event.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! ManageCharityControl MCC = new ManageCharityControl(); %>
<%! Charity charity = new Charity(); %>
<%!public interface DeleteCharityInterface {

	public void deleteCharityID();

	public void charityDeleteConfirmation();

	public void charityDeleteFailed();

}%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update & Delete Charity</title>
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
        
        <div class="row align-items-start justify-content-center"><h4><b>Update and Delete Charity</b></h4></div>
        
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
            <td><b>Description</b></td>
            <td><b>Dateline</b></td>
            <td><b>Account Bank</b></td>
            <td><b>Account Number</b></td>
            <td><b>Account Name</b></td>
            <td><b>Charity Image</b></td>
            <td><b>Charity Target Amount</b></td>
            <td><b>Charity Gathered Amount</b></td>
            <td colspan="2"><b>Action</b></td>
        </tr>

            <%
                //Event event = new Event();
                //event=(Event)session.getAttribute("event");
            %>
            <%ArrayList<Charity> charitylist = (ArrayList<Charity>)session.getAttribute("charitylist");%>

          
            
            <%
                for(int i=0; i<charitylist.size();i++)
                {
            %>
        <form  name="DeleteCharityInterface" action="${pageContext.request.contextPath}/ManageCharityControl" method="post">
                <tr>
                <td><%=((Charity)charitylist.get(i)).getCharityTitle()%></td>
                <td><%=((Charity)charitylist.get(i)).getCharityDescription()%></td>
                <td><%=((Charity)charitylist.get(i)).getCharityDateline()%></td>
                <td><%=((Charity)charitylist.get(i)).getCharityAccBank()%></td>
                <td><%=((Charity)charitylist.get(i)).getCharityAccNumber()%></td>
                <td><%=((Charity)charitylist.get(i)).getCharityAccName()%></td>  
                <td>
                    <%
                        byte eventImage2[] =((Charity)charitylist.get(i)).getCharityImage2();
                        String imgDataBase64=new String(Base64.getEncoder().encode(eventImage2));
                    %>
                    <img src="data:image/gif;base64,<%= imgDataBase64 %>" alt="No images" width="100px" height="100px"/>
                </td>
                <td><%=((Charity)charitylist.get(i)).getCharityTargetAmt()%></td>
                <td><%=((Charity)charitylist.get(i)).getCharityGatheredAmt()%></td>
                
                
                <% int charityID =((Charity)charitylist.get(i)).getCharityID(); %>
 
            <td> <label>       
                <input type="hidden" name="charityID" value=<%=charityID %> >
                <input class="btn btn-primary btn-sm" type="submit" name="button5" id="update" value="Update">
            </label></td>    
            <td> <label>
             <%--untuk sponsor nnti--%>
             <%-- if(((Event)eventlist.get(i)).isEventSponsor()){--%> 
               
                <input type="hidden" name="charityID" value=<%=charityID %> >
                <input class="btn btn-danger btn-sm" type="submit" name="button6" id="delete" value="Delete">
              
            
            </label></td></tr>
        </form>
            <%--}--%>  
            <%
                
                }
                
            %>
    
    <table border="0" align="center">
      <div class="d-grid gap-2 col-2 mx-auto pb-4">
        <a href="ManageCharityControl?option=Charity Menu" class="btn btn-success">                           
            Charity Menu
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