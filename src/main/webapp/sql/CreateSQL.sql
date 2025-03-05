-- db122266.dbo.J_참여자관리 definition

-- Drop table

-- DROP TABLE db122266.dbo.J_참여자관리;

CREATE TABLE db122266.dbo.J_참여자관리 (
                                      구직번호 int IDENTITY(1,1) NOT NULL,
                                      등록일 date DEFAULT getdate() NULL,
                                      전담자_계정 nvarchar(50) COLLATE Korean_Wansung_CI_AS NULL,
                                      참여자 nvarchar(40) COLLATE Korean_Wansung_CI_AS NOT NULL,
                                      생년월일 date NULL,
                                      성별 nvarchar(40) COLLATE Korean_Wansung_CI_AS NULL,
                                      모집경로 nvarchar(40) COLLATE Korean_Wansung_CI_AS NULL,
                                      참여유형 nvarchar(40) COLLATE Korean_Wansung_CI_AS NULL,
                                      학교명 nvarchar(128) COLLATE Korean_Wansung_CI_AS NULL,
                                      전공 nvarchar(128) COLLATE Korean_Wansung_CI_AS NULL,
                                      주소 nvarchar(128) COLLATE Korean_Wansung_CI_AS NULL,
                                      경력 nvarchar(40) COLLATE Korean_Wansung_CI_AS NULL,
                                      특정계층 nvarchar(40) COLLATE Korean_Wansung_CI_AS NULL,
                                      알선요청 nvarchar(20) COLLATE Korean_Wansung_CI_AS DEFAULT '미해당' NULL,
                                      취업역량 nvarchar(20) COLLATE Korean_Wansung_CI_AS NULL,
                                      최근상담일 date NULL,
                                      진행단계 nvarchar(40) COLLATE Korean_Wansung_CI_AS NULL,
                                      초기상담일 date NULL,
                                      구직만료일 date NULL,
                                      IAP수료일 date NULL,
                                      [3단계진입일] date NULL,
                                      기간만료일 date NULL,
                                      클리닉실시일 date NULL,
                                      희망직무 nvarchar(128) COLLATE Korean_Wansung_CI_AS NULL,
                                      희망급여 nvarchar(40) COLLATE Korean_Wansung_CI_AS NULL,
                                      취창업일 date NULL,
                                      취창업처리일 date NULL,
                                      취업유형 nvarchar(40) COLLATE Korean_Wansung_CI_AS NULL,
                                      취업처 nvarchar(60) COLLATE Korean_Wansung_CI_AS NULL,
                                      임금 nvarchar(40) COLLATE Korean_Wansung_CI_AS NULL,
                                      직무 nvarchar(40) COLLATE Korean_Wansung_CI_AS NULL,
                                      취업인센티브_구분 nvarchar(40) COLLATE Korean_Wansung_CI_AS NULL,
                                      일경험분류 nvarchar(40) COLLATE Korean_Wansung_CI_AS NULL,
                                      메모 ntext COLLATE Korean_Wansung_CI_AS NULL,
                                      기타 nvarchar(200) COLLATE Korean_Wansung_CI_AS NULL,
                                      마감 bit NULL,
                                      퇴사일 date NULL,
                                      지점 nvarchar(10) COLLATE Korean_Wansung_CI_AS NULL,
                                      CONSTRAINT J_참여자관리_PK PRIMARY KEY (구직번호)
);


-- db122266.dbo.J_참여자관리_로그인정보 definition

-- Drop table

-- DROP TABLE db122266.dbo.J_참여자관리_로그인정보;

CREATE TABLE db122266.dbo.J_참여자관리_로그인정보 (
                                            전담자번호 int IDENTITY(1,1) NOT NULL,
                                            지점 nvarchar(10) COLLATE Korean_Wansung_CI_AS NOT NULL,
                                            이름 nvarchar(20) COLLATE Korean_Wansung_CI_AS NOT NULL,
                                            아이디 nvarchar(20) COLLATE Korean_Wansung_CI_AS NOT NULL,
                                            비밀번호 nvarchar(15) COLLATE Korean_Wansung_CI_AS NOT NULL,
                                            권한 nvarchar(20) COLLATE Korean_Wansung_CI_AS DEFAULT '상담' NULL,
                                            관리자권한 bit DEFAULT 0 NULL,
                                            등록일 date DEFAULT getdate() NULL,
                                            고유번호 nvarchar(15) COLLATE Korean_Wansung_CI_AS DEFAULT left(newid(),(8)) NULL,
                                            이메일 nvarchar(150) COLLATE Korean_Wansung_CI_AS NULL,
                                            전화번호 nvarchar(13) COLLATE Korean_Wansung_CI_AS NULL,
                                            CONSTRAINT 전담자_로그인정보_PK PRIMARY KEY (전담자번호)
);


-- db122266.dbo.J_참여자관리_지점 definition

-- Drop table

-- DROP TABLE db122266.dbo.J_참여자관리_지점;

CREATE TABLE db122266.dbo.J_참여자관리_지점 (
                                         지점번호 int IDENTITY(1,1) NOT NULL,
                                         지점 nvarchar(10) COLLATE Korean_Wansung_CI_AS NULL,
                                         지점인원 int NULL,
                                         CONSTRAINT J_참여자관리_지점_PK PRIMARY KEY (지점번호)
);


-- db122266.dbo.J_참여자관리_자격증 definition

-- Drop table

-- DROP TABLE db122266.dbo.J_참여자관리_자격증;

CREATE TABLE db122266.dbo.J_참여자관리_자격증 (
                                          자격증번호 int IDENTITY(1,1) NOT NULL,
                                          구직번호 int NOT NULL,
                                          자격증 nvarchar(150) COLLATE Korean_Wansung_CI_AS NULL,
                                          CONSTRAINT J_참여자관리_자격증_PK PRIMARY KEY (자격증번호)
);


-- db122266.dbo.J_참여자관리_직업훈련 definition

-- Drop table

-- DROP TABLE db122266.dbo.J_참여자관리_직업훈련;

CREATE TABLE db122266.dbo.J_참여자관리_직업훈련 (
                                           직업훈련번호 int IDENTITY(1,1) NOT NULL,
                                           구직번호 int NOT NULL,
                                           직업훈련 nvarchar(150) COLLATE Korean_Wansung_CI_AS NULL,
                                           CONSTRAINT J_참여자관리_직업훈련_PK PRIMARY KEY (직업훈련번호)
);


-- dbo.SUCCESSMONEY source

-- dbo.SUCCESSMONEY source

-- dbo.SUCCESSMONEY source

-- dbo.SUCCESSMONEY source

-- dbo.SUCCESSMONEY source

-- dbo.SUCCESSMONEY source

CREATE VIEW dbo.SUCCESSMONEY AS WITH 기준금액 AS (
    --특 6개월 이내 A,B 역량
    SELECT '특A6' AS 구분, 10 AS 임금_최소, 205 AS 임금_최대, 600000 AS 성공금 UNION ALL
    SELECT '특A6', 205, 235, 850000 UNION ALL
    SELECT '특A6', 235, 265, 1100000 UNION ALL
    SELECT '특A6', 265, NULL, 1750000 UNION ALL  -- 2,650,000 이상
    --특 12개월 이내 A,B 역량
    SELECT '특A12', 10, 205, 400000 UNION ALL
    SELECT '특A12', 205, 235, 600000 UNION ALL
    SELECT '특A12', 235, 265, 900000 UNION ALL
    SELECT '특A12', 265, NULL, 1550000 UNION ALL  -- 2,650,000 이상
    --특 18개월 이내 A,B 역량
    SELECT '특A18', 10, 205, 200000 UNION ALL
    SELECT '특A18', 205, 235, 450000 UNION ALL
    SELECT '특A18', 235, 265, 700000 UNION ALL
    SELECT '특A18', 265, NULL, 1150000 UNION ALL  -- 2,650,000 이상
    --특 6개월 이내 C,D 역량
    SELECT '특C6', 10, 205, 400000 UNION ALL
    SELECT '특C6', 205, 235, 650000 UNION ALL
    SELECT '특C6', 235, 265, 900000 UNION ALL
    SELECT '특C6', 265, NULL, 1550000 UNION ALL  -- 2,650,000 이상
    --특 12개월 이내 C,D 역량
    SELECT '특C12', 10, 205, 200000 UNION ALL
    SELECT '특C12', 205, 235, 450000 UNION ALL
    SELECT '특C12', 235, 265, 700000 UNION ALL
    SELECT '특C12', 265, NULL, 1350000 UNION ALL  -- 2,650,000 이상
    --특 18개월 이내 C,D 역량
    SELECT '특C18', 10, 205, 100000 UNION ALL
    SELECT '특C18', 205, 235, 250000 UNION ALL
    SELECT '특C18', 235, 265, 500000 UNION ALL
    SELECT '특C18', 265, NULL, 1150000 UNION ALL  -- 2,650,000 이상
    --6개월 이내 A,B 역량
    SELECT 'A6', 10, 205, 500000 UNION ALL
    SELECT 'A6', 205, 235, 750000 UNION ALL
    SELECT 'A6', 235, 265, 1000000 UNION ALL
    SELECT 'A6', 265, NULL, 1550000 UNION ALL  -- 2,650,000 이상
    --12개월 이내 A,B 역량
    SELECT 'A12', 10, 205, 300000 UNION ALL
    SELECT 'A12', 205, 235, 550000 UNION ALL
    SELECT 'A12', 235, 265, 800000 UNION ALL
    SELECT 'A12', 265, NULL, 1350000 UNION ALL  -- 2,650,000 이상
    --18개월 이내 A,B 역량
    SELECT 'A18', 10, 205, 100000 UNION ALL
    SELECT 'A18', 205, 235, 350000 UNION ALL
    SELECT 'A18', 235, 265, 600000 UNION ALL
    SELECT 'A18', 265, NULL, 950000 UNION ALL  -- 2,650,000 이상
    --6개월 이내 C,D 역량
    SELECT 'C6', 10, 205, 300000 UNION ALL
    SELECT 'C6', 205, 235, 550000 UNION ALL
    SELECT 'C6', 235, 265, 800000 UNION ALL
    SELECT 'C6', 265, NULL, 1350000 UNION ALL  -- 2,650,000 이상
    --12개월 이내 C,D 역량
    SELECT 'C12', 10, 205, 100000 UNION ALL
    SELECT 'C12', 205, 235, 300000 UNION ALL
    SELECT 'C12', 235, 265, 600000 UNION ALL
    SELECT 'C12', 265, NULL, 1150000 UNION ALL  -- 2,650,000 이상
    --18개월 이내 C,D 역량
    SELECT 'C18', 10, 205, 50000 UNION ALL
    SELECT 'C18', 205, 235, 150000 UNION ALL
    SELECT 'C18', 235, 265, 400000 UNION ALL
    SELECT 'C18', 265, NULL, 950000  -- 2,650,000 이상
)
                                SELECT
                                    G.구직번호,
                                    G.등록일,
                                    G.전담자_계정,
                                    G.지점,
                                    (CASE
                                         WHEN G.취업인센티브_구분 LIKE '%50%' THEN B.성공금 * 0.5
                                         WHEN G.취업인센티브_구분 LIKE '%100%' THEN B.성공금 * 1.0
                                         WHEN G.취업인센티브_구분 LIKE '%120%' THEN B.성공금 * 1.2
                                         ELSE 0
                                        END
                                        ) 성공금,
                                    (CASE
                                         WHEN G.취업인센티브_구분 LIKE '%50%' THEN B.성공금 * 0.5 * 0.1
                                         WHEN G.취업인센티브_구분 LIKE '%100%' THEN B.성공금 * 1.0 * 0.1
                                         WHEN G.취업인센티브_구분 LIKE '%120%' THEN B.성공금 * 1.2 * 0.1
                                         ELSE 0
                                        END
                                        ) 인센티브
                                FROM J_참여자관리 G
                                         LEFT JOIN 기준금액 B
                                                   ON
                                                       (CASE
                                                            WHEN G.특정계층 LIKE 'O%' THEN '특' +
                                                                                       CASE
                                                                                           WHEN G.취업역량 IN ('A', 'B') THEN 'A'
                                                                                           WHEN G.취업역량 IN ('C', 'D') THEN 'C'
                                                                                           END +
                                                                                       CASE
                                                                                           WHEN DATEDIFF(DAY, G.초기상담일, G.취창업일) > 0 THEN
                                                                                               CASE
                                                                                                   WHEN DATEDIFF(MONTH, G.초기상담일, G.취창업일) <= 6 THEN '6'
                                                                                                   WHEN DATEDIFF(MONTH, G.초기상담일, G.취창업일) <= 12 THEN '12'
                                                                                                   WHEN DATEDIFF(MONTH, G.초기상담일, G.취창업일) <= 18 THEN '18'
                                                                                                   ELSE NULL
                                                                                                   END
                                                                                           ELSE NULL
                                                                                           END
                                                            ELSE
                                                                CASE
                                                                    WHEN G.취업역량 IN ('A', 'B') THEN 'A'
                                                                    WHEN G.취업역량 IN ('C', 'D') THEN 'C'
                                                                    END +
                                                                CASE
                                                                    WHEN DATEDIFF(DAY, G.초기상담일, G.취창업일) > 0 THEN
                                                                        CASE
                                                                            WHEN DATEDIFF(MONTH, G.초기상담일, G.취창업일) <= 6 THEN '6'
                                                                            WHEN DATEDIFF(MONTH, G.초기상담일, G.취창업일) <= 12 THEN '12'
                                                                            WHEN DATEDIFF(MONTH, G.초기상담일, G.취창업일) <= 18 THEN '18'
                                                                            ELSE NULL
                                                                            END
                                                                    ELSE NULL
                                                                    END
                                                           END) = B.구분
                                                           AND (G.임금 >= B.임금_최소 AND (B.임금_최대 IS NULL OR G.임금 < B.임금_최대))
                                WHERE
                                    G.임금 > 0 AND (G.취업인센티브_구분 != NULL OR G.취업인센티브_구분 != '');



-- dbo.EXTERNALPARTICIPANT source

-- dbo.EXTERNALPARTICIPANT source

-- dbo.NewView source

CREATE VIEW dbo.EXTERNALPARTICIPANT AS SELECT
                                           J_PARTIC.구직번호,
                                           J_PARTIC.참여자,
                                           J_PARTIC.성별,
                                           J_PARTIC.주소,
                                           J_PARTIC.학교명,
                                           J_PARTIC.전공,
                                           J_PARTIC.희망직무,
                                           (
                                               SELECT
                                                   STUFF(
                                                           (SELECT ', ' + J_PARTIC_P.자격증
                                                            FROM J_참여자관리_자격증 J_PARTIC_P
                                                            WHERE J_PARTIC_P.구직번호 = J_PARTIC.구직번호
                                                            FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)')
                                                       , 1, 2, '')
                                           ) AS 자격증,
                                           (J_PARTIC.희망급여*12/10*10) 희망연봉,
                                           J_PARTIC_L.이름 상담사,
                                           J_PARTIC_L.이메일 이메일,
                                           J_PARTIC_L.전화번호 전화번호,
                                           J_PARTIC_L.고유번호
                                       FROM
                                           J_참여자관리 J_PARTIC
                                               JOIN
                                           J_참여자관리_로그인정보 J_PARTIC_L
                                           ON
                                               J_PARTIC.전담자_계정 = J_PARTIC_L.아이디
                                               LEFT JOIN
                                           J_참여자관리_자격증 J_PARTIC_P
                                           ON
                                               J_PARTIC.구직번호 = J_PARTIC_P.구직번호
                                       WHERE
                                           알선요청='희망' AND
                                           J_PARTIC.학교명 != '' AND
                                           J_PARTIC.전공 != ''
                                       GROUP BY
                                           J_PARTIC.구직번호,
                                           J_PARTIC.참여자,
                                           J_PARTIC.성별,
                                           J_PARTIC.주소,
                                           J_PARTIC.학교명,
                                           J_PARTIC.전공,
                                           J_PARTIC.희망직무,
                                           J_PARTIC.희망급여,
                                           J_PARTIC_L.이름,
                                           J_PARTIC_L.이메일,
                                           J_PARTIC_L.전화번호,
                                           J_PARTIC_L.고유번호;


-- 사용자 이메일 자동 생성 쿼리
CREATE TRIGGER trg_SetEmail
    ON db122266.dbo.J_참여자관리_로그인정보
    AFTER INSERT
    AS
BEGIN
    UPDATE db122266.dbo.J_참여자관리_로그인정보
    SET 이메일 = t.아이디 + '@jobmoa.com'
    FROM db122266.dbo.J_참여자관리_로그인정보 AS t
             INNER JOIN inserted AS i
                        ON t.아이디 = i.아이디;
END;