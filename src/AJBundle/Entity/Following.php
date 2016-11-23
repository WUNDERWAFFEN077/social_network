<?php

namespace AJBundle\Entity;

/**
 * Following
 */
class Following
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
     * @var \AJBundle\Entity\User
     */
    private $followed;


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
     * @return Following
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
     * Set followed
     *
     * @param \AJBundle\Entity\User $followed
     *
     * @return Following
     */
    public function setFollowed(\AJBundle\Entity\User $followed = null)
    {
        $this->followed = $followed;

        return $this;
    }

    /**
     * Get followed
     *
     * @return \AJBundle\Entity\User
     */
    public function getFollowed()
    {
        return $this->followed;
    }
}

