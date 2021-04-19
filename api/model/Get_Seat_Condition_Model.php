<?php

class Get_Seat_Condition_Model{


    public function __construct($db) {$this->conn = $db;}

    //get post
    public function read($schedule_id)
    {
        $query = "SELECT * FROM seat_condition
                    WHERE schedule_id = '$schedule_id'";  

        $stmt = $this->conn->prepare($query);
        $stmt->execute();

        $data = array();
        $content = [];
        foreach($stmt as $result){

            $content[] = $result;
            
        }

        return $content;
    }

}
