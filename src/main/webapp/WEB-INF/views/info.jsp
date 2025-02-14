<%--
  Created by IntelliJ IDEA.
  User: no1fc
  Date: 25. 1. 20.
  Time: 오후 4:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<!-- sweetalert2 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="js/sweetAlert.js"></script>

<script>
    $(document).ready(function(){
        let icon = '${icon}';
        console.log(icon);
        let title = '${title}';
        console.log(title);
        let message = '${message}';
        console.log(message);
        let url = '${url}';
        console.log(url);

        if(icon == 'success'){
            alertDefaultSuccess(title, message).then((r) => {
                console.log(r);
                location.href = url;
            });
        }
        else if(icon == 'error'){
            alertDefaultError(title, message).then(()=>{
                location.href = url;
            });
        }
        else if(icon == 'info'){
            alertDefaultInfo(title, message).then(()=>{
                location.href = url;
            });
        }
        else if(icon == 'question'){
            alertDefaultQuestion(title, message).then(()=>{
                location.href = url;
            });
        }
        else if(icon == 'back'){
            alertDefaultInfo(title, message).then(()=>{
                window.history.back();
            });
        }
        else{
            alertDefaultWarning('잘못된 접근', '메인 페이지로 돌아갑니다.').then(()=>{
                location.href = 'login.do';
            });
        }
    })
</script>
