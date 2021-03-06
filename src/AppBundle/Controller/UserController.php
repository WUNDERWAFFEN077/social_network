<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\Session;
use AJBundle\Entity\User;
use AppBundle\Form\RegisterType;
use AppBundle\Form\UserType;

class UserController extends Controller
{
    private $session;
    
    public function __construct(){
        $this->session = new Session();
    }
    
    public function loginAction(Request $request)
    {
        //SI EXISTE UN USUARIO LOGUEADO, REDIRIGIR A HOME
        if(is_object($this->getUser())){
            return $this->redirect('home');
        }
        
        $authenticationUtils = $this->get('security.authentication_utils');
        
        $error = $authenticationUtils->getLastAuthenticationError();
        
        $lastUsername = $authenticationUtils->getLastUsername();
        
        return $this->render("AppBundle:User:login.html.twig", array(
            'last_username' => $lastUsername,
            'error' => $error
            ));
    }
    
    public function registerAction(Request $request)
    {
        //SI EXISTE UN USUARIO LOGUEADO, REDIRIGIR A HOME
        if(is_object($this->getUser())){
            return $this->redirect('home');
        }
        
        $user = new User();
        
        $form = $this->createForm(RegisterType::class,$user);
        $form->handleRequest($request);
        
        if($form->isSubmitted() && $form->isValid()){
            $em = $this->getDoctrine()->getManager();
            
            //VALIDAR CORREO Y NICK, QUE NO SE REPITA
            $query = $em->createQuery("SELECT u FROM AJBundle:User u WHERE u.email = :email OR u.nick = :nick")
                ->setParameter('email',$form->get('email')->getData())
                ->setParameter('nick',$form->get('nick')->getData())
                ;
                
            $usser_isset = $query->getResult();
            
            $password = $form->get('password')->getData();
            if(count($usser_isset)==0){
                $factory = $this->get("security.encoder_factory");
    		    $encoder = $factory->getEncoder($user);
                $encoded = $encoder->encodePassword($password,$user);
                
                $user->setPassword($encoded);
                $user->setRole("ROLE_USER");
                $user->setImage(null);
                
                $em->persist($user);
                $flush = $em->flush();
                
                if($flush == null){
                    $status = "Te has registrado correctamente.";
                    
                    $this->session->getFlashBag()->add("mensaje",$status);
                    return $this->redirect("login");
                }else{
                    $status = "No te has registrado correctamente";
                }
            }else{
                $status = "El usuario ya existe.";
            }
            
            $this->session->getFlashBag()->add("mensaje",$status);
            
        }
        
        return $this->render("AppBundle:User:register.html.twig", array(
            "form" => $form->createView()
        ));
    }
    
    public function nickTestAction(Request $request){
         
        $nick = $request->get('nick');
        $em = $this->getDoctrine()->getManager();
        $user_repo = $em->getRepository("AJBundle:User");
        $user_isset = $user_repo->findOneBy(array('nick'=>$nick));
        
        $result = "used";
        
        if(count($user_isset)>=1 && is_object($user_isset)){
            $result = "used";
        }else{
            $result = "unused";
        }
        
        return new Response($result);
    }
    
    public function editUserAction(Request $request){
        $user = $this->getUser();//Recoger Objeto del Usuario logueado
        $user_image = $user->getImage();
        
        $form = $this->createForm(UserType::class,$user);
        $form->handleRequest($request);
        
        if($form->isSubmitted() && $form->isValid()){
            $em = $this->getDoctrine()->getManager();
            
            //VALIDAR CORREO Y NICK, QUE NO SE REPITA
            $query = $em->createQuery("SELECT u FROM AJBundle:User u WHERE u.email = :email OR u.nick = :nick")
                ->setParameter('email',$form->get('email')->getData())
                ->setParameter('nick',$form->get('nick')->getData())
                ;
                
            $user_isset = $query->getResult();
            
            if(count($user_isset)==0 || ($user->getEmail() == $user_isset[0]->getEmail() && $user->getNick() == $user_isset[0]->getNick())){
                
                $file = $form['image']->getData();
                if(!empty($file) && $file != null){
                    $ext = $file->guessExtension();
                    if($ext == 'jpg' || $ext == 'jpeg' || $ext == 'png' || $ext == 'gif' ){
                        $file_name = $user->getId().time().'.'.$ext;
                        $file->move('uploads/users',$file_name);
                        $user->setImage($file_name);
                    }
                    
                }else{
                    $user->setImage($user_image);
                }
                
                
                $em->persist($user);
                $flush = $em->flush();
                
                if($flush == null){
                    $status = "Datos actualizado correctamente.";
                    
                }else{
                    $status = "No se ha modificado correctamente.";
                }
            }else{
                $status = "No se han actualizado tus datos.";
            }
            
            $this->session->getFlashBag()->add("mensaje",$status);
            return $this->redirect('my-data');
            
        }
        
        return $this->render("AppBundle:User:edit_user.html.twig",array(
            'form' => $form->createView()
            ));
    }
    
    
    public function usersAction(Request $request){
        $em = $this->getDoctrine()->getManager();
        $dql = "SELECT u FROM AJBundle:User u Order By u.id";
        $query = $em->createQuery($dql);
        
        $paginator = $this->get('knp_paginator');
        $pagination = $paginator->paginate(
            $query, $request->query->getInt('page',1),
            5
        );
        return $this->render('AppBundle:User:users.html.twig', 
        array('pagination'=> $pagination));
    }
    
    public function searchAction(Request $request){
        $search = $request->get('search',null);
        if($search == null){
            return $this->redirect($this->generateURL('home_publications'));
        }
        
        $em = $this->getDoctrine()->getManager();
        $dql = "SELECT u FROM AJBundle:User u 
        WHERE u.name LIKE :search OR u.surname LIKE :search 
        Order By u.id";
        $query = $em->createQuery($dql)->setParameter('search',"%$search%");
        
        $paginator = $this->get('knp_paginator');
        $pagination = $paginator->paginate(
            $query, $request->query->getInt('page',1),
            5
        );
        return $this->render('AppBundle:User:users.html.twig', 
        array('pagination'=> $pagination));
    }
    
    
}
