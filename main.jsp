<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "model.User,java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

// セッション属性"redirected"をチェックします
if (session.getAttribute("redirected") == null) {
    // "redirected"属性が存在しない場合（つまり、初回アクセスの場合）、
    // 属性を設定し、MyServletにリダイレクトします
    session.setAttribute("redirected", true);
    response.sendRedirect("Main");
    return;
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Portfolio - Yu Akita</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #ffffff;
    margin: 0;
    padding: 0;
}

h1 {
    color: #333;
    text-align: center;
    margin-top: 50px;
}
h2 {
    color: #333;
    text-align: center;
    margin-top: 50px;
}

.intro {
    text-align: center;
    width: 80%; /* programmerの両端と会う程度にする */
    margin: auto;
    padding-top: 30vh; /* Yu Akitaとページの上端の間を広げる */
}

.intro .name {
    font-size: 45px; /* Yu Akitaのフォントサイズを上げる */
    margin-bottom: 5px; /* Yu Akitaとprogrammerの間を縮める */
}

.intro .role {
    font-size: 15px;
    font-color: grey;
    margin-bottom: 400px; /* programmerと<table>の間を広げる */
}

table {
    width: 80%;
    margin: 20px auto;
    text-align: center;
    border-collapse: collapse;
}

table, th, td {
    border: 1px solid black;
}

th, td {
    padding: 15px;
    text-align: left;
}

.container {
    max-height: 100vh; /* ビューポートの高さに合わせる */
    overflow: auto; /* スクロールを可能にする */
}

.link-icon {
    width: 20px; /* 幅を20ピクセルに設定 */
    height: auto; /* 高さは自動的に調整 */
}

.good-icon {
    width: 25px; /* 幅を25ピクセルに設定 */
    height: auto; /* 高さは自動的に調整 */
}
#photo_list {
	display: flex;
	flex-wrap: wrap;
	padding: 10px;
	background-color: #333333;
	display: flex;
	justify-content: center;
	}

#photo_list2 {
	display: flex;
	flex-wrap: wrap;
	padding: 10px;
	background-color: #333333;
	display: flex;
	justify-content: center;
	}

#photo_list img{
	opacity: 0.4;
	border: solid 2px #333333;
	padding: 4px;
	}

#photo_list2 img{
	opacity: 0.4;
	border: solid 2px #333333;
	padding: 4px;
	}

.figure{
	position: relative;
	align: center;
	}

.figcaption{
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: white;
	background: rgba(0, 0, 0, 0.5);
	padding: 10px;
	}

</style>
</head>
<body>
<div class="intro">
    <p class="name">Yu Akita</p>
    <p class="role">programmer</p>
</div>
<div class="container">
    <h1>Acheivement List</h1>
    <table>
        <tr>
            <th>DATE</th>
            <th>TYPE</th>
            <th>FEATURE</th>
            <th>LINK</th>
            <th>TERM</th>
            <th>GOOD</th>
        </tr>
    <c:forEach var="item" items="${itemsList}">
    	<tr>
            <td><c:out value="${item.date}" /></td>
            <td><c:out value="${item.type}" /></td>
            <td><c:out value="${item.feature}" /></td>
			<td><a href="<c:out value='${item.link}' />"><img class="link-icon" src="resources/link.png" alt="Link"></a></td>
            <td><c:out value="${item.term}" /></td>
            <td><a href="Main?action=good&id=<c:out value='${item.id}' />&good=<c:out value='${item.good}' />"><img class="good-icon" src="resources/good.png" alt="Good"></a>　<c:out value="${item.good}" /></td>
        </tr>
    </c:forEach>
    </table>
</div>
<h2>Free AI Image Generator</h2>
<div id="photo_list">
	<figure class="figure">
	<a href = "https://playground.com/">
		<img src="resources/01_playground220150.jpg" onmouseover="mOver(this)" onmouseout="mOut(this)" alt="playground" title="playground">
	</a>
	<figcaption class="figcaption">Playground</figcaption>
	</figure>

	<figure class="figure">
	<a href = "https://www.canva.com/">
		<img src="resources/02_canva220150.png" onmouseover="mOver(this)" onmouseout="mOut(this)" alt="Canva" title="Canva">
	</a>
	<figcaption class="figcaption">Canva</figcaption>
	</figure>

	<figure class="figure">
	<a href = "https://www.bing.com/images/create">
		<img src="resources/03_bingImageCreator220150.jpg" onmouseover="mOver(this)" onmouseout="mOut(this)" alt="BingImageCreagor" title="BingImageCreator">
	</a>
	<figcaption class="figcaption">BingImageCreator</figcaption>
	</figure>
</div>

<h2>Free AI Image Editer; Doodle to Image</h2>
<div id="photo_list2">
	<figure class="figure">
	<a href = "https://app.leonardo.ai/realtime-canvas">
		<img src="resources/04_leonardo.Ai-RealtimeCanvas220150.PNG" onmouseover="mOver(this)" onmouseout="mOut(this)" alt="Leonardo Ai-RealtimeCanvas" title="Leonardo Ai-RealtimeCanvas">
	</a>
	<figcaption class="figcaption">Leonardo Ai-RealtimeCanvas</figcaption>
	</figure>
</div>

<script>
function mOver(obj){
	obj.style.opacity = 1.0;
	obj.style.border = 'solid 2px #FF9933';
}
function mOut(obj){
	obj.style.opacity = 0.4;
	obj.style.border = 'solid 2px #333333';
}

</script>
</body>
</html>
