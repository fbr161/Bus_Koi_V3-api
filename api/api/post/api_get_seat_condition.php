<?php
// Headers
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

include_once '../../config/Database.php';
include_once '../../model/Get_Seat_Condition_Model.php';

// Instantiate DB & connect
$database = new Database();
$db = $database->connect();

// Instantiate blog post object
$post = new Get_Seat_Condition_Model($db);

// Get raw posted data
$data = json_decode(file_get_contents("php://input"));

//$phn_no = $_POST["phn_no"];
$schedule_id = "h1";

$arr = $post->read($schedule_id);

if(!empty($arr)) {
    echo json_encode(array('seat_condition' => $arr));
}
