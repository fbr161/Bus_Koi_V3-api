<?php

class Update_Bus_Live_Location_Model{

    private $conn;
    public function __construct($db) {$this->conn = $db;}

    //get post
    public function update($bus_no, $lat, $lon)
    {
        if(!$this->checkValidBusNo($bus_no) )
            return false;


        $query ="UPDATE `bus` 
                SET `Last_lat` = '$lat', `Last_lon` = '$lon'
                WHERE `bus`.`Bus_No` = '$bus_no';";

        $cnt = $this->conn->prepare($query);
        $cnt->execute();

        
        return true;
    }

    private function checkValidBusNo($bus_no){

        $query = "SELECT * FROM
         `bus` WHERE Bus_No = '$bus_no'";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        if($stmt->rowCount()>0) {return true;}

        return false;
    }

}