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
| `Library & Framework` |  ojcbc8(21.1.0),  lombok(1.18.26),  log4j(1.16),  gson(2.8.9),  json(20160810), <br> jackson(2.13.2.2),  commons-fileupload(1.4),  commons-io(2.6),  slf4j(1.6.6), <br> aspectJ(1.6.10), security(4.2.1.RELEASE),  Bootstrap(5.2.3),  DateRangePicker ,  Chart.js,  Google chart            |
| `API`      |  과학기술정보통신부 우정사업본부_우체국알뜰폰 요금제 조회 서비스,<br>  카카오톡 로그인, 카카오톡 push 알림, 카카오톡 공유, 다음 우편번호 서비스, 채널톡, 누리고, CKEditor   |


## 5️⃣ 주요기능

### 1. 메인페이지
<details>
    <summary>메인페이지</summary>
    
![main-page](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/54164292/64820d1f-da24-4d97-b59d-5dfe24e28264)
    
</details>

---

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

Spring Security를 활용하여 로그인 기능을 구현, 비밀번호의 경우 bcrypt 암호화를 적용
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
4. kakaoController에서 받은 정보를 데이터베이스와 비교하여 유저 정보가 있으면 해당 정보로 Security Authentication을 생성해 권한을 만들고 로그인한다.

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

<details>
<summary><h3>✅ 공지사항 / 통신사 페이지 </h3></summary>
<div markdown="1">
  
<br>
<br>
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
공지사항
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">

![notice](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/39897996/47fecab7-0d9a-4871-9c75-88a74aa20f0b)
    
</div>

1. 공지사항 리스트 생성
2. 공지사항 클릭 시 공지사항 상세 페이지로 이동
    
---
  
<br> 
<br> 
<br> 
    
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
통신사
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
    
![tellinfo](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/39897996/da959de5-4333-42a8-b0d5-b84a0bd085fe)
    
</div>

1. 기본정보, 요금제, 리뷰 클릭 시 해당하는 내용으로 스크롤 이동
2. 요금제 클릭 시 해당 요금제 리스트 페이지로 이동
    2-1. 요금제 더보기 클릭 시 요금제 리스트 페이지로 이동 후 해당 통신사의 요금제 리스트 생성
3. 리뷰 더보기 클릭 시 리뷰 5개 추가 생성
    3-1. 이후 더보기 클릭 시 모든 리뷰 생성
    
---

</div>
</details>

<details>
<summary><h3>✅ 요금제 상세 / 신청 </h3></summary>
<div markdown="1">
    
<br>
<br>
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
요금제 상세페이지
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
    
<div align="center">
    
![요금제 상세페이지](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/96179832/98d42adb-adbe-4ef8-b91f-ae4d0f43333d)

</div>

1. 통신사 로고 또는 통신사명을 클릭하면 통신사 페이지로 이동
2. 현재 로그인한 사용자의 해당 요금제를 찜한 상태에 따라 찜하기 버튼 변화
    2-1. ajax로 찜 구현 / 찜 버튼 변화
    2-2. 로그인하지 않은 사용자는 로그인 페이지로 이동
3. 카카오톡 공유하기 api 사용
4. 통신사 간략 정보
    4-1. 지원 통신망은 해당 통신사의 요금제에서 통신망 정보 가져옴
5. 통신사 리뷰의 평균 별점과 개수, 최대 3개의 리뷰 출력
    5-1. 리뷰 개수 또는 각 리뷰 박스를 클릭하면 통신사 페이지의 리뷰 위치로 스크롤 이동
    
<div align="center">
<img src="https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/96179832/d97bc2ba-2693-422e-b01e-1e1f9894bf72">
</div>
    
<br>
<br>
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
요금제 신청
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>

1. 
    
<div align="center">

</div>
    
</details>



### 2. 통신사
<details>
    <summary>✅ 통신사 대시보드</summary>
    
![biz-dashboard](https://github.com/minseong95/minseong95.github.io/assets/54164292/2f1015e3-3962-448a-a6d8-16880fe9fb27)
    
1. 통신사가 로그인하고 마이페이지로 이동
2. 페이지 진입한 시스템 시간 표시
3. 해당 통신사 로고 출력
3-1. 로고 옆 세팅 아이콘 클릭시 내 정보수정하기 페이지 즉시 이동
4. 리뷰/가입자 수, 등록 요금제 수 통계 텍스트로 표시
5. 최근 7일간 가입자 수 차트
6. 인기 상위 5개의 요금제 간단 정보 <br>
6-1. 제목 클릭시 해당 요금제 상세정보페이지 연결<br>
7. 가장 최신 리뷰 3개 전시, 더 보기 링크 <br>
7-1. 리뷰 내용이 25자 이상일 경우 그 이상 텍스트는 ··· 으로 대체 
</details>

<details>
    <summary>✅ 통신사 정보</summary>
    
![bizinfo](https://github.com/minseong95/minseong95.github.io/assets/54164292/d38f5fb8-762b-40bd-82f9-dfdfd113fec9)

1. 통신사의 기본정보/상세정보 조회 가능
2. 이전 정보가 입력되어있는 상태로 수정 진행
3. 우편번호 찾기 api 이용
4. 각 input 마다 입력 양식 제한
5. 지원통신망의 경우, 특정 통신망 체크 시 해당 통신망의 고객센터번호 입력칸 생성<br>
5-1. 미체크 시 입력칸 숨김 처리<br>
5-2. 숨김 처리 상태로 등록할 경우 고객센터번호 미운영으로 처리<br>
6. 로고 이미지 파일 수정하지 않는 경우 이전 로고 이미지로 자동 저장
    
    
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
체크박스 이벤트 로직
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
    

<img width="952" alt="serviceList-checkBox-event" src="https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/54164292/2815a7ba-5f95-4125-8212-feff7ffd33b7">
<img width="770" alt="js_ctrl_check" src="https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/54164292/07fde5bb-ad2a-4996-b05b-08bfbe1405b9">


</details>

<details>
    <summary>✅ 자사 요금제 관리</summary>
    
![bizPlanDelete](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/54164292/74e9379a-b1b5-44d9-88c7-3fe04f2ece40)

1. 해당 요금제 삭제 버튼 클릭 시 모달창 발생
2. 체크박스 미체크 상태에서 선택 삭제 버튼 클릭시 alert 창 발생
3. 체크박스 체크 후 선택 삭제 버튼 클릭 시 모달창 발생
4. 체크박스를 통해 체크한 데이터는 ajax를 통해 전달
5. 삭제 상태가 삭제로 변경 <br>
    5-1. 삭제 상태일 경우 수정/삭제 버튼 비활성화
6. 요금제가 삭제될 시 해당 요금제에 대한 찜하기, 최근 본 요금제 기록에서 삭제하기 위해 트리거 작동
 
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
요금제 삭제 로직
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center"> 
    
![plan-delete](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/54164292/be6f9b07-d053-4db7-8a87-c25486e69560)
    
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
모달창과 체크박스로 선택 삭제
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center"> 
    
![modal-check-delete](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/54164292/e4e6c753-d499-4db8-912e-f300451de0f5)


</details>

<details>
    <summary>✅ 자사 요금제 가입 신청 관리</summary>
    
![bizApply](https://github.com/minseong95/minseong95.github.io/assets/54164292/b7ada5f0-219b-4638-9c9c-995434d42991)
    
1. 해당 통신사의 가입 신청서 목록 조회 가능
2. 한 페이지의 목록 출력 개수 선택 가능
3. 조건별 검색 기능 <br>
3-1. 검색키워드(요금제명 / 신청자) 검색 가능<br>
3-2. 가입신청상태(전체/신청완료/승인완료/승인보류) 검색 가능<br>
3-3. 기간으로 조회 가능<br>
3-4  키워드와 신청상태 , 기간 동시 검색 가능<br>
4. 결과에 따른 출력 개수 텍스트로 표시
5. 페이징 처리
6. 신청일자 활용하여 신청번호 생성<br>
6-1. 하이픈 뒷 자리는 총 6자리 숫자로 고정
7. 가입신청상태 별로 텍스트 색상 다르게 함
8. 상세보기 버튼 클릭시 요금제 가입 신청서 상세정보 페이지로 이동
9. 가입신청서 없을 시 문구 출력 
10. 가입 신청 상세조회 페이지에서 가입 신청 상태 변경 가능<br>
10-1. 신청 상태에 따른 텍스트 색상 변경<br>
10-2. 승인/보류 버튼 클릭시 확인 alert 창 표시<br>
10-3. ajax를 사용하여 상태 변경 시 화면 즉시 반영
    
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
기간조회 로직
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center"> 
    
![date-search__](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/54164292/7850950e-3607-4b51-80ab-36f8fd7aaf8b)

</details>

<details>
    <summary>✅ 자사 리뷰 관리</summary>
    
![bizReview](https://github.com/minseong95/minseong95.github.io/assets/54164292/18d07722-12db-482a-8c94-20367e15f1a8)

1. 해당 통신사에 대한 모든 리뷰 조회 가능<br>
    1-1. 사용자에게 보여지지 않는 숨김 처리된 리뷰 또한 조회 가능 (상태 : 삭제)
2. 한 페이지의 목록 출력 개수 선택 가능
3. 결과에 따른 출력 개수 텍스트로 표시
4. 페이징 처리
5. 사용자 아이디, 리뷰 작성일자, 리뷰 내용, 별점 확인 가능<br>
5-1. 리뷰 내용 길이에 따라 리뷰 박스 길이 또한 자동으로 증가
6. 신고처리상태(전체/신고처리중/삭제/반려)에 따른 조회 가능<br>
6-1. 해당 상태 라디오버튼 체크 시 화면 즉시 반영
7. 등록된 리뷰 없을 시 문구 출력
8. 특정 라디오버튼 체크된 상태일 경우 페이지 이동시에도 체크 상태 유지
    
</details>


<details>
    <summary>✅ 자사 통계 조회</summary>
    
![bizChart](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/54164292/8dc97561-f6ea-42f8-bbeb-e03460ca8504)
    
0. 구글 차트 이용
1. 해당 통신사의 요금제 별 가입자 수 <br>
1-1. 두 개의 열로 누적 / 일일 가입 자수 표시 <br>
1-2. 가입자 수가 0인 경우에도 표시
2. 시스템 시각 기준 최근 일주일 간 해당 통신사의 모든 요금제 가입자 수에 대한 열 차트
3. 현재 기준 가장 많은 가입자 수를 가진 요금제의 연령대 비율에 대한 원형 차트
4. 현재 기준 가장 많은 가입자 수를 가진 요금제의 성별 비율에 대한 원형 차트
5. 해당 통신사의 요금제를 가입한 사용자들의 연령대 비율에 대한 원형 차트
6. 해당 통신사의 요금제를 가입한 사용자들의 성별 비율에 대한 원형 차트

<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
두 개의 열을 가진 차트 로직
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
    
<img width="873" alt="bizChart" src="https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/54164292/e8197c19-6366-4c7c-8485-73c28a7d107a">

   
</details>




김민성

### 3. 관리자

<details>
    <summary>✅ 대시보드</summary>
    
  ![대시보드](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/108276943/c9df45e6-2589-461a-863c-25c8e8fc8683)

<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
대시보드
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
    
</div>
    
1. ajax를 사용하여 차트 데이터를 받아옴
2. 리뷰, 질문/답변, 신고글은 최신글 3개까지만 보여짐.
- 게시글의 제목이 23자보다 긴 경우의 조건을 <c:when>태그를 사용하였고 참일 때, fn:substring() 함수를 사용하여 게시글 제목의 일부분만 출력하도록함.    
      
![대시보드](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/108276943/711e9897-6271-4aed-b85d-c4e224dafd44)
    
![대시보드2](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/108276943/b181d6fa-9fc2-4d94-be88-77810ac602b5)

</details>
    
<details>
    <summary>✅ 관리자 신고 관리</summary>
    
![신고관리](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/108276943/1a19e9b7-274d-485b-9d45-bf1bbb21faa5)
    
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
신고 리뷰 목록
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
    
</div>
    
1. 신고리뷰 목록에서 미확인/삭제/반려 버튼을 누르면 해당 상태의 목록만 따로 조회 가능
- '미확인', '삭제', '반려' 버튼 클릭 시 reportStatus 값(0,1,2)을 설정하고, reportStatusForm을 제출
- 각각의 버튼은 활성화된 상태와 비활성화된 상태가 있으며, 활성화된 상태일 때 해당 버튼에 'active'가 추가되어 표시
2. 3일 이내에 신고된 리뷰는 새로운 리뷰로 간주되어, 목록에서 해당 리뷰 옆에 new 아이콘이 표시
3. 상태 처리가 '미확인'인 리뷰는 목록에서 빨간색 글자로 표시
4. 검색 옵션을 사용하여 특정 키워드와 일치하는 리뷰를 검색. 검색어를 입력하면 해당 검색어가 포함된 리뷰가 목록에서 필터링

<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
신고 리뷰 처리
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
    
</div> 
    
1. ajax를 활용하여 신고 리뷰를 삭제/반려 처리
- 삭제/반려 처리 시 "반려(삭제)처리 하시겠습니까?"라는 확인창(confirm) 표시
- 확인을 누르면 처리상태가 '반려' 또는 '삭제'로 바뀐다.

</details> 

<details>
    <summary>✅ 관리자 문의내역 관리</summary>
    
![문의내역 관리](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/108276943/152ace0c-d6b3-4059-8c88-e7bdd8850d2b)
    
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
문의내역 목록 조회
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
    
</div>
    
1. 등록된 문의내역 목록을 조회
2. 3일 이내에 등록된 문의는 새로운 문의로 간주되어, 목록에서 해당 제목 옆에 new 아이콘이 표시
    
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
문의내역 상세
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
    
</div>

1. 쿠키를 이용한 조회수 무한증가 방지.
    
<img width="696" alt="스크린샷 2023-05-11 오후 8 44 58" src="https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/108276943/5c3a5dbd-754d-4dbc-9d55-5bb95bc9a53c">
    
- 쿠키 만료 시간을 10초로 설정하여 해당 Q&A 글을 본 이후 10초 이내에 다시 조회하면 중복 조회로 처리되지 않고 조회수가 증가하지 않음.
    
2. 트리거와 ajax를 활용하여 답변 등록, 삭제 시 답변수가 자동으로 증감됨.
    
![트리거](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/108276943/66a18279-3677-45a9-b189-e8720ac35fbd)

3. collection을 활용하여 한 게시글의 답변과 답변의 답글 데이터 목록을 받아옴.
    
![컬렉션](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/108276943/ef16fb28-dac9-4d32-ad81-d25c367baa6a)

   
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
답변 등록
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
    
</div>
    
1. ajax를 사용한 답변 등록
- 답변 등록에 성공하면 ajax로 답변 목록과, 답변 수를 데이터를 받아와 .html()로 초기화하고 새로 받아온 답변 목록과 답변수로 변경
2. 등록시 답변 내용이 비어있으면 "댓글 내용을 입력하지 않았습니다."라는 경고창이 표시
  
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
답변 수정
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
    
</div>
    
1. ajax를 사용한 답변 수정
- 답변 수정에 성공하면 ajax로 답변 목록 데이터를 받아와 .html()로 초기화하고 새로 받아온 답변 목록으로 변경
2. 관리자(admin)계정의 답변만 수정 버튼이 활성화
3. 수정 버튼 클릭 시 해당 답변 내용이 수정할 수 있는 수정폼으로 변경
- 답변마다 고유id를 부여하여 해당 답변만 수정폼으로 변경될수있게 구현
    
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
답변 삭제
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">

</div>
    
1. ajax를 사용한 답변 삭제
- 답변 삭제에 성공하면 ajax로 답변 목록 데이터를 받아와 .html()로 초기화하고 새로 받아온 답변 목록으로 변경
2. 관리자(admin)계정의 답변만 삭제 버튼이 활성화
3. 삭제를 클릭하면 "삭제하시겠습니까?" 확인창(confirm) 표시
    
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
답글 조회
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
    
</div>
    
1. 답글버튼을 누르면 ajax로 답글목록을 데이터를 받아와 해당 답변의 답글목록이 보여짐.
    
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
답글 등록
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">

</div>
    
1. ajax를 사용하여 답글 등록
- 답글 등록에 성공하면 ajax로 답글 목록 데이터를 받아와 .html()로 초기화하고 새로 받아온 답글 목록으로 변경
- 등록시 답글 내용이 비어있으면 "댓글 내용을 입력하지 않았습니다."라는 경고창이 표시
    
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
답글 수정
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">

</div>
    
1. ajax를 사용하여 답글 수정
- 답글 수정에 성공하면 ajax로 답글 목록 데이터를 받아와 .html()로 초기화하고 새로 받아온 답글 목록으로 변경   
2. 관리자(admin)계정의 답글만 수정 버튼이 활성화
3. 수정 버튼 클릭 시 해당 답글 내용이 수정할 수 있는 수정폼으로 변경
- 답글마다 고유id를 부여하여 해당 답글만 수정폼으로 변경될수있게 구현
4. 저장을 클릭하면 수정 완료되고, 수정한 내용이 바로 반영되어 보여진다.
5. 수정시 답글 내용이 비어있으면 "댓글 내용을 입력하지 않았습니다."라는 경고창이 표시
     
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
답글 삭제
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">

</div>
    
1. ajax를 사용하여 답글 삭제
- 답글 삭제에 성공하면 ajax로 답글 목록 데이터를 받아와 .html()로 초기화하고 새로 받아온 답글 목록으로 변경
2. 관리자(admin)계정의 답글만 삭제 버튼이 활성화
3. 삭제를 클릭하면 "삭제하시겠습니까?"라는 확인창(confirm) 표시 

</details>

<details>
    <summary>✅ 관리자 통계조회</summary>
    
![통계조회](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/108276943/159dbd36-21a9-49d8-bf8d-459d88c0bcd4)
    
<div align="center">
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
통계조회
<img src="https://res.cloudinary.com/dnik5jlzd/image/upload/c_scale,h_10,w_225/v1679302400/readme/%EC%84%A0_vkktmh.png">
</div><br>
<div align="center">
    
</div>
    
1. apexcharts 차트 라이브러리를 활용
    
![차트](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/108276943/c2d1720e-45f0-4862-9b4c-88a97821d5db)    
</details>

권수빈

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

![Copy of KH-Sim-s](https://github.com/kh-finalproject-Sim-s/KH-Sim-s/assets/54164292/50efbc3b-ff09-4687-bac5-52fd8e26b530)

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
    
    
### 10. Troubleshooting

[TroubleShooting 전체보기](https://docs.google.com/spreadsheets/d/15NW-3_jEqZpxbsdjh70hDACcwm2r9KsZrV_pDOWIJgI/edit#gid=0)
