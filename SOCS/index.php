<?php

/**
 * Main Index Page
 *
 * @author Ozy
 */
require_once 'config/config.php';

class Index extends Controller {
    
    private $template;
    private $administrator_model;

    public function __construct() {
        parent::__construct();
        
        $this->administrator_model = new User_Model();

        $this->template = new Template();
        $this->template->setPageName('Home');
        $this->template->setContent('login.tpl');
        
    }
    
    public function login(){
        if($this->administrator_model->isExist(trim($_POST['username']), trim($_POST['password']))){

            if($this->administrator_model->getAccount_Type(trim($_POST['username']), trim($_POST['password'])) == "Admin"){
                //Session::set_user($_POST['username']);
                //Session::set_Account_type('Admin');
                $this->setSession('Admin');
                header('Location: /SOCS/administrator/');
            }else if($this->administrator_model->getAccount_Type(trim($_POST['username']), trim($_POST['password'])) == "Student"){
                //Session::set_user($_POST['username']);
                //Session::set_Account_type('Student');
                $this->setSession('Student');
                header('Location: /SOCS/student/');
            }else if($this->administrator_model->getAccount_Type(trim($_POST['username']), trim($_POST['password'])) == "Signatory"){
                //Session::set_user($_POST['username']);
               // Session::set_Account_type('Signatory');
                $this->setSession('Signatory');
                header('Location: /SOCS/signatory');
            }
                        
            exit;
        }else{
            header('Location: index.php?action=login_error');
            exit;
        }
        //$this->administrator_model->isExist(trim($_POST['username']), trim($_POST['password']));
    }
    
    public function logout(){
        Session::destroy();
        $this->template->setAlert('Logout Successfully!', Template::ALERT_SUCCESS);
    }
    
    public function login_error(){
        $this->template->setAlert('Error Logging in... ', Template::ALERT_ERROR);
    }

    public function display() {
        
        if(Session::user_exist()){
            header('Location: /SOCS/administrator');
        }else{
            $this->template->display('simple.tpl');
        }
        
        $this->administrator_model->db_close();
    }
    
    public function setSession($account_type){
        Session::set_user($_POST['username']);
        
        $result = mysql_fetch_array($this->administrator_model->getUser(trim($_POST['username']), trim($_POST['password'])));
        
        Session::set_surname($result['Surname']);
        Session::set_firstname($result['First_Name']);
        Session::set_middlename($result['Middle_Name']);
                
        Session::set_Account_type($account_type);
    }
    
}

$controller = new Index();
$controller->perform_actions();
$controller->display();
?>
