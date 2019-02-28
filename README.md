# Demo: xsendfile + websocket


A small demo illustrating how to use X-Sendfile/X-Accel of nginx to connect a websocket

# How to use

The demo requires docker to run. So have (Docker)[https://www.docker.com/] installed.

Then issue `bash startcmd.sh [port]` to build and start the container. If port is not specified it will default to port 8000. The built container will run:

* A nginx instance configured to use the nginx [X-Accel feature](https://www.nginx.com/resources/wiki/start/topics/examples/x-accel/) 
  to internally redirect a websocket connection form a served HTML page to a dedicated websocket server.
* An internal flask server to serve static html and modify headers for the internal X-Accel redirect.
* An internal websocket echo-server which serves the websocket connection when connected.

After the server is started, open your web browser and visit http://localhost:[port]/index.html to open the default page. 
The default page will connect to the internal websocket server and display perpetual echos that are sent to the server
and echoed back. Press the Stop button to stop echoing.
