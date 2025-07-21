## 🅿️ 스마트 주차장 시스템 웹사이트 개발

| 항목        | 내용                     |
|-------------|--------------------------|
| 주차장 이름 | 스마트주차 반월당점     |
| 총 주차 공간 | 10대                    |
| 운영 시간   | 24시간 운영             |

### 💰 요금 체계

- **기본 요금**
  - 첫 1시간: 2,000원
  - 추가 30분당: 1,000원
  - 일일 최대 요금: 15,000원
- **할인 혜택**
  - 월정액 회원: 월 120,000원 (무제한)
  - 장애인: 50% 할인
  - 경차: 30% 할인

> 모든 요금 및 할인 정책은 **관리자 페이지에서 수정 가능**


## 📢 Git 협업 수칙 (IntelliJ 기준)

> 모든 팀원이 따라야 할 기본 Git 루틴입니다.

### 1) 작업 시작 전 최신 코드 받아오기

- **main 브랜치로 체크아웃**
  - IntelliJ: Git → Branches → `main` → Checkout
- **최신 원격 저장소 내용 Pull**
  - Git → Pull... → origin 선택 → Pull 클릭
- **작업 브랜치 이동**
  - 본인 브랜치로 Checkout 후 작업

> ⚠️ 반드시 `main` 브랜치에서 작업하지 말고, **본인 브랜치에서 작업**하세요!

### 2) 작업 중간중간 Pull

- 다른 팀원이 Push한 내용 반영하여 충돌 방지
- Git → Pull 로 최신화 유지

### 3) 작업 완료 후 Commit & Push

- Git 패널에서 변경된 파일 → Commit → 메시지 작성 후 Push

### 4) PR 생성 및 코드 리뷰

- GitHub 웹에서 본인 브랜치 기준으로 Pull Request 생성
- 리뷰어 `SeongwonP` 지정
- 리뷰 완료 후 main 브랜치에 병합

###  요약

1. `main` 브랜치 Pull
2. 본인 브랜치에서 작업
3. 자주 Pull 받기
4. Commit & Push
5. GitHub PR 생성 및 병합


##  시스템 요구사항

###  시스템 개요

> JSP + Servlet 기반으로 차량 입출차 / 요금 계산 / 주차 현황 등을 관리하는 웹 시스템 구축

---

###  기능적 요구사항

#### 2.1 차량 입차 관리
- 차량 정보 입력: 차량번호, 유형(일반/장애인/경차), 운전자명, 연락처, 정기권 여부
- 입차 시간 자동 기록

#### 2.2 차량 출차 관리
- 차량 검색
- 자동 요금 계산
- 할인 적용 (정기권, 장애인, 경차)
- 출차 시간 저장

#### 2.3 주차 현황 관리
- 실시간 전체/사용중/빈자리 확인
- 차량 검색 (번호/운전자명 등)
- 장시간 주차 차량 알림

#### 2.4 요금 및 할인 정책
- 요금 설정: 시간당 요금 등
- 할인 정책 관리
- 정기권 회원 관리

## ⚙️ 기술 및 아키텍처

###  3계층 구조
- View: JSP
- Controller: Servlet
- Model: JDBC + MySQL

---

## 구현 기능

### 사용자 기능
- 차량 등록 / 조회
- 입차 / 출차 처리
- 주차 상태 확인
- 마이페이지 정보
- 정기권 신청 및 해지

### 관리자 기능
- 회원/차량 관리
- 공지사항 CRUD
- 요금 / 할인 정책 CRUD
- 전체 입출차 이력 관리

---

## 페키지 구조

<details>
<summary><strong>📁 주요 패키지 구조 보기</strong></summary>
  
  ```text
📦 smartparking_system
├── controller/         # 서블릿 계층
│   ├── admin/          # 관리자 기능
│   ├── car/            # 입출차
│   ├── user/           # 사용자
├── dao/                # DB 접근
├── service/            # 비즈니스 로직
├── model/
│   ├── dto/            # DTO
│   └── vo/             # VO
├── filter/             # 로그인/권한 필터
├── util/               # 공통 유틸
├── DB/*.sql            # 테이블 스크립트
└── webapp/
    ├── jsp/            # 뷰 페이지
    ├── resources/      # 이미지/스타일
    └── WEB-INF/web.xml
```
</details>


<details>
<summary><strong>주요 DB 스키마 보기</strong></summary>

### 👤 User
- userId (PK)
- userName (UNIQUE)
- password (암호화)
- isSubscription (월정액 여부)
- role (USER/ADMIN)

### 🚗 Car
- carId (PK)
- userId (FK → User)
- carNumber (UNIQUE)
- carType (일반/경차/장애인)

### 📈 ParkingRecord
- recordId (PK)
- carId (FK → Car)
- entryTime / exitTime
- fee
- isExited (출차 여부)

### 💰 FeePolicy
- baseTime, baseFee
- additionalTime, additionalFee
- dailyMaxFee

### 🎁 DiscountPolicy
- type, rate
- description

### 📰 Notice
- title, content, writer
- viewCount, createdAt, isPinned

### 🧾 Subscription
- carId (FK)
- fee (기본: 120000원)
- startDate / endDate
- subscriptionType: monthly/annual

</details>

## 🔐 인증 및 보안 처리

- `LoginFilter.java`: 비로그인 접근 차단
- `AdminAuthFilter.java`: 관리자 인증 확인
- `UTF8Filter.java`: 한글 인코딩 처리
- `ExceptionHandlingFilter.java`: 전역 예외 처리


## 향후 확장 방향 제안

- Spring MVC / Spring Boot로 구조 마이그레이션
- REST API 분리 → React / Vue 프론트 연동
- 관리자용 대시보드에 통계 시각화 도입
- Firebase / WebSocket 기반 실시간 현황 처리
