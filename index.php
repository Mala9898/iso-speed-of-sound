<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<h4>he</h4>
<?php
if (move_uploaded_file($_FILES['file']['tmp_name'], "image.png")) {
	echo "File uploaded: ".$_FILES["file"]["name"];
}
?>
</body>
</html>
