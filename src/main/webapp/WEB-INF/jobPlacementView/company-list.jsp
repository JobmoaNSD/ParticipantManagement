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
  <meta name="description" content="국민취업지원제도 참여자 목록 확인 페이지">
  <title>참여자 목록 확인 - 국민취업지원제도</title>
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

<mytag:jobPlacementView-nav pageController="list"/>

<!-- Main Content -->
<main id="main-content" role="main" class="container">
  <div class="main-content">
    <!-- 페이지 헤더 -->
    <div class="d-flex justify-content-between align-items-center mb-4">
      <div>
        <h2 class="h4 mb-1">참여자 목록</h2>
        <p class="text-muted mb-0">잡모아 국민취업지원제도 참여자 정보를 확인하세요.</p>
      </div>
      <div class="d-flex align-items-center gap-3">
        <button type="button"
                class="btn btn-modern btn-secondary"
                id="exportBtn">
          <i class="bi bi-download"></i> 내보내기
        </button>
        <button type="button"
                class="btn btn-modern btn-primary"
                id="refreshListBtn">
          <i class="bi bi-arrow-clockwise"></i> 검색 및 새로고침
        </button>
      </div>
    </div>

<%--    <!-- 통계 카드 -->--%>
<%--    <div class="row mb-4">--%>
<%--      <div class="col-md-3">--%>
<%--        <div class="stats-card">--%>
<%--          <div class="stats-number" id="totalCount">15</div>--%>
<%--          <div class="stats-label">전체 참여자</div>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--      <div class="col-md-3">--%>
<%--        <div class="stats-card">--%>
<%--          <div class="stats-number" id="savedCount">8</div>--%>
<%--          <div class="stats-label">저장 완료</div>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--      <div class="col-md-3">--%>
<%--        <div class="stats-card">--%>
<%--          <div class="stats-number" id="submittedCount">5</div>--%>
<%--          <div class="stats-label">알선 요청</div>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--      <div class="col-md-3">--%>
<%--        <div class="stats-card">--%>
<%--          <div class="stats-number" id="draftCount">2</div>--%>
<%--          <div class="stats-label">작성 중</div>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--    </div>--%>

    <!-- 검색 및 필터 -->
    <div class="search-filters">
      <div class="row">
        <div class="col-md-5">
          <label for="search" class="form-label">
            <i class="bi bi-search"></i> 검색
          </label>
          <input type="search"
                 class="form-control search-input"
                 id="search"
                 name="search"
                 placeholder="희망직종, 거주지로 검색">
        </div>
        <div class="col-md-2">
          <label for="ageStartFilter" class="form-label">
            <i class="bi bi-filter"></i> 나이 필터
          </label>
            <div class="d-flex align-items-center">
                <input type="number" class="form-control w-50 text-center" max="100" min="17" id="ageStartFilter" name="ageStartFilter" placeholder="25">
                ~
                <input type="number" class="form-control w-50 text-center" max="100" min="17" id="ageEndFilter" name="ageEndFilter" placeholder="35">
            </div>
        </div>
          <div class="col-md-3">
          <label for="desiredSalaryStartFilter" class="form-label">
            <i class="bi bi-filter"></i> 희망 연봉 필터
          </label>
              <div class="d-flex align-items-center">
                  <input type="number" class="form-control text-center" min="0" id="desiredSalaryStartFilter" name="desiredSalaryStartFilter" placeholder="2500">
                  ~
                  <input type="number" class="form-control text-center" min="0" id="desiredSalaryEndFilter" name="desiredSalaryEndFilter" placeholder="3000">
              </div>
        </div>
          <div class="col-md-2">
              <label for="genderFilter" class="form-label">
                  <i class="bi bi-filter"></i> 성별 필터
              </label>
              <select class="form-select" id="genderFilter" name="genderFilter">
                  <option value="">전체 성별</option>
                  <option value="남">남</option>
                  <option value="여">여</option>
              </select>
        </div>
        <%--<div class="col-md-3">
          <label for="jobFilter" class="form-label">
            <i class="bi bi-briefcase"></i> 직종 필터
          </label>
          <select class="form-select" id="jobFilter" name="jobFilter">
            <option value="">전체 직종</option>
            <option value="사무직">사무직</option>
            <option value="영업직">영업직</option>
            <option value="생산직">생산직</option>
            <option value="서비스직">서비스직</option>
            <option value="기술직">기술직</option>
            <option value="전문직">전문직</option>
            <option value="관리직">관리직</option>
            <option value="기타">기타</option>
          </select>
        </div>--%>
      </div>
    </div>

    <!-- 참여자 목록 테이블 -->
    <div class="card-modern">
      <div class="table-responsive">
        <table class="table table-modern mb-0" id="participantTable">
          <thead>
          <tr>
<%--            <th scope="col" style="width: 60px;">--%>
<%--              <input type="checkbox"--%>
<%--                     class="form-check-input"--%>
<%--                     id="selectAllCheckbox"--%>
<%--                     aria-label="전체 선택">--%>
<%--            </th>--%>
            <th scope="col" style="width: 120px;">구직번호</th>
            <th scope="col">이름</th>
            <th scope="col">나이</th>
            <th scope="col">성별</th>
            <th scope="col">거주지</th>
            <th scope="col">희망직종</th>
            <th scope="col">희망연봉</th>
            <th scope="col" style="width: 120px;">상세정보</th>
          </tr>
          </thead>
          <tbody id="participantTableBody">
          <c:forEach items="${jobPlacementDatas}" var="company">
              <tr>
                  <td>${company.jobNumber}</td>
                  <td>${fn:substring(company.participant, 0, 4)}</td>
                  <td>${company.age == 0 ? '비공개':company.age}</td>
                  <td>${company.gender}</td>
                  <c:choose>
                      <c:when test="${company.address eq ''}">
                          <td></td>
                      </c:when>
                      <c:otherwise>
                          <td>${fn:substring(company.address, 0, 11)}...</td>
                      </c:otherwise>
                  </c:choose>
                  <td>${company.desiredJob}</td>
                  <td>${company.desiredSalary}</td>
                  <td>
                      <a href="placementDetail?jobNumber=${company.jobNumber}&page=${page}"
                         class="btn btn-outline-primary btn-sm"
                         title="상세보기">
                          <i class="bi bi-eye"></i>
                      </a>
                  </td>
              </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>
    </div>

    <%--<!-- 선택된 항목 액션 -->
    <div class="d-flex justify-content-between align-items-center mt-3" id="selectedActions" style="display: none !important;">
      <div>
        <span class="text-muted">선택된 항목: <strong id="selectedCount">0</strong>개</span>
      </div>
      <div class="d-flex gap-2">
        <button type="button"
                class="btn btn-modern btn-secondary btn-sm"
                id="bulkExportBtn">
          <i class="bi bi-download"></i> 선택 내보내기
        </button>
        <button type="button"
                class="btn btn-modern btn-primary btn-sm"
                id="bulkDetailBtn">
          <i class="bi bi-eye"></i> 선택 상세보기
        </button>
      </div>
    </div>--%>

      <%-- 페이지네이션 시작 --%>
      <nav class="col-md-11 text-center ms-auto me-auto d-flex justify-content-center">
          <ul class="pagination">
          </ul>
      </nav>
      <%-- 페이지네이션 끝 --%>
  </div>
</main>

<!-- Toast Container -->
<div class="toast-container" id="toastContainer"></div>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Pagination Function Start -->
<script src="/js/paginationJS.js"></script>
<script>
    $(document).ready(function(){
        <%-- pagination 시작 --%>
        // page 변수
        let page = parseInt("${page}", 10) || 1; // page가 비어있거나 아닌 경우 숫자로 변환 후 기본값 1 적용
        page = (page == 0) ? 1 : page; //page가 0이라면 1로 변경
        // startButton 변수
        const startButton = parseInt("${startButton}", 10) || 1; // startButton 기본값 1
        // endButton 변수
        const endButton = parseInt("${endButton}", 10) || 1; // endButton 기본값 10
        // totalButton 변수
        const totalButton = parseInt("${totalButton}", 10) || 0; // totalButton 기본값 0
        //pagination JS 함수 호출
        paginationAddItems(page, startButton, endButton, totalButton);
        <%-- pagination 끝 --%>
    })
</script>
<!-- Pagination Function End -->

<script>
  // 참여자 목록 관리
  class ParticipantListManager {
    constructor() {
      this.allParticipants = [];
      this.filteredParticipants = [];
      this.selectedParticipants = [];
      this.init();
    }

    init() {
      this.loadParticipants();
      this.setupEventListeners();
      this.updateStatistics();
    }

    // 이벤트 리스너 설정
    setupEventListeners() {
      // 검색
      document.getElementById('participantSearch').addEventListener('input', (e) => {
        clearTimeout(this.searchTimeout);
        this.searchTimeout = setTimeout(() => {
          this.filterParticipants();
        }, 300);
      });

      // 필터
      document.getElementById('statusFilter').addEventListener('change', () => this.filterParticipants());
      document.getElementById('jobFilter').addEventListener('change', () => this.filterParticipants());

      // 전체 선택/해제
      document.getElementById('selectAllCheckbox').addEventListener('change', (e) => {
        this.toggleSelectAll(e.target.checked);
      });

      // 개별 체크박스
      document.getElementById('participantTableBody').addEventListener('change', (e) => {
        if (e.target.classList.contains('row-checkbox')) {
          this.updateSelectedItems();
        }
      });

      // 새로고침
      document.getElementById('refreshListBtn').addEventListener('click', () => this.refreshList());

      // 내보내기
      document.getElementById('exportBtn').addEventListener('click', () => this.exportData());

      // 선택된 항목 액션
      document.getElementById('bulkExportBtn').addEventListener('click', () => this.exportSelected());
      document.getElementById('bulkDetailBtn').addEventListener('click', () => this.viewSelectedDetails());
    }

    // 참여자 데이터 로드
    loadParticipants() {
      // 실제 환경에서는 서버 API 호출
      this.allParticipants = [
        {
          id: 1,
          name: '홍길동',
          age: '20대',
          location: '서울특별시',
          job: '사무직',
          salary: '2000-3000만원',
          registrationDate: '2025-06-20',
          status: 'saved'
        },
        {
          id: 2,
          name: '김영희',
          age: '30대',
          location: '경기도',
          job: '영업직',
          salary: '3000-4000만원',
          registrationDate: '2025-06-19',
          status: 'submitted'
        },
        {
          id: 3,
          name: '박민수',
          age: '40대',
          location: '부산광역시',
          job: '기술직',
          salary: '4000-5000만원',
          registrationDate: '2025-06-18',
          status: 'draft'
        },
        {
          id: 4,
          name: '이수정',
          age: '30대',
          location: '인천광역시',
          job: '전문직',
          salary: '3000-4000만원',
          registrationDate: '2025-06-17',
          status: 'saved'
        },
        {
          id: 5,
          name: '정민호',
          age: '20대',
          location: '대구광역시',
          job: '서비스직',
          salary: '2000-3000만원',
          registrationDate: '2025-06-16',
          status: 'submitted'
        },
        {
          id: 6,
          name: '강예진',
          age: '20대',
          location: '광주광역시',
          job: '사무직',
          salary: '2000-3000만원',
          registrationDate: '2025-06-15',
          status: 'saved'
        },
        {
          id: 7,
          name: '윤성민',
          age: '30대',
          location: '대전광역시',
          job: '기술직',
          salary: '3000-4000만원',
          registrationDate: '2025-06-14',
          status: 'submitted'
        },
        {
          id: 8,
          name: '조혜영',
          age: '40대',
          location: '울산광역시',
          job: '관리직',
          salary: '4000-5000만원',
          registrationDate: '2025-06-13',
          status: 'saved'
        },
        {
          id: 9,
          name: '한지우',
          age: '20대',
          location: '세종특별자치시',
          job: '생산직',
          salary: '2000-3000만원',
          registrationDate: '2025-06-12',
          status: 'draft'
        },
        {
          id: 10,
          name: '임태현',
          age: '30대',
          location: '강원도',
          job: '영업직',
          salary: '3000-4000만원',
          registrationDate: '2025-06-11',
          status: 'submitted'
        }
      ];

      this.filteredParticipants = [...this.allParticipants];
    }

    // 참여자 목록 필터링
    filterParticipants() {
      const searchTerm = document.getElementById('participantSearch').value.toLowerCase();
      const statusFilter = document.getElementById('statusFilter').value;
      const jobFilter = document.getElementById('jobFilter').value;

      this.filteredParticipants = this.allParticipants.filter(participant => {
        const matchesSearch = !searchTerm ||
                participant.name.toLowerCase().includes(searchTerm) ||
                participant.job.toLowerCase().includes(searchTerm) ||
                participant.location.toLowerCase().includes(searchTerm);

        const matchesStatus = !statusFilter || participant.status === statusFilter;
        const matchesJob = !jobFilter || participant.job === jobFilter;

        return matchesSearch && matchesStatus && matchesJob;
      });

      this.renderTable();
      this.updateStatistics();
    }

    // 테이블 렌더링
    renderTable() {
      const tbody = document.getElementById('participantTableBody');
      tbody.innerHTML = '';

      if (this.filteredParticipants.length === 0) {
        tbody.innerHTML = '<tr><td colspan="10" class="text-center py-4">검색 조건에 맞는 참여자가 없습니다.</td></tr>';
        return;
      }

      this.filteredParticipants.forEach((participant, index) => {
        const row = this.createTableRow(participant, index + 1);
        tbody.appendChild(row);
      });
    }

    // 테이블 행 생성
    createTableRow(participant, rowNumber) {
      const tr = document.createElement('tr');
      tr.setAttribute('data-status', participant.status);
      tr.setAttribute('data-job', participant.job);

      const statusBadge = this.getStatusBadge(participant.status);

      tr.innerHTML = '<td>' +
              '<input type="checkbox" class="form-check-input row-checkbox" ' +
              'value="' + participant.id + '" aria-label="참여자 ' + participant.id + ' 선택">' +
              '</td>' +
              '<td>' + rowNumber + '</td>' +
              '<td>' + participant.name + '</td>' +
              '<td>' + participant.age + '</td>' +
              '<td>' + participant.location + '</td>' +
              '<td>' + participant.job + '</td>' +
              '<td>' + participant.salary + '</td>' +
              '<td>' + participant.registrationDate + '</td>' +
              '<td>' + statusBadge + '</td>' +
              '<td>' +
              '<a href="placementDetail?id=' + participant.id + '" ' +
              'class="btn btn-outline-primary btn-sm" title="상세보기">' +
              '<i class="bi bi-eye"></i>' +
              '</a>' +
              '</td>';

      return tr;
    }

    // 상태 배지 생성
    getStatusBadge(status) {
      const badges = {
        draft: '<span class="status-badge draft">작성중</span>',
        saved: '<span class="status-badge saved">저장완료</span>',
        submitted: '<span class="status-badge submitted">알선요청</span>'
      };
      return badges[status] || '';
    }

    // 전체 선택/해제
    toggleSelectAll(checked) {
      const checkboxes = document.querySelectorAll('.row-checkbox');
      checkboxes.forEach(checkbox => {
        checkbox.checked = checked;
      });
      this.updateSelectedItems();
    }

    // 선택된 항목 업데이트
    updateSelectedItems() {
      const checkboxes = document.querySelectorAll('.row-checkbox:checked');
      this.selectedParticipants = Array.from(checkboxes).map(cb => cb.value);

      // 전체 선택 체크박스 상태 업데이트
      const allCheckboxes = document.querySelectorAll('.row-checkbox');
      const selectAllCheckbox = document.getElementById('selectAllCheckbox');

      if (this.selectedParticipants.length === 0) {
        selectAllCheckbox.indeterminate = false;
        selectAllCheckbox.checked = false;
      } else if (this.selectedParticipants.length === allCheckboxes.length) {
        selectAllCheckbox.indeterminate = false;
        selectAllCheckbox.checked = true;
      } else {
        selectAllCheckbox.indeterminate = true;
        selectAllCheckbox.checked = false;
      }

      // 선택된 항목 액션 영역 표시/숨김
      const selectedActions = document.getElementById('selectedActions');
      const selectedCount = document.getElementById('selectedCount');

      if (this.selectedParticipants.length > 0) {
        selectedActions.style.display = 'flex';
        selectedCount.textContent = this.selectedParticipants.length;
      } else {
        selectedActions.style.display = 'none';
      }
    }

    // 통계 업데이트
    updateStatistics() {
      const total = this.allParticipants.length;
      const saved = this.allParticipants.filter(p => p.status === 'saved').length;
      const submitted = this.allParticipants.filter(p => p.status === 'submitted').length;
      const draft = this.allParticipants.filter(p => p.status === 'draft').length;

      document.getElementById('totalCount').textContent = total;
      document.getElementById('savedCount').textContent = saved;
      document.getElementById('submittedCount').textContent = submitted;
      document.getElementById('draftCount').textContent = draft;
    }

    // 목록 새로고침
    refreshList() {
      const refreshBtn = document.getElementById('refreshListBtn');
      const originalText = refreshBtn.innerHTML;

      refreshBtn.innerHTML = '<span class="loading-spinner"></span> 새로고침 중...';
      refreshBtn.disabled = true;

      setTimeout(() => {
        this.loadParticipants();
        this.filterParticipants();

        refreshBtn.innerHTML = originalText;
        refreshBtn.disabled = false;

        this.showToast('success', '목록이 새로고침되었습니다.');
      }, 1000);
    }

    // 데이터 내보내기
    exportData() {
      const data = this.filteredParticipants.map(p => ({
        '번호': p.id,
        '이름': p.name,
        '나이': p.age,
        '거주지': p.location,
        '희망직종': p.job,
        '희망연봉': p.salary,
        '등록일': p.registrationDate,
        '상태': this.getStatusText(p.status)
      }));

      this.downloadCSV(data, '참여자_목록_' + new Date().toISOString().slice(0, 10) + '.csv');
      this.showToast('success', '데이터가 내보내기되었습니다.');
    }

    // 선택된 항목 내보내기
    exportSelected() {
      if (this.selectedParticipants.length === 0) {
        this.showToast('warning', '내보낼 항목을 선택해주세요.');
        return;
      }

      const selectedData = this.allParticipants
              .filter(p => this.selectedParticipants.includes(p.id.toString()))
              .map(p => ({
                '번호': p.id,
                '이름': p.name,
                '나이': p.age,
                '거주지': p.location,
                '희망직종': p.job,
                '희망연봉': p.salary,
                '등록일': p.registrationDate,
                '상태': this.getStatusText(p.status)
              }));

      this.downloadCSV(selectedData, '선택된_참여자_' + new Date().toISOString().slice(0, 10) + '.csv');
      this.showToast('success', '선택된 항목이 내보내기되었습니다.');
    }

    // 선택된 항목 상세보기
    viewSelectedDetails() {
      if (this.selectedParticipants.length === 0) {
        this.showToast('warning', '상세보기할 항목을 선택해주세요.');
        return;
      }

      if (this.selectedParticipants.length === 1) {
        window.location.href = 'placementDetail?id=' + this.selectedParticipants[0];
      } else {
        window.location.href = 'placementDetail?ids=' + this.selectedParticipants.join(',');
      }
    }

    // CSV 다운로드
    downloadCSV(data, filename) {
      if (data.length === 0) return;

      const headers = Object.keys(data[0]);
      const csvContent = [
        headers.join(','),
        ...data.map(row => headers.map(header => '"' + (row[header] || '') + '"').join(','))
      ].join('\n');

      const blob = new Blob(['\uFEFF' + csvContent], { type: 'text/csv;charset=utf-8;' });
      const link = document.createElement('a');
      const url = URL.createObjectURL(blob);

      link.setAttribute('href', url);
      link.setAttribute('download', filename);
      link.style.visibility = 'hidden';
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
    }

    // 상태 텍스트 반환
    getStatusText(status) {
      const statusTexts = {
        draft: '작성중',
        saved: '저장완료',
        submitted: '알선요청'
      };
      return statusTexts[status] || '';
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
    window.participantListManager = new ParticipantListManager();
    console.log('참여자 목록 페이지가 초기화되었습니다.');
  });
</script>
</body>
</html>