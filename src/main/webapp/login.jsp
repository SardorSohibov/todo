<%--
  Created by IntelliJ IDEA.
  User: sohib
  Date: 7/22/2025
  Time: 11:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Simple ToDo App</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #121212;
            color: #e0f7fa;
        }

        .container {
            display: grid;
            place-items: center;
            height: 100vh;
        }

        .login {
            color: #a7ffeb;
            text-transform: uppercase;
            letter-spacing: 2px;
            font-weight: bold;
            font-size: x-large;
        }

        .card {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 350px;
            width: 350px;
            flex-direction: column;
            gap: 35px;
            background: #1e1e1e;
            box-shadow: 12px 12px 25px rgba(0, 0, 0, 0.7),
            -12px -12px 25px rgba(255, 255, 255, 0.05);
            border-radius: 12px;
        }

        .inputBox {
            position: relative;
            width: 250px;
        }

        .inputBox input {
            width: 100%;
            padding: 10px;
            outline: none;
            border: none;
            background: transparent;
            border-left: 2px solid #00bcd4;
            border-bottom: 2px solid #00bcd4;
            color: #e0f7fa;
            font-size: 1em;
            border-bottom-left-radius: 8px;
            transition: 0.3s ease;
        }

        .inputBox span {
            margin-top: 5px;
            position: absolute;
            left: 0;
            transform: translateY(-4px);
            margin-left: 10px;
            padding: 10px;
            pointer-events: none;
            font-size: 12px;
            color: #b2ebf2;
            text-transform: uppercase;
            transition: 0.5s;
            letter-spacing: 3px;
            border-radius: 8px;
        }

        .inputBox input:focus ~ span,
        .inputBox input:valid ~ span {
            transform: translateX(113px) translateY(-15px);
            font-size: 0.8em;
            padding: 5px 10px;
            background: #00bcd4;
            color: #121212;
            letter-spacing: 0.2em;
        }

        .inputBox input:focus,
        .inputBox input:valid {
            border: 2px solid #00bcd4;
            border-radius: 8px;
        }

        .enter {
            height: 45px;
            width: 100px;
            border-radius: 5px;
            border: 2px solid #00bcd4;
            cursor: pointer;
            background-color: transparent;
            transition: 0.3s;
            color: #00bcd4;
            text-transform: uppercase;
            font-size: 10px;
            letter-spacing: 2px;
        }

        .enter:hover {
            background-color: #00bcd4;
            color: #121212;
        }

        /* JustUse Button */
        .usewithoutlogin {
            --primary-color: #e0f7fa;
            --hovered-color: #00bcd4;
            border: none;
            background: none;
            cursor: pointer;
            display: flex;
            align-items: center;
            font-weight: 600;
            font-size: 20px;
            gap: 0.5rem;
            margin-top: 2rem;
        }

        .usewithoutlogin p {
            margin: 0;
            position: relative;
            color: var(--primary-color);
        }

        .usewithoutlogin::after {
            content: "";
            position: absolute;
            width: 0;
            left: 0;
            bottom: -7px;
            background: var(--hovered-color);
            height: 2px;
            transition: 0.3s ease-out;
        }

        .usewithoutlogin p::before {
            position: absolute;
            content: "SignUp";
            width: 0%;
            inset: 0;
            color: var(--hovered-color);
            overflow: hidden;
            transition: 0.3s ease-out;
        }

        .usewithoutlogin:hover::after {
            width: 100%;
        }

        .usewithoutlogin:hover p::before {
            width: 100%;
        }

        .usewithoutlogin:hover svg {
            transform: translateX(4px);
            color: var(--hovered-color);
        }

        .usewithoutlogin svg {
            color: var(--primary-color);
            width: 15px;
            transition: 0.2s;
            transition-delay: 0.2s;
        }
    </style>
</head>
<body>

<div class="container">
    <form action="/login" method="post">
        <div class="card">

            <%if (request.getAttribute("error") != null) {%>
            <div role="alert">
                Username or password is incorrect!
            </div>
            <%}%>

            <a class="login">Log in</a>
            <div class="inputBox">
                <input type="text" required name="username">
                <span class="user">Username</span>
            </div>

            <div class="inputBox">
                <input type="password" required name="password">
                <span>Password</span>
            </div>
            <button type="submit" class="enter">Login</button>
            <a href="register.jsp" class="usewithoutlogin">
                <p>SignUp</p>
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path fill="currentColor" d="M10 17l5-5-5-5v10z"/>
                </svg>
            </a>

        </div>
    </form>
</div>

</body>
</html>