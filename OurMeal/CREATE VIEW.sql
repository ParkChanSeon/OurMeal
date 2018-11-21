use ourmeal;

DROP VIEW IF EXISTS v_free_bulletin_comment;
DROP VIEW IF EXISTS v_store_info;

/* =================================================================================================================
=================================================== 자유 게시판 조회 ===================================================
===================================================== 18.11.19 =====================================================
================================================================================================================= */
CREATE VIEW v_free_bulletin_comment AS

	SELECT fb.fb_no						-- 자유 게시판 번호
		 , fb.fb_title					-- 자유 게시판 제목
         , fb.member_id					-- 제시판 작성자
         , fb.fb_content				-- 게시판 내용
         , fb.fb_image					-- 게시판 첨부 사진
         , fb.fb_count					-- 게시판 조회수
         , fb.fb_u_date					-- 게시판 수정일
         , COUNT(fc.fc_no) AS cnt		-- 댓글 수
      FROM free_bulletin	fb
      LEFT
      JOIN free_comment		fc
        ON fb.fb_no = fc.fb_no
	 WHERE fb.fb_d_date IS NULL
       AND fc.fc_d_date IS NULL
	 GROUP
	    BY fb.fb_no;
        
/* =================================================================================================================
==================================================== 가게 정보 조회 ===================================================
===================================================== 18.11.20 =====================================================
================================================================================================================= */
CREATE VIEW v_store_info AS

 SELECT ST.store_code					-- 가게 코드
	  , ST.store_title					-- 가게 명
      , ST.member_id	AS partner_id	-- 사업자 아이디
      , ST.loc_code						-- 지역 코드
      , LC.loc_sido						-- 시도 명
      , LC.loc_googun					-- 구군 명
      , LC.loc_dong						-- 동 명
      , ST.store_address				-- 가게 상세 주소
      , ST.store_tel					-- 가게 연락처
      , ST.store_info					-- 가게 소개
      , ST.store_image					-- 가게 사진
      , ST.store_type					-- 가게 구분
      , ST.store_parking				-- 주차 여부
      , ST.store_o_time					-- 영업 시간
      , ST.store_b_time					-- 쉬는 시간
      , ST.store_website				-- 가게 홈페이지
      , SBC.cnt							-- 평가 게시글 수
      , ST.store_c_date					-- 가게 생성일
      , ST.store_u_date					-- 가게 수정일
      , SB.sb_no						-- 평가 게시글 번호	
      , SB.sb_title						-- 평가 게시글 제목
      , SB.member_id					-- 게시글 작성자
      , SB.sb_score						-- 평가 점수
      , SB.sb_content					-- 게시글 내용
      , SB.sb_image						-- 게시글 첨부 사진
      , SB.sb_c_date					-- 게시글 생성일
      , SB.sb_u_date					-- 게시글 수정일
      , SC.sc_content					-- 게시글 답변 내용
      , SC.sc_c_date					-- 게시글 답변 생성일
      , SC.sc_u_date					-- 게시글 답변 수정일
   FROM store			ST
   LEFT
   JOIN star_bulletin	SB
     ON ST.store_code = SB.store_code
   LEFT
   JOIN star_comment	SC
     ON SB.sb_no = SC.sb_no
	AND ST.member_id = SC.member_id 
   LEFT
   JOIN location		LC
     ON ST.loc_code = LC.loc_code
   LEFT
   JOIN ( SELECT store_code
               , COUNT(*) AS cnt
			FROM star_bulletin
		   WHERE sb_d_date IS NULL
           GROUP BY store_code ) SBC
     ON ST.store_code = SBC.store_code
  WHERE ST.store_d_date IS NULL
    AND SB.sb_d_date IS NULL
    AND SC.sc_d_date IS NULL;