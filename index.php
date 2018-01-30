<html>
 <head>
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
	width: 90%;
	}
      .slide{
	width: 420px;
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
    </div>
  </div>
  <hr>
  <div class="content center">
   
  <?php
   foreach (scandir(".") as $dir) {
        if ( ! in_array($dir, ['.', '..','images','.cache','index.php'])) {
  ?>
		<a href="<?php echo $dir.'/index.html'; ?>">
		<div class="slide">
		<img height="300px" width="400px" src="<?php echo $dir.'/snapshot.png'; ?>">
		<h3><?php echo $dir ;?></h3>
		</div>
		</a>
  <?php
        }
    }
  ?>
  </div>
 </body>
</html>
