<?php

class Search_Buses_By_Location_and_Date{




    public function __construct($db) {$this->conn = $db;}

    //get post
    public function read($from, $to, $date)
    {
        $query = "SELECT ID, dep_time, company_name, ac_status, Fare, available_seats
         FROM daily_schedule as s JOIN bus as b ON s.bus_no=b.Bus_No
         WHERE s.Source_Location='$from' AND Destination_location='$to' AND s.date = '$date'";  //date formate    2021-04-20

        $stmt = $this->conn->prepare($query);
        $stmt->execute();

        $data = array();
        foreach($stmt as $result){

            $jf['schedule_id']=$result['ID'];
            $jf['dep_time']=$result['dep_time'];
            $jf['company_name']=$result['company_name'];
            $jf['ac_status']=$result['ac_status'];
            $jf['Fare']=$result['Fare'];
            $jf['available_seats']=$result['available_seats'];

            array_push($data, $jf);
        }

        return $data;
    }

}