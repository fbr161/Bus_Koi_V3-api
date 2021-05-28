<?php
// Headers
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

include_once '../../../../config/Database.php';
include_once '../../../../model/bus_koi_driver_app/share_location/Get_Bus_No_List_Model.php';

// Instantiate DB & connect
$database = new Database();
$db = $database->connect();

// Instantiate blog post object
$post = new Get_Bus_No_List_Model($db);

// Get raw posted data
$data = json_decode(file_get_contents("php://input"));

$driver_phn_no = "01712XXX";

//$driver_phn_no = $_POST['bus_no'];

$arr = $post->read($driver_phn_no);

if(!empty($arr)) {
    echo json_encode($arr);
}


