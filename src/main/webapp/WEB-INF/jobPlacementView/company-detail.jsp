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

  <!-- jobPlacementDetailJS -->
  <script src="/js/jobPlacementJs/jobPlacementDetailJS.js"></script>

  <style>

    /* 참여자 상세 정보 페이지 인쇄 스타일 - A4 최적화 */
    @media print {
      /* 페이지 설정 */
      @page {
        size: A4;
        margin: 15mm 20mm; /* 상하 15mm, 좌우 20mm */
        padding: 0;
      }

      /* 기본 설정 */
      * {
        -webkit-print-color-adjust: exact !important;
        color-adjust: exact !important;
        print-color-adjust: exact !important;
      }

      body {
        font-size: 11pt !important;
        line-height: 1.4 !important;
        color: #000 !important;
        background: #fff !important;
        font-family: 'Malgun Gothic', '맑은 고딕', sans-serif !important;
      }

      /* 헤더 스타일 - 인쇄용 */
      .system-header {
        display: block !important;
        background: #fff !important;
        background-image: none !important;
        color: #000 !important;
        padding: 10pt 0 !important;
        margin: 0 0 15pt 0 !important;
        border-bottom: 2px solid #000 !important;
        box-shadow: none !important;
        position: static !important;
        overflow: visible !important;
      }

      .system-header::before {
        display: none !important;
      }

      .system-header .container {
        max-width: none !important;
        width: 100% !important;
        padding: 0 !important;
        margin: 0 !important;
      }

      .system-title {
        font-size: 14pt !important;
        font-weight: bold !important;
        color: #000 !important;
        margin: 0 !important;
        text-align: center !important;
        display: block !important;
      }

      .system-title a {
        color: #000 !important;
        text-decoration: none !important;
      }

      .system-logo {
        display: none !important; /* 로고는 인쇄에서 제외 */
      }

      /* 숨길 요소들 */
      .main-nav,
      .breadcrumb-nav,
      .btn-modern,
      .card-header,
      .breadcrumb-item,
      .d-flex.justify-content-between,
      .toast-container,
      #printBtn,
      #backToListBtn,
      #backToListATag,
      .card-tools,
      .text-muted {
        display: none !important;
      }

      /* 컨테이너 설정 */
      .container {
        max-width: none !important;
        width: 100% !important;
        padding: 0 !important;
        margin: 0 !important;
      }

      .main-content {
        box-shadow: none !important;
        border-radius: 0 !important;
        padding: 0 !important;
        margin: 0 !important;
        background: #fff !important;
      }

      .detail-content {
        width: 100% !important;
        padding: 0 !important;
      }

      /* 문서 제목 - 헤더 아래에 배치 */
      .detail-content::before {
        content: "참여자 상세 정보";
        display: block;
        font-size: 16pt !important;
        font-weight: bold !important;
        text-align: center !important;
        margin: 15pt 0 !important;
        padding: 8pt !important;
        background: #f5f5f5 !important;
        border: 1px solid #000 !important;
      }

      /* 참여자 정보 헤더 */
      .detail-content::after {
        content: "참여자: ${data.participant} | 구직번호: ${data.jobNumber}";
        display: block;
        font-size: 12pt !important;
        font-weight: bold !important;
        text-align: center !important;
        margin-bottom: 15pt !important;
        padding: 6pt !important;
        background: #e9ecef !important;
        border: 1px solid #ddd !important;
        color: #000 !important;
      }

      /* 실제 제목 숨기기 */
      .detail-content h2 {
        display: none !important;
      }

      /* 카드 스타일 */
      .card-modern {
        box-shadow: none !important;
        border: 1px solid #000 !important;
        border-radius: 0 !important;
        margin-bottom: 15pt !important;
        page-break-inside: avoid;
      }

      .card-body {
        padding: 12pt !important;
      }

      /* 섹션 제목 */
      .card-modern .card-header {
        display: block !important;
        font-size: 13pt !important;
        font-weight: bold !important;
        background: #f5f5f5 !important;
        padding: 10pt !important;
        border-bottom: 1px solid #000 !important;
        color: #000 !important;
      }

      /* 아이콘 숨기기 */
      .card-header i {
        display: none !important;
      }

      /* 카드 제목 스타일 */
      .card-title {
        font-size: 13pt !important;
        font-weight: bold !important;
        color: #000 !important;
        margin: 1px !important;
      }

      /* 읽기 전용 섹션 */
      .readonly-section {
        background: #fff !important;
        border: none !important;
        padding: 0 !important;
        margin: 0 !important;
      }

      .readonly-item {
        display: flex !important;
        align-items: flex-start !important;
        padding: 6pt 0 !important;
        border-bottom: 1px solid #ddd !important;
        page-break-inside: avoid;
      }

      .readonly-item:last-child {
        border-bottom: none !important;
      }

      .readonly-label {
        font-weight: bold !important;
        color: #000 !important;
        min-width: 80pt !important;
        flex-shrink: 0 !important;
        margin-right: 10pt !important;
      }

      .readonly-value {
        color: #000 !important;
        flex: 1 !important;
        word-wrap: break-word !important;
      }

      /* 상세정보 전용 스타일 */
      .readonly-pre {
        background: #f9f9f9 !important;
        border: 1px solid #ddd !important;
        padding: 8pt !important;
        margin: 0 !important;
        font-size: 10pt !important;
        line-height: 1.4 !important;
        color: #000 !important;
        white-space: pre-wrap !important;
        word-wrap: break-word !important;
        max-height: none !important;
        overflow: visible !important;
        page-break-inside: avoid;
      }

      /* 자기소개서/담당상담사 섹션 */
      .essay-section {
        background: #fff !important;
        border: 1px solid #ddd !important;
        padding: 10pt !important;
        margin-bottom: 10pt !important;
        page-break-inside: avoid;
      }

      .essay-title {
        font-size: 12pt !important;
        font-weight: bold !important;
        color: #000 !important;
        margin-bottom: 8pt !important;
        padding-bottom: 4pt !important;
        border-bottom: 1px solid #ccc !important;
      }

      .essay-content {
        font-size: 10pt !important;
        line-height: 1.5 !important;
        color: #000 !important;
        white-space: pre-wrap !important;
        word-wrap: break-word !important;
      }

      /* 상담사 정보 강조 */
      .essay-content strong {
        font-weight: bold !important;
        color: #000 !important;
        display: inline-block !important;
        margin-right: 8pt !important;
      }

      /* 페이지 하단 정보 */
      .detail-content .main-content::after {
        content: "인쇄일: " attr(data-print-date) " | 국민취업지원제도";
        display: block;
        text-align: center;
        font-size: 8pt;
        color: #666;
        margin-top: 20pt;
        padding-top: 10pt;
        border-top: 1px solid #ccc;
      }

      /* 각 카드 사이 간격 조정 */
      .card-modern + .card-modern {
        margin-top: 15pt !important;
      }

      /* 텍스트 선택 방지 */
      .readonly-label,
      .essay-title {
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      /* 긴 텍스트 처리 */
      .readonly-value,
      .essay-content {
        overflow-wrap: break-word !important;
        word-break: break-word !important;
        hyphens: auto !important;
      }

      /* 특수 항목 처리 */
      .readonly-item:has(.readonly-pre) {
        flex-direction: column !important;
        align-items: stretch !important;
      }

      .readonly-item:has(.readonly-pre) .readonly-label {
        margin-bottom: 4pt !important;
        min-width: auto !important;
      }

      .readonly-item:has(.readonly-pre) .readonly-value {
        width: 100% !important;
      }

      /* 빈 값 처리 */
      .readonly-value:empty::after {
        content: "정보 없음";
        color: #999;
        font-style: italic;
      }

    }
  </style>
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

  <div class="main-content detail-content">
    <!-- 페이지 헤더 -->
    <div class="d-flex justify-content-between align-items-center mb-4">
      <div>
        <h2 class="h4 mb-1">${data.participant} 상세 정보</h2>
        <p class="text-muted mb-0">선택된 참여자의 상담사정보를 확인하세요.<%--이력서와 자기소개서를 확인하세요.--%></p>
      </div>
      <div class="d-flex align-items-center gap-3">
        <span class="text-muted">참여자 구직번호 : <strong id="selectedParticipantId">${data.jobNumber}</strong></span>
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
            <span class="readonly-label">이름</span>
            <span class="readonly-value" id="detailName">${data.participant}</span>
          </div>
          <div class="readonly-item">
            <span class="readonly-label">나이</span>
            <span class="readonly-value" id="detailAge">${data.age == 0 ? '비공개':data.age}</span>
          </div>
          <div class="readonly-item">
            <span class="readonly-label">거주지</span>
            <span class="readonly-value" id="detailLocation"><c:choose>
              <c:when test="${data.address eq ''}">
                <td></td>
              </c:when>
              <c:otherwise>
                <td>${fn:substring(data.address, 0, 11)}...</td>
              </c:otherwise>
            </c:choose></span>
          </div>
          <div class="readonly-item">
            <span class="readonly-label">희망직종</span>
            <span class="readonly-value" id="detailJob">${data.desiredJob}</span>
          </div>
          <div class="readonly-item">
            <span class="readonly-label">희망연봉</span>
            <span class="readonly-value" id="detailSalary">${data.desiredSalary}</span>
          </div>
          <div class="readonly-item">
            <span class="readonly-label">자격증</span>
            <span class="readonly-value" id="detailCertificates">${data.certificate eq '' ? '없음':data.certificate}</span>
          </div>
          <div class="readonly-item">
            <span class="readonly-label">경력사항</span>
            <span class="readonly-value" id="detailExperience">${data.career eq '' ? '신입':data.career}</span>
          </div>
<%--          <div class="readonly-item">--%>
<%--            <span class="readonly-label">등록일</span>--%>
<%--            <span class="readonly-value" id="detailRegistrationDate">${data.career}</span>--%>
<%--          </div>--%>
          <div class="readonly-item">
            <span class="readonly-label">상세정보</span>
            <pre class="readonly-pre" id="placementDetail">${data.placementDetail eq '' ? '' : data.placementDetail}</pre>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="../js/paginationJS.js"></script>
<script>
  $(document).ready(function(){
    let page = parseInt("${param.page}", 10) || 1; // page가 비어있거나 아닌 경우 숫자로 변환 후 기본값 1 적용
    page = (page == 0) ? 1 : page; //page가 0이라면 1로 변경

    /* 리스트 돌아가기 버튼 주소 추가 */
    $('#backToListATag').on('click',function(){
      let href = 'placementList'+searchHref(page);
      window.location.href = href.lastIndexOf('jobNumber') > 0 ? href.substring(0,href.lastIndexOf('jobNumber')-1) : href;
    })
    $('#backToListBtn').on('click',function(){
      let href = 'placementList'+searchHref(page);
      window.location.href = href.lastIndexOf('jobNumber') > 0 ? href.substring(0,href.lastIndexOf('jobNumber')-1) : href;
    })
    /* 리스트 돌아가기 버튼 주소 추가 */

    /* 프린트 버튼 실행 시작 */
    $('#printBtn').click(function(){
      window.print();
    })
    /* 프린트 버튼 실행 끝 */

  })
</script>
</body>
</html>