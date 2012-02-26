<?php

function getLatest($dir) {
   $latest_ctime = 0;
   $latest_filepath = '';
   foreach (scandir($dir) as $f) {
      $filepath = "$dir/$f";
      if (is_file($filepath) && filectime($filepath) > $latest_ctime) {
         $latest_ctime = filectime($filepath);
         $latest_filepath = $filepath;
      }
   }
   echo $latest_filepath;
}

if(!empty($_POST['method'])) {
   switch($_POST['method']) {
      case 'getLatest':
         getLatest('images');
         break;
   }
}
