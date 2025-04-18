# Flutter 위치 검색 앱

## 📣 프로젝트 개요

지역을 검색하여 최대 5개까지 검색이 가능한 앱.
사이트가 있다면 웹뷰를 이용해 사이트에 접속이 가능하다.
위치 권한을 통해 현재 위치에 맞는 검색 결과를 알 수 있다.

## 📆 프로젝트 일정

25/04/17 ~ 25/04/18

<br/>

## 📑 주요 기능

> - 지역을 검색하면 최대 5개까지의 결과를 알 수 있다.
> - 웹뷰를 이용해 해당 사이트로 이동이 가능하다.
> - 위치 기반을 통해 현재 위치에서의 결과를 알 수 있다.

<br/>

<p float="left">
  <img src="assets/screenshot/home.png" width="45%" />
  <img src="assets/screenshot/result.png" width="45%" />
</p>

<p float="left">
  <img src="assets/screenshot/loading.png" width="45%" />
  <img src="assets/screenshot/loaded.png" width="45%" />
</p>

<p float="left">
  <img src="assets/screenshot/notfound.png" width="45%" />
</p>

## 🚨 TroubleShooting

> ios 웹뷰 에러 현상

`문제상황` :

- 해당 결과에 URL을 정상적으로 가져오지만 웹뷰로 띄울 수 없는 문제

`해결과정` :

1. ios의 App Transport Security (ATS) 정책 때문에 문제가 생긴 것을 찾음
2. 그래서 Info.plist 파일에 Permission을 추가하여 해결

<br/>

## 💻 발전 시킬 부분

- [ ] 디바운스, 쓰로틀링을 이용한 검색 기능
