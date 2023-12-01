<?php
    include 'connect.php';
    $pid = $_GET['pid'];

    $sql = "SELECT p.pid, p.pname, p.pdesc, p.pimage, p.pprice, p.pquantity, p.pinsertdate, p.pupdatedate, c.cid, c.cname, p.pstatus 
            FROM product p 
            INNER JOIN categories c ON p.cid = c.cid 
            WHERE p.pid = $pid";

    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            echo "Product Name: " . $row["pname"]. "<br>";
            echo "Description: " . $row["pdesc"]. "<br>";
            echo "Price: " . $row["pprice"]. "<br>";
            echo "Quantity: " . $row["pquantity"]. "<br>";
            echo "Image: <br>" ;
            echo "<img src='images/".$row["pimage"]."' width=223>";
        }
    } else {
        echo "No product found with pid: $pid";
    }

    $conn->close();
?>
