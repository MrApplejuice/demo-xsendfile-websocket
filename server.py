import flask
from flask import Flask, render_template, Response, request
app = Flask(__name__)

@app.route("/websocket")
def websocket():
    response = Response()
    response.headers["X-Accel-Redirect"] = "/internal-websocket"
    response.headers["X-Accel-Buffering"] = "no"
    return response

@app.route("/<name>")
def server_template(name=None):
    return flask.send_from_directory(".", name)
