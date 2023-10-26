# Battletube Container
<pre>
  make init : 폴더 생성 및 이미지 생성에 필요한 소스코드 git clone
  make update : git에서 최신 소스로 업데이트
  make build : ems, redis, api docker 이미지 생성
  make all : 최신 소스 업데이트 후 이미지 생성
</pre>
## api : (구) onairApi, videoApi
<pre>
  onairapi와 videoapi를 통합
</pre>

## ems : encoder management service
<pre>
  video encoding을 위한 api 및 ffmpeg 어플리케이션 서비스
</pre>
## redis : redis server
<pre>
  IMDB 임시 저장 및 캐시용도의 DB
  - Encoder 상태저장
  - 사용자 비밀번호 찾기시 인증번호 및 유효시간 저장
</pre>
## videoapi : ~~fastApiVideoContainer~~ (Deprecated)
<pre>
  <s>onairApi와 통합후 삭제 예정</s>
  fastapi에 통합됨
</pre>
