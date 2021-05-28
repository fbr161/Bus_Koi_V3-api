<?php
    // Headers
    header('Access-Control-Allow-Origin: *');
    header('Content-Type: application/json');
    header('Access-Control-Allow-Methods: POST');
    header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

    include_once '../../../../config/Database.php';
    include_once '../../../../model/counter_admin_web/sign_in/Sign_In_Model.php';

    // Instantiate DB & connect
    $database = new Database();
    $db = $database->connect();

    // Instantiate blog post object
    $post = new Sign_In_Model($db);

    // Get raw posted data
    $data = json_decode(file_get_contents("php://input"));
    
    $phn_no = "01712";
    $password = "1234";
    
    // $phn_no = $_POST["phn_no"];
    // $password = $_POST["pass"];
    
    $company_name = $post->signIn($phn_no, $password);

    if ($company_name == false){
        echo json_encode(
            false
        );
        
    } else {
        
        echo json_encode(
            true
        );
        session_start();
        $_SESSION["counter_phn_no"] = $phn_no;
        $_SESSION["company_name"] = $company_name;
    }





    