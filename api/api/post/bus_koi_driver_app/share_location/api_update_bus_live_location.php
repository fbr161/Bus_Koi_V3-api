<?php
// Headers
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

include_once '../../../../config/Database.php';
include_once '../../../../model/bus_koi_driver_app/share_location/Update_Bus_Live_Location_Model.php';

// Instantiate DB & connect
$database = new Database();
$db = $database->connect();

// Instantiate blog post object
$post = new Update_Bus_Live_Location_Model($db);

// Get raw posted data
$data = json_decode(file_get_contents("php://input"));

$bus_no = "Hanif_1";
$lat = 4;
$lon = 4;


$arr = $post->update($bus_no, $lat, $lon);

if(!empty($arr)) {
    echo json_encode($arr);
}


