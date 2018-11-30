package com.all.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.all.model.Member;
import com.all.model.Partner;

@Repository
public class PartnerDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private String strNameSpace = "com.jk.model.PartnerMapper";

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 파트너 등록
	public int partnerRegist(Partner partner) {
		return sqlSession.insert(strNameSpace + ".partnerRegist", partner);
	}

	// 사업자로그인
	public Partner partnerLogin(Partner partner) {
		return sqlSession.selectOne(strNameSpace + ".partnerRogin", partner);
	}

	//사업자 로그인 체크
	public Member partnerLoginCheck(Member member) {		
		return sqlSession.selectOne(strNameSpace + ".partner_logincheck", member);
	}

	// 사업자페이지
	public Partner partnerPage(Partner partner) {
		return sqlSession.selectOne(strNameSpace + ".partnerPage", partner);
	}

	// 사업자정보수정
	public int partnerUpdate(Partner partner) {
		return sqlSession.insert(strNameSpace + ".partnerUpdate", partner);
	}

	// 사업자탈퇴
	public int partnerDelete(Partner partner) {
		return sqlSession.delete(strNameSpace + ".partnerDelete", partner);
	}

}
