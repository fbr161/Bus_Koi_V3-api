<?php

class Get_Bus_Live_Location_Model{

    private $conn;
    public function __construct($db) {$this->conn = $db;}

    //get post
    public function read($schedule_id)
    {
        $query = "SELECT b.Last_lat as lat,
                     b.Last_lon as lon
                    FROM bus as b JOIN schedule as s ON s.bus_no = b.Bus_No 
                    WHERE s.id = '$schedule_id'";  //date formate    2021-04-20

        $stmt = $this->conn->prepare($query);
        $stmt->execute();

        $data = array();
        foreach($stmt as $result){

            // $jf['schedule_id']=$schedule_id;
            $jf['last_Lat']=$result['lat'];
            $jf['last_Lon']=$result['lon'];

            return $jf;

            array_push($data, $jf);
        }

        return $data;
    }

}
