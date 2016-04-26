# itrust-docker

This project allows the deployment of iTrust in Docker containers. The deployment includes a MySQL container and a Tomcat container. Upon startup, the MySQL container initializes its database. Once that's finished, the Tomcat container will insert the sample data into the database and start up its server.

You can see a demo of it in action [here](https://youtu.be/u9OGvEWe3FA).

Note that the `deploy-itrust-docker.sh` script only supports the DNF package manager, but additional distributions can be added very easily. All other commands are distribution-independent.

This guide assumes that you are able to build an iTrust WAR file, so you'll need to have a development environment set up. See [rhefner1/itrust-ansible](https://github.com/rhefner1/itrust-ansible) for help with that.

Here's how to get started:

1. Open your cloned version of iTrust in Eclipse.
2. In the *Package Explorer*, right click the iTrust projec and click *Export*.
3. Under the *Web* folder, select *WAR file* and click *Next*.
4. For *Destination*, click *Browse*.
5. Select the `itrust/itrust-docker/` directory for exporting and click *Finish*.
6. Open a shell and navigate to the root project directory (`/home/wombat/code/itrust` if using the `itrust-ansible` configuration).
7. Run `./itrust-docker/deploy-itrust-docker.sh`
8. Open up your browser to <http://localhost:8888> and proceed as normal!
