<%-- 
    Document   : ViewCharityInterface
    Created on : Dec 29, 2020, 5:54:39 PM
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
    </head>
    <body>
        <h2 align="center"><font><strong>View Charity</strong></font></h2>
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

          
            <div class="viewEvent3">
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
            
            </div>
            <div>
                <form action="${pageContext.request.contextPath}/ViewPageControl" method="post">
                <table border="0" align="center">
                  <tr>
                    <td><input type="submit" name="button" value="Main Menu" /></td>
                  </tr>
                </table>
                </form>
            </div>
    </body>
</html>