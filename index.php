<html>
 <head>
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>P2PSP Slides</title>
    <style>
      .header{
	width: 75%;
       }
      .header img{
	float:left;
	}
      h1{
	color: #9E9E9E;
	padding-top: 5px;
      }
      hr { 
	height: 5px;
        color: gray;
	background-color: gray;
      } 
      .title{
	text-align: center;
      }
      .center {
  	margin: auto;
      }
      .content{
	width: 85%;
	}
      .slide{
	width: 320px;
	text-align: center;
	float: left;
      }
   </style>
 </head>
 <body>
  <div class="header center">
    <img height="100px" src="images/p2pspsf.png">
    <div class="title">
    	<h1>P2PSP Slides</h1>
	<h2>Enjoy the P2PSP slides on the Web</h2>
	<span>Get the <a href="https://github.com/P2PSP/slides">source code</a>!</span>
    </div>
  </div>
  <hr>
  <div class="content center">
   
  <?php
   foreach (scandir(".") as $dir) {
        if ( substr($dir, 0,1) === "2") {
  ?>
		<a href="<?php echo $dir.'/index.html'; ?>">
		<div class="slide">
		<img width="300px" src="<?php echo $dir.'/snapshot.png'; ?>">
		<?php list($year, $month, $name) = explode("-", $dir); ?>
		<h3><?php echo $name; ?></h3>
		<span><?php echo $month."-".$year; ?></span>
		</div>
		</a>
  <?php
        }
    }
  ?>
  </div>
 </body>
</html>