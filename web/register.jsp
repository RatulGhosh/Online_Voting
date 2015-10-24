<link rel="stylesheet" href="res/Site.css"/>
<title>
    Online Pooling : REGISTER
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
</title>

<%@page import="java.util.*"%>
<%
    String st = "";
    Random rand = new Random();
    for (int i = 1; i < 8; i++) {
        if (i % 2 == 0) {
            st += (char) ((int) ((rand.nextFloat()) * 9) + 48);
        } else {
            st += (char) ((int) ((rand.nextFloat()) * 26) + 65);
        }
    }
    String[] states = {"Andaman and Nicobar Islands", "Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chandigarh", "Chhattisgarh", "Dadra and Nagar Haveli", "Daman and Diu", "Delhi", "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jammu and Kashmir", "Jharkhand", "Karnataka", "Kerala", "Lakshadweep", "Madhya Pradesh", "Maharashtra", "Manipur", "Meghalaya", "Mizoram", "Nagaland", "Orissa", "Pondicherry", "Punjab", "Rajasthan", "Sikkim", "Tamil Nadu", "Tripura", "Uttaranchal", "Uttar Pradesh", "West Bengal"};
%>

<div id="wrapper">
    <header id="top">
        <h1 id ="heading">Register for a Better India<br>
        </h1>
        <nav id="mainnav">
            <ul>
                <li><a href="index.html" >Home</a></li>
                <li><a href="candidatelogin.jsp">Candidate Login</a></li>
                <li><a href="login.jsp">Voter Login</a></li>
                <li><a href="register.jsp"class="thispage">Voter Registration</a></li>
                <li><a href="adminlogin.jsp">Admin Login</a></li>
            </ul>
        </nav>
    </header>
</div>
<br><br>
<center><h2>${requestScope.msg}</h2></center>


<center>
    <div>
        <img src="res/register.png" alt="Register Icon" style="float:left"/>
        <form method="POST" action="signup">
            <table align="center">
                <tr><th colspan><span style="font-family: cursive">Register Here</span><br><br></th></tr>
                <tr><td>Name : </td><td><input type="text" name="name" placeholder="name" required/><br><br></td><br><br></tr>
                <tr><td>Password   </td><td><input type="password" name="pass" id="password" placeholder="password" oninput="checkSize();" required/><br><br></td></tr>

                <tr><td> Confirm Password   </td><td><input type="password" id="retypepassword" placeholder="retype password" oninput="checkPasswords();" required/><br><br></td></tr>
                <tr><td>Address : </td><td><textarea rows="3" name="address" required placeholder="your address" ></textarea><br><br></td></tr>
                <tr><td>State : </td>
                    <td>
                        <select name ="state">
                            <option value="-1">------SELECT STATE------</option>
                            <%for (String s : states) {%>
                            <option  value="<%=s%>"><%=s%> </option>
                            <%}%>
                        </select>
                        <br><br>
                    </td>
                </tr>


                <tr><td>Gender</td>
                    <td>
                        <input type="radio" name="gender" value="M"> Male
                        <input type="radio" name="gender" value="F"> Female
                        <br><br>
                    </td>
                </tr>

                </tr>

                <tr><td>Highest level of education</td>
                    <td>
                        <input type="radio" name="academics" value="10th"/> 10th
                        <input type="radio" name="academics" value="12th"/> 12th
                        <input type="radio" name="academics" value="Graduate"/>Graduate
                        <input type="radio" name="academics" value="Post_Graduate"/>Post Graduate
                        <br><br>
                    </td>
                </tr>
                <tr>
                    <td>UPLOAD IMAGE</td>
                    <td><input type="file" name="profile_picture"/><br><br></td>
                </tr>
            </table>
            <center>
                <input class="captcha" id="captcha" value="<%=st%>"/><br><br>
                <input type="text" id="confirm_captcha" placeholder="type captcha" oninput="checkCaptcha();" required /><br><br>
            </center>
            <center>
                <div>
                    <input type="submit" value="Register"  class="button green"/>

                    <input type="reset" value="Reset"  class="button red"/>

                </div>
            </center>

        </form>

        <script>
            function checkSize() {
                var password1 = document.getElementById('password');
                var s = password1.value;
                if (s.length < 6) {
                    password1.setCustomValidity('Invalid Password');
                } else {
                    password1.setCustomValidity('');
                }
            }
            function checkPasswords() {
                var password1 = document.getElementById('password');
                var password2 = document.getElementById('retypepassword');
                if (password1.value != password2.value) {
                    password2.setCustomValidity('Passwords do not match!');
                } else {
                    password2.setCustomValidity('');
                }
            }
            function checkCaptcha() {
                var password1 = document.getElementById('captcha');
                var password2 = document.getElementById('confirm_captcha');
                if (password1.value != password2.value) {
                    password2.setCustomValidity('Captcha do not match!');
                } else {
                    password2.setCustomValidity('');
                }
            }
        </script>
        </html>

