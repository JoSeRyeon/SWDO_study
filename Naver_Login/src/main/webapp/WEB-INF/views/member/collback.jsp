<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
  <head>
    <title>네이버로그인</title>
  </head>
 <script type="text/javascript">
  var naver_id_login = new naver_id_login("4XBeSaYNtp8zLIHcXTPG", "http://localhost:8881/member/collback");
  // 접근 토큰 값 출력
  //alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    //alert(naver_id_login.getProfileData('email'));
    //alert(naver_id_login.getProfileData('nickname'));
    //alert(naver_id_login.getProfileData('age'));
    //alert(naver_id_login.getProfileData('id'));
    location.href = "/member/naver_login?id=" + naver_id_login.getProfileData('id') + "&name=" + naver_id_login.getProfileData('nickname');
  }
</script>
  </body>
</html>