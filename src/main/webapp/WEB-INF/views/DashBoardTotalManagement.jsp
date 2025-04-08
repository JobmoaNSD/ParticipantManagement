<%--
  Created by IntelliJ IDEA.
  User: no1fc
  Date: 25. 4. 4.
  Time: 오전 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag" %>
<html>
<head>
  <title>잡모아</title>
  <!-- Jobmoa 로고 탭 이미지 -->
  <mytag:Logo/>
  <!--begin::Primary Meta Tags-->
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="title" content="AdminLTE v4 | Dashboard" />
  <meta name="author" content="ColorlibHQ" />
  <meta
          name="description"
          content="AdminLTE is a Free Bootstrap 5 Admin Dashboard, 30 example pages using Vanilla JS."
  />
  <meta
          name="keywords"
          content="bootstrap 5, bootstrap, bootstrap 5 admin dashboard, bootstrap 5 dashboard, bootstrap 5 charts, bootstrap 5 calendar, bootstrap 5 datepicker, bootstrap 5 tables, bootstrap 5 datatable, vanilla js datatable, colorlibhq, colorlibhq dashboard, colorlibhq admin dashboard"
  />
  <!--end::Primary Meta Tags-->
  <!-- jQuery JS -->
  <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

  <!--begin::Fonts-->
  <link
          rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/@fontsource/source-sans-3@5.0.12/index.css"
          integrity="sha256-tXJfXfp6Ewt1ilPzLDtQnJV4hclT9XuaZUKyUvmyr+Q="
          crossorigin="anonymous"
  />
  <!--end::Fonts-->
  <!--begin::Third Party Plugin(OverlayScrollbars)-->
  <link
          rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.10.1/styles/overlayscrollbars.min.css"
          integrity="sha256-tZHrRjVqNSRyWg2wbppGnT833E/Ys0DHWGwT04GiqQg="
          crossorigin="anonymous"
  />
  <!--end::Third Party Plugin(OverlayScrollbars)-->
  <!--begin::Third Party Plugin(Bootstrap Icons)-->
  <link
          rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
          integrity="sha256-9kPW/n5nn53j4WMRYAxe9c1rCY96Oogo/MKSVdKzPmI="
          crossorigin="anonymous"
  />
  <!--end::Third Party Plugin(Bootstrap Icons)-->
  <!--begin::Required Plugin(AdminLTE)-->
  <link rel="stylesheet" href="css/adminlte.css" />
  <!--end::Required Plugin(AdminLTE)-->
  <!-- apexcharts -->
  <link
          rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/apexcharts@3.37.1/dist/apexcharts.css"
          integrity="sha256-4MX+61mt9NVvvuPjUWdUdyfZfxSB1/Rf9WtqRHgG5S0="
          crossorigin="anonymous"
  />
  <!-- jsvectormap -->
  <link
          rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/jsvectormap@1.5.3/dist/css/jsvectormap.min.css"
          integrity="sha256-+uGLJmmTKOqBr+2E6KDYs/NRsHxSkONXFHUL0fy2O/4="
          crossorigin="anonymous"
  />
  <!-- mouse pointer 모양 bootstrap 5 -->
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
  <!-- sweetalert2 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
  <script src="js/sweetAlert.js"></script>


  <!-- 대시보드 JavaScript -->
  <script src="js/dashboard_data_visualization.js"></script>
  <script src="js/dashboard_data_visualization2.js"></script>
  <script src="js/dashboard_data_visualization3.js"></script>

</head>
<body class="layout-fixed sidebar-expand-lg bg-body-tertiary">

<!--begin::App Wrapper-->
<div class="app-wrapper">
  <!--begin:::App Gnb-->
  <mytag:gnb gnb_main_header="지점관리" gnb_sub_header="지점 대시보드"/>
  <!--end:::App Gnb-->
  <!--begin:::App main content-->
  <!--begin::App Main-->
  <main class="app-main">
    <!--begin::App Content-->
    <div class="app-content">
      <!--begin::Main content-->
      <div class="container-fluid">
        <div class="card">
          <div class="card-body">
            <form id="searchForm">
              <!-- 날짜 선택 -->
              <div class="row mb-12 d-flex align-items-center justify-content-start">
                <div class="col-md-5 d-flex align-items-center">
                  <input type="date" class="form-control w-50" id="startDate">
                  <span>~</span>
                  <input type="date" class="form-control w-50" id="endDate">
                </div>
                <%--                <!-- 데이터 기준 선택 -->--%>
                <%--                <div class="col-md-3">--%>
                <%--                  <select class="form-select" id="dataCriteria">--%>
                <%--                    <option value="year">년도</option>--%>

                <%--                    <option value="month">월</option>--%>
                <%--                  </select>--%>
                <%--                </div>--%>
                <div class="col-md-3">
                  <button type="submit" class="btn btn-primary">조회</button>
                </div>
              </div>
            </form>
          </div>
        </div>

        <!-- 지점별 성공금 현황 chart -->
        <div class="card">
          <div class="card-body">
            <div id="dashboard_Success_chart">
            </div>
          </div>
        </div>

        <!-- 상담사 정보 모달 -->
        <div class="modal fade" id="counselorModal" tabindex="-1" aria-labelledby="counselorModalLabel" aria-hidden="true" >
          <div class="modal-dialog modal-lg">
            <div class="modal-content" style="width: 1000px;">
              <div class="modal-header">
                <h5 class="modal-title" id="counselorModalLabel">지점 상담사 성공금 현황</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <!-- 차트 영역 -->
                <div id="counselorChart"></div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
              </div>
            </div>
          </div>
        </div>


        <!-- 지점별 인센(해당,미해당) 현황 chart -->
        <div class="card">
          <div class="card-body">
            <div id="dashboard_inventive_chart">
            </div>
          </div>
        </div>

        <!-- 전체, A,B팀 인센(미해당 비율) 현황 chart -->
        <div class="card">
          <div class="card-body">
            <div id="dashboard_inventive_situation_chart">
            </div>
          </div>
        </div>

        <!-- 지점별 인센(미해당 비율) 현황 chart -->
        <div class="modal fade" id="inventiveSituationModal" tabindex="-1" aria-labelledby="inventiveSituationModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="inventiveSituationModalLabel">지점별 미해당 사유 현황</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <!-- 차트 영역 -->
                <div id="inventiveSituationAChart"></div>
                <!-- 차트 영역 -->
                <div id="inventiveSituationBChart"></div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
              </div>
            </div>
          </div>
        </div>

      </div>
      <!--end::Main content-->
    </div>
    <!--end::App Content-->
  </main>
  <!--end::App Main-->
  <!--end:::App main content-->

  <!--begin::Footer-->
  <mytag:footer/>
  <!--end::Footer-->

</div>

</body>
<!--begin::Script-->
<!--begin::Third Party Plugin(OverlayScrollbars)-->
<script
        src="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.10.1/browser/overlayscrollbars.browser.es6.min.js"
        integrity="sha256-dghWARbRe2eLlIJ56wNB+b760ywulqK3DzZYEpsg2fQ="
        crossorigin="anonymous"
></script>
<!--end::Third Party Plugin(OverlayScrollbars)--><!--begin::Required Plugin(popperjs for Bootstrap 5)-->
<script
        src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"
></script>
<!--end::Required Plugin(popperjs for Bootstrap 5)--><!--begin::Required Plugin(Bootstrap 5)-->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
        integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
        crossorigin="anonymous"
></script>
<!--end::Required Plugin(Bootstrap 5)--><!--begin::Required Plugin(AdminLTE)-->
<script src="js/adminlte.js"></script>
<!--begin::Script-->
<!--begin::OverlayScrollbars Configure-->
<script>
  const SELECTOR_SIDEBAR_WRAPPER = '.sidebar-wrapper';
  const Default = {
    scrollbarTheme: 'os-theme-light',
    scrollbarAutoHide: 'leave',
    scrollbarClickScroll: true,
  };
  document.addEventListener('DOMContentLoaded', function () {
    const sidebarWrapper = document.querySelector(SELECTOR_SIDEBAR_WRAPPER);
    if (sidebarWrapper && typeof OverlayScrollbarsGlobal?.OverlayScrollbars !== 'undefined') {
      OverlayScrollbarsGlobal.OverlayScrollbars(sidebarWrapper, {
        scrollbars: {
          theme: Default.scrollbarTheme,
          autoHide: Default.scrollbarAutoHide,
          clickScroll: Default.scrollbarClickScroll,
        },
      });
    }
  });
</script>
<!--end::OverlayScrollbars Configure-->

<!-- OPTIONAL SCRIPTS -->
<!-- sortablejs -->
<script>
  const connectedSortables = document.querySelectorAll('.connectedSortable');
  connectedSortables.forEach((connectedSortable) => {
    let sortable = new Sortable(connectedSortable, {
      group: 'shared',
      handle: '.card-header',
    });
  });

  const cardHeaders = document.querySelectorAll('.connectedSortable .card-header');
  cardHeaders.forEach((cardHeader) => {
    cardHeader.style.cursor = 'move';
  });
</script>
<!-- apexcharts -->
<script
        src="https://cdn.jsdelivr.net/npm/apexcharts@3.37.1/dist/apexcharts.min.js"
        integrity="sha256-+vh8GkaU7C9/wbSLIcwq82tQ2wTf44aOHA8HlBMwRI8="
        crossorigin="anonymous"
></script>

<script>

  const initData = {
    branch:['전체 지점','남부','서부','인서','인남','동대문'],
    thisSuccess:{
      branch:['전체 지점','남부','서부','인서','인남','동대문'],
      data:[20,10,40,30,50,40]
    },
    previousSuccess:{
      branch:['전체 지점','남부','서부','인서','인남','동대문'],
      data:[30,20,50,40,70,60]
    },
    correInventive:{
      branch:['전체 지점','남부','서부','인서','인남','동대문'],
      data:[10,20,30,40,50,20]
    },
    notCorreInventive:{
      branch:['전체 지점','남부','서부','인서','인남','동대문'],
      data:[20,10,40,30,50,40]
    },
    inventiveSituation:
            [
              {
                name: '서비스 미제공',
                data: [90, 55, 57]
              },
              {
                name: '1개월 미만 퇴사',
                data: [12, 85, 101]
              },
              {
                name: '파견업체',
                data: [23, 41, 36]
              },
              {
                name: '최저임금 미만',
                data: [23, 41, 36]
              },
            ]
  };

  // TODO FIXME 여기서 부터 수정 진행 데이터 넘겨받기는 완료 데이터 정제 및 수정만 진행하면됨
  let test = ${jsonResult1};
  let thisSuccess = {
    branch:[],
    data:[]
  };
  test.forEach(function(item){
    console.log(item.previousSuccess.branch + "::::" + item.previousSuccess.data);
    console.log(item.thisSuccess.branch + "::::" + item.thisSuccess.data);
    thisSuccess.branch.push(item.thisSuccess.branch);
    thisSuccess.data.push(item.thisSuccess.data);
  })
  initData.thisSuccess = thisSuccess;
  console.log(initData.thisSuccess);

  console.log("jsonResult1 Data : [ " + ${jsonResult1} + " ]");
  console.log("jsonResult2 Data : [ " + ${jsonResult2} + " ]");
  console.log("jsonResult3 Data : [ " + ${jsonResult3} + " ]");

</script>


</html>
