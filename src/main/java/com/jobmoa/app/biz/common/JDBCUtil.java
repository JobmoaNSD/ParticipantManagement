package com.jobmoa.app.biz.common;

import lombok.extern.slf4j.Slf4j;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@Slf4j
public class JDBCUtil {
    public static final String DB_DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    public static final String DB_NAME = "db122266";
    public static final String DB_PORT = "1433";
    public static final String DB_IP = "";
    public static final String DB_URL = "jdbc:sqlserver://211.115.206.107:1433;DatabaseName=db122266;trustServerCertificate=true;";
    public static final String DB_USER = "u122266";
    public static final String DB_PASSWORD = "jobmoano1!"; // DB설정 Github 연결시 삭제 후 진행

    public static Connection connect(){
        log.info("-----현재 연결 정보 시작------");
        try {
            Class.forName(DB_DRIVER);
        }
        catch (ClassNotFoundException e) {
            log.error("잘못된 SQL Driver 로 인한 설정 오류 [{}]",e.getMessage());
        }
        finally {
            log.info("-----Driver Data------");
            log.info("SQL Driver : [{}]", DB_DRIVER);

        }
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        }
        catch (SQLException e) {
            log.error("연결 불가 [{}]",e.getMessage());
        }
        finally {
            log.info("-----Connection Data------");
            log.info("DB_URL : [{}]", DB_URL);
            log.info("DB_USER : [{}]", DB_USER);
            log.info("DB_PASSWORD : [{}]", DB_PASSWORD);
        }
        log.info("-----현재 연결 정보 종료------");
        return conn;
    }

    public static void disconnect(PreparedStatement pstmt, Connection conn){
        log.info("----- 연결 종료. -----");
        try {
            if(pstmt != null) pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if(conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        log.info("----- 연결 종료.. -----");
    }

}
