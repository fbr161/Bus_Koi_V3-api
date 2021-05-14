<?php

class Get_Seat_Condition_Model{

    private $conn;
    public function __construct($db) {$this->conn = $db;}

    //get post
    public function read($schedule_id)
    {
        $query = "SELECT * 
                    FROM seat_condition
                    WHERE schedule_id = '$schedule_id'";  

        $stmt = $this->conn->prepare($query);
        $stmt->execute();

        $data = array();
        $content = [];
        foreach($stmt as $result){
            $content[] = $result;
        }

        
        $c = array();
        for ($i=1; $i <count($content[0])/2; $i+=1) { 
            $x = false;
            if ($content[0][$i])
                $x = true;
                
            array_push($c,$x);
        }

        return array("schedule_id" => $schedule_id, "seat_condition" => array_chunk($c, 4), "user_previous_booked_seat_record"=>"");

        // $indx = 1;
        // for ($i=0; $i<10; $i++){
        //     $d = array();
        //     for ($j=0: $j<4; $j++){
        //         array_push($d, $content[0][$indx]);
        //         $indx++;
        //     }
        //     array_push($data, $d);
        // }

        //return $data;
    }

}