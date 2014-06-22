<?php 
class Main extends CI_Controller
{
	function __construct(){
		parent::__construct();
		$this->load->library("session");

	}
	function index(){
		// loads
			$this->load->helper('url');
			$this->load->model("mainm");
		// vars 
			$user = $_POST['usuario'];
			$pass = $_POST['pass'];
		$mainModel = new Mainm();
		$resultLogin = new stdClass();
		if(!empty($user) && !empty($pass)){
			$resultLogin = $mainModel->login($user,$pass);		
		}else{
			$resultLogin->estado = false;
		}		
		if($resultLogin->estado){
			$data = array(
				"user" 		=> $user,
				"idUser"	=> $resultLogin->idUser
				);
			$this->session->set_userdata($data);
			$this->load->view('main/index.php');
		}else{
			redirect('/welcome','refresh');
		}
	}
}