<?php
// Headers
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

include_once '../../../../config/Database.php';
include_once '../../../../model/bus_koi_app/booked_bus_list__and__bus_tracking/Get_Bus_Live_Location_Model.php';

// Instantiate DB & connect
$database = new Database();
$db = $database->connect();

// Instantiate blog post object
$post = new Get_Bus_Live_Location_Model($db);

// Get raw posted data
$data = json_decode(file_get_contents("php://input"));


$schedule_id = "20210520000100022200ha01010";

$arr = $post->read($schedule_id);

if(!empty($arr)) {
    echo json_encode($arr);
}


