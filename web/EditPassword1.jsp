<!DOCTYPE html>
<html>
    <head>
        <title>Change Password</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/Site.css">

    </head>
    <body>

    <center>
        <h1>REGISTRATION PAGE</h1>
    </center>
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
    %>
    <center>
        <div>
            <form method="POST" action="save_password">
                <table align="center"><br>

                    <tr><td>Old Password   </td><td><input type="password" name="userid"  placeholder="opass" required/><br><br></td></tr>

                    <tr><td>Password   </td><td><input type="password" name="pass" id="password" placeholder="npass" oninput="checkSize();" required/><br><br></td></tr>

                    <tr><td> Confirm Password   </td><td><input type="password" id="retypepassword" placeholder="retype password" oninput="checkPasswords();" required/><br><br></td></tr>
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
        </div>
    </center>
</body>
<script>
    function checkSize() {
        var password1 = document.getElementById('password');
        var s = password1.value;
        if (s.length < 8) {
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

