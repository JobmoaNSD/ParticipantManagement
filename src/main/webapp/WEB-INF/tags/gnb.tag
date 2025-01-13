<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ attribute name="gnb_main_header"%>
<%@ attribute name="gnb_sub_header"%>

    <!--begin::Header-->
    <nav class="app-header navbar navbar-expand bg-body">
        <!--begin::Container-->
        <div class="container-fluid">
            <!--begin::Start Navbar Links-->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" data-lte-toggle="sidebar" href="" role="button">
                        <i class="bi bi-list"></i>
                    </a>
                </li>
                <li class="nav-item d-none d-md-block"><a href="" class="nav-link"><%=gnb_main_header%></a></li>
                <li class="nav-item d-none d-md-block"><a href="" class="nav-link"><%=gnb_sub_header%></a></li>
            </ul>
            <!--end::Start Navbar Links-->
            <!--begin::End Navbar Links-->
            <ul class="navbar-nav ms-auto">
                <!--begin::Fullscreen Toggle-->
                <li class="nav-item">
                    <a class="nav-link" href="#" data-lte-toggle="fullscreen">
                        <i data-lte-icon="maximize" class="bi bi-arrows-fullscreen"></i>
                        <i data-lte-icon="minimize" class="bi bi-fullscreen-exit" style="display: none"></i>
                    </a>
                </li>
                <!--end::Fullscreen Toggle-->
                <!--begin::User Menu Dropdown-->
                <li class="nav-item dropdown user-menu">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <span class="d-none d-md-inline">로그인 정보</span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-lg dropdown-menu-end">
                        <!--begin::User Image-->
                        <li class="text-bg-primary text-center">
                            <p>
                                참여자 관리
                                <small class="text-center">(남부)</small>
                            </p>
                        </li>
                        <!--end::User Image-->
                        <!--begin::Menu Body-->
                        <li class="user-body">
                            <!--begin::Row-->
                            <div class="row">

                                <div class="col-4 text-center">전담자<br/>홍길동</div>
                                <div class="col-4 text-center">권한<br/>상담</div>
                                <div class="col-4 text-center">관리자<br/>False</div>
                            </div>
                            <!--end::Row-->
                        </li>
                        <!--end::Menu Body-->
                        <!--begin::Menu Footer-->
                        <li class="user-footer">
                            <a href="#" class="btn btn-default btn-flat float-end">Sign out</a>
                        </li>
                        <!--end::Menu Footer-->
                    </ul>
                </li>
                <!--end::User Menu Dropdown-->
            </ul>
            <!--end::End Navbar Links-->
        </div>
        <!--end::Container-->
    </nav>
    <!--end::Header-->
    <!--begin::Sidebar-->
    <aside class="app-sidebar bg-body-secondary shadow" data-bs-theme="dark">
        <!--begin::Sidebar Brand-->
        <div class="sidebar-brand">
            <!--begin::Brand Link-->
            <a href="./index.jsp" class="brand-link">
                <!--begin::Brand Image-->
                <img
                        src="../../img/JobmoaLog.png"
                        alt="AdminLTE Logo"
                        class="brand-image opacity-75 shadow"
                />
                <!--end::Brand Image-->
                <!--begin::Brand Text-->
<%--                <span class="brand-text fw-light">AdminLTE 4</span>--%>
                <!--end::Brand Text-->
            </a>
            <!--end::Brand Link-->
        </div>
        <!--end::Sidebar Brand-->
        <!--begin::Sidebar Wrapper-->
        <div class="sidebar-wrapper" style="max-height: 100vh; overflow: hidden;">
            <nav class="mt-2">
                <!--begin::Sidebar Menu-->
                <ul
                        class="nav sidebar-menu flex-column"
                        data-lte-toggle="treeview"
                        role="menu"
                        data-accordion="false"
                >
                    <!--begin::실적관리-->
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon bi bi-file-bar-graph-fill"></i>
                            <p>
                                실적관리
                                <i class="nav-arrow bi bi-chevron-right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="./index.jsp" class="nav-link">
                                    <small><p>대시보드</p></small>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="./index.jsp" class="nav-link">
                                    <small><p>일일업무보고</p></small>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="./index.jsp" class="nav-link">
                                    <small><p>업무진행현황</p></small>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <!--end::실적관리-->
                    <!--begin::상담관리-->
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon bi bi-file-person"></i>
                            <p>
                                상담관리
                                <i class="nav-arrow bi bi-chevron-right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="./index.jsp" class="nav-link">
                                    <small><p>참여자 조회 및 수정</p></small>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="./index.jsp" class="nav-link">
                                    <small><p>신규 참여자</p></small>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <!--end::상담관리-->
                    <!--begin::알선기업관리-->
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon bi bi-people-fill"></i>
                            <p>
                                알선기업관리
                                <i class="nav-arrow bi bi-chevron-right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="./index.jsp" class="nav-link">
                                    <small><p>알선기업</p></small>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <!--end::알선기업관리-->
<%--                    <li class="nav-header">DOCUMENTATIONS</li>--%>
<%--                    <li class="nav-item">--%>
<%--                        <a href="./docs/introduction.html" class="nav-link">--%>
<%--                            <i class="nav-icon bi bi-download"></i>--%>
<%--                            <p>Installation</p>--%>
<%--                        </a>--%>
<%--                    </li>--%>
                </ul>
                <!--end::Sidebar Menu-->
            </nav>
        </div>
        <!--end::Sidebar Wrapper-->
    </aside>
    <!--end::Sidebar-->