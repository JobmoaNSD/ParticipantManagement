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
                    </div>
                </div>
                <div class="d-grid gap-2 mb-4">
                    <button type="submit" class="btn btn-primary btn-lg">로그인</button>
                </div>
                <div class="text-center">
                    <a href="#" class="text-decoration-none text-primary fw-bold"
                       data-bs-toggle="modal" data-bs-target=".#findPasswordModal">
                        비밀번호 찾기
                    </a>
                    <br>
                    <a href="/jobPlacement/placementList" class="text-decoration-none text-primary fw-bold"
                       data-bs-toggle="modal" data-bs-target=".#findPasswordModal">
                        기업회원 알선 확인
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>


<!-- 비밀번호 찾기 Modal -->
<div class="modal fade" id="findPasswordModal" data-bs-backdrop="static" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">비밀번호 찾기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form id="findPasswordForm">
                    <div class="mb-3">
                        <label for="findUserID" class="form-label">아이디</label>
                        <input type="text" class="form-control" id="findUserID" required>
                    </div>
                    <div class="mb-3">
                        <label for="userPrimaryKey" class="form-label">고유번호</label>
                        <input type="text" class="form-control" id="userPrimaryKey" required>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary" id="findPasswordBtn">비밀번호 찾기</button>
            </div>
        </div>
    </div>
</div>
</body>

<script>
    $(document).ready(function() {
        let formControl = $('.form-control');
        let findPasswordBtn = $('#findPasswordBtn');
        let findPasswordForm = $('#findPasswordForm');
        let findPasswordModal = $('#findPasswordModal');

        // 입력 필드에 포커스 효과
        formControl.focus(function() {
            $(this).parent().addClass('shadow-sm');
        }).blur(function() {
            $(this).parent().removeClass('shadow-sm');
        });

        findPasswordBtn.click(function() {
            if(findPasswordForm[0].checkValidity()) {
                // 비밀번호 찾기 로직 구현
                $.ajax({
                  url: '/findPassword.do',
                  type: 'POST',
                  data: [],
                  dataType: 'json',
                  success: function(data) {

                  },
                  error: function(request, status, error) {

                  }
                })
            } else {
                findPasswordForm[0].reportValidity();
            }
        });
    });
</script>
</html>
