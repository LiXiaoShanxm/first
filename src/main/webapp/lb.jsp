<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <title></title>
 <style>
#div1 {
	width: 192px;
	height: 120px;
	border: 1px solid gray;
	margin: 0 auto;
	position: relative;
	overflow: hidden;
}

#div1 img {
	position: absolute;
}
</style>
</head>
<body>
<div id="div1">
 <img src="img/img13.jpg" alt="" width="192" />
 <img src="img/img14.jpg" alt="" width="192" />
 <img src="img/img15.jpg" alt="" width="192" />
 <img src="img/img16.jpg" alt="" width="192" />
</div>
<div id="div2">
 
</div>
<script>
	//获取页面元素
	var div1 = document.getElementById('div1');
	var div2 = document.getElementById('div2');
	var imgs = div1.getElementsByTagName('img');
	//初始化页面图片的位置
	window.onload = function() {
		for (var i = 0; i < imgs.length; i++) {
			imgs[i].style.left = i * 192 + 'px'
		}
	};
	//轮播移动的函数
	function imgMove() {
		var b1 = false;
		for (var i = 0; i < imgs.length; i++) {
			imgs[i].style.left = imgs[i].offsetLeft - 1 + 'px';
			if (imgs[i].offsetLeft == 0) {
				b1 = true;
				if (i == 0)
					imgs[imgs.length - 1].style = '576px';
				else
					imgs[i - 1].style.left = '576px'
			}
		}
		if (!b1)
			setTimeout(imgMove, 20);
		else
			setTimeout(imgMove, 2000);
	}
	setTimeout(imgMove, 3000);
</script>
</body>
</html>