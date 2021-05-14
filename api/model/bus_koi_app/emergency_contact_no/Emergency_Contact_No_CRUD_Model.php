
<?php
class Emergency_Contact_No_CRUD_Model{
    
    private $conn;

    public function __construct($db){
        $this->conn = $db;
    }

    //get post
    public function insert($user_phn_no, $emergency_contact_phn_no, $emergency_contact_name){

        if(!$this->checkValidUser($user_phn_no) ||  $this->isAnyRecord($user_phn_no))
            return false;


        $query ="INSERT INTO `emergency_contact_numbers` 
        (`user_phone_no`, `contact_name`, `contact_phn_no`) VALUES ('$user_phn_no', '$emergency_contact_name', '$emergency_contact_phn_no');";

        $cnt = $this->conn->prepare($query);
        $cnt->execute();

        
        return true;
    }

    public function update($user_phn_no, $emergency_contact_phn_no, $emergency_contact_name){

        if(!$this->checkValidUser($user_phn_no) ||  !$this->isAnyRecord($user_phn_no))
            return false;


        $query ="UPDATE `emergency_contact_numbers` 
                SET `contact_name` = '$emergency_contact_name', `contact_phn_no` = '$emergency_contact_phn_no' 
                WHERE `emergency_contact_numbers`.`user_phone_no` = '$user_phn_no';";

        $cnt = $this->conn->prepare($query);
        $cnt->execute();

        
        return true;
        
    }

    public function read($user_phn_no){

        $query ="SELECT contact_name, contact_phn_no
                FROM `emergency_contact_numbers` 
                WHERE user_phone_no='$user_phn_no'";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();

        $data = array();
        foreach($stmt as $result){

            $jf['contact_name']=$result['contact_name'];
            $jf['contact_phn_no']=$result['contact_phn_no'];

            array_push($data, $jf);
        }

        return $data;
    }

    public function delete($user_phone_no){

        if(!$this->checkValidUser($user_phone_no) ||  !$this->isAnyRecord($user_phone_no))
            return false;

        $query ="DELETE FROM `emergency_contact_numbers`
                WHERE user_phone_no = '$user_phone_no'";

        $cnt = $this->conn->prepare($query);
        $cnt->execute();
        
        return true;
    }

    private function checkValidUser($phn_no){

        $query = "SELECT Phone_no
            FROM user
            WHERE Phone_no='$phn_no'";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        if($stmt->rowCount()>0) {return true;}

        return false;
    }

    private function isAnyRecord($user_phn_no){

        $query = "SELECT *
            FROM emergency_contact_numbers
            WHERE user_phone_no='$user_phn_no'";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        if($stmt->rowCount()>0) {return true;}

        return false;
    }

    
}


