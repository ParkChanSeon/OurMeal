USE ourmeal;

INSERT INTO `ourmeal`.`allergy` (`allergy_code`, `allergy_name`) VALUES ('20', '계란');
INSERT INTO `ourmeal`.`allergy` (`allergy_code`, `allergy_name`) VALUES ('21', '우유');
INSERT INTO `ourmeal`.`allergy` (`allergy_code`, `allergy_name`) VALUES ('3', '메밀');
INSERT INTO `ourmeal`.`allergy` (`allergy_code`, `allergy_name`) VALUES ('4', '밀');
INSERT INTO `ourmeal`.`allergy` (`allergy_code`, `allergy_name`) VALUES ('5', '대두');
INSERT INTO `ourmeal`.`allergy` (`allergy_code`, `allergy_name`) VALUES ('6', '견과류');
INSERT INTO `ourmeal`.`allergy` (`allergy_code`, `allergy_name`) VALUES ('7', '복숭아');
INSERT INTO `ourmeal`.`allergy` (`allergy_code`, `allergy_name`) VALUES ('8', '토마토');
INSERT INTO `ourmeal`.`allergy` (`allergy_code`, `allergy_name`) VALUES ('9', '돼지고기');
INSERT INTO `ourmeal`.`allergy` (`allergy_code`, `allergy_name`) VALUES ('10', '쇠고기');
INSERT INTO `ourmeal`.`allergy` (`allergy_code`, `allergy_name`) VALUES ('11', '닭고기');
INSERT INTO `ourmeal`.`allergy` (`allergy_code`, `allergy_name`) VALUES ('12', '고등어');
INSERT INTO `ourmeal`.`allergy` (`allergy_code`, `allergy_name`) VALUES ('13', '새우');
INSERT INTO `ourmeal`.`allergy` (`allergy_code`, `allergy_name`) VALUES ('14', '홍합');
INSERT INTO `ourmeal`.`allergy` (`allergy_code`, `allergy_name`) VALUES ('15', '전복');
INSERT INTO `ourmeal`.`allergy` (`allergy_code`, `allergy_name`) VALUES ('16', '굴');
INSERT INTO `ourmeal`.`allergy` (`allergy_code`, `allergy_name`) VALUES ('17', '조개류');
INSERT INTO `ourmeal`.`allergy` (`allergy_code`, `allergy_name`) VALUES ('18', '게');
INSERT INTO `ourmeal`.`allergy` (`allergy_code`, `allergy_name`) VALUES ('19', '오징어');


-- 관리자
INSERT member VALUES ('admin', '1234', '관리자', 'aa@naver.com', NULL, NULL, '010-0101-0101', '751112', 'M', date_format(now(), '%y%m%d'), NULL, 9, NULL);



INSERT member VALUES ('TEST01', '1234', '가', 'aa@naver.com', NULL, NULL, '010-0101-0101', '751112', 'M', date_format(now(), '%y%m%d'), NULL, 1, NULL);
INSERT member VALUES ('TEST02', '1234', '나', 'bb@naver.com', NULL, NULL, '010-0202-0202', '720829', 'M', date_format(now(), '%y%m%d'), NULL, 1, NULL);
INSERT member VALUES ('TEST03', '1234', '다', 'cc@naver.com', NULL, NULL, '010-0303-0303', '791103', 'M', date_format(now(), '%y%m%d'), NULL, 1, NULL);
INSERT member VALUES ('TEST04', '1234', '라', 'dd@naver.com', NULL, NULL, '010-0404-0404', '910719', 'M', date_format(now(), '%y%m%d'), NULL, 1, NULL);
INSERT member VALUES ('TEST05', '1234', '마', 'ee@naver.com', NULL, NULL, '010-0505-0505', '840101', 'M', date_format(now(), '%y%m%d'), NULL, 1, NULL);
INSERT member VALUES ('TEST06', '1234', '바', 'ff@naver.com', NULL, NULL, '010-0606-0606', '710729', 'M', date_format(now(), '%y%m%d'), NULL, 1, NULL);
INSERT member VALUES ('TEST07', '1234', '사', 'gg@naver.com', NULL, NULL, '010-0707-0707', '900202', 'M', date_format(now(), '%y%m%d'), NULL, 1, NULL);
INSERT member VALUES ('TEST08', '1234', '아', 'hh@naver.com', NULL, NULL, '010-0808-0808', '950325', 'M', date_format(now(), '%y%m%d'), NULL, 1, NULL);
INSERT member VALUES ('TEST09', '1234', '자', 'ii@naver.com', NULL, NULL, '010-0909-0909', '520814', 'M', date_format(now(), '%y%m%d'), NULL, 1, NULL);
INSERT member VALUES ('TEST10', '1234', '차', 'jj@naver.com', NULL, NULL, '010-1010-1010', '900711', 'M', date_format(now(), '%y%m%d'), NULL, 1, NULL);
INSERT member VALUES ('TEST11', '1234', '카', 'kk@naver.com', NULL, NULL, '010-1111-1111', '590418', 'M', date_format(now(), '%y%m%d'), NULL, 1, NULL);
INSERT member VALUES ('TEST12', '1234', '타', 'll@naver.com', NULL, NULL, '010-1212-1212', '560416', 'M', date_format(now(), '%y%m%d'), NULL, 1, NULL);
INSERT member VALUES ('TEST13', '1234', '파', 'mm@naver.com', NULL, NULL, '010-1313-1313', '940819', 'M', date_format(now(), '%y%m%d'), NULL, 1, NULL);
INSERT member VALUES ('TEST14', '1234', '하', 'nn@naver.com', NULL, NULL, '010-1414-1414', '670414', 'M', date_format(now(), '%y%m%d'), NULL, 1, NULL);
INSERT member VALUES ('TEST15', '1234', '야', 'oo@naver.com', NULL, NULL, '010-1515-1515', '590101', 'M', date_format(now(), '%y%m%d'), NULL, 1, NULL);
INSERT member VALUES ('TEST16', '1234', '어', 'pp@naver.com', NULL, NULL, '010-1616-1616', '610830', 'M', date_format(now(), '%y%m%d'), NULL, 1, NULL);
INSERT member VALUES ('TEST17', '1234', '여', 'qq@naver.com', NULL, NULL, '010-1717-1717', '681215', 'M', date_format(now(), '%y%m%d'), NULL, 1, NULL);
INSERT member VALUES ('TEST18', '1234', '오', 'rr@naver.com', NULL, NULL, '010-1818-1818', '861012', 'M', date_format(now(), '%y%m%d'), NULL, 1, NULL);
INSERT member VALUES ('TEST19', '1234', '요', 'ss@naver.com', NULL, NULL, '010-1919-1919', '830116', 'M', date_format(now(), '%y%m%d'), NULL, 1, NULL);
INSERT member VALUES ('TEST20', '1234', '우', 'tt@naver.com', NULL, NULL, '010-2020-2020', '631025', 'M', date_format(now(), '%y%m%d'), NULL, 1, NULL);

INSERT partner VALUES ('TEST01', '389-91-15334', '', '', date_format(now(), '%y%m%d'));
INSERT partner VALUES ('TEST02', '170-35-65892', '', '', date_format(now(), '%y%m%d'));
INSERT partner VALUES ('TEST03', '300-07-23976', '', '', date_format(now(), '%y%m%d'));
INSERT partner VALUES ('TEST04', '387-42-88213', '', '', date_format(now(), '%y%m%d'));
INSERT partner VALUES ('TEST05', '117-98-83863', '', '', date_format(now(), '%y%m%d'));
INSERT partner VALUES ('TEST06', '148-76-83625', '', '', date_format(now(), '%y%m%d'));
INSERT partner VALUES ('TEST07', '336-57-69425', '', '', date_format(now(), '%y%m%d'));
INSERT partner VALUES ('TEST08', '244-27-77480', '', '', date_format(now(), '%y%m%d'));
INSERT partner VALUES ('TEST09', '111-03-11129', '', '', date_format(now(), '%y%m%d'));
INSERT partner VALUES ('TEST10', '308-67-71302', '', '', date_format(now(), '%y%m%d'));
INSERT partner VALUES ('TEST11', '188-69-30885', '', '', date_format(now(), '%y%m%d'));
INSERT partner VALUES ('TEST12', '241-67-08438', '', '', date_format(now(), '%y%m%d'));
INSERT partner VALUES ('TEST13', '171-88-83740', '', '', date_format(now(), '%y%m%d'));
INSERT partner VALUES ('TEST14', '234-69-12575', '', '', date_format(now(), '%y%m%d'));
INSERT partner VALUES ('TEST15', '266-68-83451', '', '', date_format(now(), '%y%m%d'));
INSERT partner VALUES ('TEST16', '169-88-09575', '', '', date_format(now(), '%y%m%d'));
INSERT partner VALUES ('TEST17', '264-90-14700', '', '', date_format(now(), '%y%m%d'));
INSERT partner VALUES ('TEST18', '223-21-81546', '', '', date_format(now(), '%y%m%d'));
INSERT partner VALUES ('TEST19', '200-65-70175', '', '', date_format(now(), '%y%m%d'));
INSERT partner VALUES ('TEST20', '220-66-18383', '', '', date_format(now(), '%y%m%d'));

CALL p_save_store('긴밤천국', 'TEST01', NULL, NULL, NULL, NULL, NULL, '서울시 강서구', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
CALL p_save_store('원할아버지 보쌈', 'TEST02', NULL, NULL, NULL, NULL, NULL, '안양시 관양동', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
CALL p_save_store('뉘예뉘예치킨', 'TEST03', NULL, NULL, NULL, NULL, NULL, '안양시 안양동', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
CALL p_save_store('피자사랑 나라사랑', 'TEST04', NULL, NULL, NULL, NULL, NULL, '서울시 강남구', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
CALL p_save_store('사천성', 'TEST05', NULL, NULL, NULL, NULL, NULL, '부산광역시', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
CALL p_save_store('만리장성', 'TEST06', NULL, NULL, NULL, NULL, NULL, '대구시', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
CALL p_save_store('피자에 땀', 'TEST07', NULL, NULL, NULL, NULL, NULL, '전라남도 무안군', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
CALL p_save_store('맘스 스매싱', 'TEST08', NULL, NULL, NULL, NULL, NULL, '서울시 대포동', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
CALL p_save_store('빨떡', 'TEST09', NULL, NULL, NULL, NULL, NULL, '서울시 반포동', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
CALL p_save_store('열라닭발', 'TEST10', NULL, NULL, NULL, NULL, NULL, '제주도 서귀포시', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
CALL p_save_store('시스터보쌈', 'TEST11', NULL, NULL, NULL, NULL, NULL, '제주도 제주시', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
CALL p_save_store('흥부부대찌개', 'TEST12', NULL, NULL, NULL, NULL, NULL, '서울시 강북구', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
CALL p_save_store('걱정치킨', 'TEST13', NULL, NULL, NULL, NULL, NULL, '나주시', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
CALL p_save_store('너랑통닭', 'TEST14', NULL, NULL, NULL, NULL, NULL, '포항시 남구', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
CALL p_save_store('등킨도나쓰', 'TEST15', NULL, NULL, NULL, NULL, NULL, '포항시 북구', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
CALL p_save_store('투썸 핫플레이스', 'TEST16', NULL, NULL, NULL, NULL, NULL, '울산광역시 중구', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
CALL p_save_store('쿠우쿠우하세요', 'TEST17', NULL, NULL, NULL, NULL, NULL, '울산광역시 울주군', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
CALL p_save_store('마마존스', 'TEST18', NULL, NULL, NULL, NULL, NULL, '경주시 성동동', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
CALL p_save_store('베스킨라빈스21', 'TEST19', NULL, NULL, NULL, NULL, NULL, '전주시 완산구', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
CALL p_save_store('담소', 'TEST20', NULL, NULL, NULL, NULL, NULL, '세종시 대평동', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
