dbruns-docker-php
================

Base docker image to run PHP applications on Apache


Usage
-----

To create the image `dbruns/dbruns-docker-php`, execute the following command on the dbruns-docker-php folder:

	docker build -t dbruns/dbruns-docker-php .


Running your Apache+PHP docker image
------------------------------------

Start your image binding the external ports 80 in all interfaces to your container:

	docker run -d -p 80:80 dbruns/dbruns-docker-php

Test your deployment:

	curl http://localhost/

Hello world!


Loading your custom PHP application
-----------------------------------

In order to replace the "Hello World" application that comes bundled with this docker image,
create a new `Dockerfile` in an empty folder with the following contents:

	FROM dbruns/dbruns-docker-php:latest
	RUN rm -fr /app && git clone https://github.com/username/customapp.git /app
	EXPOSE 80
	CMD ["/run.sh"]

replacing `https://github.com/username/customapp.git` with your application's GIT repository.
After that, build the new `Dockerfile`:

	docker build -t username/my-php-app .

And test it:

	docker run -d -p 80:80 username/my-php-app

Test your deployment:

	curl http://localhost/

That's it!
