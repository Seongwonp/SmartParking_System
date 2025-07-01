<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>
.list-group-item.active {
    background-color: #0d6efd !important;
    color: white !important;
}
</style>
<%
  // 현재 요청 URI 가져오기
  String currentUri = request.getRequestURI();

  // 네비게이션 링크 URI
  String userListUri = request.getContextPath() + "/WEB-INF/jsp/admin/user/userList.jsp";
  String subscriptionListUri = request.getContextPath() + "/WEB-INF/jsp/admin/user/subscriptionUserList.jsp";
  String subscriptionCarListUri = request.getContextPath() + "/WEB-INF/jsp/admin/user/carList.jsp";

  // active 클래스 조건문
  String userListActive = currentUri.equals(userListUri) ? "active" : "";
  String subscriptionListActive = currentUri.equals(subscriptionListUri) ? "active" : "";
  String subscriptionCarListActive = currentUri.equals(subscriptionCarListUri) ? "active" : "";
%>
<nav style="width: 100%; background-color: #f8f9fa; padding: 12px 24px; box-shadow: 0 2px 5px rgba(0,0,0,0.1);">
  <div class="list-group list-group-horizontal">
    <a href="/admin/user/list" class="list-group-item list-group-item-action <%= userListActive %>" <%= userListActive.equals("active") ? "aria-current=\"page\"" : "" %>>회원 목록</a>
    <a href="/admin/user/subscriptionList" class="list-group-item list-group-item-action <%= subscriptionListActive %>" <%= subscriptionListActive.equals("active") ? "aria-current=\"page\"" : "" %>>정기권 회원 목록</a>
    <a href="/admin/subscription/car/list" class="list-group-item list-group-item-action <%= subscriptionCarListActive %>" <%= subscriptionCarListActive.equals("active") ? "aria-current=\"page\"" : "" %>>정기권 차량 목록</a>
  </div>
</nav>