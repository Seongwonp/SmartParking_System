CREATE TABLE discountPolicy (
                                discountId INT AUTO_INCREMENT PRIMARY KEY,
                                type VARCHAR(50) NOT NULL UNIQUE,
                                description VARCHAR(255),
                                rate INT NOT NULL
);

INSERT INTO discountPolicy (type, description, rate)
VALUES
  ('장애인', '장애인 등록 차량은 주차 요금의 50% 할인', 50),
  ('경차', '경형 차량은 주차 요금의 30% 할인', 30);

INSERT INTO discountPolicy (type, description, rate)
VALUES
    (
        '장애인',
        '감면조건: 행정정보 연동 후 실시간 할인\n필요서류: 없음 (행정정보 조회로 차량확인)\n감면대상:\n - 장애인협회 및 단체차량\n - 상이등급을 받은 국가유공자\n - 장해등급 판정을 받은 5.18 민주유공자\n - 장해등급 판정을 받은 고엽제후유의증 환자\n감면율: 50%',
        50
    ),
    (
        '경차',
        '감면조건: 자동차관리법시행규칙 제2조 별표1에 따른 경형자동차\n필요서류: 없음 (행정정보 조회로 차량확인)\n감면율: 50%',
        50
    );