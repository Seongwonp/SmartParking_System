# 🅿️ Smart Parking System

**Smart Parking System**은 차량의 입출차 관리, 요금 계산, 실시간 주차 현황, 정기권 및 할인 정책 등  
다양한 기능을 포함한 **웹 기반 주차장 통합 관리 시스템**입니다.  

**JSP + Servlet + JDBC** 기반의 MVC 구조로 설계되었으며,  
웹 서비스 전체 흐름(로그인 → 이용 → 마이페이지/관리자 대시보드)까지 직접 설계하고 구현했습니다.

<br/>

## 🗓 프로젝트 개요

- 프로젝트명 : Smart Parking System
- 키오스크 개발인원 : 2명
- 프로젝트 기간: 2025.06.25~2025.07.11(16일)

<br />

## 👥 역할 분담

| 이름 | 담당 역할 |
|------|------------|
| Rachel (Seojeong Yun) | 풀스택, 마이페이지 화면 및 기능 구현 |
| Seong Won Park| 풀스택, 관리자 페이지 화면 및 기능 구현 |
<br />

## 🛠️ Tech Stack

- **Language/Backend**: Java, JSP, Servlet, JDBC
- **Database**: MariaDB
- **Frontend**: HTML, CSS, JavaScript, jQuery
- **Tools**: IntelliJ IDEA, Apache Tomcat, DBeaver, Git

<br/>

## 🚩 프로젝트 주요 특징

-  **차량 입출차 관리**: 입차/출차 시간 자동 기록, 요금 계산 로직 구현
-  **요금 계산 + 할인 정책**: 기본 요금, 장기 주차 요금, 정기권 할인 기능 포함
-  **로그인 인증 및 관리자 권한 분리**: 세션 기반 인증, 필터(Filter)로 권한 체크
-  **실시간 주차 현황**: 현재 주차 중인 차량 수, 장기 주차 차량 알림 기능
-  **공지사항, 마이페이지, 관리자 대시보드 등 웹 서비스 전반 구성**
-  **Git 브랜치 전략 및 협업 가이드 정리**: 팀원들과 IntelliJ 기반 협업

<br/>

## ✅ 주요 기능

### 사용자(User)
- **입차 등록**: 차량번호 입력 → 입차 시각 DB 저장
- **출차 처리**: 출차 시각 기록 + 요금 계산 + 할인 적용
- **정기권 등록 및 확인**
- **내 주차 이력 확인 (마이페이지)**
- **공지사항 확인**

### 관리자(Admin)
- **전체 주차 현황 모니터링**
- **장기 주차 차량 알림**
- **공지사항 등록/수정**
- **관리자 대시보드**: 차량 목록, 요금 통계 등

<br/>

## 🧮 요금/정책 로직 예시

| 항목 | 내용 |
|------|------|
| 기본 요금 | 1시간 2,000원 |
| 추가 요금 | 30분당 1,000원 |
| 장기 주차 | 24시간 이상 주차 차량 별도 표시 |
| 할인 정책 | 정기권 소지 시 요금 면제 or 할인 적용 |


## 🧠 프로젝트 회고

- Servlet을 이용한 **클래식한 MVC 웹 아키텍처**를 처음부터 직접 설계하고 구성함으로써 Java 웹 개발의 구조와 흐름을 깊이 이해할 수 있었음
- JDBC를 통해 SQL과 자바 로직을 연결하고, 시간 차 계산 및 상태 출력 등 **백엔드 중심의 핵심 로직 처리** 경험
- 유지보수를 고려하여 **기능별 클래스 분리**, 유틸리티 클래스 구성 등 코드 구조화에 신경 씀

<br/>

## 📸 주요 화면 
### 초기 화면

![Image](https://github.com/user-attachments/assets/35e12776-98d6-42fc-b91e-ca3230477a77)

### 회원가입 화면
<img width="900"  alt="회원가입" src="https://github.com/user-attachments/assets/cf0ac3cb-304c-4336-966b-3d2639606b8f" />

### 입차등록 화면
<img width="900" alt="입차등록" src="https://github.com/user-attachments/assets/0a4ca436-40e1-48de-8ccb-8b61293fbf87" />

### 주차기록 조회 화면
<img width="900" alt="주차기록" src="https://github.com/user-attachments/assets/c7486d6b-491e-445e-bae0-25eb168faab5" />

### 멤버쉽관리 화면
<img width="900"  alt="멤버쉽관리" src="https://github.com/user-attachments/assets/7b49ac7e-66f6-48ab-a521-84deef274f2e" />

<br/>
