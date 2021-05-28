<?php
class Purchase_Ticket_Model
{
    private $conn;
    public function __construct($db){
        $this->conn = $db;
    }

    //get post
    public function purchase($schedule_id, $user_id, $passenger_phn, $passenger_name, $gender, $seat_no, $fare, $issued_by ){

        if($this->checkValidUser($issued_by)==0 ||  $this->checkValid_schedule_id($schedule_id)==0)
            return false;

        $issed_date_time = date("Y-m-d H:i:s")."";
        
        // $ticket_id = 'T'.$this->countTciketRow();
        // $bus_no = $this->getBusNo($schedule_id);
        $flag = 1;

        // if($this->checkValid_bus_no($bus_no)==0)
        //     return false;

        $query ="INSERT INTO ticket ( `schedule_id`, `user_id`, `passenger_phn`, `passenger_name`, `gender`, `seat_no`, `issed_date_time`, `fare`, `issued_by`, `bus_no`) 
                VALUES ('$schedule_id', '$user_id', '$passenger_phn', '$passenger_name', '$gender', '$seat_no', '$issed_date_time', $fare, '$issued_by', '')";

        $cnt = $this->conn->prepare($query);
        $cnt->execute();

        $this->updateSeatCondition($schedule_id, $seat_no);

        return true;
    }

    private function updateSeatCondition($schedule_id, $seat_no){

        $seat_condition_array = explode(",",$seat_no);
        

        foreach($seat_condition_array as $s){

            $query = "UPDATE seat_condition
                        SET $s=0
                        WHERE schedule_id='$schedule_id'";

            $cnt = $this->conn->prepare($query);
            if(!$cnt->execute())
                return false;
        }
        return true;
    }

    private function countTciketRow(){

        $query ="SELECT COUNT(*) AS c FROM ticket";

        $cnt = $this->conn->prepare($query);
        $cnt->execute();

        $ans = 0;
        foreach ($cnt as $r){
            $ans=$r['c'];
        }
        return $ans+1;
    }

    private function getBusNo($schedule_id){

        $query ="SELECT Bus_no AS b
                FROM schedule
                WHERE ID = '$schedule_id'";

        $cnt = $this->conn->prepare($query);
        $cnt->execute();

        $ans = "";
        foreach ($cnt as $r){
            $ans=$r['b'];
        }
        return $ans;
    }

    private function checkValidUser($phn_no){

        $query = "SELECT Phone_no
            FROM user
            WHERE Phone_no='$phn_no'";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        if($stmt->rowCount()>0) {return 1;}

        return 0;
    }

    private function checkValid_schedule_id($id){

        $query = "SELECT ID
            FROM schedule
            WHERE ID='$id'";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        if($stmt->rowCount()>0) {return 1;}

        return 0;
    }

    private function checkValid_bus_no($bus_no){

        $query = "SELECT Bus_no
            FROM bus
            WHERE Bus_No='$bus_no'";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        if($stmt->rowCount()>0) {return 1;}

        return 0;
    }
}
