#!/usr/bin/python3

from bottle import route, run, template, get, static_file, request, redirect
import os
import bottle
import socket

script_dir = os.path.dirname(__file__)
bottle.TEMPLATE_PATH.insert(0, os.path.join(script_dir, 'views'))

@route('/')
def index(name='Stranger'):
    file = open('/opt/webshop/config/flag')
    flag = file.readline()
    file.close()
    host_ip = socket.gethostbyname(socket.gethostname())
    hostname=os.system('hostname')
    return template('index',flag=int(flag),host_ip=host_ip,hostname=hostname)

@route('/static/<filepath:path>')
def server_static(filepath):
    return static_file(filepath, root=os.path.join(script_dir, 'static'))

run(host='0.0.0.0', port=8080, reloader=True)