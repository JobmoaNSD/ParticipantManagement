<%--
  Created by IntelliJ IDEA.
  User: no1fc
  Date: 25. 6. 27.
  Time: 오후 2:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="국민취업지원제도 참여자 상세 정보 확인 페이지">
  <title>참여자 상세 정보 - 국민취업지원제도</title>
  <mytag:Logo/>

  <!-- Favicon -->
<%--  <link rel="icon" type="image/x-icon" href="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHZpZXdCb3g9IjAgMCAzMiAzMiIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHJlY3Qgd2lkdGg9IjMyIiBoZWlnaHQ9IjMyIiByeD0iNCIgZmlsbD0iIzI1NjNlYiIvPgo8cGF0aCBkPSJNOCAxMmg0djhoLTR2LTh6bTYgMGg0djhoLTR2LTh6bTYgMGg0djhoLTR2LTh6IiBmaWxsPSJ3aGl0ZSIvPgo8L3N2Zz4K">--%>

  <!-- Preconnect for performance -->
  <link rel="preconnect" href="https://cdn.jsdelivr.net">

  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;600;700&display=swap" rel="stylesheet">

  <!-- Custom Style CSS  -->
  <link href="/css/jobPlacementDefault.css" rel="stylesheet">

  <!-- Custom print Style CSS  -->
  <link href="/css/jobPlacementCss/companyDetailPrintCss.css" rel="stylesheet">


  <!-- jQuery JS  -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <!-- jobPlacementDetailJS -->
  <script src="/js/jobPlacementJs/jobPlacementDetailJS.js"></script>

  <!-- datepicker CSS JS -->
  <!-- mouse pointer 모양 bootstrap 5 -->
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

  <!-- Bootstrap Datepicker 로드 -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.10.0/js/bootstrap-datepicker.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.10.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="/js/jobPlacementJs/datepickerJS.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.10.0/css/bootstrap-datepicker.min.css">
  <link rel="stylesheet" href="/css/datepicker.css">

  <!-- kakao 주소 API 호출 JS API 문서 주소 https://postcode.map.daum.net/guide#usage -->
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

  <!-- kakao 주소 API 호출 JS API 문서 주소 https://postcode.map.daum.net/guide#usage -->
  <script src="/js/jobPlacementJs/kakaoAddressAPIJS.js"></script>
</head>
<body>
<!-- Skip Navigation for Accessibility -->
<%--<a href="#main-content" class="skip-link">메인 콘텐츠로 바로가기</a>--%>

<mytag:jobPlacementView-header/>

<%--<mytag:jobPlacementView-nav pageController="detail"/>--%>

<!-- Main Content -->
<main id="main-content" role="main" class="container">
  <!-- Breadcrumb -->
  <nav aria-label="breadcrumb" class="breadcrumb-nav">
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="#" id="backToListATag">
          <i class="bi bi-list-ul"></i> 참여자 목록
        </a>
      </li>
      <li class="breadcrumb-item active" aria-current="page">
        <span id="currentParticipantName">${data.participant}</span> 상세정보
      </li>
    </ol>
  </nav>

  <div class="main-content detail-content" data-participant-info="참여자: ${data.participant} | 구직번호: ${data.jobNumber}">
    <!-- 페이지 헤더 -->
    <div class="d-flex justify-content-between align-items-center mb-4">
      <div>
        <h2 class="h4 mb-1">${data.participant} 상세 정보</h2>
        <p class="text-muted mb-0">선택된 참여자의 상담사정보를 확인하세요.<%--이력서와 자기소개서를 확인하세요.--%></p>
      </div>
      <div class="d-flex align-items-center gap-3">
        <span class="text-muted">참여자 구직번호 : <strong id="selectedParticipantId">${data.jobNumber}</strong></span>
        <c:if test="${JOBMOA_LOGIN_DATA.memberUserID eq data.counselorId}">
          <button type="button"
                  class="btn btn-modern btn-info"
                  id="updateBtn">
            <i class="bi bi-pencil-square"></i> 수정
          </button>
        </c:if>
        <button type="button"
                class="btn btn-modern btn-secondary"
                id="printBtn">
          <i class="bi bi-printer"></i> 인쇄
        </button>
        <a href="#"
           id="backToListBtn"
           class="btn btn-modern btn-outline">
          <i class="bi bi-arrow-left"></i> 목록으로
        </a>
      </div>
    </div>

    <!-- 기본 정보 (읽기 전용) -->
    <div class="card-modern">
      <div class="card-header">
        <h3 class="card-title">
          <i class="bi bi-person-badge-fill"></i>
          기본 정보
        </h3>
      </div>
      <div class="card-body">
        <div class="readonly-section">
          <div class="readonly-item">
            <input type="hidden" id="detailJobNumber" name="jobNumber" value="${data.jobNumber}">
            <input type="hidden" id="detailCounselorId" name="counselorId" value="${JOBMOA_LOGIN_DATA.memberUserID}">
            <span class="readonly-label">이름</span>
            <span class="readonly-value" id="detailName" name="participant" >${data.participant}</span>
          </div>
          <div class="readonly-item">
            <span class="readonly-label">(만)나이</span>
            <span class="readonly-value" id="detailAge" name="age" >${data.age == 0 ? '비공개':data.age}</span>
            <input type="hidden" id="detailBirthDate" name="birthDate" value="${data.birthDate}">
          </div>
          <div class="readonly-item">
            <span class="readonly-label">성별</span>
            <span class="readonly-value" id="detailGender" name="gender" >${data.gender == null ? '비공개':data.gender}</span>
          </div>
          <div class="readonly-item">
            <span class="readonly-label">거주지</span>
            <span class="readonly-value" id="detailLocation" name="address" >${data.address}</span>
            <div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
              <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" alt="닫기 버튼">
            </div>
          </div>
          <div class="readonly-item">
            <span class="readonly-label">희망직종</span>
            <span class="readonly-value" id="detailJob" name="desiredJob" >${data.desiredJob}</span>
          </div>
          <div class="readonly-item">
            <span class="readonly-label">희망연봉</span>
            <span class="readonly-value" id="detailSalary" name="desiredSalary" >${data.desiredSalary}</span>
          </div>
          <div class="readonly-item">
            <span class="readonly-label">학교명</span>
            <span class="readonly-value" id="schoolName" name="schoolName" >${data.schoolName}</span>
          </div>
          <div class="readonly-item">
            <span class="readonly-label">전공</span>
            <span class="readonly-value" id="major" name="major" >${data.major}</span>
          </div>
          <div class="readonly-item">
            <span class="readonly-label">자격증</span>
            <span class="readonly-value" id="detailCertificates" name="certificate" >${data.certificate eq '' ? '없음':data.certificate}</span>
          </div>
          <div class="readonly-item">
            <span class="readonly-label">경력사항</span>
            <span class="readonly-value" id="detailExperience" name="career" >${data.career eq '' ? '신입':data.career}</span>
          </div>
<%--          <div class="readonly-item">--%>
<%--            <span class="readonly-label">등록일</span>--%>
<%--            <span class="readonly-value" id="detailRegistrationDate">${data.career}</span>--%>
<%--          </div>--%>
          <div class="readonly-item">
            <span class="readonly-label">상세정보</span>
            <pre class="readonly-pre" id="placementDetail" name="placementDetail" >${data.placementDetail eq '' ? '' : data.placementDetail}</pre>
          </div>
        </div>
      </div>
    </div>

    <!-- 자기소개서 (읽기 전용) -->
    <div class="card-modern">
      <div class="card-header">
        <h3 class="card-title">
          <i class="bi bi-file-text-fill"></i>
          담당 상담사
        </h3>
      </div>
      <div class="card-body">
        <div id="detailEssayContainer">
<%--          <div class="essay-section">--%>
<%--            <h4 class="essay-title">1. 지원동기 및 포부</h4>--%>
<%--            <p class="essay-content">저는 이 직무에 지원하게 된 동기는 제가 가진 IT 관련 지식과 경험을 활용하여 회사의 발전에 기여하고 싶기 때문입니다. 특히 사무직으로서의 업무 경험을 바탕으로 체계적이고 효율적인 업무 처리 능력을 발휘할 수 있을 것이라고 생각합니다.--%>

<%--              앞으로의 포부는 단순히 주어진 업무를 수행하는 것을 넘어서, 업무 프로세스 개선과 효율성 향상에 기여하고 싶습니다. 또한 지속적인 학습을 통해 전문성을 키워나가며, 팀원들과의 협업을 통해 더 나은 결과를 만들어내고 싶습니다.</p>--%>
<%--          </div>--%>
          <div class="essay-section">
            <h4 class="essay-title">이력서와 자기소개서는 아래 상담사에게 문의 부탁드립니다.</h4>
            <p class="essay-content">
              <strong>지점 : </strong> ${data.counselorBranch}
              <strong>상담사 : </strong> ${data.counselor}
              <strong>이메일 : </strong> ${data.email}
              <strong>전화 번호 : </strong> ${data.counselorPhone}
            </p>
          </div>
        </div>
      </div>
    </div>

  </div>
</main>

<!-- Toast Container -->
<div class="toast-container" id="toastContainer"></div>

<!-- Scripts -->
<script src="../js/paginationJS.js"></script>
<script>
  $(document).ready(function(){
    let page = parseInt("${param.page}", 10) || 1; // page가 비어있거나 아닌 경우 숫자로 변환 후 기본값 1 적용
    page = (page == 0) ? 1 : page; //page가 0이라면 1로 변경
//updateBtn

    /* 리스트 돌아가기 버튼 주소 추가 */
    $('#backToListATag').on('click',function(){
      locationBack(page);
    })
    $('#backToListBtn').on('click',function(){
      locationBack(page);
    })
    /* 리스트 돌아가기 버튼 주소 추가 */

    /* 프린트 버튼 실행 시작 */
    $('#printBtn').click(function(){
      window.print();
    })
    /* 프린트 버튼 실행 끝 */

    /* datePicker 날짜 형식 변환 시작 */
    const datepicker_on = $('.datepicker_on');
    let dateValue = "";

    default_datepicker();

    datepicker_on.on('keyup', function () {
      dateValue = $(this).val();
      if(dateValue.length == 7) {
        dateValue+='-'
      }
      else if(dateValue.length == 4) {
        dateValue+='-'
      }
      $(this).val(dateValue);
    });

    datepicker_on.on('change', function () {
      dateValue = $(this).val();
      const datePattern = /^\d{4}-\d{2}-\d{2}$/;
      console.log(dateValue);
      if (!datePattern.test(dateValue)) {
        $(this).val(''); // 날짜형식이 아니면 삭제
        console.log('Invalid date format, value cleared.');
      } else {
        console.log('datepicker_on');
        //console.log(dateValue);
      }
    });
    /* datePicker 날짜 형식 변환 끝 */


    /*// kakao 주소 api function 시작 TODO 여기서 부터 시작
    const addressBtn = $("#detailLocation");
    const btnCloseLayer = $("#btnCloseLayer");
    const layer = $("#addressBtn");
    // 주소 입력 필드 클릭 시 주소 검색 창 열기
    addressBtn.on("keyup", function () {
      console.log(layer.val());
      getAddress();
    });

    // 닫기 버튼 클릭 시 주소 검색 창 닫기
    btnCloseLayer.on("click", function () {
      closeDaumPostcode();
    });
    // kakao 주소 api function 끝*/

  })
</script>
</body>
</html>