<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

include_once '../../../../config/Database.php';
include_once '../../../../model/bus_koi_app/purchase_ticket/Purchase_Ticket_Model.php';

// Instantiate DB & connect
$database = new Database();
$db = $database->connect();

// Instantiate blog post object
$post = new Purchase_Ticket_Model($db);


// Get raw posted data
$data = json_decode(file_get_contents("php://input"));

$schedule_id = $_POST["schedule_id"];
$user_id = $_POST["user_id"];
$passenger_phn = $_POST["passenger_phn"];
$passenger_name = $_POST["passenger_name"];
$gender = $_POST["gender"];
$seat_no = $_POST["seat_no"];
$fare = $_POST["fare"];
$issued_by = $_POST["issued_by"];

// $schedule_id = "20210520000100022200ha01010";
// $user_id = "user_id";
// $passenger_phn = "0171234";
// $passenger_name = "fuad";
// $gender = true;
// $seat_no = "5A,5B";
// $fare = 500;
// $issued_by = "01739703058";

$b = $post->purchase( $schedule_id, $user_id, $passenger_phn, $passenger_name, $gender, $seat_no, $fare, $issued_by );

if($b) echo json_encode(true);
else echo json_encode(false);

// Get raw posted data