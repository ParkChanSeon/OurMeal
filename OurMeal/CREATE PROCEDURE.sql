USE ourmeal;



DROP PROCEDURE IF EXISTS p_save_health;
DROP PROCEDURE IF EXISTS p_save_store;
DROP PROCEDURE IF EXISTS p_save_fc_comment;
DROP PROCEDURE IF EXISTS p_string_split;
DROP PROCEDURE IF EXISTS p_re_col_val;
DROP PROCEDURE IF EXISTS p_syn_search;
DROP PROCEDURE IF EXISTS p_search_store;

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
                              , IN S_Info		TEXT		 	-- 가게 설명
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

/* =================================================================================================================
============================================ 테이블 하나의 컬럼 값 텍스트로 반환 ============================================
===================================================== 18.11.26 =====================================================
================================================================================================================= */
DELIMITER $$
CREATE PROCEDURE p_re_col_val ( IN as_table		VARCHAR(100) 
							  , IN as_column	VARCHAR(100)
                              , IN as_delimiter CHAR(1)
                              , OUT RTN_VAL		TEXT )
BEGIN
    
    DECLARE CNT_MAX		INT;
    DECLARE CNT_I		INT	DEFAULT 1;
    DECLARE INTO_VAL	TEXT;
    
    
    DROP TEMPORARY TABLE IF EXISTS tmpColumn;
    CREATE TEMPORARY TABLE tmpColumn( seq INT, attribute	VARCHAR(100) );
    
    
	SET @s = 'INSERT INTO tmpColumn ';
    SET @a = CONCAT('SELECT @num:=@num+1 as seq, ', as_column);
    SET @b = CONCAT('  FROM ( SELECT @num:=0 ) a');
    SET @c = CONCAT('	  , ', as_table, ' b');
    
	SET @stmt = CONCAT(@s, @a, @b, @c);
    
    PREPARE stmt FROM @stmt;
    EXECUTE stmt;
    
    
    SELECT COUNT(*) INTO CNT_MAX
      FROM tmpColumn;
    
    WHILE CNT_I <= CNT_MAX DO
		
        SELECT attribute INTO INTO_VAL
          FROM tmpColumn
		 WHERE seq = CNT_I;
        
        
        IF IFNULL(RTN_VAL, '') = '' THEN
			SET RTN_VAL = INTO_VAL;
        ELSE
			SET RTN_VAL = CONCAT(RTN_VAL, as_delimiter, INTO_VAL);
		END IF;
        
		SET CNT_I = CNT_I + 1;
        
    END WHILE;
    
END $$

DELIMITER ;

/* =================================================================================================================
================================================== 종합 조회 프로시저 ==================================================
===================================================== 18.11.29 =====================================================
================================================================================================================= */

DELIMITER $$
CREATE PROCEDURE p_syn_search ( IN keyWord		TEXT	-- 조회 입력 값
							  , IN A_allergy	TEXT )	-- 알러지 필터

LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL

COMMENT '종합 조회 프로시저'

BEGIN
    
	DECLARE D_KeyWord		LONGTEXT		DEFAULT '';		-- 조회 입력 값 변수
    DECLARE D_Tmp_Amount	INT				DEFAULT 0;		-- 문자열 분리 값 수량
    DECLARE D_Count			INT				DEFAULT 0;		-- 카운터
    DECLARE D_AND_KEY		VARCHAR(4096)	DEFAULT '%';	-- 모두 포함한 검색 값 저장 변수
    -- DECLARE D_MINUS_KEY		VARCHAR(4096)	DEFAULT '';		-- 제외 검색 값 저장 변수
    DECLARE D_ALLERGY_KEY	VARCHAR(4096)	DEFAULT '0';	-- 알러지 필터 저장 변수
    
    
    SET D_KeyWord = LOWER(f_string_trim(keyWord));		-- 변수에 조회 입력 값 저장
	SET D_ALLERGY_KEY = f_string_trim(A_allergy);


    DELETE FROM search_index;
    
    -- 조회 필터 테이블에 기본 식당 및 음식정보 입력
	INSERT INTO search_index
	SELECT ST.store_code
		 , ST.store_title
		 , ST.member_id
		 , MB.member_name
         , SB.score_avg
		 , ST.loc_code
		 , ST.store_address
		 , ST.store_tel
		 , ST.store_info
		 , ST.store_image
		 , ST.store_type
		 , ST.store_u_date
		 , FM.fm_code
		 , FM.fm_name
		 , FM.fm_info
		 , FM.fm_allergy
	  FROM store			ST
      LEFT
	  JOIN food_menu		FM
		ON ST.store_code = FM.store_code
	  LEFT
	  JOIN member			MB
		ON MB.member_id = ST.member_id
	  LEFT
      JOIN ( SELECT store_code
				  , ROUND(AVG(sb_score), 1) AS score_avg
               FROM star_bulletin
			  WHERE sb_d_date IS NULL
			  GROUP BY store_code ) SB
        ON ST.store_code = SB.store_code
	 WHERE store_d_date IS NULL;
    
    
    DELETE FROM AND_TABLE;
    DELETE FROM MINUS_TABLE;
    DELETE FROM ALLERGY_TABLE;
    
    
    -- 알러지 필터
	IF IFNULL(D_ALLERGY_KEY, '') != '' THEN
	
		CALL p_string_split(REPLACE(D_ALLERGY_KEY, ' ', ''), ',');		-- 알러지 구분
	
		INSERT INTO ALLERGY_TABLE SELECT Content FROM tmpContents;
	
		CALL p_re_col_val('ALLERGY_TABLE', 'Content', '|', D_ALLERGY_KEY);
	
	ELSE
    
		SET D_ALLERGY_KEY = '0';
	
	END IF;
    
    
    -- 검색어가 있을 경우
    IF LENGTH(keyWord) >= 1 THEN
    
		-- 검색 필터 적용
		IF INSTR( D_KeyWord, ' and ' ) != 0 THEN		-- keyword 'and' keyword 입력 시
		
			CALL p_string_split( '%' + REPLACE(SUBSTRING_INDEX(D_KeyWord, ' -', 1), ' ', '%'), ' and ' );		-- 각 키워드 모두를 포함한 검색 결과를 보여준다.
		
			INSERT INTO AND_TABLE SELECT Content FROM tmpContents;
			
			CALL p_re_col_val('AND_TABLE', 'Content', ' ', D_AND_KEY);
		/*
		ELSEIF INSTR( D_KeyWord, ' -' ) != 0 THEN

			CALL p_string_split( SUBSTRING(D_KeyWord, INSTR(D_KeyWord, ' -') + 2, LENGTH(D_KeyWord)), ' -' ); -- 키워드를 포함하지 않는 검색 결과를 보여준다.
				
			INSERT INTO MINUS_TABLE SELECT Content FROM tmpContents;
				
			CALL p_re_col_val('MINUS_TABLE', 'Content', ' ', D_MINUS_KEY);
		*/
		END IF; 

		-- 조회
		SELECT store_code
			 , MAX(store_title) AS store_title
			 , MAX(member_id) AS member_id
			 , MAX(member_name) AS member_name
             , MAX(score_avg) AS score_avg
			 , MAX(loc_code) AS loc_code
			 , MAX(store_address) AS store_address
			 , MAX(store_tel) AS store_tel
			 , MAX(store_info) AS store_info
			 , MAX(store_image) AS store_image
			 , MAX(store_type) AS store_type
			 , MAX(store_u_date) AS store_u_date
			 , MAX(MATCH(store_title, store_info, fm_name, fm_info, store_address) AGAINST( D_KeyWord IN BOOLEAN MODE ) )AS score
		  FROM search_index
		 WHERE MATCH(store_title, store_info, fm_name, fm_info, store_address) AGAINST( D_KeyWord IN BOOLEAN MODE )
		--   AND NOT MATCH(store_title, store_info, fm_name, fm_info) AGAINST( D_MINUS_KEY )
		   AND ( store_title LIKE (D_AND_KEY)
			  OR store_info LIKE (D_AND_KEY)
			  OR fm_name LIKE (D_AND_KEY)
			  OR fm_info LIKE (D_AND_KEY)
              OR store_address LIKE (D_AND_KEY) )
		   AND IFNULL(fm_allergy, '') NOT REGEXP ( D_ALLERGY_KEY )
		 GROUP BY store_code
		 ORDER BY score DESC;
    
    ELSE
    
		-- 조회
		SELECT store_code
			 , MAX(store_title) AS store_title
			 , MAX(member_id) AS member_id
			 , MAX(member_name) AS member_name
             , MAX(score_avg) AS score_avg
			 , MAX(loc_code) AS loc_code
			 , MAX(store_address) AS store_address
			 , MAX(store_tel) AS store_tel
			 , MAX(store_info) AS store_info
			 , MAX(store_image) AS store_image
			 , MAX(store_type) AS store_type
			 , MAX(store_u_date) AS store_u_date
			 , 0 AS score
		  FROM search_index
		 WHERE IFNULL(fm_allergy, '') NOT REGEXP ( D_ALLERGY_KEY )
		 GROUP BY store_code;
         
    END IF;
    
END $$

DELIMITER ;


/* =================================================================================================================
================================================== 가게 조회 프로시저 ==================================================
===================================================== 18.12.17 =====================================================
================================================================================================================= */

DELIMITER $$
CREATE PROCEDURE p_search_store ( IN S_Type		VARCHAR(10) 	-- 조회 타입 [ SCORE = 평균 평가 점수 | BULLETIN = 댓글 수 | NEWEST = 최근 등록일 | RANDOM = 랜덤 ]
								, IN S_Count	INT			)	-- 최대 조회 수

COMMENT '가게 조회 프로시저'

BEGIN
    
	CASE LOWER(f_string_trim(S_TYPE))
		
        WHEN 'score' THEN
        
			SELECT *
              FROM v_syn_store
			 ORDER BY avg_score DESC LIMIT S_Count;
		
        WHEN 'bulletin' THEN
        
			SELECT *
              FROM v_syn_store
			 ORDER BY cnt_bulletin DESC LIMIT S_Count;
             
		WHEN 'newest' THEN
        
			SELECT *
              FROM v_syn_store
			 ORDER BY store_c_date DESC LIMIT S_Count;
    
		ELSE 
        
			SELECT *
              FROM v_syn_store
			 LIMIT S_Count;
		
	END CASE;
    
END $$

DELIMITER ;