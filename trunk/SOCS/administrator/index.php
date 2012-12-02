<?php

/**
 * Administrator's Index Page
 *
 * @author Ozy
 */
require_once '../config/config.php';

class Index extends Controller {

    private $template;
    private $administrator_model;

    public function __construct() {
        parent::__construct();
        if (Session::user_exist() && Session::get_Account_type() == "Admin") {

            $this->administrator_model = new User_Model();
            $this->template = new Template();
            $this->template->setPageName('Administrator Page');
            $this->template->setContent('dashboard.tpl');
            $this->template->set_UserInfo("" . Session::get_Surname() . ", " . Session::get_Firstname() . " " . Session::get_Middlename() . ".");
            
//            $this->template->set_Name($this->getNameofUser('', 1));
//            $this->template->set_Photos($this->getPictureofUser('', 1));
//            $this->template->set_Type($this->getTypeeofUser('', 1));
            $this->displayTable('', 1);
        } else {
            header('Location: /SOCS/');
        }
    }

    private function getNameofUser($searchName, $page) {
        $name = array();
        $query = $this->administrator_model->getListofUsers($searchName, $page);
        while ($row = mysql_fetch_array($query)) {
            array_push($name, $row['Name']);
        }
        
        return $name;
    }

    private function getPictureofUser($searchName, $page) {
        $picture = array();
        $query = $this->administrator_model->getListofUsers($searchName, $page);
        while ($row = mysql_fetch_array($query)) {
            array_push($picture, $row['Picture']);
        }

        return $picture;
    }

    private function getTypeeofUser($searchName, $page) {
        $type = array();
        $query = $this->administrator_model->getListofUsers($searchName, $page);
        while ($row = mysql_fetch_array($query)) {
            array_push($type, $row['Account_Type']);
        }

        return $type;
    }
    
    public function displayTable($searchName, $page){
        $row = $this->administrator_model->getQueryPageSize($searchName);
        
        //$row = 0;
        $this->template->set_Name($this->getNameofUser($searchName, $page));
        $this->template->set_Photos($this->getPictureofUser($searchName, $page));
        $this->template->set_Type($this->getTypeeofUser($searchName, $page));
        $this->template->set_Filter($searchName);
        $this->template->assign('end', $row);
        
        //echo $searchName;
    }

    public function display() {
        $this->template->display('simple.tpl');
    }

}

$controller = new Index();
$controller->perform_actions();
$controller->display();
?>