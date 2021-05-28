<?php

    class sign_in_model{
        private $conn;
        private $table = 'counter_user';


        public function __construct($db){
            $this->conn = $db;
        }

        public function signIn($phn_no, $pass){

            $query = 'SELECT company FROM '
                . $this->table
                . ' WHERE phn_no="' . $phn_no. '" AND password="' . $pass . '";';

            $stmt = $this->conn->prepare($query);
            $stmt->execute();
            if($stmt->rowCount()==0){return false;}

            foreach($stmt as $result){
                return $result['company'];
            }


        }

    }
