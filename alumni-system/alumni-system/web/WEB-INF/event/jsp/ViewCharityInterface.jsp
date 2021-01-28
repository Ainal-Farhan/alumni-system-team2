<%-- 
    Document   : ViewCharityInterface
    Created on : Dec 29, 2020, 5:54:39 PM
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
<%! ManageCharityControl MCC = new ManageCharityControl(); %>
<%! Charity charity = new Charity(); %>

<%!public interface ViewCharityInterface {

	public void returnAllSavedCharity();

	public void returnSavedCharity();

	public void selectCharity();

}%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' href='style.css'/>
        <title>View Charity</title>
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
            <%ArrayList<Charity> charitylist = (ArrayList<Charity>)session.getAttribute("charitylistupdate");%>

            <%
                int i=0;
            %>
            
        <form  name="ViewCharityInterface" action="${pageContext.request.contextPath}/ViewPageControl" method="post">
        <div class="container pb-5">
            <div class="row align-items-start justify-content-center"><h2>View Charity</h2></div>
            <div class="row align-items-center pt-4">
                <div class="col">
                    <div class="card p-3 mb-2 bg-light text-dark" style="width: 25rem;">
                        <%
                            byte charityImage2[] =((Charity)charitylist.get(i)).getCharityImage2();
                            String imgDataBase64=new String(Base64.getEncoder().encode(charityImage2));
                            if(imgDataBase64!=null)
                            {
                        %>
                                <img src="data:image/gif;base64,<%= imgDataBase64 %>" alt="No images" class="card-img-top"/><br>
                        <%
                            }
                            else
                            {   
                        %>
                                 <img src="assets/images\No_Image_Available.jpg" alt="No images2" class="card-img-top"/><br>
                        <%}%>
                    </div>
                </div>
                <div class="col">
                    <div class="card p-3 mb-2 bg-light text-dark" style="width: 40rem;">
                        <div class="card-body">
                            <h5 class="card-title" style="color: blue"><b><%=((Charity)charitylist.get(i)).getCharityTitle()%></b></h5>
                            <p class="card-text"><b>Dateline:</b> <%=((Charity)charitylist.get(i)).getCharityDateline()%></p>
                            <p class="card-text"><b>Account Bank:</b> <%=((Charity)charitylist.get(i)).getCharityAccBank()%></p>
                            <p class="card-text"><b>Account Number:</b> <%=((Charity)charitylist.get(i)).getCharityAccNumber()%></p>
                            <p class="card-text"><b>Account Name:</b> <%=((Charity)charitylist.get(i)).getCharityAccName()%></p>
                            <p class="card-text"><b>Total Gathered Amount:</b> RM<%=((Charity)charitylist.get(i)).getCharityGatheredAmt()%> out of RM<%=((Charity)charitylist.get(i)).getCharityTargetAmt()%></p>
                            <p class="card-text"><b>Description:</b> <%=((Charity)charitylist.get(i)).getCharityDescription()%></p>
                            <% int charityID =((Charity)charitylist.get(i)).getCharityID(); %>
                            <input type="hidden" name="charityID" value=<%=charityID %> >
                            <input type="submit" class="btn btn-outline-primary" name="buttonCharity" id="Donate" value="Make Charity">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row align-items-end">
                <div class="d-grid gap-2 col-2 mx-auto pt-2">
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
                <form  name="ViewCharityInterface" action="${pageContext.request.contextPath}/ViewPageControl" method="post">
                    <div class="viewEvent4">
                        <h1><%=((Charity)charitylist.get(i)).getCharityTitle()%></h1><br>
                    </div>
                    <div style="display: flex; justify-content: center;">
                        <%
                            byte charityImage2[] =((Charity)charitylist.get(i)).getCharityImage2();
                            String imgDataBase64=new String(Base64.getEncoder().encode(charityImage2));
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
                        <div style="margin-right: 20px;">
                            <b>Dateline:</b> <%=((Charity)charitylist.get(i)).getCharityDateline()%><br>
                            <b>Account Bank:</b> <%=((Charity)charitylist.get(i)).getCharityAccBank()%><br>
                            <b>Account Number:</b> <%=((Charity)charitylist.get(i)).getCharityAccNumber()%><br>
                            <b>Account Name:</b><%=((Charity)charitylist.get(i)).getCharityAccName()%><br>
                        </div>
                    </div>
                   
                    <div class="viewEvent4">
                        <div style="margin-right: 20px;">
                                <b>Total Gathered Amount: RM</b><%=((Charity)charitylist.get(i)).getCharityGatheredAmt()%>
                                <b> out of RM</b><%=((Charity)charitylist.get(i)).getCharityTargetAmt()%><br>
                                
                        </div>  
                    </div>
                    
                    <div class="viewEvent4">
                        <p><%=((Charity)charitylist.get(i)).getCharityDescription()%></p><br>
                    </div>
                
                
                
                            <% int charityID =((Charity)charitylist.get(i)).getCharityID(); %>
                    <div class="viewEvent5"> 
                        <div style="margin-right: 20px;"> 
                            <label>  
                                 
                                <input type="hidden" name="charityID" value=<%=charityID %> >
                                <input type="submit" name="buttonCharity" id="Donate" value="Make Charity">
                             
                            </label>
                        </div>
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