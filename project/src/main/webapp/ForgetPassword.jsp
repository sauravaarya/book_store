

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Forgot Password</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: #1e1e2f;
            margin: 0;
            overflow: hidden;
        }
        .container {
            background: rgba(255, 255, 255, 0.1);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.3);
            text-align: center;
            width: 320px;
            backdrop-filter: blur(10px);
            animation: slideIn 0.6s ease-in-out;
        }
        h2 {
            color: #fff;
            font-size: 24px;
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin: 10px 0;
            font-weight: bold;
            color: #ddd;
        }
        input {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: none;
            border-radius: 8px;
            outline: none;
            font-size: 14px;
            background: rgba(255, 255, 255, 0.2);
            color: #fff;
            transition: 0.3s;
        }
        input:focus {
            background: rgba(255, 255, 255, 0.3);
            box-shadow: 0px 0px 10px rgba(255, 255, 255, 0.5);
        }
        button {
            background: #ff4b5c;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            font-weight: bold;
            transition: 0.3s;
        }
        button:hover {
            background: #e03e50;
            transform: scale(1.05);
        }
        a {
            display: inline-block;
            margin-top: 15px;
            text-decoration: none;
            color: #ff4b5c;
            font-weight: bold;
            transition: 0.3s;
        }
        a:hover {
            color: #fff;
        }
        @keyframes slideIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Forgot Password</h2>
        <form action="<%= request.getContextPath() %>/ForgotPasswordServlet" method="POST">
            <label>Enter your registered email:</label>
            <input type="email" name="email" required>
            <button type="submit">Send OTP</button>
        </form>
        <a href="Login.jsp">Back to Login</a>
    </div>
</body>
</html>







