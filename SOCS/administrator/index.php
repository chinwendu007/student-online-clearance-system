<?php

/**
 * Administrator's Index Page
 *
 * @author Ozy
 */
require_once '../libs/Controller.php';

class Index extends Controller{
    
    public function __construct() {
        parent::__construct();
        
    }

    public function display() {
      
    }
}

$controller = new Index();
$controller->perform_actions();
$controller->display();

?>
