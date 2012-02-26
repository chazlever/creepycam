
function updatePicture() {
   $.post("webcam.php", { method : "getLatest" }, function(data) {
      $("#webcam-image").attr("src", data);
   });
}

$(document).ready(function() {
   // Get new image every second
   window.setInterval(function() {
      updatePicture(); },
      1*1000
   );
});
