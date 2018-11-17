
-- CREATE DATABASE ourmeal;

-- USE ourmeal;


-- DROP TABLE
DROP TABLE IF EXISTS chat;
DROP TABLE IF EXISTS pa_bulletin;
DROP TABLE IF EXISTS ma_bulletin;
DROP TABLE IF EXISTS pq_bulletin;
DROP TABLE IF EXISTS mq_bulletin;
DROP TABLE IF EXISTS star_comment;
DROP TABLE IF EXISTS star_bulletin;
DROP TABLE IF EXISTS re_free_comment;
DROP TABLE IF EXISTS free_comment;
DROP TABLE IF EXISTS free_bulletin;
DROP TABLE IF EXISTS notice;
DROP TABLE IF EXISTS allergy;
DROP TABLE IF EXISTS food_menu;
DROP TABLE IF EXISTS store;
DROP TABLE IF EXISTS partner;
DROP TABLE IF EXISTS health;
DROP TABLE IF EXISTS member;
DROP TABLE IF EXISTS location;
DROP TABLE IF EXISTS administrator;



-- Administrator Table Create SQL
CREATE TABLE administrator (
		admin_id		VARCHAR(20)		NOT NULL	PRIMARY KEY		COMMENT '관리자 아이디' 
	,	admin_pw		VARCHAR(20)		NOT NULL					COMMENT '관리자 비밀번호'
);

ALTER TABLE administrator COMMENT '관리자';



-- Location Table Create SQL
CREATE TABLE location (
		loc_code		VARCHAR(20)		NOT NULL	PRIMARY KEY		COMMENT '주소 코드' 
	,	loc_name		VARCHAR(500)	NOT NULL					COMMENT '주소 명' 
);

ALTER TABLE location COMMENT '주소';



-- Member Table Create SQL
CREATE TABLE member (
		member_id		VARCHAR(20)     NOT NULL    PRIMARY KEY		COMMENT '회원 아이디'
	,	member_pw		VARCHAR(20)     NOT NULL    				COMMENT '회원 비밀번호'
	,	member_name		VARCHAR(50)     NOT NULL    				COMMENT '회원 이름'
	,	member_email	VARCHAR(100)    NOT NULL    				COMMENT '회원 이메일'
	,	loc_code 		VARCHAR(20)     		    				COMMENT '회원 주소'
    ,	member_address	VARCHAR(300)								COMMENT '회원 상세 주소'
	,	member_phone  	VARCHAR(20)     NOT NULL    				COMMENT '회원 연락처'
	,	member_birth  	DATE            NOT NULL    				COMMENT '회원 생일'
	,	member_sex    	CHAR(1)         NOT NULL    				COMMENT '회원 성별'
	,	member_date   	DATE            NOT NULL    				COMMENT '회원 가입일'
	,	member_image  	VARCHAR(300)    		      				COMMENT '회원 사진'
    ,	member_type		INT				NOT NULL	DEFAULT 0		COMMENT '회원 타입'		-- 0 : 일반회원, 1 : 사업자
	,	member_grade  	VARCHAR(20)     	          				COMMENT '회원 등급'
);

ALTER TABLE member COMMENT '회원';

ALTER TABLE member ADD CONSTRAINT FK_member_loc_code_location_loc_code FOREIGN KEY (loc_code)
			REFERENCES location (loc_code) ON DELETE SET NULL ON UPDATE SET NULL;
ALTER TABLE member ADD CONSTRAINT CK_member_member_type CHECK(member_type IN (0, 1));



-- Partner Table Create SQL
CREATE TABLE partner (
		member_id		VARCHAR(20)     NOT NULL	PRIMARY KEY		COMMENT '사업자 아이디'
	,	partner_crn		VARCHAR(20)     NOT NULL    				COMMENT '사업자 등록번호'
    ,	partner_date	DATE			NOT NULL					COMMENT '사업자 등록일'
);

ALTER TABLE partner COMMENT '사업자';

ALTER TABLE partner ADD CONSTRAINT FK_partner_member_id_member_member_id FOREIGN KEY (member_id)
			REFERENCES member (member_id) ON DELETE CASCADE ON UPDATE CASCADE;
            
            

-- Health Table Create SQL
CREATE TABLE health (
		health_no		VARCHAR(20)		NOT NULL	PRIMARY KEY		COMMENT '신체 정보 번호'
	,	member_id      	VARCHAR(20)		NOT NULL    				COMMENT '회원 아이디'
	,	health_height  	DECIMAL(4, 1)	NOT NULL    				COMMENT '회원 신장'
	,	health_weight  	DECIMAL(4, 1)	NOT NULL    				COMMENT '회원 체중'
	,	health_basal   	INT             NOT NULL					COMMENT '회원 기초 대사량'
);

ALTER TABLE health COMMENT '신체 정보';

ALTER TABLE health ADD CONSTRAINT FK_health_member_id_member_member_id FOREIGN KEY (member_id)
			REFERENCES member (member_id) ON DELETE CASCADE ON UPDATE CASCADE;
            
            
            
-- Store Table Create SQL
CREATE TABLE store (
		store_code		VARCHAR(20)		NOT NULL	PRIMARY KEY		COMMENT '가게 코드'
	,	store_title		VARCHAR(50)     NOT NULL    				COMMENT '가게 명'
	,	member_id		VARCHAR(20)     NOT NULL    				COMMENT '사업자 아이디'
	,	loc_code		VARCHAR(20)     		    				COMMENT '가게 주소'
    ,	store_address	VARCHAR(300)								COMMENT '가게 상세 주소'
	,	store_tel		VARCHAR(20)     NOT NULL    				COMMENT '가게 연락처'
	,	store_info		VARCHAR(500)    NOT NULL    				COMMENT '가게 소개'
	,	store_image		VARCHAR(300)    NOT NULL    				COMMENT '가게 사진'
	,	store_type		VARCHAR(10)      		    				COMMENT '가게 구분'
);

ALTER TABLE store COMMENT '가게';

ALTER TABLE store ADD CONSTRAINT FK_store_member_id_partner_member_id FOREIGN KEY (member_id)
			REFERENCES partner (member_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE store ADD CONSTRAINT FK_store_loc_code_location_loc_code FOREIGN KEY (loc_code)
			REFERENCES location (loc_code) ON DELETE SET NULL ON UPDATE SET NULL;



-- Food_Menu Table Create SQL
CREATE TABLE food_menu (
		store_code  	VARCHAR(20)     NOT NULL    PRIMARY KEY		COMMENT '가게 코드'
	,	fm_code     	VARCHAR(20)     NOT NULL    				COMMENT '음식 코드'
	,	fm_name     	VARCHAR(50)     NOT NULL    				COMMENT '음식 이름'
	,	fm_image    	VARCHAR(300)    NOT NULL    				COMMENT '음식 사진'
	,	fm_info     	VARCHAR(500)    NOT NULL    				COMMENT '음식 소개'
	,	fm_price    	INT             NOT NULL    				COMMENT '음식 가격'
	,	fm_kcal     	INT             NOT NULL    				COMMENT '음식 칼로리'
	,	fm_allergy  	VARCHAR(200)    	        				COMMENT '음식 알러지 재료'
);

ALTER TABLE food_menu COMMENT '음식 메뉴';

ALTER TABLE food_menu ADD CONSTRAINT FK_food_menu_store_code_store_store_code FOREIGN KEY (store_code)
			REFERENCES store (store_code) ON DELETE CASCADE ON UPDATE CASCADE;



-- Allergy Table Create SQL
CREATE TABLE allergy (
		allergy_code  	VARCHAR(5)     	NOT NULL	PRIMARY KEY		COMMENT '알러지 코드' 
	,	allergy_name  	VARCHAR(50)    	NOT NULL					COMMENT '알러지 명'
);

ALTER TABLE allergy COMMENT '알러지 재료';



-- Notice Table Create SQL
CREATE TABLE notice (
		notice_no       INT            	NOT NULL    PRIMARY KEY		AUTO_INCREMENT		COMMENT '게시글 번호'
	,	notice_title    VARCHAR(50)    	NOT NULL    									COMMENT '게시글 제목'
	,	admin_id        VARCHAR(20)    	NOT NULL    									COMMENT '관리자 아이디'
	,	notice_content	TEXT           	NOT NULL    									COMMENT '게시글 내용'
    ,	notice_image	VARCHAR(1000)													COMMENT '첨부파일'
	,	notice_count    INT            	NOT NULL	DEFAULT 0    						COMMENT '게시글 조회수'
	,	notice_c_date   DATETIME       	NOT NULL    									COMMENT '생성일'
	,	notice_u_date   DATETIME       	NOT NULL	   									COMMENT '수정일'
	,	notice_d_date   DATETIME       		        									COMMENT '삭제일'
);

ALTER TABLE notice COMMENT '공지 게시판';

ALTER TABLE notice ADD CONSTRAINT FK_notice_admin_id_administrator_admin_id FOREIGN KEY (admin_id)
			REFERENCES administrator (admin_id) ON DELETE CASCADE ON UPDATE CASCADE;
            
            
            
-- Free_Bulletin Table Create SQL
CREATE TABLE free_bulletin (
		fb_no			INT				NOT NULL	PRIMARY KEY		AUTO_INCREMENT		COMMENT '게시글 번호'
	,	fb_title		VARCHAR(50)		NOT NULL										COMMENT '게시글 제목'
	,	member_id		VARCHAR(20)		NOT NULL    									COMMENT '회원 아이디'
	,	fb_content		TEXT           	NOT NULL    									COMMENT '게시글 내용'
    ,	fb_image		VARCHAR(1000)													COMMENT '첨부파일'
	,	fb_count		INT            	NOT NULL	DEFAULT 0    						COMMENT '게시글 조회수'
	,	fb_c_date		DATETIME       	NOT NULL    									COMMENT '생성일'
	,	fb_u_date   	DATETIME       	NOT NULL       									COMMENT '수정일'
	,	fb_d_date   	DATETIME       		        									COMMENT '삭제일'
);

ALTER TABLE free_bulletin COMMENT '자유 게시판';

ALTER TABLE free_bulletin ADD CONSTRAINT FK_free_bulletin_member_id_member_member_id FOREIGN KEY (member_id)
			REFERENCES member (member_id) ON DELETE CASCADE ON UPDATE CASCADE;



-- Free_Comment Table Create SQL
CREATE TABLE free_comment (
		fc_no       	INT             NOT NULL    PRIMARY KEY		AUTO_INCREMENT 		COMMENT '댓글 번호'
    ,   fc_prt_no		INT																COMMENT '상위 댓글'
	,	fb_no       	INT             NOT NULL    									COMMENT '게시글 번호'
	,	member_id   	VARCHAR(20)     NOT NULL    									COMMENT '회원 아이디'
	,	fc_content  	VARCHAR(300)    NOT NULL    									COMMENT '댓글 내용'
	,	fc_c_date   	DATETIME        NOT NULL    									COMMENT '생성일'
	,	fc_u_date   	DATETIME        NOT NULL       									COMMENT '수정일'
	,	fc_d_date   	DATETIME        	        									COMMENT '삭제일'
);

ALTER TABLE free_comment COMMENT '자유 게시판 댓글';

ALTER TABLE free_comment ADD CONSTRAINT FK_free_comment_fb_no_free_bulletin_fb_no FOREIGN KEY (fb_no)
			REFERENCES free_bulletin (fb_no) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE free_comment ADD CONSTRAINT FK_free_comment_fc_prt_no_free_comment_fc_no FOREIGN KEY (fc_prt_no)
			REFERENCES free_comment (fc_no) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE free_comment ADD CONSTRAINT FK_free_comment_member_id_member_member_id FOREIGN KEY (member_id)
			REFERENCES member (member_id) ON DELETE CASCADE ON UPDATE CASCADE;

            
            
/*
-- Re_Free_Comment Table Create SQL
CREATE TABLE re_free_comment (
		rfc_no       	INT             NOT NULL    PRIMARY KEY		AUTO_INCREMENT 		COMMENT '답글 번호'
	,	fc_no        	INT             NOT NULL    									COMMENT '댓글 번호'
	,	member_id    	VARCHAR(20)     NOT NULL    									COMMENT '회원 아이디'
	,	rfc_content  	VARCHAR(300)    NOT NULL    									COMMENT '댓글 내용'
	,	rfc_c_date   	DATETIME        NOT NULL    									COMMENT '생성일'
	,	rfc_u_date   	DATETIME        NOT NULL    									COMMENT '수정일'
	,	rfc_d_date   	DATETIME        	        									COMMENT '삭제일'
);

ALTER TABLE re_free_comment COMMENT '자유 게시판 답글';

ALTER TABLE re_free_comment ADD CONSTRAINT FK_re_free_comment_fc_no_free_comment_fc_no FOREIGN KEY (fc_no)
			REFERENCES free_comment (fc_no) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE re_free_comment ADD CONSTRAINT FK_re_free_comment_member_id_member_member_id FOREIGN KEY (member_id)
			REFERENCES member (member_id) ON DELETE CASCADE ON UPDATE CASCADE;
*/


-- Star_Bulletin Table Create SQL
CREATE TABLE star_bulletin (
		sb_no			INT             NOT NULL	PRIMARY KEY		AUTO_INCREMENT		COMMENT '게시글 번호'
	,	sb_title		VARCHAR(50)     NOT NULL    									COMMENT '게시글 제목'
	,	store_code		VARCHAR(20)     NOT NULL    									COMMENT '가게 코드'
	,	member_id		VARCHAR(20)     	        									COMMENT '회원 아이디'
	,	sb_score		INT             NOT NULL    									COMMENT '평점'
	,	sb_content  	TEXT            NOT NULL    									COMMENT '게시글 내용'
	,	sb_image    	VARCHAR(1000)   		    									COMMENT '첨부파일'
	,	sb_count    	INT             NOT NULL	DEFAULT 0							COMMENT '게시글 조회수'
	,	sb_c_date   	DATETIME        NOT NULL    									COMMENT '생성일'
	,	sb_u_date   	DATETIME        NOT NULL	   									COMMENT '수정일'
	,	sb_d_date   	DATETIME        	        									COMMENT '삭제일'
);

ALTER TABLE star_bulletin COMMENT '가게 평가 게시판';

ALTER TABLE star_bulletin ADD CONSTRAINT FK_star_bulletin_store_code_store_store_code FOREIGN KEY (store_code)
			REFERENCES store (store_code) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE star_bulletin ADD CONSTRAINT FK_star_bulletin_member_id_member_member_id FOREIGN KEY (member_id)
			REFERENCES member (member_id) ON DELETE CASCADE ON UPDATE CASCADE;



-- Star_Comment Table Create SQL
CREATE TABLE star_comment (
		sc_no       	INT             NOT NULL	PRIMARY KEY		AUTO_INCREMENT		COMMENT '댓글 번호'
	,	sb_no       	INT             NOT NULL    									COMMENT '게시글 번호'
	,	member_id  		VARCHAR(20)     NOT NULL    									COMMENT '사업자 아이디'
	,	sc_content  	VARCHAR(300)    NOT NULL    									COMMENT '댓글 내용'
	,	sc_c_date   	DATETIME        NOT NULL    									COMMENT '생성일'
	,	sc_u_date   	DATETIME        NOT NULL    									COMMENT '수정일'
	,	sc_d_date   	DATETIME        	        									COMMENT '삭제일'
);

ALTER TABLE star_comment COMMENT '가게 평가 게시판 댓글';

ALTER TABLE star_comment ADD CONSTRAINT FK_star_comment_sb_no_star_bulletin_sb_no FOREIGN KEY (sb_no)
			REFERENCES star_bulletin (sb_no) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE star_comment ADD CONSTRAINT FK_star_comment_member_id_partner_member_id FOREIGN KEY (member_id)
			REFERENCES partner (member_id) ON DELETE CASCADE ON UPDATE CASCADE;
            
            

-- MQ_Bulletin Table Create SQL
CREATE TABLE mq_bulletin (
		mqb_no       	INT            	NOT NULL	PRIMARY KEY		AUTO_INCREMENT		COMMENT '게시글 번호'
	,	mqb_title    	VARCHAR(50)    	NOT NULL    									COMMENT '게시글 제목'
	,	member_id    	VARCHAR(20)    	NOT NULL    									COMMENT '회원 아이디'
	,	mqb_content  	TEXT           	NOT NULL    									COMMENT '게시글 내용'
    ,	mqb_image		VARCHAR(1000)													COMMENT '첨부파일'
	,	mqb_count    	INT            	NOT NULL	DEFAULT 0							COMMENT '게시글 조회수'
	,	mqb_c_date   	DATETIME       	NOT NULL    									COMMENT '생성일'
	,	mqb_u_date   	DATETIME       	NOT NULL    									COMMENT '수정일'
	,	mqb_d_date   	DATETIME       		        									COMMENT '삭제일'
);

ALTER TABLE mq_bulletin COMMENT '사용자 질문 게시판';

ALTER TABLE mq_bulletin ADD CONSTRAINT FK_mq_bulletin_member_id_member_member_id FOREIGN KEY (member_id)
			REFERENCES member (member_id) ON DELETE CASCADE ON UPDATE CASCADE;



-- PQ_Bulletin Table Create SQL
CREATE TABLE pq_bulletin (
		pqb_no       	INT            	NOT NULL	PRIMARY KEY		AUTO_INCREMENT		COMMENT '게시글 번호'
	,	pqb_title    	VARCHAR(50)    	NOT NULL    									COMMENT '게시글 제목'
	,	member_id   	VARCHAR(20)    	NOT NULL    									COMMENT '사업자 아이디'
	,	pqb_content  	TEXT           	NOT NULL    									COMMENT '게시글 내용'
    ,	pqb_image		VARCHAR(1000)													COMMENT '첨부파일'
	,	pqb_count    	INT            	NOT NULL	DEFAULT 0							COMMENT '게시글 조회수'
	,	pqb_c_date   	DATETIME       	NOT NULL    									COMMENT '생성일'
	,	pqb_u_date   	DATETIME       	NOT NULL    									COMMENT '수정일'
	,	pqb_d_date   	DATETIME       		        									COMMENT '삭제일' 
);

ALTER TABLE pq_bulletin COMMENT '사업자 질문 게시판';

ALTER TABLE pq_bulletin ADD CONSTRAINT FK_pq_bulletin_member_id_partner_member_id FOREIGN KEY (member_id)
			REFERENCES partner (member_id) ON DELETE CASCADE ON UPDATE CASCADE;



-- MA_Bulletin Table Create SQL
CREATE TABLE ma_bulletin (
		mqb_no       	INT            	NOT NULL    									COMMENT '질문 게시글 번호'
	,	mab_no       	INT            	NOT NULL	PRIMARY KEY		AUTO_INCREMENT 		COMMENT '게시글 번호'
	,	mab_title    	VARCHAR(50)    	NOT NULL    									COMMENT '게시글 제목'
	,	admin_id     	VARCHAR(20)    	NOT NULL    									COMMENT '관리자 아이디'
	,	mab_content  	TEXT           	NOT NULL    									COMMENT '게시글 내용'
    ,	mab_image		VARCHAR(1000)													COMMENT '첨부파일'
	,	mab_count    	INT            	NOT NULL	DEFAULT 0							COMMENT '게시글 조회수'
	,	mab_c_date   	DATETIME       	NOT NULL    									COMMENT '생성일'
	,	mab_u_date   	DATETIME       	NOT NULL										COMMENT '수정일'
	,	mab_d_date   	DATETIME       	        										COMMENT '삭제일'
);

ALTER TABLE ma_bulletin COMMENT '사용자 답변 게시판';

ALTER TABLE ma_bulletin ADD CONSTRAINT FK_ma_bulletin_mqb_no_mq_bulletin_mqb_no FOREIGN KEY (mqb_no)
 REFERENCES mq_bulletin (mqb_no) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE ma_bulletin ADD CONSTRAINT FK_ma_bulletin_admin_id_administrator_admin_id FOREIGN KEY (admin_id)
 REFERENCES administrator (admin_id) ON DELETE CASCADE ON UPDATE CASCADE;



-- PA_Bulletin Table Create SQL
CREATE TABLE pa_bulletin (
		pqb_no       	INT            	NOT NULL										COMMENT '질문 게시글 번호'
	,	pab_no       	INT            	NOT NULL    PRIMARY KEY		AUTO_INCREMENT		COMMENT '게시글 번호'
	,	pab_title    	VARCHAR(50)    	NOT NULL    									COMMENT '게시글 제목'
	,	admin_id     	VARCHAR(20)    	NOT NULL    									COMMENT '관리자 아이디'
	,	pab_content  	TEXT           	NOT NULL    									COMMENT '게시글 내용'
    ,	pab_image		VARCHAR(1000)													COMMENT '첨부파일'
	,	pab_count    	INT            	NOT NULL	DEFAULT 0							COMMENT '게시글 조회수'
	,	pab_c_date   	DATETIME       	NOT NULL    									COMMENT '생성일'
	,	pab_u_date   	DATETIME       	NOT NULL    									COMMENT '수정일'
	,	pab_d_date   	DATETIME       		        									COMMENT '삭제일'
);

ALTER TABLE pa_bulletin COMMENT '사업자 답변 게시판';

ALTER TABLE pa_bulletin ADD CONSTRAINT FK_pa_bulletin_pqb_no_pq_bulletin_pqb_no FOREIGN KEY (pqb_no)
			REFERENCES pq_bulletin (pqb_no) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE pa_bulletin ADD CONSTRAINT FK_pa_bulletin_admin_id_administrator_admin_id FOREIGN KEY (admin_id)
			REFERENCES administrator (admin_id) ON DELETE CASCADE ON UPDATE CASCADE;



-- Chat Table Create SQL
CREATE TABLE chat (
		chat_no			INT             NOT NULL    PRIMARY KEY		AUTO_INCREMENT 		COMMENT '채팅 번호'
	,	admin_id     	VARCHAR(20)     NOT NULL    									COMMENT '관리자 아이디'
	,	member_id    	VARCHAR(20)     NOT NULL    									COMMENT '회원 아이디'
	,	chat_s_time  	DATETIME        NOT NULL    									COMMENT '채팅 시작일'
	,	chat_e_time  	DATETIME        	        									COMMENT '채팅 종료일'
	,	chat_log     	VARCHAR(300)    		    									COMMENT '채팅 로그'
);

ALTER TABLE chat COMMENT '채팅';

ALTER TABLE chat ADD CONSTRAINT FK_chat_admin_id_administrator_admin_id FOREIGN KEY (admin_id)
			REFERENCES administrator (admin_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE chat ADD CONSTRAINT FK_chat_member_id_member_member_id FOREIGN KEY (member_id)
			REFERENCES member (member_id) ON DELETE CASCADE ON UPDATE CASCADE;




