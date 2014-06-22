<?php 
class Mainm extends CI_model
{
	function __construct(){
		parent::__construct();
	}
	function login($user,$pass){
		$retorno = new stdClass();
		$sql 	 = "SELECT idUser,COUNT(*) AS existe FROM usuarios WHERE usuario = '$user' AND pass = MD5('$pass') ";
		$this->db->trans_start();
			$query = $this->db->query($sql);
		$this->db->trans_complete();
		if($this->db->trans_status() === false){
			$retorno->estado = false;
		}else{
			$query = $query->result();
			if($query[0]->existe == 1){
				$retorno->estado = true;
				$retorno->idUser = $query[0]->idUser;
			}else{
				$retorno->estado = false;
			}
		}
		return $retorno;
	}
	function register(){
		
	}
}