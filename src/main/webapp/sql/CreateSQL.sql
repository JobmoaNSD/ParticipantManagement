-- J_참여자관리 definition

-- Drop table

-- DROP TABLE J_참여자관리;

CREATE TABLE J_참여자관리 (
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
                                      메모 nvarchar(4000) COLLATE Korean_Wansung_CI_AS NULL,
                                      기타 nvarchar(200) COLLATE Korean_Wansung_CI_AS NULL,
                                      마감 bit DEFAULT 0 NULL,
                                      퇴사일 date NULL,
                                      지점 nvarchar(10) COLLATE Korean_Wansung_CI_AS NULL,
                                      중단종료일 date NULL,
                                      간접고용서비스 varchar(4) COLLATE Korean_Wansung_CI_AS NULL,
                                      전담자_이관일 date NULL,
                                      CONSTRAINT J_참여자관리_PK PRIMARY KEY (구직번호)
);


-- J_참여자관리_로그인정보 definition

-- Drop table

-- DROP TABLE J_참여자관리_로그인정보;

CREATE TABLE J_참여자관리_로그인정보 (
                                            전담자번호 int IDENTITY(1,1) NOT NULL,
                                            지점 nvarchar(10) COLLATE Korean_Wansung_CI_AS NOT NULL,
                                            이름 nvarchar(20) COLLATE Korean_Wansung_CI_AS NOT NULL,
                                            아이디 nvarchar(20) COLLATE Korean_Wansung_CI_AS NOT NULL,
                                            비밀번호 nvarchar(15) COLLATE Korean_Wansung_CI_AS DEFAULT 'jobmoa100!' NOT NULL,
                                            권한 nvarchar(20) COLLATE Korean_Wansung_CI_AS DEFAULT '상담' NULL,
                                            관리자권한 bit DEFAULT 0 NULL,
                                            등록일 date DEFAULT getdate() NULL,
                                            고유번호 nvarchar(15) COLLATE Korean_Wansung_CI_AS DEFAULT left(newid(),(8)) NULL,
                                            이메일 nvarchar(150) COLLATE Korean_Wansung_CI_AS NULL,
                                            전화번호 nvarchar(13) COLLATE Korean_Wansung_CI_AS NULL,
                                            금일일반취업 int DEFAULT 0 NULL,
                                            금일알선취업 int DEFAULT 0 NULL,
                                            금주일반취업 int DEFAULT 0 NULL,
                                            금주알선취업 int DEFAULT 0 NULL,
                                            금월일반취업 int DEFAULT 0 NULL,
                                            금월알선취업 int DEFAULT 0 NULL,
                                            금년일반취업 int DEFAULT 0 NULL,
                                            금년알선취업 int DEFAULT 0 NULL,
                                            실적저장일 date NULL,
                                            아이디사용여부 nvarchar(100) COLLATE Korean_Wansung_CI_AS NULL,
                                            입사일 date NULL,
                                            최종발령일 date NULL,
                                            CONSTRAINT 전담자_로그인정보_PK PRIMARY KEY (전담자번호)
);


-- J_참여자관리_자격증 definition

-- Drop table

-- DROP TABLE J_참여자관리_자격증;

CREATE TABLE J_참여자관리_자격증 (
                                          자격증번호 int IDENTITY(1,1) NOT NULL,
                                          구직번호 int NOT NULL,
                                          자격증 nvarchar(150) COLLATE Korean_Wansung_CI_AS NULL,
                                          Column4 varchar(50) COLLATE Korean_Wansung_CI_AS NULL,
                                          CONSTRAINT J_참여자관리_자격증_PK PRIMARY KEY (자격증번호)
);


-- J_참여자관리_지점 definition

-- Drop table

-- DROP TABLE J_참여자관리_지점;

CREATE TABLE J_참여자관리_지점 (
                                         지점번호 int IDENTITY(1,1) NOT NULL,
                                         지점 nvarchar(10) COLLATE Korean_Wansung_CI_AS NULL,
                                         지점인원 int NULL,
                                         유형1 int DEFAULT 0 NULL,
                                         유형2 int DEFAULT 0 NULL,
                                         사업부 varchar(4) COLLATE Korean_Wansung_CI_AS NULL,
                                         순서 int NULL,
                                         CONSTRAINT J_참여자관리_지점_PK PRIMARY KEY (지점번호)
);


-- J_참여자관리_직업훈련 definition

-- Drop table

-- DROP TABLE J_참여자관리_직업훈련;

CREATE TABLE J_참여자관리_직업훈련 (
                                           직업훈련번호 int IDENTITY(1,1) NOT NULL,
                                           구직번호 int NOT NULL,
                                           직업훈련 nvarchar(150) COLLATE Korean_Wansung_CI_AS NULL,
                                           CONSTRAINT J_참여자관리_직업훈련_PK PRIMARY KEY (직업훈련번호)
);