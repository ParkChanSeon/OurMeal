use ourmeal;

DROP VIEW IF EXISTS v_free_bulletin_comment;


/* =================================================================================================================
=================================================== 자유 게시판 조회 ===================================================
===================================================== 18.11.19 =====================================================
================================================================================================================= */
CREATE VIEW v_free_bulletin_comment AS
	SELECT fb.fb_no
		 , fb.fb_title
         , fb.member_id
         , fb.fb_content
         , fb.fb_image
         , fb.fb_count
         , fb.fb_u_date
         , COUNT(fc.fc_no) AS cnt
      FROM free_bulletin	fb
      LEFT
      JOIN free_comment		fc
        ON fb.fb_no = fc.fb_no
	 WHERE fb.fb_d_date IS NULL
       AND fc.fc_d_date IS NULL
	 GROUP
	    BY fb.fb_no;