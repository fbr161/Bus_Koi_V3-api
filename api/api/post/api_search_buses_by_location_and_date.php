<?php
// Headers
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

include_once '../../config/Database.php';
include_once '../../model/Search_Buses_By_Location_and_Date.php';

// Instantiate DB & connect
$database = new Database();
$db = $database->connect();

// Instantiate blog post object
$post = new Search_Buses_By_Location_and_Date($db);

// Get raw posted data
$data = json_decode(file_get_contents("php://input"));

//$phn_no = $_POST["phn_no"];
$from = "Dhaka";
$to = "Rajshahi";
$date = "2021-04-20";

$arr = $post->read($from, $to, $date);

if(!empty($arr)) {
    echo json_encode(array('bus_list' =>$arr));
}


