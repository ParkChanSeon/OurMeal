USE ourmeal;

DROP PROCEDURE IF EXISTS p_save_health;
DROP PROCEDURE IF EXISTS p_save_store;
DROP PROCEDURE IF EXISTS p_save_fc_comment;

/* =================================================================================================================
================================================= 신체 정보 저장 프로시저 ===============================================
===================================================== 18.11.13 =====================================================
================================================================================================================= */
DELIMITER $$
CREATE PROCEDURE p_save_health( IN M_ID 	VARCHAR(20)		-- 회원 아이디
							  , IN H_Height	DECIMAL(4, 1)	-- 회원 키
                              , IN H_Weight	DECIMAL(4, 1))	-- 회원 몸무게
BEGIN

    DECLARE NB1		INT(5);		-- 고유번호 저장 변수1
    DECLARE NB2		CHAR(20);	-- 고유번호 저장 변수2
    DECLARE Age		INT;		-- 회원의 나이 저장 변수
    DECLARE Gender	CHAR(1);	-- 회원의 성별 저장 변수
    DECLARE Basal	INT;		-- 회원의 기초대사량 계산 변수
    
    DECLARE HCOUNT	INT	DEFAULT 0;	-- 회원 신체정보 카운터
    
    /* SQL 예외처리 핸들러 선언 */
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
        SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
	END;
    
    
    /* 오늘 날짜의 신체정보 데이터 카운트 */
    SELECT COUNT(health_no) INTO HCOUNT
      FROM health
	 WHERE SUBSTRING(health_no, 2, 6) = DATE_FORMAT(NOW(), '%y%m%d');
    
    
    IF HCOUNT > 0 THEN
    
		/* 오늘 날짜의 가장 최근의 신체정보 고유번호 변수에 저장 */
		SELECT RIGHT(health_no, 5) + 0 INTO NB1
		  FROM health
		 WHERE SUBSTRING(health_no, 2, 6) = DATE_FORMAT(NOW(), '%y%m%d')
		 ORDER BY health_no DESC LIMIT 1;

		/* 번호 + 1 및 문자로 형변환 */
		SET NB2 = CONVERT(NB1 + 1, CHAR(20));
        
	ELSE
		/* 오늘 날짜의 신체정보 데이터가 없을 경우 1부터 시작 */
        SET NB2 = CONVERT('1', CHAR(20));
    
    END IF;


	/* 5자리가 될 때 까지 앞자리에 '0' 붙여주기 */
	LOOP_NB:LOOP
    
		/* 5자리가 되었을 때 루프문 종료 */
		IF LENGTH(NB2) >= 5 THEN
			SET NB2 = CONCAT(CONCAT('H', CONVERT(DATE_FORMAT(NOW(), '%y%m%d'), CHAR(20))), NB2);
			LEAVE LOOP_NB;
		END IF;
        
        SET NB2 = CONCAT('0', NB2);
        
	END LOOP;
    

	/* 회원의 나이, 성별 변수에 저장 */
	SELECT TRUNCATE((TO_DAYS(now())-(TO_DAYS(member_birth)))/365, 0) + 1 , member_sex INTO Age, Gender
      FROM member
	 WHERE member_id = M_ID;
     

	/* 각 성별에 따른 기초대사량 계산 */
	IF Gender = 'M' THEN	-- 남자
		SET Basal = ROUND(66.47 + (13.75 * H_Weight) + (5 * H_Height) - (6.76 * Age));
        
    ELSE					-- 여자
		SET Basal = ROUND(665.1 + (9.56 * H_Weight) + (1.855 * H_Height) - (4.68 * Age));

	END IF;

	/* 저장 */
	#START TRANSACTION;
    
    INSERT INTO health
    VALUES (
			NB2
		,	M_ID
        ,	H_Height
        ,	H_Weight
		,	Basal
    );

	COMMIT;
    
END $$

DELIMITER ;

/* =================================================================================================================
================================================== 가게 저장 프로시저 ==================================================
===================================================== 18.11.14 =====================================================
================================================================================================================= */
DELIMITER $$
CREATE PROCEDURE p_save_store ( IN S_Title		VARCHAR(50)		-- 가게 명
							  ,	IN P_ID 		VARCHAR(20)		-- 사업자 아이디
                              , IN S_Loc_cd		VARCHAR(20)		-- 지역 코드
                              , IN S_ZipNo		VARCHAR(10)		-- 우편 번호
                              , IN S_RoadAddr1	VARCHAR(100)	-- 도로주소 1
                              ,	IN S_RoadAddr2  VARCHAR(100)	-- 도로주소 2
                              ,	IN S_AddrDetail	VARCHAR(100)	-- 상세 주소
                              , IN S_Address	VARCHAR(300)	-- 가게 주소
                              , IN S_Tel		VARCHAR(20)		-- 가게 연락처
                              , IN S_Info		VARCHAR(500) 	-- 가게 설명
                              , IN S_Image		VARCHAR(300)	-- 가게 사진
                              , IN S_Parking	VARCHAR(30)		-- 가게 주차 여부
                              , IN S_O_Time		VARCHAR(50)		-- 가게 영업 시간
                              , IN S_B_Time		VARCHAR(50)		-- 가게 쉬는 시간
                              , IN S_Website	VARCHAR(50))	-- 가게 웹사이트
BEGIN
    
    DECLARE NB1		INT(5);			-- 고유번호 저장 변수1
    DECLARE NB2		CHAR(20);		-- 고유번호 저장 변수2
    
    DECLARE SCOUNT	INT	DEFAULT 0;	-- 가게 카운터
    
    /* SQL 예외처리 핸들러 선언 */
    /*DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
        SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
	END;*/
    
    
    /* 오늘 날짜의 가게 데이터 카운트 */
    SELECT COUNT(store_code) INTO SCOUNT
      FROM store
	 WHERE SUBSTRING(store_code, 2, 6) = DATE_FORMAT(NOW(), '%y%m%d');
    
    
    IF SCOUNT > 0 THEN
    
		/* 오늘 날짜의 가장 최근의 가게 고유번호 변수에 저장 */
		SELECT RIGHT(store_code, 5) + 0 INTO NB1
		  FROM store
		 WHERE SUBSTRING(store_code, 2, 6) = DATE_FORMAT(NOW(), '%y%m%d')
		 ORDER BY store_code DESC LIMIT 1;

		/* 번호 + 1 및 문자로 형변환 */
		SET NB2 = CONVERT(NB1 + 1, CHAR(20));
        
	ELSE
		/* 오늘 날짜의 가게 데이터가 없을 경우 1부터 시작 */
        SET NB2 = CONVERT('1', CHAR(20));
    
    END IF;
    
    
    /* 5자리가 될 때 까지 앞자리에 '0' 붙여주기 */
	LOOP_NB:LOOP
    
		/* 5자리가 되었을 때 루프문 종료 */
		IF LENGTH(NB2) >= 5 THEN
			SET NB2 = CONCAT(CONCAT('S', CONVERT(DATE_FORMAT(NOW(), '%y%m%d'), CHAR(20))), NB2);
			LEAVE LOOP_NB;
		END IF;
        
        SET NB2 = CONCAT('0', NB2);
        
	END LOOP;
    
    
    /* 저장 */
    INSERT INTO store
    VALUES (
			NB2				
		,	S_Title         
        ,	P_ID        	
        ,	S_Loc_cd
        ,	S_ZipNo
        ,	S_RoadAddr1
        ,	S_RoadAddr2
        ,	S_AddrDetail
        ,	S_Address
		,	S_Tel           
        ,   S_Info          	
        ,   S_Image         	
        ,   NULL
        ,	S_Parking
        ,	S_O_Time
        ,	S_B_Time
        ,	S_Website
        ,	NOW()
        ,	NOW()
        ,	NULL
    );
    
    COMMIT;
    
END $$

DELIMITER ;

/* =================================================================================================================
============================================== 자유게시판 댓글 저장 프로시저 ==============================================
===================================================== 18.11.15 =====================================================
================================================================================================================= */
DELIMITER $$
CREATE PROCEDURE p_save_fc_comment ( IN FC_Prt_No 	INT				-- 상위 댓글
								   , IN FB_No		INT				-- 자유 게시글 번호
								   , IN M_ID		VARCHAR(20)		-- 회원 아이디
								   , IN FC_Comment	VARCHAR(300))  	-- 댓글 내용
                                   
BEGIN
    
    DECLARE Parent_B_Check	INT;	-- 상위 댓글이 있는 경우 상위 댓글과 파라미터 값의 게시글 번호 매칭용 변수
    
    /* SQL 예외처리 핸들러 선언 */
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
        SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
	END;

    /* 상위 댓글이 있는 경우 */
    IF FC_Prt_No IS NOT NULL AND FC_Prt_No != '' THEN
    
		/* 상위 댓글의 게시글 번호 조회 */
		SELECT fb_no INTO Parent_B_Check 
		  FROM free_comment
		 WHERE fc_no = FC_Prt_No
		 LIMIT 1;
    
    ELSE 
		
        SET Parent_B_Check = FB_No;
	
	END IF;
    
    /* 저장 */
	INSERT INTO free_comment
	VALUES (
			NULL     
		,	FC_Prt_No  
		,	Parent_B_Check
		,	M_ID 
		,	FC_Comment
		,	now() 
		,	now() 
		,	null           
	);
    
    COMMIT;
    
END $$

DELIMITER ;

/* =================================================================================================================
================================================== 문자열 분리 프로시저 =================================================
===================================================== 18.11.26 =====================================================
================================================================================================================= */
DELIMITER $$
CREATE PROCEDURE p_string_split ( IN stringIn	LONGTEXT
								, IN splitChar	VARCHAR(64) )

LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL

COMMENT '문자열 분리'

BEGIN
    
	DECLARE mText	LONGTEXT;
    DECLARE mValue  LONGTEXT;
   
	SET max_heap_table_size = 1024 * 1024 * 256;
    
    DROP TEMPORARY TABLE IF EXISTS tmpContents;
    CREATE TEMPORARY TABLE tmpContents ( Content	VARCHAR(4096)	NOT NULL	DEFAULT '' ) ENGINE = MEMORY;
    
    SET mText = LOWER(stringIn);
    
    WHILE IFNULL(mText, '') != '' DO
		
        SET mValue = TRIM(SUBSTRING_INDEX(mText, LOWER(splitChar), 1));
        SET mText = SUBSTRING(mText, CHAR_LENGTH(mValue) + CHAR_LENGTH(splitChar) + 1);
        
        INSERT INTO tmpContents( Content ) VALUES ( mValue );
        
    END WHILE;
    
END $$

DELIMITER ;