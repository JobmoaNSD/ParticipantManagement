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
    <link rel="preconnect" href="https://cdn.jsdelivr.net"/>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet"/>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;600;700&display=swap" rel="stylesheet"/>

    <!-- Custom Style CSS  -->
    <link href="/css/jobPlacementDefault.css" rel="stylesheet"/>

    <!-- jobPlacementListJS -->
    <script src="/js/jobPlacementJs/jobPlacementListJS.js"></script>

    <!-- InputLimits.js -->
    <script src="/js/InputLimits.js"></script>

</head>
<body>
<!-- Skip Navigation for Accessibility -->
<a href="#main-content" class="skip-link">메인 콘텐츠로 바로가기</a>

<mytag:jobPlacementView-header/>

<%--<mytag:jobPlacementView-nav pageController="list"/>--%>

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
          <c:forEach items="${jobPlacementDatas}" var="datas">
              <tr>
                  <td>${datas.jobNumber}</td>
                  <td>${fn:substring(datas.participant, 0, 4)}</td>
                  <td>${datas.age == 0 ? '비공개':datas.age}</td>
                  <td>${datas.gender}</td>
                  <c:choose>
                      <c:when test="${datas.address eq ''}">
                          <td></td>
                      </c:when>
                      <c:otherwise>
                          <td>${fn:substring(datas.address, 0, 11)}...</td>
                      </c:otherwise>
                  </c:choose>
                  <td>${datas.desiredJob}</td>
                  <td>${datas.desiredSalary}</td>
                  <td>
                      <a href="#"
                         class="btn btn-outline-primary btn-sm detailPageATag"
                         title="상세보기">
                          <i class="bi bi-eye"></i>
                      </a>
                      <input type="hidden" value="${datas.jobNumber}" name="jobNumber">
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

        <%-- 검색 폼 input --%>
        let searchType = $('#search');
        let ageStartFilter = $('#ageStartFilter');
        let ageEndFilter = $('#ageEndFilter');
        let desiredSalaryStartFilter = $('#desiredSalaryStartFilter');
        let desiredSalaryEndFilter = $('#desiredSalaryEndFilter');
        let genderFilter = $('#genderFilter');
        let countFilter = $('#countFilter');
        <%-- 검색 폼 input --%>

        /* 상세보기 버튼 주소 추가 */
        $('.detailPageATag').click(function(){
            let jobNumber = $(this).parent().find('input[name="jobNumber"]').val();
            let href = 'placementDetail'+searchHref(page)+'&jobNumber='+jobNumber;
            window.location.href = href;
        })
        /* 상세보기 버튼 주소 추가 */

        /* 검색어 및 각 필터값 특수 문자 처리 시작 */
        // 특수문자 검증
        searchType.on('input', function(){
            regexSpecialSymbols($(this).val(), $(this));
        });

        // 숫자 검증 + 범위 제한 (한 번에 처리)
        inputLimitsWithRegex(ageStartFilter, 0, 120);
        inputLimitsWithRegex(ageEndFilter, 0, 120);
        inputLimitsWithRegex(desiredSalaryStartFilter, 0, 99999);
        inputLimitsWithRegex(desiredSalaryEndFilter, 0, 99999);


        //
        /* 검색어 및 각 필터값 특수 문자 처리 끝 */

        /* 검색 시작*/
        $('#refreshListBtn').on('click',function(){
            let searchTypeVal = searchType.val();
            let ageStartFilterVal = ageStartFilter.val();
            let ageEndFilterVal = ageEndFilter.val();
            let desiredSalaryStartFilterVal = desiredSalaryStartFilter.val();
            let desiredSalaryEndFilterVal = desiredSalaryEndFilter.val();
            let genderFilterVal = genderFilter.val();
            let countFilterVal = countFilter.val();
            let searchHref = '?page=1';//+page;

            searchHref += searchTypeVal == '' ? '' : '&searchType='+searchTypeVal.trim();
            searchHref += ageStartFilterVal == '' ? '' : '&ageStartFilter='+ageStartFilterVal;
            searchHref += ageEndFilterVal == '' ? '' : '&ageEndFilter='+ageEndFilterVal;
            searchHref += desiredSalaryStartFilterVal == '' ? '' : '&desiredSalaryStartFilter='+desiredSalaryStartFilterVal;
            searchHref += desiredSalaryEndFilterVal == '' ? '' : '&desiredSalaryEndFilter='+desiredSalaryEndFilterVal;
            searchHref += genderFilterVal == '' ? '' : '&genderFilter='+genderFilterVal;
            searchHref += countFilterVal == '' ? '&pageRows=10' : '&pageRows='+countFilterVal;
            window.location.href = '/jobPlacement/placementList'+searchHref;
            }
        )
        /* 검색 끝*/

        /* 검색 폼 데이터 및 추가 시작 */
        searchType.val('${param.searchType}');
        ageStartFilter.val(${param.ageStartFilter});
        ageEndFilter.val(${param.ageEndFilter});
        desiredSalaryStartFilter.val(${param.desiredSalaryStartFilter});
        desiredSalaryEndFilter.val(${param.desiredSalaryEndFilter});
        genderFilter.val('${param.genderFilter}');
        countFilter.val('${param.pageRows}'==='' ? '10' : '${param.pageRows}');
        /* 검색 폼 데이터 및 추가 끝 */

    })
</script>
</body>
</html>