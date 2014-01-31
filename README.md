Simple Dockerfile for PHP-NGINX
=======================

Dockerfile made for learning purposes, but might come handy for some people.
Basically you create the image, then run it with the proper params and voila! you have a nginx+php (barebones) in a custom port.
By specifying the proper volumes, you can override the www directory for the container nginx, and that way
you can modify your files in your "host" (your "real/actual" computer OS) and the changes will be visible
inside the container and nginx will serve them.

Usage
=====

Building the image
------------------

sudo docker build -rm -t {my-image-name}

- {my-image-name} is the name of the image you're creating, use something descriptive and if possible
prefix it with your username/nickname

Using the image
----------------

sudo docker run -t -p 127.0.0.1:{port}:80 -v [{www-directory}:/var/www:ro] {my-image-name}

- {port} is the local port where you want to route the container 80 port, for example, if you use: 127.0.0.1:81:80
you will be able to browse to: http://localhost:81/
- the volume {www-directory}:/var/www:ro is optional, but when set and a valid {www-directory} is specified (like host's /var/www)
then the nginx in the container will read from this "shared" or "linked" location

What's next?
============

Not much with this, as stated, its just a learning exercise, it was very fun.
If you're interested in watching the glory of docker I highly recommend creating a Dockerfile, its very
straight-forward and ilustrative.
But you if you find this useful, you might want to modify the Dockerfile to add more packages to it, or
I can imagine some people adding this Dockerfile to really simple PHP apps/sites so they can be deployed
almost anywhere with too much hassle (installing nginx, php, configuring it, etc).
