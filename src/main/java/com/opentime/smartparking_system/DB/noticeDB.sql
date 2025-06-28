CREATE TABLE notice (
                        noticeId INT AUTO_INCREMENT PRIMARY KEY,
                        title VARCHAR(255) NOT NULL,
                        content TEXT NOT NULL,
                        writer VARCHAR(50) NOT NULL,
                        view INT DEFAULT 0,
                        createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
                        updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO notice (title, content, writer, view, createdAt, updatedAt)
VALUES
    ('주차장 정기점검 안내', '스마트파킹 시스템 점검으로 7월 5일(금) 00:00 ~ 06:00 동안 주차장 이용이 제한됩니다.', '관리자', 15, NOW(), NOW()),

    ('무인정산기 결제 오류 복구 안내', '무인정산기에서 카드 결제가 되지 않았던 문제가 복구되었습니다. 이용에 불편을 드려 죄송합니다.', '관리자', 8, NOW(), NOW()),

    ('친환경차 할인 혜택 안내', '전기차, 수소차 등 친환경 차량은 주차요금 50% 감면 혜택이 적용됩니다. 자세한 내용은 할인정보 메뉴를 참고해주세요.', '운영팀', 25, NOW(), NOW()),

    ('설 연휴 주차장 운영시간 안내', '설 연휴 기간 주차장 운영시간은 정상 운영됩니다. 이용에 참고 부탁드립니다.', '운영팀', 30, NOW(), NOW()),

    ('스마트파킹 앱 업데이트 안내', '스마트파킹 앱이 새롭게 업데이트 되었습니다. 더 편리해진 기능을 이용해보세요!', '홍길동', 12, NOW(), NOW());
