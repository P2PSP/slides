<html>
 <head>
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>P2PSP Slides</title>
   <link rel="stylesheet" type="text/css" href="style.css">
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
   foreach (scandir(".",1) as $dir) {
        if (substr($dir, 0,1) === "2" and file_exists($dir.'/index.html')) {
  ?>
		<a href="<?php echo $dir.'/index.html'; ?>">
		<div class="slide">
		<img width="90%" src="<?php echo $dir.'/snapshot.png'; ?>">
		<?php list($year, $month, $name) = explode("-", $dir); ?>
		<h3><?php echo str_replace("_"," ",$name); ?></h3>
		<span class="date"><?php echo $month."-".$year; ?></span>
		</div>
		</a>
  <?php
        }
    }
  ?>
  </div>
 </body>
</html>
