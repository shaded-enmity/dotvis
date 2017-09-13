#!/usr/bin/env python3
from http.server import SimpleHTTPRequestHandler
from http.server import HTTPServer as BaseHTTPServer
import sys

class CORSRequestHandler (SimpleHTTPRequestHandler):
    def end_headers (self):
        self.send_header('Access-Control-Allow-Origin', '*')
        SimpleHTTPRequestHandler.end_headers(self)

if __name__ == '__main__':
    server = BaseHTTPServer(('', int(sys.argv[1])), CORSRequestHandler)
    server.serve_forever()
