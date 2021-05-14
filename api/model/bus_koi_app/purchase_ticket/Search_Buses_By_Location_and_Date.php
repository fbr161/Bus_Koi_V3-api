<?php

class Search_Buses_By_Location_and_Date{

    private $conn;

    public function __construct($db) {$this->conn = $db;}

    //get post
    public function read($from, $to, $date)
    {
        $query = "SELECT ID, TIME(date_time) as dep_time, company_name, ac_status, Fare, available_seats
         FROM schedule 
         WHERE from_loc='$from' AND to_loc='$to' AND DATE(date_time) = '$date'";  //date formate    2021-04-20

        $stmt = $this->conn->prepare($query);
        $stmt->execute();

        $data = array();
        foreach($stmt as $result){

            $jf['schedule_id']=$result['ID'];
            $jf['dep_time']=$result['dep_time'];
            $jf['company_name']=$result['company_name'];
            $jf['ac_status']=false; if ($result['ac_status']) $jf['ac_status']=true;
            $jf['fare']=$result['Fare'];
            $jf['available_seats']=$result['available_seats'];

            array_push($data, $jf);
        }

        return $data;
    }

}