<%--
  Created by IntelliJ IDEA.
  User: no1fc
  Date: 24. 12. 26.
  Time: 오전 11:14
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag" %>
<!DOCTYPE html>
<html>
<head>
    <title>잡모아</title>
    <!-- Jobmoa 로고 탭 이미지 -->
    <mytag:Logo/>
    <!-- mouse pointer 모양 bootstrap 5 -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

    <!-- bootstrap5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1">

<%--    눈 아이콘(예: fa-eye및 fa-eye-slash)--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .login-container {
            animation: fadeIn 0.5s ease-in;
        }
        .login-box {
            background: white;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }
        .login-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 25px rgba(0,0,0,0.15);
        }
        .form-control {
            border-radius: 10px;
            padding: 12px;
        }
        .form-control:focus {
            box-shadow: 0 0 0 0.2rem rgba(0,123,255,0.25);
        }
        .input-group-text {
            border-radius: 10px 0 0 10px;
            background-color: #f8f9fa;
        }
        .btn-primary {
            padding: 12px;
            border-radius: 10px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,123,255,0.3);
        }

        #changeUserID, #primaryKey{
            width: 73%;
        }

        #sendMail, #checkAuth{
            width: 27%;
            margin-left: auto;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        #changePassword, #changePasswordCheck{
            width: 90%;
        }

        #toggle-password, #toggle-password-check{
            width: 10%;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        #toggle-password:hover, #toggle-password-check:hover{
            color: #007bff;
        }

        #toggle-password:visited, #toggle-password-check:visited{
            color: #007bff;
        }


    </style>
</head>
<body>
<div class="container d-flex w-100 h-100 justify-content-center align-items-center min-vh-100">
    <div class="login-container">
        <div class="login-box p-5" style="width: 450px;">
            <h2 class="text-center mb-4 fw-bold">로그인</h2>
            <form action="/login.do" method="POST">
                <div class="mb-4">
                    <label for="memberUserID" class="form-label fw-bold">아이디</label>
                    <div class="input-group">
                        <span class="input-group-text">
                            <i class="fa fa-user"></i>
                        </span>
                        <input type="text" class="form-control" id="memberUserID" name="memberUserID"
                               placeholder="아이디를 입력해주세요" required>
                    </div>
                </div>
                <div class="mb-4">
                    <label for="memberUserPW" class="form-label fw-bold">비밀번호</label>
                    <div class="input-group">
                        <span class="input-group-text">
                            <i class="fa fa-lock"></i>
                        </span>
                        <input type="password" class="form-control" id="memberUserPW" name="memberUserPW"
                               placeholder="비밀번호를 입력해주세요" required>
                        <span class="input-group-text">
                            <i class="fas fa-eye-slash" id="icon-password"></i>
                        </span>
                    </div>
                </div>
                <div class="d-grid gap-2 mb-4">
                    <button type="submit" class="btn btn-primary btn-lg">로그인</button>
                </div>
                <div class="text-center">
                    <a href="#" class="text-decoration-none text-primary fw-bold"
                       data-bs-toggle="modal" data-bs-target="#changePasswordModal">
                        비밀번호 찾기
                    </a>
                    <br>
                    <br>
                    <a href="/jobPlacement/placementList" class="text-decoration-none text-primary fw-bold">
                        기업회원 알선 확인
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>


<!-- 비밀번호 찾기 Modal -->
<div class="modal fade" id="changePasswordModal" data-bs-backdrop="static" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">비밀번호 찾기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form id="changePasswordForm">
                    <div class="mb-3 row">
                        <label for="changeUserID" class="form-label">아이디</label>
                        <input type="text" class="form-control" id="changeUserID" required>
                        <button type="button" class="btn btn-primary" id="sendMail">인증번호 발송</button>
                    </div>
                    <div id="primaryKeyDiv" class="mb-3 row">
                        <label for="primaryKey" class="form-label">인증번호</label>
                        <input type="text" class="form-control" id="primaryKey">
                        <button type="button" class="btn btn-primary" id="checkAuth">인증번호 확인</button>
                    </div>
                    <div id="changePasswordDiv" class="mb-3 row">
                        <label for="changePassword" class="form-label">변경 비밀번호</label>
                        <input type="password" class="form-control mb-3" id="changePassword">
                        <i class="fas fa-eye-slash" id="toggle-password"></i>

                        <label for="changePasswordCheck" class="form-label">변경 비밀번호 확인</label>
                        <input type="password" class="form-control" id="changePasswordCheck">
                        <i class="fas fa-eye-slash" id="toggle-password-check"></i>

                        <div id="changePasswordResult">

                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary" id="changePasswordBtn">비밀번호 찾기</button>
            </div>
        </div>
    </div>
</div>
</body>

<script>
    $(document).ready(function() {
        let formControl = $('.form-control'); // form control
        let changePasswordBtn = $('#changePasswordBtn'); // 비밀번호 찾기 버튼
        let sendMailBtn = $('#sendMail'); //인증번호 발송 버튼
        let changePasswordForm = $('#changePasswordForm'); // 비밀번호 찾기 from
        let changePasswordModal = $('#changePasswordModal'); // 비밀번호 찾기 modal
        let primaryKeyInput = $('#primaryKey'); // 인증번호 입력 란
        let primaryKeyDiv = $('#primaryKeyDiv'); // 인증번호 Div
        let checkAuthBtn = $('#checkAuth'); // 인증번호 확인 버튼
        let checkAuthFlag = false; // 인증 완료

        const changePasswordDiv = $("#changePasswordDiv");
        const toggleChangePassword = $("#toggle-password"); // 변경 비밀번호 숨기기 보이기 아이콘
        const toggleChangePasswordCheck = $("#toggle-password-check"); // 변경 비밀번호 확인 숨기기 보이기 아이콘
        const changePassword = $("#changePassword"); // 변경 비밀번호
        const changePasswordCheck = $("#changePasswordCheck"); // 변경 비밀번호 확인
        const changePasswordResult = $("#changePasswordResult");

        const memberUserPW = $("#memberUserPW") // 로그인 비밀번호
        const iconPassword = $("#icon-password"); // 로그인 비밀번호 아이콘 숨기기
        resetForm() // 초기 설정 진행

        // 입력 필드에 포커스 효과
        formControl.focus(function() {
            $(this).parent().addClass('shadow-sm');
        }).blur(function() {
            $(this).parent().removeClass('shadow-sm');
        });

        sendMailBtn.click(function() {
            if(changePasswordForm[0].checkValidity()) {
                // 비밀번호 찾기 로직 구현
                $.ajax({
                  url: 'pwChangeSendEmail.api',
                  type: 'POST',
                  data: JSON.stringify({
                      "userId": changePasswordForm.find('#changeUserID').val(),
                  }),
                  contentType: 'application/json; charset=utf-8',
                  dataType: 'json',
                  success: function(data,status,xhr) {
                      // const responseData = JSON.parse(data);
                      console.log("responseData:[" + data + "]");
                      console.log("responseData:[" + status + "]");
                      console.log("responseData:[" + data.flag + "]");
                      console.log("responseData:[" + data.responseText + "]");
                      if(!data.flag){
                          alert(data.responseText);
                          return;
                      }

                      alert(data.responseText);
                      primaryKeyDiv.show();
                  },
                  error: function(request, status, error) {
                      /*console.log("code:" + request.status);
                      console.log("message:" + request.responseText);
                      console.log("error:" + error);*/

                      alert(request.responseText);
                  }
                })
            }
        });

        // 인증 후 비밀번호 찾기 버튼 활성화
        checkAuthBtn.on('click', function() {
            if(changePasswordForm[0].checkValidity()) {
                // 비밀번호 찾기 로직 구현
                $.ajax({
                    url: 'checkAuthCode.api',
                    type: 'POST',
                    data: JSON.stringify({
                        "authCode": changePasswordForm.find('#primaryKey').val(),
                        "userId": changePasswordForm.find('#changeUserID').val(),
                    }),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function(data,status,xhr) {
                        // const responseData = JSON.parse(data);
                        console.log("responseData:[" + data + "]");
                        console.log("responseData:[" + status + "]");
                        console.log("responseData:[" + data.flag + "]");
                        console.log("responseData:[" + data.responseText + "]");

                        if(!data.flag){
                            alert(data.responseText);
                            return;
                        }

                        alert(data.responseText);
                        changePasswordBtn.prop('disabled', false);
                        checkAuthFlag = true;
                        changePasswordDiv.show();
                    },
                    error: function(request, status, error) {
                        console.log("code:" + request.status);
                        console.log("message:" + request.responseText);
                        console.log("error:" + error);

                        alert(request.responseText);
                    }
                })
            }
        })

        changePasswordModal.on('hide.bs.modal', function (event) {
            resetForm()
        })

        function resetForm() {
            changePasswordForm.find('#changeUserID').val('');
            changePasswordForm.find('#primaryKey').val('');
            primaryKeyDiv.hide();
            changePasswordBtn.prop('disabled', true);
            checkAuthFlag = false;

            changePasswordDiv.hide();
            changePassword.val('');
            changePasswordCheck.val('');
            changePasswordResult.empty();
        }

         changePasswordBtn.on('click', function() {
             let changePasswordVal = changePassword.val();
             let changePasswordCheckVal = changePasswordCheck.val();

             let reg = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{5,}$/;//(?=.*?[A-Z]) 대소문자 확인

/*             if(!checkAuthFlag){
                alert("인증 완료 후 비밀번호 초기화가 가능합니다.")
                return;
             }*/

             changePasswordResult.empty();

             console.log(changePasswordVal === changePasswordCheckVal);
             if (changePasswordVal.search(/\s/) !== -1) {
                 passwordCheckInnerSpan(changePasswordResult, "비밀번호는 공백없이 부탁드립니다.", "red");
                 return false;
             }
             else if (false === reg.test(changePasswordVal)) {
                 passwordCheckInnerSpan(changePasswordResult, "비밀번호는 5자 이상이어야 하며, 숫자/소문자/특수문자(#?!@$%^&*-)를 모두 포함해야 합니다.", "red");
                 return;
             }
             else if (changePasswordVal === changePasswordCheckVal) {
                 passwordCheckInnerSpan(changePasswordResult, "비밀번호가 정상적으로 입력되었습니다.", "green");
             }
             else {
                 passwordCheckInnerSpan(changePasswordResult, "동일한 비밀번호를 입력해주세요.", "red");
             }

             fetchChangePassword()

         })

        function passwordCheckInnerSpan(innerDiv, str, color = "red") {
            let spanHTML = "<span style='color:"+color+";'>"+str+"</span>";
            innerDiv.append(spanHTML)
        }

        toggleChangePassword.on('click', function() {
            togglePasswordShow($(this), changePassword);
        })

        toggleChangePasswordCheck.on('click', function() {
            togglePasswordShow($(this), changePasswordCheck);
        })

        iconPassword.on('click', function() {
            togglePasswordShow($(this), memberUserPW);
        })

        function togglePasswordShow($togglePassword, $password) {
            if ($password.attr('type') === 'password') {
                $password.attr('type', 'text');
                $togglePassword.removeClass('fa-eye-slash').addClass('fa-eye');
            } else {
                $password.attr('type', 'password');
                $togglePassword.removeClass('fa-eye').addClass('fa-eye-slash');
            }
        }

        //TODO 업데이트 완료 및 실패에 대한 피드백을 추가해야함
        async function fetchChangePassword() {
            fetch('changePW.api', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    "memberUserID": changePasswordForm.find('#changeUserID').val(),
                    "memberUserPW": changePasswordForm.find('#changePassword').val(),
                    "memberUserChangePW": changePasswordForm.find('#changePasswordCheck').val(),
                })
            })
                .then(function(response) {
                    const responseData = response.json();
                    console.log(response);
                })
                .catch(function(error) {
                    console.log(error);
                })
        }
    });
</script>
</html>
