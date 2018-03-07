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
	overflow: hidden;
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
var canvas = document.querySelector("canvas");
var c = canvas.getContext('2d');

canvas.width = window.innerWidth;
canvas.height = window.innerHeight;

var mouse = {
    x: canvas.width / 2,
    y: canvas.height / 2
};

window.addEventListener("resize",
function() {
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
});

window.addEventListener("mousemove",
function(e) {
    mouse.x = e.clientX;
    mouse.y = e.clientY;
});

var colors = [{
    r: 255,
    g: 71,
    b: 71
},
{
    r: 0,
    g: 206,
    b: 237
},
{
    r: 255,
    g: 255,
    b: 255
}];

function Particle(x, y, dx, dy, r, ttl) {
    this.x = x;
    this.y = y;
    this.dx = dx;
    this.dy = dy;
    this.r = r;
    this.opacity = 1;
    this.shouldRemove = false;
    this.timeToLive = ttl;
    this.randomColor = Math.floor(Math.random() * colors.length);
    console.log(this.randomColor);

    this.update = function() {
        this.x += this.dx;
        this.y += this.dy;
        if (this.x + this.r >= canvas.width || this.x - this.r <= 0) {
            this.dx = -this.dx;
        };

        if (this.y + this.r >= canvas.height || this.y - this.r <= 0) {
            this.dy = -this.dy;
        };

        // Ensure that particles cannot be spawned past canvas boundaries
        this.x = Math.min(Math.max(this.x, 0 + this.r), canvas.width - this.r);
        this.y = Math.min(Math.max(this.y, 0 + this.r), canvas.height - this.r);

        c.beginPath();
        c.arc(this.x, this.y, this.r, 0, Math.PI * 2, false);
        // c.strokeStyle = 'rgba(0, 0, 0,' + this.opacity + ')';
        c.strokeStyle = 'rgba(' + colors[this.randomColor].r + ',' + colors[this.randomColor].g + ',' + colors[this.randomColor].b + ',' + this.opacity + ')';
        c.fillStyle = 'rgba(' + colors[this.randomColor].r + ',' + colors[this.randomColor].g + ',' + colors[this.randomColor].b + ',' + this.opacity + ')';
        // c.fill();
        c.stroke();
        c.closePath();

        this.opacity -= 1 / (ttl / 0.1);
        this.r -= r / (ttl / 0.1);
        this.timeToLive -= 0.1;
    }

    this.remove = function() {
        // If timeToLive expires, return a true value.
        // This signifies that the particle should be removed from the scene.
        return this.timeToLive <= 0;
    }
}

function Explosion(x, y) {
    this.particles = [];

    this.init = function() {
        for (var i = 1; i <= 1; i++) {
            var randomVelocity = {
                x: (Math.random() - 0.5) * 3.5,
                y: (Math.random() - 0.5) * 3.5,
            }
            this.particles.push(new Particle(x, y, randomVelocity.x, randomVelocity.y, 30, 8));
        }
    }

    this.init();

    this.draw = function() {
        for (var i = 0; i < this.particles.length; i++) {
            this.particles[i].update();

            if (this.particles[i].remove() == true) {
                this.particles.splice(i, 1);
            };
        }
    }
}

var explosions = [];

function animate() {
    clearTimeout(animate);
    setTimeout(animate, 10);

    c.fillStyle = "#1e1e1e";
    c.fillRect(0, 0, canvas.width, canvas.height);

    explosions.push(new Explosion(mouse.x, mouse.y));

    for (var i = 0; i < explosions.length; i++) {
        explosions[i].draw();
    }
}
animate();
</script>
</html>
