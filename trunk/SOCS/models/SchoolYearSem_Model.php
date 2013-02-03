<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of SchoolYearSem
 *
 * @author ronversa09
 */
class SchoolYearSem_Model extends Model{
    private $query;
    
    public function __construct() {        
        parent::__construct();
        
        $this->query = "";
    }
    
    public function getSchool_Year(){
        $arrayTemp = array();
        $this->query = mysql_query("SELECT School_Year from schoolyearsem group by School_Year");
        
        while($row = mysql_fetch_array($this->query)){
            array_push($arrayTemp, $row['School_Year']);
        }
        
        return $arrayTemp;
    }
    
    public function getSy_ID($sy, $sem){
        $this->query = mysql_query("select SY_SEM_ID from schoolyearsem where School_Year = '$sy' AND Semester = '$sem'");
        $row = mysql_fetch_array($this->query);
        
        return $row['SY_SEM_ID'];
    }
    
    public function getCurSemester(){
        $row = explode("-", date("Y-m-d"));
        $curMonth = $row[1];
        
        if($curMonth >= 1 && $curMonth <= 3){
            return "Second";
        }else if($curMonth >= 6 && $curMonth <= 10){
            return "First";
        }else if($curMonth >= 11 && $curMonth <= 12){
            return "Second";
        }else{
            return "Summer";
        }
    }
    
    public function getCurSchool_Year(){
        $row = explode("-", date("Y-m-d"));
        $curYear = $row[0];
        $curMonth = $row[1];
        
        if($this->getCurSemester() == "First"){
            return $curYear ."-" .($curYear +1);
        }elseif ($this->getCurSemester() == "Second"){
            if($curMonth >= 11 && $curMonth <= 12){
                return $curYear ."-" .($curYear +1);
            }else{
                return ($curYear - 1) ."-" .$curYear;
            }
        }else{
             return ($curYear - 1) ."-" .$curYear;
        }
    }
    
    
    /*=========== for registration purposes =================*/
    
    public function getListOfYear(){
        $array_temp = array();
        
        $temp_year = $this->getSchool_Year();
        $first = $temp_year[0];
        $last = $temp_year[count($temp_year) - 1];
        
        $first = explode("-", $first);
        $last = explode("-", $last);
        
        $first = $first[0];
        $last = $last[1];
        
        for ($index = $first; $index <= $last; $index ++) {
            array_push($array_temp, $index);
        }
        
        return $array_temp;
    }
}

?>