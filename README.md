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
<details>
    <summary>메인페이지</summary>
    
![main-page](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/54164292/64820d1f-da24-4d97-b59d-5dfe24e28264)
    
</details>

진수성 
<details>
<summary><h3>✅ 시큐리티 로그인 및 회원 </h3></summary>
<div markdown="1">
  
<br>
<br>
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
시큐리티 로그인
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">

![login](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/39897996/f04deb30-ed48-4e3e-b34b-76a769dc5ba5)
    
</div>

Spring Security를 활용하여 로그인 기능을 구현, 비밀번호의 경우 bcrpt 암호화를 적용
- security-context.xml 시큐리티 설정
1. jdbc-user-service 에서 로그인 폼에 입력한 내용을 DB와 비교하여 로그인이 된다.
2. 로그인 한 유저의 정보를 가져와서 유저이름과 권한을 저장한다.

![security](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/39897996/08d5a65c-04a2-4e47-a65e-ed8bf66c4db5)
    
---
  
<br> 
<br> 
<br> 
    
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
카카오 로그인
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
    
![kakaoLogin](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/39897996/b640e275-d5cb-4b56-96a6-5a42e4ea96b9)
    
</div>

1. KakaoService에서 토큰값을 받아온다.
2. kakaoService에서 토큰값으로 현재 로그인 한 유저의 정보를 받아온다.
3. kakaoController에서 받은 정보를 데이터베이스와 비교하여 유저 정보가 없으면 회원가입을 하고 해당 정보로 Security Authentication을 생성해 권한을 만들고 로그인한다.
4. kakaoController에서 받은 정보를 와 비교하여 유저 정보가 있으면 해당 정보로 Security Authentication을 생성해 권한을 만들고 로그인한다.

![카카오로그인](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/39897996/28b119a4-ca52-4693-94e7-18563763e198)
![카카오정보](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/39897996/f8f78b92-191e-45d5-961e-c76128fb99dc)
    
---
  
<br> 
<br> 
<br> 
 
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
아이디 찾기
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
  
![findId](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/39897996/10a20ba5-6c2d-4880-99be-b6a35874f71d)
  
</div>

1. 로그인 페이지 하단의 아이디 찾기 클릭
2. 이름, 이메일 인증 후 데이터베이스 조회
3. 해당하는 정보와 일치하는 ID 화면에 출력
4. 휴면계정이라면 휴면풀기 버튼 생성
5. 휴면계정이 아니라면 로그인하기, 비밀번호 찾기 버튼 생성

---
  
<br> 
<br> 
<br> 
 
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
비밀번호 찾기
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
  
![findpw](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/39897996/90810f62-be1b-4d66-87db-3d2e3e154c8f)
  
</div>

1. 로그인 페이지 하단의 비밀번호 찾기 클릭
2. 아이디 이메일 인증 후 데이터베이스 조회
3. 해당하는 정보와 일치하면 비밀번호 재설정
4. 로그인 페이지로 이동
    
---
    
<br> 
<br> 
<br>
 
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
회원가입
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
  
![signup](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/39897996/613e39e4-79e5-476a-90b9-f5203ba9c008)
  
</div>

1. 사용자, 통신사를 선택하면 해당하는 회원가입 폼이 생성
2. 회원가입에 필요한 정보를 모두 적지 않으면 에러 메시지 생성
3. 이메일 인증 버튼을 누르면 해당 이메일로 인증번호를 보내고 입력한 인증번호와 같은지 확인
4. 아이디 중복확인 버튼을 누르면 입력한 아이디를 사용할 수 있는지 데이터베이스와 비교
4-1. 아이디 생성이 가능하다면 '사용 가능한 아이디입니다' 메시지 출력
4-2. 아이디 생성이 불가하다면 '사용 불가능한 아이디입니다' 메시지 출력
5. 비밀번호 정규식 체크를 통해 사용 가능한 비밀번호인지 확인
5-1. 비밀번호와 비밀번호 확인에 입력한 문자열이 동일한지 확인
6. 주민등록번호, 전화번호, 법인등록번호, 사업자등록번호는 정규식을 통해 확인
    
![유효성체크1](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/39897996/d53decb9-e790-4940-be7e-dbe0a3899e48)
    
---

</div>
</details>

<details>
<summary><h3>✅ 마이페이지 </h3></summary>
<div markdown="1">
  
<br>
<br>
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
정보 수정
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">

![myinfo](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/39897996/15775d43-a63d-47db-ba93-937839dc7b60)
    
</div>

1. 비밀번호 확인을 통해 정보 수정 폼 생성
2. 이름과 아이디는 유저 정보로 작성
5. 비밀번호 정규식 체크를 통해 사용 가능한 비밀번호인지 확인
5-1. 비밀번호와 비밀번호 확인에 입력한 문자열이 동일한지 확인
3. 이메일 인증 버튼을 누르면 해당 이메일로 인증번호를 보내고 입력한 인증번호와 같은지 확인
6. 전화번호는 정규식을 통해 확인
7. 정보 변경 후 로그아웃 처리
    
---
  
<br> 
<br> 
<br> 
    
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
리뷰 작성/관리
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
    
![review](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/39897996/d802bd8c-42b1-4536-9e5d-5ce5fac6c43d)
    
</div>

1. 상단 리뷰 작성을 누르면 작성할 수 있는 리뷰 폼 생성
2. 리뷰 작성 버튼을 누르면 글 작성 폼과 별점 선택 폼 생성
2-1. 작성 버튼 누르면 리뷰 저장
3. 상단 작성한 리뷰 누르면 작성된 리뷰 리스트 생성
4. 수정 버튼 누르면 수정 폼으로 변경
4-1. 수정 버튼 누르면 수정한 내용으로 변경
5. 삭제 버튼 누르면 해당 리뷰 삭제
    
---
  
<br> 
<br> 
<br> 
 
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
신청한 요금제
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
  
![order](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/39897996/25e0f622-ee4b-411a-befa-dcdf96d28da7)
  
</div>

1. 상단 신청완료, 승인완료, 승인보류 선택시 해당 요금제 리스트 생성
2. 각 리스트 상세 조회 누를시 상세 조회 페이지로 이동

---
  
<br> 
<br> 
<br> 
 
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
찜한 요금제
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
  
![like](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/39897996/29e3d535-c478-4771-a9c5-0d0035e61d41)
  
</div>

1. 찜한 요금제 리스트 생성
2. 각 리스트 하트 누르면 찜 삭제
3. 자세히 보기 누르면 해당 요금제 페이지로 이동
    
---
    
<br> 
<br> 
<br>
 
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
최근 본 요금제
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
  
![recent](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/39897996/adb17b2f-b2ef-4c61-92fb-f4e6d7a9501b)
  
</div>
    
1. 요금제 페이지 이동시 최근 본 요금제 추가
2. 자세히 보기 누르면 해당 요금제 페이지로 이동
    
---

</div>
</details>

<details>
<summary><h3>✅ 요금제 검색 / 맞춤형 요금제 </h3></summary>
<div markdown="1">
  
<br>
<br>
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
요금제 검색
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">

![plans](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/39897996/9a1e5ee5-d037-49e1-b9e4-19b1b196afe5)
    
</div>

1. 분류 클릭 후 선택순, 별점순, 데이터순 클릭 시 해당 요금제 리스트 생성
2. 우측 검색어 입력시 해당 요금제 리스트 생성
3. 필터 클릭 후 각 분류 선택 후 확인 버튼 클릭 시 해당하는 요금제 리스트 생성
4. 우측 최근 본 요금제 리스트 최대 7개 생성
5. 분류에 대한 데이터, 통화량, 가격 상단에 생성
    
---
  
<br> 
<br> 
<br> 
    
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
맞춤형 요금제
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
    
![find-customPlan](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/54164292/5096b025-b9a3-45ed-b103-9fa1ea6d5d25)
    
</div>

1. 메인페이지 맞춤 요금제 찾기 클릭
2. 질문에 대한 답변 클릭, 다음페이지로 넘어감
3. 모든 질문에 답변하게되면 해당 답변에 대한 정보를 가지고 요금제 리스트 페이지로 넘어감
    
---

</div>
</details>

진수성 끝

### 3. 관리자
### 3-1. 관리자 신고 관리
<details>
    <summary>관리자 신고 관리</summary>
    
![신고관리](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/108276943/1a19e9b7-274d-485b-9d45-bf1bbb21faa5)

</details> 

### 3-2. 관리자 문의내역 관리
<details>
    <summary>관리자 문의내역 관리</summary>
    
![문의내역 관리](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/108276943/152ace0c-d6b3-4059-8c88-e7bdd8850d2b)

</details>

### 3-3. 관리자 자주묻는질문 관리
<details>
    <summary>관리자 자주묻는질문 관리</summary>
    
![자주묻는질문 관리](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/108276943/ebffa4f0-64d9-451b-91e4-306829fd1443)

</details>

### 3-4. 관리자 통계조회
<details>
    <summary>관리자 통계조회</summary>
    
![통계조회](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/108276943/159dbd36-21a9-49d8-bf8d-459d88c0bcd4)

</details>
    
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

![플로우차트](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/96179832/69db77f4-0496-455b-9def-56d5dc0bff4f)

<br>


### 9. history

[history 전체보기](https://docs.google.com/spreadsheets/d/1kZ3R5gv2rakgyw1BX-JixVKzIxx89I8O9IaOMMycSPo/edit?usp=share_link)

<br>
