#!/usr/bin/python3

from bottle import route, run, template, get, static_file
from pprint import pprint

@route('/')
def index(name='Stranger'):
    conn = sqlite3.connect('../db.sqlite')
    c = conn.cursor()

    c.execute("SELECT * FROM hosts")

    data = c.fetchall()

    return template('index', flag=0)

@route('/static/<filepath:path>')
def server_static(filepath):
    return static_file(filepath, root='static')

run(host='localhost', port=8080, reloader=True)