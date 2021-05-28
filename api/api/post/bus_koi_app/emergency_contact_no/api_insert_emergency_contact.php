<?php
// Headers
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

include_once '../../../../config/Database.php';
include_once '../../../../model/bus_koi_app/emergency_contact_no/Emergency_Contact_No_CRUD_Model.php';

// Instantiate DB & connect
$database = new Database();
$db = $database->connect();

// Instantiate blog post object
$post = new Emergency_Contact_No_CRUD_Model($db);

// Get raw posted data
$data = json_decode(file_get_contents("php://input"));


// $user_phn_no = "01739703058";
// $emergency_contact_phn_no = "016XYZ";
// $emergency_contact_name = "Mr. XYZ";


$user_phn_no = $_POST["user_phn_no"];
$emergency_contact_phn_no = $_POST["emergency_contact_phn_no"];
$emergency_contact_name = $_POST["emergency_contact_name"];

$arr = $post->insert($user_phn_no, $emergency_contact_phn_no, $emergency_contact_name);

if(!empty($arr)) {
    echo json_encode($arr);
}


