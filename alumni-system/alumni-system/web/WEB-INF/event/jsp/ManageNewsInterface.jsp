<%-- 
    Document   : ManageNewsInterface
    Created on : Dec 29, 2020, 5:53:34 PM
    Author     : Amir Syafiq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!public interface ManageNewsInterface {

	/**
	 * 
	 * @param newsAction
	 */
	public void selectNewsAction(String newsAction);

}%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage News</title>
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
        
        
        <%--<form action="\ManageNewsControl" method="post">--%>
            
            <div class="container pb-5">
            <div class="row align-items-start justify-content-center"><h1>Manage News</h1></div>
            <div class="row align-items-center pt-4">
                <div class="col">
                    <div class="card p-3 mb-2 bg-light text-dark" style="width: 18rem;">
                        <img src="assets/images/forest1.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Adding News</h5>
                            <p class="card-text">Add and create any latest news.</p>
                            <a href="ManageNewsControl?option=AddNews" class="btn btn-outline-primary">                           
                                Add News
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card p-3 mb-2 bg-light text-dark" style="width: 18rem;">
                        <img src="assets/images/forest1.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Deleting News</h5>
                            <p class="card-text">Delete and remove any past or canceled news.</p>
                            <a href="ManageNewsControl?option=DeleteNews" class="btn btn-outline-danger">                           
                                Delete News
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card p-3 mb-2 bg-light text-dark" style="width: 18rem;">
                        <img src="assets/images/forest1.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Updating News</h5>
                            <p class="card-text">Update or modify any latest news.</p>
                            <a href="ManageNewsControl?option=UpdateNews" class="btn btn-outline-success">                           
                                Update News
                            </a>
                         </div>
                    </div>
                </div>
            </div>
            <div class="row align-items-end">
                <div class="d-grid gap-2 col-2 mx-auto pt-2">
                    <a class="btn btn-success btn-lg" href="ManageNewsControl?option=Manage Menu">Main Menu</a>                                           
                </div>
            </div>
            </div>
        <%--</form>--%>
        
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
