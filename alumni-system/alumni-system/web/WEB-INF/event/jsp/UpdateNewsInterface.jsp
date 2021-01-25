<%-- 
    Document   : UpdateNewsInterface
    Created on : Dec 29, 2020, 5:54:26 PM
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

<%!public interface UpdateNewsInterface {

	public void newsUpdateConfirmation();

	public void newsUpdateFailed();

	public void updateNewsID();

	public void returnSavedNewsData();

	/**
	 * 
	 * @param newsTitle
	 * @param newsCategory
	 * @param newsArticle
	 * @param newsWebsite
	 */
	public void updateSavedNewsData(String newsTitle, String newsCategory, String newsArticle, String newsWebsite);

}%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update News</title>
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
        
        <%ArrayList<News> newslist = (ArrayList<News>)session.getAttribute("newslistupdate");
        
            int i=0;
        %>
        
        <form  name="UpdateNewsForm" method="post" action="ManageNewsControl" enctype="multipart/form-data">
            <div class="container pb-5">
            <div class="row align-items-start justify-content-center"></div>
            <div class="row align-items-center pt-4">
                <div class="col">
                    <div class="card mb-2 bg-light text-dark" style="width: auto;">
                        <div class="card-body">
                            <h4 class="card-title" style="text-align: center;"><b>Update News</b></h4>
                            <div class="row g-2 p-2">
                                <div class="col">
                                  <div class="form-floating">
                                    <label for="floatingInput">News Title</label>
                                    <input type="text" class="form-control" id="floatingInput" placeholder="Title of News" name="newsTitle" value="<%=((News)newslist.get(i)).getNewsTitle()%>" size="100" required>                                    
                                  </div>
                                </div>
                                <div class="col-md">
                                  <div class="form-floating">
                                    <label for="floatingInput">News Category</label>
                                    <input type="text" class="form-control" id="floatingInput" placeholder="Category of News" name="newsCategory" value="<%=((News)newslist.get(i)).getNewsCategory()%>" size="100" required>                                    
                                  </div>
                                </div>
                            </div>
                            <div class="row g-2 p-2">
                                <div class="col">
                                  <div class="form-floating">
                                    <label for="floatingInput">News Article</label>
                                    <input type="text" class="form-control" id="floatingInput" placeholder="Article of News" name="newsArticle" value="<%=((News)newslist.get(i)).getNewsArticle()%>" size="100" required>                                    
                                  </div>
                                </div>
                            </div>
                            <div class="row g-2 p-2">
                                <div class="col">
                                  <div class="form-floating">
                                    <label for="floatingInput">News Website</label>
                                    <input type="text" class="form-control" id="floatingInput" placeholder="Website Link of the News" name="newsWebsite" value="<%=((News)newslist.get(i)).getNewsWebsite()%>" size="100" required>                                    
                                  </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="d-grid gap-2 col-3 mx-auto pt-1">
                        <input class="btn btn-warning" type="reset" id="buttonreset" name="buttonreset" value="Reset Form">
                        <input class=" btn btn-primary" type="submit" id="button7" name="button7" value="Update News">                                            
                    </div>
                    <div class="d-grid gap-2 col-2 mx-auto pt-2">
                        <a href="ManageNewsControl?option=News Menu" class="btn btn-success">News Menu</a>       
                    </div>
                </div>
            </div>
            </div>
        </form>
<%--      <form  name="UpdateNewsForm" method="post" action="ManageNewsControl" enctype="multipart/form-data">
      <%ArrayList<News> newslist = (ArrayList<News>)session.getAttribute("newslistupdate");
        
            int i=0;
      %>
      
      <table align="center" width="500" border="5" cellspacing="5" cellpadding="5">
          
        <tr>
          <th width="72" scope="row">
              <div align="left">News Title</div></th>
          <td width="240">
              <label>
                  <input type="text" name="newsTitle" id="newsTitle" value="<%=((News)newslist.get(i)).getNewsTitle()%>" size="100" required>
              </label>
          </td>
        </tr>
        
        <tr>
          <th scope="row">
              <div align="left">News Category</div>
          </th>
          <td>
              <label>
                  <input type="text" name="newsCategory" id="newsCategory" value="<%=((News)newslist.get(i)).getNewsCategory()%>" size="100" required>
              </label>
          </td>
        </tr>
        
        <tr>
          <th scope="row">
              <div align="left">News Article</div>
          </th>
          <td>
              <label>
                  <input type="text" name="newsArticle" id="newsArticle" value="<%=((News)newslist.get(i)).getNewsArticle()%>" size="100" required>
              </label>
          </td>
        </tr>
        
        <tr>
          <th scope="row">
              <div align="left">News Website</div>
          </th>
          <td>
              <label>
                  <input type="text" name="newsWebsite" id="newsWebsite" value="<%=((News)newslist.get(i)).getNewsWebsite()%>" size="100">
              </label>
          </td>
        </tr>
      
        <tr>
          <th scope="row"><div align="left"></div></th>
          <td>&nbsp;</td>
        </tr>
        
        <tr>
          <th scope="row"><div align="left"></div></th>
          <td><label>
                  
            <input type="submit" name="button7" id="button1" value="Update">
            <input type="reset" name="buttonreset" id="buttonreset" value="Reset">
          </label></td>
        </tr>
        
      </table>
    </form>
        
    <br><br>
    <form action="ManageNewsInterface.jsp">
    <table border="0" align="center">
      <tr>
        <td><input type="submit" value="Main Menu" /></td>
      </tr>
    </table>
    </form>--%>
    
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
