"""
Enable routes with SimpleHTTPServer.

Written by Huy Nguyen.
See http://www.huyng.com/posts/modifying-python-simplehttpserver/
"""

import sys
import os
import posixpath
import urllib
import BaseHTTPServer
from SimpleHTTPServer import SimpleHTTPRequestHandler

PORT = 9090

"""
modify this to add additional routes, eg
    [url_prefix ,  directory_path]
"""
ROUTES = (
    ['/toolz', '/Users/noahsussman/git/Arcane/html_can_not_do_that/lib/site'],
    ['',       '.']  # empty string for the 'default' match
) 

class RequestHandler(SimpleHTTPRequestHandler):
    
    def translate_path(self, path):
        """translate path given routes"""

        # set default root to cwd
        root = os.getcwd()
        
        # look up routes and set root directory accordingly
        for pattern, rootdir in ROUTES:
            if path.startswith(pattern):
                # found match!
                path = path[len(pattern):]  # consume path up to pattern len
                root = rootdir
                break
        
        # normalize path and prepend root directory
        path = path.split('?',1)[0]
        path = path.split('#',1)[0]
        path = posixpath.normpath(urllib.unquote(path))
        words = path.split('/')
        words = filter(None, words)
        
        path = root
        for word in words:
            drive, word = os.path.splitdrive(word)
            head, word = os.path.split(word)
            if word in (os.curdir, os.pardir):
                continue
            path = os.path.join(path, word)

        return path

if not sys.argv[1:]:
    sys.argv.append(PORT)

if __name__ == '__main__':
    BaseHTTPServer.test(RequestHandler, BaseHTTPServer.HTTPServer)
