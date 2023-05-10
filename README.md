# 파이널 프로젝트 : Sim-s 알뜰폰 요금제 사이트 <img width="60" alt="image" src="https://noticon-static.tammolo.com/dgggcrkxq/image/upload/v1660020225/noticon/hzshsydhgjwuw3j1ryzi.png">

## Contents <img width="50" src="https://noticon-static.tammolo.com/dgggcrkxq/image/upload/v1577544307/noticon/a7cmr2ibsfyuwcydpvny.png">
1. 팀 소개
2. 프로젝트 개요
3. 설계의 주안점
4. 개발환경
5. 주요기능
6. Document

<br>

## 1️⃣ 팀 소개
<p align="center"><img width="300" src="https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/54164292/e64afc8a-6c50-4c0e-9fe2-6e6e7deee122"></p>

`김민성`


## 2️⃣ 프로젝트 개요

    개발배경
    
<p align="center"><img width="300" src="https://img.hankyung.com/photo/202107/AD.26948272.1.jpg">&nbsp; &nbsp;<img width="450" height="300" src="https://image.kmib.co.kr/online_image/2023/0115/2023011516035982408_1673766239_0017866684.jpg"></p>

✔️ 알뜰폰의 가입자수와 이동통신 시장 점유율이 높아지면서 소비자의 알뜰폰 요금제 관심사 또한 높아짐.

✔️ 수요에 따른 알뜰폰 요금제 상품 공급량이 증가.

✔️ 이에 따라 소비자는 수많은 요금제들 중에서 본인에게 적합한 요금제를 선택해야하는 문제에 직면함. 


    프로젝트 목표
    
✔️ 가격, 데이터 용량 등 사용자의 취향에 맞는 적합한 요금제를 추천하는 주요 기능 구현.

✔️ 통신사와 관리자 입장에서 사이트 이용방식을 파악함.

✔️ 사용자의 요금제 관련 정보 습득과 편의를 고려한 기능 구현

## 3️⃣ 설계의 주안점

    벤치마킹 사이트
 
모요 사이트 (https://www.moyoplan.com/)


    주안점
    
✔️ 벤치마킹 사이트를 참고하여 사용자의 편의를 생각한 UI 직접 구현

✔️ 알뜰폰 요금제 open api를 이용하여 데이터 확보/맞춤 요금제 추천 기능 구현 

✔️ Spring MVC를 통한 게시판 구성

✔️ 벤치마킹 사이트에서 확인할 수 없었던 통신사/관리자 입장에서의 유효한 기능 구현

✔️ 스프링 시큐리티를 이용한 로그인으로 유저 인증과 권한 감사, 비밀번호 암호화, 보안성 강화

✔️ Lombok을 이용하여 어노테이션 설정으로 간단하게 vo의 메소드를 생성, 작성 코드 단순화

✔️ AJAX를 통해 비동기 처리 구현

     목표 기능 
     
🙍‍♀️ 사용자
+ 요금제 조회
+ 맞춤 요금제 조회
+ 통신사 리뷰
+ 문의 게시판
+ 요금제 가입 신청
+ 최근 본 요금제
+ 찜하기

📱 통신사
+ 자사 요금제 관리
+ 요금제 가입 신청 관리
+ 자사 리뷰 관리
+ 챗봇 운영
+ 요금제 이용 통계 조회

👨‍🏭 관리자
+ 대시보드
+ 회원 관리
+ 문의,리뷰,신고 내역관리
+ 사이트 이용, 요금제 총괄 통계 조회
+ 자주 묻는 질문 관리 

## 4️⃣ 개발환경
|  분류      |                     개발환경                                     |
| --------   | ----------------------------------------------------------------|
| `OS`       |        Window 10(x64), macOS                                        |
| `IDE`      |  Spring Tools Suite3, SQL Developer, DBeaver, Visual Studio Code |
| `BackEnd`  |   Java(JDK 11), Servlet(4.0.1), Spring(5.3.19), MyBatis(3.5.6) | 
| `FrontEnd` | HTML5, CSS3, JavaScript, JQuery(3.6.3)                         |
| `WAS`      | Apache-tomcat 9.0                                              |
| `DataBase`  | Oracle DataBase 21c Express Edition RELEASE 21.0.0.0.0         |
| `CI`       | Git(GitHub Desktop)                                            |
| `Web browser` | Chrome                                                      |
| `Document` | ERDCloud, StarUML, Google Drive                                |
| `Library & Framework` |  ojcbc8(21.1.0),lombok(1.18.26), log4j(1.16), gson(2.8.9),json(20160810), jackson(2.13.2.2),commons-fileupload(1.4), commons-io(2.6), slf4j(1.6.6),aspectJ(1.6.10), security(4.2.1.RELEASE),Bootstrap(5.2.3), DateRangePicker , Chart.js, Google chart                    |
| `API`      |  과학기술정보통신부 우정사업본부_우체국알뜰폰 요금제 조회 서비스, 카카오톡 로그인, 카카오톡 push 알림, 카카오톡 공유, 다음 우편번호 서비스, 채널톡, 누리고, CKEditor                                                        |


## 5️⃣ 주요기능

### 1. 메인페이지

![main-page](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/54164292/64820d1f-da24-4d97-b59d-5dfe24e28264)

### 2. 사용자 맞춤형 요금제 찾기

![find-customPlan](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/54164292/5096b025-b9a3-45ed-b103-9fa1ea6d5d25)

## 6️⃣ Document

<br>

###  1. 개발 일정

![파이널일정](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/39897996/5884c88c-22d0-44d6-b73a-d7e4d4b1fbfe)

[개발 일정](https://docs.google.com/spreadsheets/d/1lzwMWUxGIPIKWTNiMaEKy476FF1IoE7DxSgG2XCRy0I/edit?usp=share_link)

<br>

### 2. 요구사항 정의서

[요구사항 정의서](https://docs.google.com/spreadsheets/d/1zpxNKCAAbaDkjvBq_QaCtq5PRXOaC3a94BBmZ-sLCoA/edit?usp=share_link)

<br>

### 3. 화면설계서

[화면 설계서](https://docs.google.com/presentation/d/14XjLgfpgOTimMjqLh9ypzOsEaiUIjZgHz0ETE-nXkoU/edit?usp=share_link)

<br>

### 4. 유스케이스
![sims 유스케이스 다이어그램](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/108276943/58a6a69f-c5bd-49df-8ba0-7b8dc925776f)


<br>

### 5. ERD

![erd](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/39897996/699cf502-2929-4802-a517-21be0c933483)

<br>

### 6. Sequence Diagram

![요금제검색_Sequence](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/39897996/c4f86fd2-b246-4bae-84d2-c6235d66a879)

<br>

![요금제신청_Sequence](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/39897996/568e8b3b-3204-4506-a70f-6f54cc2460ca)

<br>

### 7. Class Diagram


<br>


### 8. 플로우 차트


<br>


### 9. history

[history 전체보기](https://docs.google.com/spreadsheets/d/1kZ3R5gv2rakgyw1BX-JixVKzIxx89I8O9IaOMMycSPo/edit?usp=share_link)

<br>
