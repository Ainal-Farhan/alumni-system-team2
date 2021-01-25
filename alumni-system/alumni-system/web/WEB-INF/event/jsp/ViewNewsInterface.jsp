<%-- 
    Document   : ViewNewsInterface
    Created on : Dec 29, 2020, 5:55:07 PM
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
            <%ArrayList<News> newslist = (ArrayList<News>)session.getAttribute("newslistupdate");%>

          
            <div class="viewEvent3">
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