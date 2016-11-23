<?php

namespace AJBundle\Entity;

/**
 * Like
 */
class Like
{
    /**
     * @var integer
     */
    private $id;

    /**
     * @var \AJBundle\Entity\User
     */
    private $user;

    /**
     * @var \AJBundle\Entity\Publication
     */
    private $publication;


    /**
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set user
     *
     * @param \AJBundle\Entity\User $user
     *
     * @return Like
     */
    public function setUser(\AJBundle\Entity\User $user = null)
    {
        $this->user = $user;

        return $this;
    }

    /**
     * Get user
     *
     * @return \AJBundle\Entity\User
     */
    public function getUser()
    {
        return $this->user;
    }

    /**
     * Set publication
     *
     * @param \AJBundle\Entity\Publication $publication
     *
     * @return Like
     */
    public function setPublication(\AJBundle\Entity\Publication $publication = null)
    {
        $this->publication = $publication;

        return $this;
    }

    /**
     * Get publication
     *
     * @return \AJBundle\Entity\Publication
     */
    public function getPublication()
    {
        return $this->publication;
    }
}

