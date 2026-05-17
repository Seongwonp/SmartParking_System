# 🅿️ Smart Parking System

<p align="center">
  <img src="./SmartParking.gif" alt="SmartParking Demo" width="900" />
</p>

차량 입출차, 요금 계산, 정기권/할인 정책, 실시간 주차 현황을 통합 관리하는 **웹 기반 주차 운영 시스템**입니다.  
**JSP + Servlet + JDBC** 기반 MVC 구조로 설계했으며, 사용자 키오스크와 관리자 페이지를 분리해 구현했습니다.

---

## 프로젝트 개요

- **프로젝트명**: Smart Parking System
- **개발 인원**: 2명
- **개발 기간**: 2025.06.25 ~ 2025.07.11 (16일)
- **구성**: 사용자 키오스크 + 관리자 웹 대시보드
- **핵심 목표**: 입출차부터 정산/운영까지 주차장 업무 흐름을 하나의 시스템으로 통합

---

## 팀 역할

| 이름 | 담당 |
|------|------|
| **Rachel (Seojeong Yun)** | 풀스택 · 마이페이지 및 사용자 기능 구현 |
| **Seong Won Park** | 풀스택 · 관리자 페이지 및 대시보드 구현 |

---

## 기술 스택

- **Backend**: Java, JSP, Servlet, JDBC
- **Database**: MariaDB
- **Frontend**: HTML, CSS, JavaScript, jQuery
- **Infra/Tools**: Apache Tomcat, IntelliJ IDEA, DBeaver, Git

---
## 아키텍처

JSP/Servlet 기반의 클래식 MVC 패턴으로 계층을 분리했습니다.

- **Controller**: Servlet (요청 라우팅/권한 체크)
- **Service/DAO**: 비즈니스 로직/DB 접근
- **View**: JSP (화면 렌더링)

### Request Flow
`Client → Servlet(Controller) → Service → DAO → DB → JSP(View)`

---

## 주요 기능

### 사용자(User)
- 차량 **입차 등록** (차량번호 입력 → 입차 시각 저장)
- **출차 처리** (출차 시각 기록 + 요금 계산 + 할인 적용)
- **정기권 등록/조회**
- **주차 이력 조회** (마이페이지)
- **공지사항 조회**

### 관리자(Admin)
- **전체 주차 현황 모니터링**
- **장기 주차 차량 알림**
- **공지사항 등록/수정**
- **관리자 대시보드** (차량 목록/상태/운영 정보)

---
## 요금/정책 로직

| 항목 | 정책 |
|------|------|
| 기본 요금 | 1시간 2,000원 |
| 추가 요금 | 30분당 1,000원 |
| 장기 주차 | 24시간 이상 차량 별도 표시 |
| 할인 정책 | 정기권 소지 시 요금 면제 또는 할인 적용 |

---

## 구현 포인트

- 세션 기반 로그인 + 필터(Filter) 권한 분리
- 시간 차 계산 기반 요금 산정 로직 구현
- DAO/유틸 분리로 유지보수 가능한 코드 구조화
- Git 브랜치 전략 기반 협업 워크플로우 적용

---

## 주요 화면

### 초기 화면
![초기 화면](https://github.com/user-attachments/assets/35e12776-98d6-42fc-b91e-ca3230477a77)

### 회원가입
![회원가입](https://github.com/user-attachments/assets/cf0ac3cb-304c-4336-966b-3d2639606b8f)

### 입차 등록
![입차 등록](https://github.com/user-attachments/assets/0a4ca436-40e1-48de-8ccb-8b61293fbf87)

### 주차기록 조회
![주차기록 조회](https://github.com/user-attachments/assets/c7486d6b-491e-445e-bae0-25eb168faab5)

### 멤버십 관리
![멤버십 관리](https://github.com/user-attachments/assets/7b49ac7e-66f6-48ab-a521-84deef274f2e)

---
## 데모 프리뷰

### 홈 화면 → 페이지 이동
![기능 시연 1](https://github.com/user-attachments/assets/b1da4eb3-97eb-4f53-8114-77e0cd778511)

### 로그인 → 마이페이지 이동
![기능 시연 2](https://github.com/user-attachments/assets/06867204-e31a-4f3f-91a5-f86936120e9d)

