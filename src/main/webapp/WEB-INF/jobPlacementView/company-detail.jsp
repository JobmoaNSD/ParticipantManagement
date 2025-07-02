<%--
  Created by IntelliJ IDEA.
  User: no1fc
  Date: 25. 6. 27.
  Time: 오후 2:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <a href="placementList">
          <i class="bi bi-list-ul"></i> 참여자 목록
        </a>
      </li>
      <li class="breadcrumb-item active" aria-current="page">
        <span id="currentParticipantName">홍길동</span> 상세정보
      </li>
    </ol>
  </nav>

  <div class="main-content">
    <!-- 페이지 헤더 -->
    <div class="d-flex justify-content-between align-items-center mb-4">
      <div>
        <h2 class="h4 mb-1">참여자 상세 정보</h2>
        <p class="text-muted mb-0">선택된 참여자의 이력서와 자기소개서를 확인하세요.</p>
      </div>
      <div class="d-flex align-items-center gap-3">
        <span class="text-muted">참여자 ID: <strong id="selectedParticipantId">1</strong></span>
        <button type="button"
                class="btn btn-modern btn-secondary"
                id="printBtn">
          <i class="bi bi-printer"></i> 인쇄
        </button>
        <a href="placementList"
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
            <span class="readonly-value" id="detailName">홍길동</span>
          </div>
          <div class="readonly-item">
            <span class="readonly-label">나이</span>
            <span class="readonly-value" id="detailAge">20대</span>
          </div>
          <div class="readonly-item">
            <span class="readonly-label">거주지</span>
            <span class="readonly-value" id="detailLocation">서울특별시</span>
          </div>
          <div class="readonly-item">
            <span class="readonly-label">희망직종</span>
            <span class="readonly-value" id="detailJob">사무직</span>
          </div>
          <div class="readonly-item">
            <span class="readonly-label">희망연봉</span>
            <span class="readonly-value" id="detailSalary">2000-3000만원</span>
          </div>
          <div class="readonly-item">
            <span class="readonly-label">자격증</span>
            <span class="readonly-value" id="detailCertificates">컴퓨터활용능력 1급, 토익 800점</span>
          </div>
          <div class="readonly-item">
            <span class="readonly-label">경력사항</span>
            <span class="readonly-value" id="detailExperience">4년</span>
          </div>
          <div class="readonly-item">
            <span class="readonly-label">등록일</span>
            <span class="readonly-value" id="detailRegistrationDate">2025-06-20</span>
          </div>
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
              <strong>상담사 : </strong> 테스터
              <strong>이메일 : </strong> XXX@jobmoa.com
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

<script>
  // 참여자 상세 정보 관리
  class ParticipantDetailManager {
    constructor() {
      this.participantId = null;
      this.participantData = null;
      this.evaluationHistory = [];
      this.init();
    }

    init() {
      this.getParticipantIdFromURL();
      this.loadParticipantData();
      this.loadSavedData();
      this.setupEventListeners();
    }

    // URL에서 참여자 ID 추출
    getParticipantIdFromURL() {
      const urlParams = new URLSearchParams(window.location.search);
      this.participantId = urlParams.get('id') || '1'; // 기본값 1
      document.getElementById('selectedParticipantId').textContent = this.participantId;
    }

    // 이벤트 리스너 설정
    setupEventListeners() {
      // // 평가 폼 제출
      // document.getElementById('companyEvaluationForm').addEventListener('submit', (e) => this.handleEvaluationSubmit(e));
      //
      // // 평가 초기화
      // document.getElementById('resetEvaluationBtn').addEventListener('click', () => this.resetEvaluation());
      //
      // // 임시 저장
      // document.getElementById('saveAsDraftBtn').addEventListener('click', () => this.saveAsDraft());

      // 인쇄
      document.getElementById('printBtn').addEventListener('click', () => this.printDetail());

      // 평가 점수 변경시 별점 미리보기
      // document.getElementById('evaluationScore').addEventListener('change', (e) => this.updateScorePreview(e.target.value));
    }

    // 참여자 데이터 로드
    loadParticipantData() {
      // 실제 환경에서는 서버 API 호출
      const sampleData = this.getSampleParticipantData(this.participantId);
      this.participantData = sampleData;
      // TODO FIXME 추후 DB 연동시 변경해야함
      // this.updateDetailView(sampleData);
    }

    // 저장된 평가 데이터 로드
    loadSavedData() {
      try {
        const savedEvaluation = localStorage.getItem('evaluation_' + this.participantId);
        if (savedEvaluation) {
          const evaluation = JSON.parse(savedEvaluation);
          this.populateEvaluationForm(evaluation);
          this.showExistingEvaluation(evaluation);
        }

        const savedHistory = localStorage.getItem('evaluationHistory_' + this.participantId);
        if (savedHistory) {
          this.evaluationHistory = JSON.parse(savedHistory);
          this.updateEvaluationHistory();
        }
      } catch (e) {
        console.warn('저장된 평가 데이터 로드 실패:', e);
      }
    }

    // 상세 뷰 업데이트
    updateDetailView(data) {
      document.getElementById('currentParticipantName').textContent = data.participantName || '';
      document.getElementById('detailName').textContent = data.participantName || '';
      document.getElementById('detailAge').textContent = data.participantAge || '';
      document.getElementById('detailLocation').textContent = data.participantLocation || '';
      document.getElementById('detailJob').textContent = data.desiredJob || '';
      document.getElementById('detailSalary').textContent = data.desiredSalary || '';
      document.getElementById('detailCertificates').textContent = data.certificates || '없음';
      document.getElementById('detailExperience').textContent = data.experience || '없음';
      document.getElementById('detailRegistrationDate').textContent = data.registrationDate || '';

      // 상태 업데이트
      const statusBadge = document.getElementById('detailStatus');
      statusBadge.textContent = this.getStatusText(data.status);
      statusBadge.className = 'status-badge ' + data.status;

      // 자기소개서 업데이트
      const essayContainer = document.getElementById('detailEssayContainer');
      if (data.essays && data.essays.length > 0) {
        let essayHTML = '';
        data.essays.forEach(function(essay, index) {
          essayHTML += '<div class="essay-section">' +
                  '<h4 class="essay-title">' + (index + 1) + '. ' + essay.title + '</h4>' +
                  '<p class="essay-content">' + essay.content + '</p>' +
                  '</div>';
        });
        essayContainer.innerHTML = essayHTML;
      }
    }

    // 기존 평가 표시
    showExistingEvaluation(evaluation) {
      const existingDiv = document.getElementById('existingEvaluation');

      // 기존 별점 및 점수 추가 주석
      // document.getElementById('existingScoreStars').textContent = this.getStarDisplay(evaluation.evaluationScore);
      // document.getElementById('existingScoreNumber').textContent = evaluation.evaluationScore + '점';
      document.getElementById('contactPlanStatus').textContent = evaluation.contactPlanStatus;
      document.getElementById('existingStatus').textContent = this.getStatusText(evaluation.evaluationStatus);
      document.getElementById('existingMemo').textContent = evaluation.evaluationMemo || '메모 없음';
      document.getElementById('existingEvaluationDate').textContent = evaluation.evaluationDate || '';

      existingDiv.style.display = 'block';
    }

    // 평가 폼에 데이터 채우기
    populateEvaluationForm(evaluation) {
      // document.getElementById('evaluationScore').value = evaluation.evaluationScore || '';
      document.getElementById('evaluationScore').value = evaluation.evaluationScore || '';
      document.getElementById('evaluationStatus').value = evaluation.evaluationStatus || '';
      document.getElementById('evaluationMemo').value = evaluation.evaluationMemo || '';
      document.getElementById('contactPlan').value = evaluation.contactPlan || '';
    }

    // 별점 표시 생성
    getStarDisplay(score) {
      const stars = ['☆', '☆', '☆', '☆', '☆'];
      for (let i = 0; i < score; i++) {
        stars[i] = '★';
      }
      return stars.join('');
    }

    // 점수 미리보기 업데이트
/*    updateScorePreview(score) {
      if (score) {
        const stars = this.getStarDisplay(parseInt(score));
        // 점수 선택 옵션 텍스트에 별점이 이미 포함되어 있음
      }
    }*/

    // 평가 제출 처리
    handleEvaluationSubmit(e) {
      e.preventDefault();

      const formData = new FormData(e.target);
      const evaluationData = Object.fromEntries(formData);
      evaluationData.evaluationDate = new Date().toLocaleString('ko-KR');
      evaluationData.evaluator = '담당자'; // 실제로는 로그인 사용자 정보

      // 검증
      // if (!evaluationData.evaluationScore) {
      //   this.showToast('warning', '평가 점수를 선택해주세요.');
      //   return;
      // }

      if (!evaluationData.evaluationStatus) {
        this.showToast('warning', '채용 단계를 선택해주세요.');
        return;
      }

      // 저장
      this.saveEvaluation(evaluationData);
      this.addToHistory(evaluationData);

      this.showToast('success', '평가가 성공적으로 저장되었습니다.');
    }

    // 평가 저장
    saveEvaluation(evaluationData) {
      try {
        localStorage.setItem('evaluation_' + this.participantId, JSON.stringify(evaluationData));
        this.showExistingEvaluation(evaluationData);
      } catch (e) {
        console.error('평가 저장 실패:', e);
      }
    }

    // 히스토리에 추가
    addToHistory(evaluationData) {
      this.evaluationHistory.unshift(evaluationData);

      try {
        localStorage.setItem('evaluationHistory_' + this.participantId, JSON.stringify(this.evaluationHistory));
        this.updateEvaluationHistory();
      } catch (e) {
        console.error('히스토리 저장 실패:', e);
      }
    }

    // 평가 히스토리 업데이트
    updateEvaluationHistory() {
      const historyContainer = document.getElementById('evaluationHistory');

      if (this.evaluationHistory.length === 0) {
        historyContainer.innerHTML = '<p class="text-muted">평가 내역이 없습니다.</p>';
        return;
      }

      let historyHTML = '';
      this.evaluationHistory.forEach(evaluation => {
        historyHTML += '<div class="readonly-section">' +
                '<div class="d-flex justify-content-between align-items-start mb-3">' +
                '<div>' +
                '<strong class="text-primary">' + evaluation.evaluationDate + '</strong>' +
                '<span class="ms-3">평가자: ' + evaluation.evaluator + '</span>' +
                '</div>' +
                '<div class="score-display">' +
                '<span class="score-stars">' + this.getStarDisplay(evaluation.evaluationScore) + '</span>' +
                '<span class="score-number">' + evaluation.evaluationScore + '점</span>' +
                '</div>' +
                '</div>' +
                '<div class="mb-2">' +
                '<strong>단계:</strong> ' + this.getStatusText(evaluation.evaluationStatus) +
                '</div>' +
                '<div>' +
                '<strong>메모:</strong> ' + (evaluation.evaluationMemo || '메모 없음') +
                '</div>' +
                '</div>';
      });

      historyContainer.innerHTML = historyHTML;
    }

    // 임시 저장
    saveAsDraft() {
      const formData = new FormData(document.getElementById('companyEvaluationForm'));
      const draftData = Object.fromEntries(formData);
      draftData.isDraft = true;
      draftData.draftDate = new Date().toLocaleString('ko-KR');

      try {
        localStorage.setItem('evaluationDraft_' + this.participantId, JSON.stringify(draftData));
        this.showToast('info', '평가가 임시저장되었습니다.');
      } catch (e) {
        console.error('임시저장 실패:', e);
        this.showToast('error', '임시저장에 실패했습니다.');
      }
    }

    // 평가 초기화
    resetEvaluation() {
      if (confirm('평가 내용을 초기화하시겠습니까?')) {
        document.getElementById('companyEvaluationForm').reset();
        this.showToast('info', '평가 내용이 초기화되었습니다.');
      }
    }

    // 인쇄
    printDetail() {
      window.print();
    }

    // 상태 텍스트 반환
    getStatusText(status) {
      const statusTexts = {
        draft: '작성중',
        saved: '저장완료',
        submitted: '알선요청',
        review: '서류 검토 중',
        interview: '면접 예정',
        final: '최종 검토',
        pass: '채용 확정',
        fail: '채용 보류',
        reject: '불합격'
      };
      return statusTexts[status] || status;
    }

    // 샘플 참여자 데이터 반환
    getSampleParticipantData(id) {
      const sampleData = {
        '1': {
          participantName: '홍길동',
          participantAge: '20대',
          participantLocation: '서울특별시',
          desiredJob: '사무직',
          desiredSalary: '2000-3000만원',
          certificates: '컴퓨터활용능력 1급',
          experience: 'ABC회사 사무직 2년 (2020-2022)',
          registrationDate: '2025-06-20',
          status: 'saved',
          essays: [
            {
              title: '지원동기 및 포부',
              content: '저는 이 직무에 지원하게 된 동기는 제가 가진 IT 관련 지식과 경험을 활용하여 회사의 발전에 기여하고 싶기 때문입니다. 특히 사무직으로서의 업무 경험을 바탕으로 체계적이고 효율적인 업무 처리 능력을 발휘할 수 있을 것이라고 생각합니다.\n\n앞으로의 포부는 단순히 주어진 업무를 수행하는 것을 넘어서, 업무 프로세스 개선과 효율성 향상에 기여하고 싶습니다. 또한 지속적인 학습을 통해 전문성을 키워나가며, 팀원들과의 협업을 통해 더 나은 결과를 만들어내고 싶습니다.'
            }
          ]
        },
        '2': {
          participantName: '김영희',
          participantAge: '30대',
          participantLocation: '경기도',
          desiredJob: '영업직',
          desiredSalary: '3000-4000만원',
          certificates: '토익 850점, 영업관리사',
          experience: 'XYZ회사 영업팀 3년 (2019-2022)',
          registrationDate: '2025-06-19',
          status: 'submitted',
          essays: [
            {
              title: '영업 경험과 성과',
              content: '저는 3년간 XYZ회사에서 영업 업무를 담당하며 월 평균 목표 달성률 120%를 기록했습니다. 고객과의 신뢰 관계 구축을 통해 지속적인 매출 성장을 이끌어낸 경험이 있습니다.\n\n특히 신규 고객 개발에 강점을 가지고 있으며, 체계적인 고객 관리 시스템을 통해 장기적인 관계를 유지하는 것을 중시합니다.'
            }
          ]
        },
        '3': {
          participantName: '박민수',
          participantAge: '40대',
          participantLocation: '부산광역시',
          desiredJob: '기술직',
          desiredSalary: '4000-5000만원',
          certificates: '정보처리기사, AWS 자격증',
          experience: 'DEF회사 개발팀 리더 5년 (2017-2022)',
          registrationDate: '2025-06-18',
          status: 'draft',
          essays: [
            {
              title: '기술 전문성과 리더십',
              content: '저는 5년간 개발팀 리더로 근무하며 다양한 프로젝트를 성공적으로 완수했습니다. 특히 클라우드 기반 시스템 구축에 전문성을 가지고 있으며, 팀원들과의 협업을 통해 효율적인 개발 프로세스를 구축한 경험이 있습니다.\n\n기술적 역량뿐만 아니라 팀 관리와 프로젝트 리딩 능력을 바탕으로 조직의 성장에 기여하고 싶습니다.'
            }
          ]
        }
      };

      return sampleData[id] || sampleData['1'];
    }

    // 토스트 알림 표시
    showToast(type, message) {
      const toastContainer = document.getElementById('toastContainer');
      const toastId = 'toast-' + Date.now();

      const toastHTML = '<div class="toast toast-custom toast-' + type + '" id="' + toastId + '" role="alert" aria-live="assertive" aria-atomic="true">' +
              '<div class="toast-header">' +
              '<i class="bi bi-' + this.getToastIcon(type) + ' me-2"></i>' +
              '<strong class="me-auto">' + this.getToastTitle(type) + '</strong>' +
              '<button type="button" class="btn-close btn-close-white" data-bs-dismiss="toast" aria-label="닫기"></button>' +
              '</div>' +
              '<div class="toast-body">' +
              message +
              '</div>' +
              '</div>';

      toastContainer.insertAdjacentHTML('beforeend', toastHTML);

      const toastElement = document.getElementById(toastId);
      const toast = new bootstrap.Toast(toastElement, {
        autohide: true,
        delay: 4000
      });

      toast.show();

      // 토스트가 숨겨진 후 DOM에서 제거
      toastElement.addEventListener('hidden.bs.toast', () => {
        toastElement.remove();
      });
    }

    // 토스트 아이콘 반환
    getToastIcon(type) {
      const icons = {
        success: 'check-circle-fill',
        error: 'exclamation-triangle-fill',
        warning: 'exclamation-triangle-fill',
        info: 'info-circle-fill'
      };
      return icons[type] || 'info-circle-fill';
    }

    // 토스트 제목 반환
    getToastTitle(type) {
      const titles = {
        success: '성공',
        error: '오류',
        warning: '주의',
        info: '정보'
      };
      return titles[type] || '알림';
    }
  }

  // 페이지 초기화
  document.addEventListener('DOMContentLoaded', function() {
    window.participantDetailManager = new ParticipantDetailManager();
    console.log('참여자 상세 페이지가 초기화되었습니다.');
  });
</script>
</body>
</html>