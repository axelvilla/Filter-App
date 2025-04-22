<?php
$host ='localhost';
$dbname ='provincias';
$user ='root';
$pass = '';

try{
    $conn = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $pass);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $sql = "SELECT 
        p.id AS id,
        p.nombre AS provincia,
        p.cantidad_habitantes AS habitantes_provincia,
        c.nombre AS capital,
        c.habitantes_capital,
        r.nombre AS region
    FROM provincia p
        LEFT JOIN capital c ON p.id = c.provincia_id
        LEFT JOIN region r ON p.region_id = r.id
    ORDER BY p.nombre
";
$stmt = $conn->query($sql);
$resultados = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($resultados);


}catch (PDOException $e) {
    echo "Error de conexión: " . $e->getMessage();
    exit;
}
?>
