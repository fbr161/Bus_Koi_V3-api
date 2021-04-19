<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

include_once '../../config/Database.php';
include_once '../../model/Purchase_Ticket_Model.php';

// Instantiate DB & connect
$database = new Database();
$db = $database->connect();

// Instantiate blog post object
$post = new Purchase_Ticket_Model($db);

$schedule_id = "h1";
$user_phn_no = "0171234";
$seat_no = "1A";
$issed_date_time = "2019-12-10";
$fare = 500;
$issued_by = "self";

$b = $post->purchase($schedule_id, $user_phn_no, $seat_no, $issed_date_time, $fare, $issued_by );

if($b) echo "success";
else echo "failed";

// Get raw posted data