<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery旋转木马自动切换代码 - 站长素材</title>

<link type="text/css" rel="stylesheet" href="css/carousel.css">
<script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="js/carousel.js"></script>

<style>
body {color:#fff;font-family:"microsoft yahei";}
.container { margin:150px auto; max-width:1000px;height:270px;}
</style>

</head>
<body>
<div class="container" style="margin-top: 0px;">
<div class="pictureSlider poster-main" data-setting='{"width":1000,"height":270,"posterWidth":640,"posterHeight":280,"scale":0.8,"autoPlay":true,"delay":1500,"speed":600}'>
	<div class="poster-btn poster-prev-btn"></div>
    <ul class="poster-list">
    	<li class="poster-item"><a href="#"><img src="images/BigData.jpg" width="100%" height="100%"></a></li>
        <li class="poster-item"><a href="#"><img src="images/java.jpg" width="100%" height="100%"></a></li>
        <li class="poster-item"><a href="#"><img src="images/Python.jpg" width="100%" height="100%"></a></li>
        <li class="poster-item"><a href="#"><img src="images/web.gif" width="100%" height="100%"></a></li>
        <li class="poster-item"><a href="#"><img src="images/web.jpg" width="100%" height="100%"></a></li>
        <li class="poster-item"><a href="#"><img src="images/javaee.jpg" width="100%" height="100%"></a></li>
        <li class="poster-item"><a href="#"><img src="images/php.jpg" width="100%" height="100%"></a></li>
        <li class="poster-item"><a href="#"><img src="images/javaSystem.png" width="100%" height="100%"></a></li>
    </ul>
    <div class="poster-btn poster-next-btn"></div>
</div>
</div>
<script>
$(function(){
	Carousel.init($(".pictureSlider"));
});
</script>

</body>
</html>
