<%-- 
    Document   : MakeCharityInterface
    Created on : Dec 29, 2020, 5:52:45 PM
    Author     : Amir Syafiq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!public interface MakeCharityInterface {

	/**
	 * 
	 * @param userName
	 * @param userID
	 * @param userEmail
	 * @param userPhoneNum
	 * @param charityAmt
	 * @param charityID
	 * @param charityImgProof
	 */
	public void addNewDonorData(String userName, int userID, String userEmail, String userPhoneNum, double charityAmt, int charityID, String charityImgProof);

	public void charityConfirmation();

}%>

<!DOCTYPE html>
<html>
    <head>
        <title>Make Charity</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body style="background-color: #ffdac1;"> 
    <h1  style="text-align:center">Make Charity</h1>
    
    <% 
        int charityID=(Integer)session.getAttribute("makeIDCharity");
        String message = (String)session.getAttribute("alertMsg");
    %>
    
    <% if(!message.equals("no")){ %>
        <script type="text/javascript">
        var msg = "<%=message%>";
        alert(msg);
    </script>
    <%}%>
  
        <form  name="AddParticipantform" method="post" action="ViewPageControl" enctype="multipart/form-data">
      <table align="center" width="500" border="5" cellspacing="5" cellpadding="5">
          
        <tr>
          <th width="72" scope="row">
              <div align="left">ID</div></th>
          <td width="240">
              <label>
                  <input type="text" name="userID" id="userID" size="100" required>
              </label>
          </td>
        </tr>
        
        <tr>
          <th width="72" scope="row">
              <div align="left">Name</div></th>
          <td width="240">
              <label>
                  <input type="text" name="userName" id="userName" size="100" >
              </label>
          </td>
        </tr>
        
        <tr>
          <th scope="row">
              <div align="left">Email Address</div>
          </th>
          <td>
              <label>
                  <input type="text" name="userEmail" id="userEmail" size="100" required>
              </label>
          </td>
        </tr>
        
        <tr>
          <th scope="row">
              <div align="left">Telephone Number</div>
          </th>
          <td>
              <label>
                  <input type="text" name="userPhoneNum" id="userPhoneNum" size="100" required>
              </label>
          </td>
        </tr>
        
        <tr>
          <th scope="row">
              <div align="left">Donation Amount</div>
          </th>
          <td>
              <label>RM
                  <input type="text" name="donationAmt" id="donationAmt" size="100" required>
              </label>
          </td>
        </tr>
        
        <tr>
          <th scope="row">
              <div align="left">Payment Proof Image</div>
          </th>
          <td>
              <label>
                  <input type="file" name="donorImgProofImage" id="donorImgProofImage" required>
              </label>
          </td>
        </tr>
        
        <input type="hidden" name="charityID" value=<%=charityID %> >
        
      
        <tr>
          <th scope="row"><div align="left"></div></th>
          <td>&nbsp;</td>
        </tr>
        
        <tr>
          <th scope="row"><div align="left"></div></th>
          <td><label>
                  
            <input type="submit" name="buttonSubmitDonation" id="button1" value="Add">
            <input type="reset" name="buttonreset" id="button2" value="Reset">
          </label></td>
        </tr>
        
      </table>
    </form>
        
    <br><br>
    <form action="ViewPageInterface.jsp">
    <table border="0" align="center">
      <tr>
        <td><input type="submit" value="Go back" /></td>
      </tr>
    </table>
    </form>
    </body>
</html>
