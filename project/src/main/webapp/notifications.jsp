<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Notifications</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        .notification-item {
            transition: background-color 0.2s;
        }
        .notification-item:hover {
            background-color: #f3f4f6;
        }
        .unread {
            background-color: #f0f9ff;
        }
    </style>
</head>
<body>
    <div class="p-4">
        <h2 class="text-xl font-bold mb-4">Your Notifications</h2>
        
        <c:choose>
            <c:when test="${not empty notifications}">
                <div class="space-y-2">
                    <c:forEach var="notification" items="${notifications}">
                        <div class="notification-item p-3 rounded-lg ${notification.read ? '' : 'unread'}">
                            <div class="flex justify-between items-start">
                                <div>
                                    <p class="font-medium">${notification.message}</p>
                                    <p class="text-sm text-gray-500">
                                        <fmt:formatDate value="${notification.createdAt}" pattern="MMM dd, yyyy HH:mm" />
                                    </p>
                                </div>
                                <c:if test="${!notification.read}">
                                    <span class="bg-blue-500 text-white text-xs px-2 py-1 rounded-full">New</span>
                                </c:if>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <p class="text-gray-500">You have no notifications.</p>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>