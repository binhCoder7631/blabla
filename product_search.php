<?php 
	session_start();
	require_once("connect.php");
	if (!isset($_REQUEST["txtKey"])){
		$key = "";
	} else {
		$key = $_REQUEST["txtKey"];
	}
	if (!isset($_REQUEST["cmd"])){
		$cmd = "";
	} else {
		$cmd = $_REQUEST["cmd"];
	}
	if (!isset($_REQUEST["slCat"])){
		$cat = 0;
	} else {
		$cat = $_REQUEST["slCat"];
	}
	if (!isset($_REQUEST["page"])){
		$page = 1;	
	} else {
		$page = $_REQUEST["page"];
	}
	if ($key=="" && $cat==0){ 
	} else { 
	// sùa sdfjoskfjsdak;ls
	$sql2 = "select a.*, b.cname from Product a,Categories b where a.cid = b.cid and (pname like '%$key%' or pdesc like '%$key%' or a.cid=$cat)";
	// echo $sql2;
	$result2 = $conn->query($sql2) or die($conn->error);
	$num_row_of_page = 3;
	$num_page = ceil($result2->num_rows/$num_row_of_page);
	if ($page<1) {
		$page = 1;
	}
	if ($page>$num_page){
		$page = $num_page;
	}
	$sql = "select a.*, b.cname from product a,categories b where a.cid = b.cid and (pname like '%$key%' or pdesc like '%$key%' or a.cid=$cat) limit ".$num_row_of_page*($page-1).",".$num_row_of_page;
	$result = $conn->query($sql) or die($conn->error);
	}
	
?>

<html>
	<head>
		<meta charset="utf-8">
		<style type="text/css">
			.product-list{
				background: #fff;
				width: 25%;
				border-right: solid 1px #ddd;
				border-bottom: solid 1px #ddd;
			}
			.title-box-pro-home{
				width:900px;
				margin-bottom: 5px;
				border-bottom: solid 2px #333;
				height: 36px;
				background: #4471c2;
				text-align:left;
				vertical-align:middle;
				padding-top:15px;
			}
			.title-box-pro-home a{
				
				color: white;
				font-weight: bold;
				
			}
		</style>
	</head>
	<body>
			<form method="POST" action="">
			<h1 align=center>Tìm kiếm sản phẩm</h1>
			<center>
			Nhập tên sản phẩm cần tìm:
				<input type=text name=txtKey value="<?php echo $key;?>">
				<select name=slCat>
					<option value=0></option>
					<?php 
					$result1 = $conn->query("select * from categories") or die($conn->error);
					while ($row1 = $result1->fetch_assoc()){
						echo "<option value=".$row1["cid"];
						if ($cat==$row1["cid"]) {
							echo " selected ";
						}
						echo ">".$row1["cname"]."</option>";
					}
					
					?>
				</select>
				<input type=submit value="Tìm kiếm" name=cmd>
			</center>
			</form>
			<?php if ($cmd<>""){ ?>
			<table width=900 align=center border = 0>
				<?php 
					if ($result->num_rows==0){
						echo "<tr><td>Nhóm này chưa có sản phẩm, vui lòng chọn nhóm khác!</td><tr>";	
					} else {
					$i=0;
					while ($rows=$result->fetch_assoc()){
						
						if ($i==0) echo "<tr>";
						$i++;
						echo "<td class=product-list>";
						echo "<img src='images/".$rows["pimage"]."' width=223>";
						echo "<br>";
						
						echo "<a href='product_detail.php?pid=".$rows["pid"]."'>".$rows["pname"]."</a><br>";
						echo "Giá: ".$rows["pprice"]."</td>";
						if ($i==4) {
							echo "</tr>";
							$i=0;
						}
					}
					$conn->close();
					}
				?>
			</table>
			<center>
				<?php 
					for($i=1; $i<=$num_page; $i++){
						if ($i==$page) {
							echo(" ".$i." ");
						} else {
							echo " <a href=?page=$i&txtKey=$key&slCat=$cat&cmd=tk>$i</a> ";
						}
					}
				?>	
			</center>
			<?php } ?>
	</body>
</html>


