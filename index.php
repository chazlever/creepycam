<?php 
include 'webcam.php';
?>

<html>
   <head>
      <title>Creepy Cram</title>
      <script src="js/jquery-1.7.min.js" type="text/javascript"></script>
      <script src="js/custom.js" type="text/javascript"></script>
      <style type="text/css">
         html, body {
            width: 100%;
            height: 100%;
            text-align: center;
         }
         #webcam-image {
            width: 640px;
            height: 360px;
         }
         #content {
            margin: auto auto; 
         }
      </style>
   </head>
   
   <body>
   <div id="content">
      <h1>Creepy Cam</h1>
      <img id="webcam-image" src="<?php getLatest('images'); ?>" />   
   <div/>
   </body>
</html>
