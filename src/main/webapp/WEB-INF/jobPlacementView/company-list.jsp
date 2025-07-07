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
<%--        <button type="button"
                class="btn btn-modern btn-secondary"
                id="exportBtn">
          <i class="bi bi-download"></i> 내보내기
        </button>--%>
        <button type="button"
                class="btn btn-modern btn-primary"
                id="refreshListBtn">
          <i class="bi bi-arrow-clockwise"></i> 검색 및 새로고침
        </button>
      </div>
    </div>

    <!-- 검색 및 필터 -->
    <div class="search-filters">
      <div class="row">
        <div class="col-md-5 ps-0 pe-0">
          <label for="search" class="form-label">
            <i class="bi bi-search"></i> 검색
          </label>
          <input type="search"
                 class="form-control search-input"
                 id="search"
                 name="searchType"
                 placeholder="희망직종, 거주지로 검색">
        </div>
        <div class="col-md-2">
          <label for="ageStartFilter" class="form-label">
            <i class="bi bi-filter"></i> 나이 필터
          </label>
            <div class="d-flex align-items-center">
                <input type="number" class="form-control w-50 text-center" max="100" min="17" id="ageStartFilter" name="ageStartFilter" placeholder="18">
                ~
                <input type="number" class="form-control w-50 text-center" max="100" min="17" id="ageEndFilter" name="ageEndFilter" placeholder="35">
            </div>
        </div>
          <div class="col-md-2 ps-0 pe-0">
          <label for="desiredSalaryStartFilter" class="form-label">
            <i class="bi bi-filter"></i> 희망 연봉 필터
          </label>
              <div class="d-flex align-items-center">
                  <input type="number" class="form-control text-center" min="0" id="desiredSalaryStartFilter" name="desiredSalaryStartFilter" placeholder="0">
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
          <div class="col-md-1 ps-0 pe-0">
              <label for="countFilter" class="form-label">
                  <i class="bi bi-filter"></i> 조회 개수
              </label>
              <select class="form-select" id="countFilter" name="pageRows">
                  <option value="10">10</option>
                  <option value="20">20</option>
                  <option value="30">30</option>
                  <option value="40">40</option>
                  <option value="50">50</option>
              </select>
          </div>
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
                      <a href="#"
                         class="btn btn-outline-primary btn-sm detailPageATag"
                         title="상세보기">
                          <i class="bi bi-eye"></i>
                      </a>
                      <input type="hidden" value="${company.jobNumber}" name="jobNumber">
                  </td>
              </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>
    </div>

      <%-- 페이지네이션 시작 --%>
      <nav class="col-md-11 text-center ms-auto me-auto d-flex justify-content-center">
          <ul class="pagination">
          </ul>
      </nav>
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

        /* 상세보기 버튼 주소 추가 */
        $('.detailPageATag').click(function(){
            let jobNumber = $(this).parent().find('input[name="jobNumber"]').val();
            let href = 'placementDetail'+searchHref(page)+'&jobNumber='+jobNumber;
            window.location.href = href;
        })
        /* 상세보기 버튼 주소 추가 */

    })
</script>
<!-- Pagination Function End -->

<script>
  /*// 참여자 목록 관리
  class ParticipantListManager {
    constructor() {
      this.allParticipants = [];
      this.filteredParticipants = [];
      this.selectedParticipants = [];
      this.init();
    }

    init() {
      this.setupEventListeners();
      // this.updateStatistics();
    }

    // 이벤트 리스너 설정
    setupEventListeners() {
        // 검색
        $('#participantSearch').on('input', (e) => {
            clearTimeout(this.searchTimeout);
            this.searchTimeout = setTimeout(() => {
            }, 300);
        })

        // 새로고침
        $('#refreshListBtn').on('click', (e) => {
            this.refreshList();
        })
    }

    /!*!// 테이블 행 생성
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
    }*!/


   /!* // 목록 새로고침
    refreshList() {
      const refreshBtn = document.getElementById('refreshListBtn');
      const originalText = refreshBtn.innerHTML;

      refreshBtn.innerHTML = '<span class="loading-spinner"></span> 새로고침 중...';
      refreshBtn.disabled = true;

      //ajax or fetch function change
      setTimeout(() => {
        refreshBtn.innerHTML = originalText;
        refreshBtn.disabled = false;

        this.showToast('success', '목록이 새로고침되었습니다.');
      }, 1000);
    }*!/

    /!*!// 데이터 내보내기
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
    }*!/

    /!*!// 선택된 항목 내보내기
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
    }*!/

    /!*!// 선택된 항목 상세보기
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
    }*!/

    /!*!// CSV 다운로드
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
    }*!/

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
  });*/
</script>
</body>
</html>