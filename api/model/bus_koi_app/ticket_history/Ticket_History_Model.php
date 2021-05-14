<?php

class Ticket_History_Model{

    private $conn;
    public function __construct($db) {$this->conn = $db;}

    //get post
    public function read($user_phn_no)
    {
        $query = "SELECT s.from_loc as from_loc,
                         s.to_loc as to_loc, 
                         TIME(s.date_time) as dep_time,
                        DATE(s.date_time) as dep_date, 
                        s.company_name as company_name, 
                        SUM(t.fare) as fare, 
                        GROUP_CONCAT(seat_no SEPARATOR ',') as booked_seats_no,
                        s.ac_status as ac_status, 
                        schedule_id
                FROM ticket AS t JOIN schedule AS s ON t.schedule_id = s.id
                WHERE t.user_id = '$user_phn_no' and DATE(s.date_time) < CURDATE() 
                GROUP BY schedule_id";  //date formate    2021-04-20

        $stmt = $this->conn->prepare($query);
        $stmt->execute();

        $data = array();
        foreach($stmt as $result){

            $jf['from']=$result['from_loc'];
            $jf['to']=$result['to_loc'];
            $jf['dep_time']=$result['dep_time'];
            $jf['dep_date']=$result['dep_date'];
            $jf['company_name']=$result['company_name'];
            $jf['fare']=$result['fare'];
            $jf['booked_seats_no']=$result['booked_seats_no'];
            $jf['ac_status']=false; if ($result['ac_status']) $jf['ac_status']=true;
            $jf['schedule_id']=$result['schedule_id'];

            array_push($data, $jf);
        }

        return $data;
    }

}