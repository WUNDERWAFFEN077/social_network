<?php

namespace AJBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();
        $user_repo = $em->getRepository('AJBundle:User');
        
        $user = $user_repo->find(1);
        
        print_r($user);die();
        
        return $this->render('AJBundle:Default:index.html.twig');
    }
}
