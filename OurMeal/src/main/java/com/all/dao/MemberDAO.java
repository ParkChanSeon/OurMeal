package com.all.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.all.model.*;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private String strNameSpace = "com.jk.model.MemberMapper";

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	public Member selectById(JoinRequest joinReq) {
		Member member = sqlSession.selectOne(strNameSpace + ".selectById", joinReq);
		return member;
	}
	// 회원가입
	public int memberRegist(JoinRequest joinReq) {
		return sqlSession.insert(strNameSpace + ".memberRegist", joinReq);
	}

	// 회원로그인
	public Member memberLogin(Member member) {		
		return sqlSession.selectOne(strNameSpace + ".logincheck", member);
	}

	//회원 로그인 체크
	public Member memberLoginCheck(Member member) {		
		return sqlSession.selectOne(strNameSpace + ".logincheck", member);
	}
	
	// 마이페이지
	public Member myPage(Member member) {
		return sqlSession.selectOne(strNameSpace + ".myPage", member);
	}
	
	// 회원정보수정
	public int memberUpdate(Member member) {
		return sqlSession.update(strNameSpace + ".memberUpdate", member);
	}

	// 회원탈퇴
	public int memberDelete(Member member) {
		return sqlSession.delete(strNameSpace + ".memberDelete", member);
	}
	
	// 회원 비밀번호 체크
	public Member memberPasswordCheck(Member member) {		
		return sqlSession.selectOne(strNameSpace + ".memberPasswordCheck", member);
	}
	
	// 회원 비밀번호 업데이트
	public int memberPasswordUpdate(Member member) {
		return sqlSession.update(strNameSpace + ".memberPasswordUpdate", member);
	}
	
	//회원 건강정보 등록
	public int memberAddHealth(Health health) {
		return sqlSession.insert(strNameSpace + ".memberAddHealth", health);
	}
	
	//회원 건강정보 조회
	public Health memberSelectHealth(Health health) {		
		return sqlSession.selectOne(strNameSpace + ".memberSelectHealth", health);
	}
	
	//회원 신체 정보 수정
	public Health memberUpdateHealth(Health health) {		
		return sqlSession.selectOne(strNameSpace + ".memberUpdateHealth", health);
	}	
	
	//회원 사진 등록
	public int memberProfileImage(Member member) {
		return sqlSession.insert(strNameSpace+ ".memberProFileImage",member);			
	}
	
	//메인 메뉴 가져오기
	public List<MainView> mainView(String check) {
		List<MainView> mainviewList = sqlSession.selectList(strNameSpace+ ".mainView", check);
		
		/*
		for(int i = 0; i<mainviewList.size(); i++) {
			System.out.println("주소 : " + mainviewList.get(i).getStore_address());
			System.out.println("코드 : " + mainviewList.get(i).getStore_code());
			System.out.println("이미지 주소 : " + mainviewList.get(i).getStore_image());
			System.out.println("가게 이름 : " + mainviewList.get(i).getStore_title());
			System.out.println("평가 점수 : " + mainviewList.get(i).getAvg_score());
		}
		*/
		
		return mainviewList;					
	}
	
	//파트너 신청 여부 확인
	public Partner checkPartner(String id) {
		return sqlSession.selectOne(strNameSpace +".checkPartner", id);		
	}
}
