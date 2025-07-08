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

  <style>
    /* 인쇄 스타일 */
    @media print {
      .system-header,
      .main-nav,
      .breadcrumb-nav,
      .btn-modern,
      .card-header {
        display: none !important;
      }
      .main-content {
        box-shadow: none !important;
        border-radius: 0 !important;
      }

      .card-modern {
        box-shadow: none !important;
        border: 1px solid #ccc !important;
      }

      .essay-section {
        width: 100% !important;
        break-inside: avoid;
      }
    }
  </style>
</head>
<body>
<!-- Skip Navigation for Accessibility -->
<a href="#main-content" class="skip-link">메인 콘텐츠로 바로가기</a>

<mytag:jobPlacementView-header/>

<mytag:jobPlacementView-nav pageController="detail"/>

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

  <div class="main-content">
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
<%--          <div class="readonly-item">
            <span class="readonly-label">상태</span>
            <span class="readonly-value">
                                <span class="status-badge saved" id="detailStatus">저장완료</span>
                            </span>
          </div>--%>
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
            <h4 class="essay-title">상세 이력서와 자기소개서는 아래 상담사에게 문의 부탁드립니다.</h4>
            <p class="essay-content">
              <strong>상담사 : </strong> ${data.counselor}
              <strong>이메일 : </strong> ${data.email}
            </p>
          </div>
        </div>
      </div>
    </div>

<%--    <!-- 기업 평가 섹션 -->--%>
<%--    <div class="card-modern">--%>
<%--      <div class="card-header">--%>
<%--        <h3 class="card-title">--%>
<%--          <i class="bi bi-clipboard-check"></i>--%>
<%--          기업 평가 및 메모--%>
<%--        </h3>--%>
<%--      </div>--%>
<%--      <div class="card-body">--%>
<%--        <!-- 기존 평가 내역 표시 -->--%>
<%--        <div id="existingEvaluation" class="mb-4" style="display: none;">--%>
<%--          <div class="alert alert-info">--%>
<%--            <h5 class="alert-heading">--%>
<%--              <i class="bi bi-info-circle"></i> 기존 평가 내역--%>
<%--            </h5>--%>
<%--            <div class="row">--%>
<%--&lt;%&ndash;              <div class="col-md-6">--%>
<%--                <strong>평가 점수:</strong>--%>
<%--                <div class="score-display mt-1">--%>
<%--                  <span class="score-stars" id="existingScoreStars">★★★★☆</span>--%>
<%--                  <span class="score-number" id="existingScoreNumber">4점</span>--%>
<%--                </div>--%>
<%--              </div>&ndash;%&gt;--%>
<%--              <div class="col-md-6">--%>
<%--                <div class="form-group">--%>
<%--                  <strong>연락 계획</strong>--%>
<%--                  <span id="contactPlanStatus" class="ms-2">상담사 연락</span>--%>
<%--                </div>--%>
<%--              </div>--%>
<%--              <div class="col-md-6">--%>
<%--                <strong>채용 단계:</strong>--%>
<%--                <span id="existingStatus" class="ms-2">면접 예정</span>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--            <div class="mt-2">--%>
<%--              <strong>평가 메모:</strong>--%>
<%--              <p id="existingMemo" class="mt-1 mb-0">IT 관련 경험이 풍부하고 자기소개서가 잘 작성되어 있음. 면접을 통해 구체적인 역량을 확인해볼 필요가 있음.</p>--%>
<%--            </div>--%>
<%--            <div class="mt-2">--%>
<%--              <small class="text-muted">평가일: <span id="existingEvaluationDate">2025-06-25 14:30</span></small>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--        </div>--%>

<%--        <form id="companyEvaluationForm">--%>
<%--          <div class="row">--%>
<%--            <div class="col-md-6">--%>
<%--              <div class="form-group">--%>
<%--                <label for="contactPlan" class="form-label">--%>
<%--                  <i class="bi bi-telephone"></i> 연락 계획--%>
<%--                </label>--%>
<%--                <select class="form-select"--%>
<%--                        id="contactPlan"--%>
<%--                        name="contactPlan">--%>
<%--                  <option value="">참여자 컨택 계획</option>--%>
<%--                  <option value="immediate">상담사 연락</option>--%>
<%--                  <option value="within_week">상담사 메일 전달</option>--%>
<%--                  <option value="within_month">세부 이력서 요청</option>--%>
<%--                  <option value="later">추후 연락</option>--%>
<%--                  <option value="no_contact">연락 안함</option>--%>
<%--                </select>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--            <div class="col-md-6">--%>
<%--              <div class="form-group">--%>
<%--                <label for="evaluationStatus" class="form-label">--%>
<%--                  <i class="bi bi-clipboard-check"></i> 채용 단계--%>
<%--                </label>--%>
<%--                <select class="form-select"--%>
<%--                        id="evaluationStatus"--%>
<%--                        name="evaluationStatus">--%>
<%--                  <option value="">단계 선택</option>--%>
<%--                  <option value="review">서류 검토 중</option>--%>
<%--                  <option value="interview">면접 예정</option>--%>
<%--                  <option value="final">최종 검토</option>--%>
<%--                  <option value="pass">채용 확정</option>--%>
<%--                  <option value="fail">채용 보류</option>--%>
<%--                  <option value="reject">불합격</option>--%>
<%--                </select>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--          </div>--%>

<%--          <div class="form-group">--%>
<%--            <label for="evaluationMemo" class="form-label">--%>
<%--              <i class="bi bi-chat-text"></i> 평가 메모--%>
<%--            </label>--%>
<%--            <textarea class="form-control"--%>
<%--                      id="evaluationMemo"--%>
<%--                      name="evaluationMemo"--%>
<%--                      rows="4"--%>
<%--                      placeholder="참여자에 대한 평가 내용, 면접 계획, 추가 확인사항 등을 입력하세요..."></textarea>--%>
<%--            <div class="form-text">--%>
<%--              평가 내용은 내부 기록용이며, 참여자에게 공개되지 않습니다.--%>
<%--            </div>--%>
<%--          </div>--%>

<%--          <div class="d-flex gap-3 justify-content-end">--%>
<%--            <button type="button"--%>
<%--                    class="btn btn-modern btn-secondary"--%>
<%--                    id="resetEvaluationBtn">--%>
<%--              <i class="bi bi-arrow-clockwise"></i> 초기화--%>
<%--            </button>--%>
<%--            <button type="button"--%>
<%--                    class="btn btn-modern btn-outline"--%>
<%--                    id="saveAsDraftBtn">--%>
<%--              <i class="bi bi-file-earmark"></i> 임시저장--%>
<%--            </button>--%>
<%--            <button type="submit"--%>
<%--                    class="btn btn-modern btn-primary">--%>
<%--              <i class="bi bi-floppy"></i> 평가 저장--%>
<%--            </button>--%>
<%--          </div>--%>
<%--        </form>--%>
<%--      </div>--%>
<%--    </div>--%>

    <%--<!-- 평가 히스토리 -->
    <div class="card-modern">
      <div class="card-header">
        <h3 class="card-title">
          <i class="bi bi-clock-history"></i>
          평가 히스토리
        </h3>
      </div>
      <div class="card-body">
        <div id="evaluationHistory">
          <div class="readonly-section">
            <div class="d-flex justify-content-between align-items-start mb-3">
              <div>
                <strong class="text-primary">2025-06-25 14:30</strong>
                <span class="ms-3">평가자: 김담당</span>
              </div>
              <div class="score-display">
                <span class="score-stars">★★★★☆</span>
                <span class="score-number">4점</span>
              </div>
            </div>
            <div class="mb-2">
              <strong>단계:</strong> 면접 예정
            </div>
            <div>
              <strong>메모:</strong> IT 관련 경험이 풍부하고 자기소개서가 잘 작성되어 있음. 면접을 통해 구체적인 역량을 확인해볼 필요가 있음.
            </div>
          </div>
        </div>
      </div>
    </div>--%>

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