<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>轮播图</title>
<style type="text/css" rel="stylesheet">
* {
	margin: 0;
	padding: 0;
}
/*想要图片出现重叠的效果*/
.content {
	width: 100%;
	height: 420px;
	margin-top: 40px;
}

.list {
	width: 1200px;
	height: 300px;
	overflow: hidden; /*溢出的隐藏掉，默认的是：内容不会被修剪，会呈现在元素框之外。*/
	position: absolute;
	left: 50%;
	margin-left: -600px;
}

li {
	list-style: none;
	position: absolute; /*一定要设置这个*/
	top: 0;
	left: 0;
	opacity: 0;
	transition: all 0.3s ease-out;
}

img {
	border: none;
	width: 730px;
	height: 336px;
	float: left;
}

.p5 {
	transform: translate3d(-224px, 0, 0) scale(0.81);
	transform-origin: 100% 25%;
	opacity: 0.8;
	z-index: 2;
}

.p4 {
	transform: translate3d(224px, 0, 0) scale(1);
	z-index: 3;
	opacity: 1;
}

.p3 {
	transform: translate3d(449px, 0, 0) scale(0.81);
	transform-origin: 100% 25%; /*改变基准的*/
	opacity: 0.8;
	z-index: 2;
}

.p2 {
	transform: translate3d(672px, 0, 0) scale(0.81);
}

.p1 {
	transform: translate3d(896px, 0, 0) scale(0.81);
}

.pre {
	left: 224px;
}

.next {
	right: 244px;
}

.button {
	position: absolute;
	top: 35%;
	text-decoration: none;
	font-size: 70px;
	color: #ffffff;
	z-index: 5;
}

a:active {
	color: #000;
	opacity: 0.5;
}

.buttons {
	position: absolute;
	width: 1200px;
	height: 30px;
	top: 50%;
	left: 50%;
	margin-top: -15px;
	margin-left: -600px;
	text-align: center;
}

.buttons a {
	display: inline-block;
	width: 35px;
	height: 5px;
	padding-top: 4px;
	cursor: pointer;
}

span {
	width: 35px;
	height: 1px;
	background: red;
	display: block;
}

.blue {
	background: blue;
}
</style>
</head>
<body>
	<div class="content">
		<div class="list">
			<ul>
				<li class="p5"><a href="#"><img src="img/img13.jpg" alt=""></a></li>
				<li class="p4"><a href="#"><img src="img/img14.jpg" alt=""></a></li>
				<li class="p3"><a href="#"><img src="img/img15.jpg" alt=""></a></li>
				<li class="p2"><a href="#"><img src="img/img16.jpg" alt=""></a></li>
				<li class="p1"><a href="#"><img src="img/img25.jpg" alt=""></a></li>
			</ul>
			<a href="javascript:;" class="pre button"><</a> <a
				href="javascript:;" class="next button">></a>
		</div>


		<!--下面的横线按钮-->
		<div class="buttons">
			<a href="javascript:;"><span class="blue"></span></a> <a
				href="javascript:;"><span></span></a> <a href="javascript:;"><span></span></a>
			<a href="javascript:;"><span></span></a> <a href="javascript:;"><span></span></a>

		</div>
	</div>
	<script src="js/jquery-1.11.3.min.js"></script>
	<script src="js/imagePlayer.js"></script>
	<script type="text/javascript">
		var cArr = [ "p5", "p4", "p3", "p2", "p1" ];
		var $s = $(".buttons span");
		var $a = $(".buttons a");
		var index = 0;
		$(".next").click(function() {
			nextImg();

		});
		$(".pre").click(function() {
			preImg();
		});
		function nextImg() {
			cArr.unshift(cArr[4]);//向开头添加p1  
			cArr.pop();//把最后的p1删掉，最终数组是【p1,p5,p4,p3,p2】  
			$("li").each(function(i, e) {
				$(e).removeClass().addClass(cArr[i]);
			})
			index++;
			if (index > 4) {
				index = 0;
			}
			show();
		}
		function preImg() {
			cArr.push(cArr[0]);//向数组末尾添加p5  
			cArr.shift();//把开头的p5删掉，最终数组是【p4,p3,p2,p1,p5】  
			$("li").each(function(i, e) {
				$(e).removeClass().addClass(cArr[i]);
			})
			index--;
			if (index < 0) {
				index = 4;
			}
			show();
		}
		//改变底下按钮的背景色  
		function show() {
			$($s).eq(index).addClass("blue").parent().siblings().children()
					.removeClass("blue");
			//$($s).eq(index).addClass("blue").parent()意思是当前的span添加上蓝色之后，他的父元素a  
			//$($s).eq(index).addClass("blue").parent().siblings() 这个找到除了自己之外的所有的a  
			//$($s).eq(index).addClass("blue").parent().siblings().children()  所有a下边的span  
		}

		//点下边的按钮切换图片  
		//这个思路一开始感觉毫无头绪，可是后才参考资料，琢磨，还真想出来一个  
		//按钮的index与前一次点击图片的index相减；判断这个差值dip和之前的相差多少  
		//是正数的话就是next图片，负数的话就是pre图片。dip是多少就循环几次  
		$a.each(function() {

			$(this).click(function() {

				var myIndex = $(this).index();
				var dipIndex = myIndex - index;
				if (dipIndex >= 0) {
					for (var i = 0; i < dipIndex; i++) {
						cArr.unshift(cArr[4]);//向开头添加p1  
						cArr.pop();
					}

				} else if (dipIndex < 0) {
					for (var i = 0; i < -dipIndex; i++) {
						cArr.push(cArr[0]);//向数组末尾添加p5  
						cArr.shift();//把开头的p5删掉，最终数组是【p4,p3,p2,p1,p5】  
					}
				}
				$("li").each(function(i, e) {
					$(e).removeClass().addClass(cArr[i]);
				})
				index = myIndex;
				show();
			});

		});

		//点击图片能切换的功能  
		//点击class为p3的图片  
		$(document).on("click", ".p3", function() {
			nextImg();
		});
		//点击class为p5的图片  
		$(document).on("click", ".p5", function() {
			preImg();
		});

		//自动播放功能  
		//	          鼠标移入box时清除定时器  
		$(".content").mouseover(function() {
			clearInterval(timer);
		})

		//	          鼠标移出box时开始定时器  
		$(".content").mouseleave(function() {
			timer = setInterval(nextImg, 4000);
		})

		//	          进入页面自动开始定时器  
		timer = setInterval(nextImg, 4000);
	</script>
</body>
</html>