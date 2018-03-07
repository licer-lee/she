<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>用户登录</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="static/css/normalize.css">
<link rel="stylesheet" href="static/css/login.css">
<style type="text/css">
body {
  background: #121212;
  margin: 0;
  overflow: hidden;
}

@keyframes fadeIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}
@keyframes chill {
  from {
    opacity: 1;
  }
  to {
    opacity: 1;
  }
}
@keyframes fadeOut {
  from {
    opacity: 1;
  }
  to {
    opacity: 0;
  }
}
p {
  position: absolute;
  top: 10px;
  left: 12px;
  color: white;
  opacity: 0;
  font-family: "Source Sans Pro";
  animation: fadeIn 2s ease-out, chill 2s 2s, fadeOut 2s 4s;
}

.social:hover a {
  transform: rotate(-45deg) scale(1.05);
}
.social:hover i {
  color: #21c2ff;
}

a {
  position: absolute;
  bottom: -40px;
  right: -75px;
  background: white;
  color: white;
  box-shadow: -1px -1px 20px 0px rgba(0, 0, 0, 0.3);
  display: inline-block;
  width: 150px;
  height: 80px;
  transform-origin: 50% 50%;
  transform: rotate(-45deg);
  transition: .15s ease-out;
}

i {
  position: absolute;
  bottom: 7px;
  right: 7px;
  pointer-events: none;
  color: #00ACED;
  z-index: 1000;
  font-size: 100px;
  transition: .15s ease-out;
}

</style>
</head>

<body>
	<canvas></canvas>
	
	<div class="login">
		<h1>Login</h1>
		<form method="post">
			<input type="text" name="u" placeholder="用户名" required="required" />
			<input type="password" name="p" placeholder="密码" required="required" />
			<button type="submit" class="btn btn-primary btn-block btn-large"
				onclick="login(); return false;">登录</button>
		</form>
	</div>

	<!-- 遮罩层DIV -->
	<div id="overlay" class="overlay"></div>
	<!-- Loading提示 DIV -->
	<div id="loadingTip" class="loading-tip">
		<img src="images/loading.gif" />
	</div>
	
	<script type="text/javascript">
		
		/**
		 * 登录
		 */
		function login(){
			
			showLoading();

			// 使用定时器模拟
			setTimeout(function() {
				//window.top.window.hideLoading();
				window.location.href='layout/layout';
			}, 2000);
		}
	
	</script>
	<script type="text/javascript" src="static/plugins/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="static/js/login.js"></script>
</body>
<script type="text/javascript">
var canvas = document.querySelector('canvas');
var c = canvas.getContext('2d');

canvas.width = window.innerWidth;
canvas.height = window.innerHeight;

var particleCount = 750;
var mouse = {
    x: window.innerWidth / 2,
    y: window.innerHeight / 2
};

window.addEventListener("mousemove",
function(event) {
    mouse.x = event.clientX - canvas.width / 2;
    mouse.y = event.clientY - canvas.height / 2;
});

window.addEventListener("resize",
function() {
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;

    lightParticles = [];
    initializeParticles();
});

function LightParticle(x, y, radius, color) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.color = color;

    this.update = function() {

        this.draw();
    };

    this.draw = function() {
        c.save();
        c.beginPath();
        c.arc(this.x, this.y, this.radius, 0, Math.PI * 2, false);
        c.shadowColor = this.color;
        c.shadowBlur = 15;
        c.shadowOffsetX = 0;
        c.shadowOffsetY = 0;
        c.fillStyle = this.color;
        c.fill();
        c.closePath();
        c.restore();
    };
}

var lightParticles = [];

var timer = 0;
var opacity = 1;
var speed = 0.0005;
var colors = ["#0952BD", "#A5BFF0", "#118CD6", "#1AAEE8", "#F2E8C9"];

var initializeParticles;

(initializeParticles = function() {
    for (var i = 0; i < particleCount; i++) {

        var randomColorIndex = Math.floor(Math.random() * 6);
        var randomRadius = Math.random() * 2;

        // Ensure particles are spawned past screen width and height so
        // there will be no missing stars when rotating canvas
        var x = (Math.random() * (canvas.width + 200)) - (canvas.width + 200) / 2;
        var y = (Math.random() * (canvas.width + 200)) - (canvas.width + 200) / 2;
        lightParticles.push(new LightParticle(x, y, randomRadius, colors[randomColorIndex]));
    }
})();

function animate() {
    window.requestAnimationFrame(animate);

    c.save();
    if (isMouseDown === true) {

        // Ease into the new opacity
        var desiredOpacity = 0.01;
        opacity += (desiredOpacity - opacity) * 0.03;
        c.fillStyle = "rgba(18, 18, 18," + opacity + ")";

        // Ease into the new speed
        var desiredSpeed = 0.012;
        speed += (desiredSpeed - speed) * 0.01;
        timer += speed;

    } else {

        // Ease back to the original opacity
        var originalOpacity = 1;
        opacity += (originalOpacity - opacity) * 0.01;
        c.fillStyle = "rgba(18, 18, 18, " + opacity + ")";

        // Ease back to the original speed
        var originalSpeed = 0.001;
        speed += (originalSpeed - speed) * 0.01;
        timer += speed;

    }

    c.fillRect(0, 0, canvas.width, canvas.height);
    c.translate(canvas.width / 2, canvas.height / 2);
    c.rotate(timer);

    for (var i = 0; i < lightParticles.length; i++) {
        lightParticles[i].update();
    }

    c.restore();

}

var isMouseDown = false;

window.addEventListener("mousedown",
function() {
    isMouseDown = true;
});

window.addEventListener("mouseup",
function() {
    isMouseDown = false;
});

animate();
</script>
</html>
