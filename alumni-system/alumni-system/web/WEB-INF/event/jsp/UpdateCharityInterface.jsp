<%-- 
    Document   : UpdateCharityInterface
    Created on : Dec 29, 2020, 5:54:01 PM
    Author     : Amir Syafiq
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.models.event.*"%>
<%@page import="com.controllers.event.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! ManageCharityControl MCC = new ManageCharityControl(); %>
<%! Charity charity = new Charity(); %>
<%!public interface UpdateCharityInterface {

	public void updateCharityID();

	public void returnSavedCharityData();

	/**
	 * 
	 * @param charityTitle
	 * @param charityDescription
	 * @param charityDateline
	 * @param charityTargetAmt
	 * @param charityGatheredAmt
	 * @param charityImage
	 * @param charityAccBank
	 * @param charityAccNumber
	 * @param charityAccName
	 */
	public void updateSavedCharityData(String charityTitle, String charityDescription, String charityDateline, double charityTargetAmt, double charityGatheredAmt, String charityImage, String charityAccBank, String charityAccNumber, String charityAccName);

	public void charityUpdateConfirmation();

	public void charityUpdateFailed();

}%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Charity</title>
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
        
        <%ArrayList<Charity> charitylist = (ArrayList<Charity>)session.getAttribute("charitylistupdate");
        
            int i=0;
        %>
        <form  name="AddCharityform" method="post" action="ManageCharityControl" enctype="multipart/form-data">
        <div class="container pb-5">
            <div class="row align-items-start justify-content-center"></div>
            <div class="row align-items-center pt-4">
                <div class="col">
                    <div class="card mb-2 bg-light text-dark" style="width: auto;">
                        <div class="card-body">
                            <h4 class="card-title" style="text-align: center;"><b>Update Charity</b></h4>
                            <div class="row g-2 p-2">
                                <div class="col">
                                  <div class="form-floating">
                                    <label for="floatingInput">Charity Title</label>
                                    <input type="text" class="form-control" id="floatingInput" placeholder="Title of Charity" name="charityTitle" value="<%=((Charity)charitylist.get(i)).getCharityTitle()%>" size="100" required>                                    
                                  </div>
                                </div>
                                <div class="col-md">
                                  <div class="form-floating">
                                    <label for="floatingInput">Charity Dateline</label>
                                    <input type="date" class="form-control" id="floatingInput" placeholder="Dateline of Charity" name="charityDateline" value="<%=((Charity)charitylist.get(i)).getCharityDateline()%>" size="100" required>                                    
                                  </div>
                                </div>
                            </div>
                            <div class="row g-2 p-2">
                                <div class="col">
                                  <div class="form-floating">
                                    <label for="floatingInput">Charity Description</label>
                                    <input type="text" class="form-control" id="floatingInput" placeholder="Description of Charity" name="charityDescription" value="<%=((Charity)charitylist.get(i)).getCharityDescription()%>" size="100" required>                                    
                                  </div>
                                </div>
                            </div>
                            <div class="row g-2 p-2">
                                <div class="col">
                                  <div class="form-floating">
                                    <label for="floatingInput">Bank Account</label>
                                    <input type="text" class="form-control" id="floatingInput" placeholder="Type of Bank Account" name="charityAccBank" value="<%=((Charity)charitylist.get(i)).getCharityAccBank()%>" size="100" required>                                    
                                  </div>
                                </div>
                                <div class="col-md">
                                  <div class="form-floating">
                                    <label for="floatingInput">Account Number</label>
                                    <input type="int" class="form-control" id="floatingInput" placeholder="Bank Account's Number" name="charityAccNumber" value="<%=((Charity)charitylist.get(i)).getCharityAccNumber()%>" size="100" required>                                    
                                  </div>
                                </div>
                            </div>
                            <div class="row g-2 p-2">
                                <div class="col">
                                  <div class="form-floating">
                                    <label for="floatingInput">Account Name</label>
                                    <input type="text" class="form-control" id="floatingInput" placeholder="The Account's Name" name="charityAccName" value="<%=((Charity)charitylist.get(i)).getCharityAccName()%>" size="100" required>                                    
                                  </div>
                                </div>
                            </div>
                            <div class="row g-2 p-2">
                                <div class="col">
                                  <div class="form-floating">
                                    <label for="floatingInput">Charity Targeted Amount</label>
                                    <input type="text" class="form-control" id="floatingInput" placeholder="The Targeted Amount of the Charity" name="charityTargetAmt" value="<%=((Charity)charitylist.get(i)).getCharityTargetAmt()%>" size="100" required>                                    
                                  </div>
                                </div>
                                <div class="col-md">
                                  <div class="form-floating">
                                    <label for="floatingInput">Charity Image</label>
                                    <input type="file" class="form-control" id="floatingInput" placeholder="Image of the Charity" name="charityImage" value="<%=((Charity)charitylist.get(i)).getCharityImage()%>" size="100" value="0.00" required>                                    
                                  </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="d-grid gap-2 col-3 mx-auto pt-1">
                        <input class="btn btn-warning" type="reset" id="buttonreset" name="buttonreset" value="Reset Form">
                        <input class=" btn btn-primary" type="submit" id="button7" name="button7" value="Update Charity">                                            
                    </div>
                    <div class="d-grid gap-2 col-2 mx-auto pt-2">
                        <a href="ManageCharityControl?option=Charity Menu" class="btn btn-success">Charity Menu</a>       
                    </div>
                </div>
            </div>
        </div>
        </form>
        
<%--        <form  name="AddCharityform" method="post" action="ManageCharityControl" enctype="multipart/form-data">
        <table align="center" width="500" border="5" cellspacing="5" cellpadding="5">
        <%ArrayList<Charity> charitylist = (ArrayList<Charity>)session.getAttribute("charitylistupdate");
        
            int i=0;
        %>
          <tr>
            <th width="72" scope="row">
                <div align="left">Charity Title</div></th>
            <td width="240">
                <label>
                    <input type="text" name="charityTitle" id="charityTitle" value="<%=((Charity)charitylist.get(i)).getCharityTitle()%>" size="100">
                </label>
            </td>
          </tr>

          <tr>
            <th scope="row">
                <div align="left">Charity Description</div>
            </th>
            <td>
                <label>
                    <input type="text" name="charityDescription" id="charityDescription" value="<%=((Charity)charitylist.get(i)).getCharityDescription()%>" size="100" required>
                </label>
            </td>
          </tr>

          <tr>
            <th scope="row">
                <div align="left">Charity Dateline</div>
            </th>
            <td>
                <label>
                    <input type="date" name="charityDateline" id="charityDateline" value="<%=((Charity)charitylist.get(i)).getCharityDateline()%>" size="100" required>
                </label>
            </td>
          </tr>

          <tr>
            <th scope="row">
                <div align="left">Account Bank</div>
            </th>
            <td>
                <label>
                    <input type="text" name="charityAccBank" id="charityAccBank" value="<%=((Charity)charitylist.get(i)).getCharityAccBank()%>" size="100" required required>
                </label>
            </td>
          </tr>

          <tr>
            <th scope="row">
                <div align="left">Account Number</div>
            </th>
            <td>
                <label>
                    <input type="int" name="charityAccNumber" id="charityAccNumber" value="<%=((Charity)charitylist.get(i)).getCharityAccNumber()%>" size="100" required>
                </label>
            </td>
          </tr>

          <tr>
            <th scope="row">
                <div align="left">Account Name</div>
            </th>
            <td>
                <label>
                    <input type="text" name="charityAccName" id="charityBankName" value="<%=((Charity)charitylist.get(i)).getCharityAccName()%>" size="100" required>
                </label>
            </td>
          </tr>

          <tr>
            <th scope="row">
                <div align="left">Charity Image</div>
            </th>
            <td>
                <label>
                    <input type="file" name="charityImage" id="charityImage" value="<%=((Charity)charitylist.get(i)).getCharityImage()%>" required>
                </label>
            </td>
          </tr>


          <tr>
            <th scope="row">
                <div align="left">Charity Target Amount (RM)</div>
            </th>
            <td>
                <label>
                    <input type="text" name="charityTargetAmt" id="charityTargetAmt" size="100" value="<%=((Charity)charitylist.get(i)).getCharityTargetAmt()%>" required>
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

              <input type="submit" name="button7" id="button7" value="Update">
              <input type="reset" name="buttonreset" id="buttonreset" value="Reset">
            </label></td>
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
