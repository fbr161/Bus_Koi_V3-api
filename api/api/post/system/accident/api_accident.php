<?php
    // Headers
    header('Access-Control-Allow-Origin: *');
    header('Content-Type: application/json');
    header('Access-Control-Allow-Methods: POST');
    header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

    include_once '../../../../config/Database.php';
    include_once '../../../../model/system/accident/Accident_Model.php';

    // Instantiate DB & connect
    $database = new Database();
    $db = $database->connect();

    // Instantiate blog post object
    $post = new Accident_Model($db);

    // Get raw posted data
    $data = json_decode(file_get_contents("php://input"));
    
    $lat = 25.123941; 
    $lon = 88.592984;
    $schedule_id = "20210520000100022200ha01010";
    

    // $lat = $_POST["lat"]; 
    // $lon = $_POST["lon"];
    // $schedule_id = $_POST["schedule_id"];
    
    $emergency_cntcts = $post->xcute($lat, $lon, $schedule_id);

    if ($emergency_cntcts == false){
        echo json_encode(
            false
        );
        
    } else {
        
        echo json_encode(
            $emergency_cntcts
        );
    }
