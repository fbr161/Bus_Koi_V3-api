<?php

class Get_Bus_No_List_Model{

    private $conn;
    public function __construct($db) {$this->conn = $db;}

    //get post
    public function read($driver_phn_no)
    {
        $query = "SELECT b.Bus_No as bus_no
                FROM `bus` as b JOIN bus_driver_user as d ON b.company_name = d.company_name
                WHERE d.phn_no = '$driver_phn_no'";  

        $stmt = $this->conn->prepare($query);
        $stmt->execute();

        $data = array();
        foreach($stmt as $result){

            $jf['bus_no']=$result['bus_no'];

            array_push($data, $jf);
        }

        return $data;
    }

}