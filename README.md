# 37기 합동세미나 모바일앱 2조 유니클로 iOS 
37기 합동세미나 모바일앱 2조 유니클로 레포지토리입니다. 👔

## 👩🏻‍💻 Developers
| [이나연(Lead)](https://github.com/y-eonee)| [이상수](https://github.com/soo127) | [정윤아](https://github.com/laura-jung) | 
| --- | --- | --- | 
| <p align="center"><img src="https://github.com/y-eonee.png" width="260"/></p> |  <p align="center"> <img src="https://github.com/soo127.png" width="260"/></p>  | <p align="center"><img src="https://github.com/laura-jung.png" width="260"/></p> |
| <p align="center"> 카테고리 뷰 구현, 네트워크 세팅, 리뷰조회 API 연결  </p> | <p align="center"> 상세페이지 뷰 구현, 제품정보조회 API, 제품 상세정보조회 API 연결 </p> | <p align="center"> 상품목록 뷰 구현, 카테고리별 제품 조회 API, 스타일힌트 조회 API 연결 </p> |

<br/>

## 📌 Convention
### Prefix
`FEAT` : 새로운 기능 구현 및 네트워크 관련   
`STYLE`: 컴포넌트 및 UI 작업     
`ADD` : feat 이외의 부수적인 코드, 폰트, 에셋 등 추가    
`FIX` : 버그 및 오류 해결    
`CHORE` : 버전 코드, 패키지 구조, 의존성 추가   
`DOCS` : README, .gitignore 등의 문서 작업   
`REFACTOR` : 리팩토링   


### Branch Naming Rule
`TYPE/#이슈번호`


### Git Flow
1. Issue를 생성한다.
2. 현재 브랜치가 아닌 main 브랜치에서 Branch Naming Rule을 따르는 브랜치를 생성한다.
3. 이슈에 작성한 내용을 기반으로 기능을 구현한다. (+ 커밋)
4. add - commit - push - 간략한 PR 과정을 거친다.
5. PR 올린 후 팀원들과 공유하여 merge 한다.
6. merge 이후에는 로컬에서도 main으로 이동하여 pull 받는다.


### Code Convention 
[StyleShare 가이드](https://github.com/StyleShare/swift-style-guide)를 따릅니다.    
SwiftLint 및 BaseView, BaseViewController를 채택하여 일관성 있는 코드 스타일을 유지할 수 있도록 합니다. 

<br/>   

## Foldering 
```
37-COLLABORATION-UNIQLO
├─ .swiftlint
└─ 37-COLLABORATION-UNIQLO
   ├─ 📂 Core
   │  ├─ AppDelegate
   │  ├─ Config
   │  └─ SceneDelegate
   │
   ├─ 📂 Feature
   │  ├─ 📂 Category
   │  ├─ 📂 DetailPage
   │  └─ 📂 ItemList
   │
   ├─ 📂Global
   │  ├─ 📂 Base
   │  ├─ 📂 Button
   │  ├─ 📂 CategoryTab
   │  ├─ 📂 CustomTabBar
   │  ├─ 📂 Extensions
   │  └─ TopNavigationBar
   │
   ├─ 📂 Network
   │  ├─ 📂 Base
   │  ├─ 📂 DTO
   │  └─ 📂 Service
   │
   ├─ 📂 Resource
   │  ├─ 📂 Fonts
   │  ├─ 📂 Assets
   │  └─ Info
```

## ⚒️ Tech Stack
| 이름 | 사용 이유 | 
| --- | ------- |
| MVC 패턴 | 단기간 개발이라는 특징에 따라 패턴 적용에 대한 리소스를 최대한 줄이기 위하여 채택 | 
| Snapkit | 오토레이아웃을 간편하게 설정하기 위함 |
| Then | UI 코드를 간편하게 작성하기 위함 | 
| URLSession | 세미나 때 배운 네트워크를 다시 적용해보기 위하여 채택 | 
| Kingfisher | 이미지 처리 및 캐싱을 편리하게 하기 위함 |


<br />



## 📹 시연영상
| 아이템 1 | 아이템 2 |
| ------- | ----- |
|<img src ="https://github.com/user-attachments/assets/c3f1d0a2-12f8-4a66-9dd2-524b451a6776" width = "250" /> | <img src= "https://github.com/user-attachments/assets/0794d70d-b2e6-462b-b040-c8c5cd91b9b1" width = "250" /> |

