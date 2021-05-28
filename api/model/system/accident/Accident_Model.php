<?php

class Accident_Model{

    private $conn;

    public function __construct($db) {$this->conn = $db;}

    //get post
    public function xcute($lat, $lon, $schedule_id){

        $hspt_query = "SELECT lat, lon, Hospital_name, Contact_no
                         FROM `hospital` ";  

        $hptl_stmt = $this->conn->prepare($hspt_query);
        if(!$hptl_stmt->execute()) return false;

        $police_query = "SELECT lat, lon, name, contact_no FROM
                         `police` ";

        $police_stmt = $this->conn->prepare($police_query);
        if(!$police_stmt->execute()) return false;

        $user_emergency_cntct_no_query = "SELECT u.Phone_no as user_phn, e.contact_phn_no as emergency_cntct_no
                                            FROM ticket as t JOIN user as u ON u.Phone_no = t.user_id
                                                JOIN emergency_contact_numbers as e ON e.user_phone_no = u.Phone_no
                                            WHERE t.schedule_id = '$schedule_id'";
        
        $user_emergency_cntct_no_stmt = $this->conn->prepare($user_emergency_cntct_no_query);
        if(!$user_emergency_cntct_no_stmt->execute()) return false;


        $hsptl_data = array();
        $police_data = array();
        $users_emergency_cntct_data = array();

        
        //////////////////////////////////////////// Hospital ////////////////////////////////////////
        $min_hspt_dstnc = 9999999999999;
        foreach($hptl_stmt as $result){

            if($this->distance($lat, $lon, $result['lat'], $result['lon']) < $min_hspt_dstnc){
                $hsptl_data['lat'] = $result['lat'];
                $hsptl_data['lon'] = $result['lon'];
                
                $hsptl_data['name'] = $result['Hospital_name'];
                $hsptl_data['contact_no'] = $result['Contact_no'];
                
                $min_hspt_dstnc = $this->distance($lat, $lon, $result['lat'], $result['lon']);
            }

        }

        //////////////////////////////////////////// Police ////////////////////////////////////////
        $min_police_dstnc = 9999999999999;
        foreach($police_stmt as $result){

            if($this->distance($lat, $lon, $result['lat'], $result['lon']) < $min_police_dstnc){
                $police_data['lat'] = $result['lat'];
                $police_data['lon'] = $result['lon'];
                
                $police_data['name'] = $result['name'];
                $police_data['contact_no'] = $result['contact_no'];
                
                $min_police_dstnc = $this->distance($lat, $lon, $result['lat'], $result['lon']);

            }

        }

        //////////////////////////////////////////// Users' emergency contact no  ////////////////////////////////////////
        foreach($user_emergency_cntct_no_stmt as $result){

            array_push($users_emergency_cntct_data, $result['emergency_cntct_no']);

        }


        ///////////////////////////////////////// Insert record to database ///////////////////////////////////////////////
        $cur_date_time = date("Y-m-d H:i:s")."";
        $bus_no = $this->getBusNo($schedule_id);

        $alert_hospital_lat = $hsptl_data['lat'];
        $alert_hospital_lon = $hsptl_data['lon'];
        $hospital_name = $hsptl_data['name'];
        $hospital_cntct_no = $hsptl_data['contact_no'];

        $alert_police_lat = $police_data['lat'];
        $alert_police_lon = $police_data['lon'];
        $police_sttn_name = $police_data['name'];
        $police_sttn_cntct_no = $police_data['contact_no'];

        $cmpny_emrgncy_cntct_no = $this->get_companys_emergency_cntctNo($schedule_id);

        $users_emergency_nmbrs =  implode(",",$users_emergency_cntct_data);

        $data_insert_query = "INSERT INTO `accident_record` (`schedule_record_id`, `bus_no`, `date_time`, `alert_hospital_lat`, `alert_hospital_lon`, `hospital_name`, 
                            `hospital_cntct_no`, `alert_police_lat`, `alert_police_lon`, `police_sttn_name`, `police_sttn_cntct_no`, `cmpny_emrgncy_cntct_no`, `users_emergency_nmbrs`)
                            VALUES ('$schedule_id', '$bus_no', '$cur_date_time', '$alert_hospital_lat', '$alert_hospital_lon', '$hospital_name', 
                            '$hospital_cntct_no', '$alert_police_lat', '$alert_police_lon', '$police_sttn_name', '$police_sttn_cntct_no', '$cmpny_emrgncy_cntct_no', '$users_emergency_nmbrs')";


        $data_insert_stmt = $this->conn->prepare($data_insert_query);
        if(!$data_insert_stmt->execute()) return false;
        

        ////////////////////////////////////////////// returning data //////////////////////////////////
        $data = array();
        array_push($data, $hsptl_data['contact_no']);
        array_push($data, $police_data['contact_no']);
        array_push($data, $cmpny_emrgncy_cntct_no);
        array_push($data, $users_emergency_nmbrs);

        return implode(",",$data);

        
    }
    

    private function get_companys_emergency_cntctNo($schedule_id){

        $query = "SELECT cntct_no
                    FROM `companys_emergency_cntct_no` as c JOIN schedule as s ON c.name = s.company_name
                    WHERE s.id = '$schedule_id'";

        $cnt = $this->conn->prepare($query);
        $cnt->execute();

        $ans = "";
        foreach ($cnt as $r){
            $ans=$r['cntct_no'];
        }
        return $ans;
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


    private function distance($latitudeFrom, $longitudeFrom, $latitudeTo, $longitudeTo, $earthRadius = 6371000){
        // convert from degrees to radians
        $latFrom = deg2rad($latitudeFrom);
        $lonFrom = deg2rad($longitudeFrom);
        $latTo = deg2rad($latitudeTo);
        $lonTo = deg2rad($longitudeTo);

        $latDelta = $latTo - $latFrom;
        $lonDelta = $lonTo - $lonFrom;

        $angle = 2 * asin(sqrt(pow(sin($latDelta / 2), 2) +
                cos($latFrom) * cos($latTo) * pow(sin($lonDelta / 2), 2)));
        return $angle * $earthRadius;
    }

}
