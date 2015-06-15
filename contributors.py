#!/usr/bin/env python
import sys
import requests
import json

LOGIN = None
try:
    with open("login.json", "r") as f:
        login_data = json.load(f)
        if (login_data['user'] and login_data['password']):
            LOGIN = (login_data['user'],
                     login_data['password'])
except:
    print("Couldn't open file 'login.json'.")
    sys.exit()


def apiRequestLeft():
    resp = requests.get("https://api.github.com/rate_limit",
                        auth=LOGIN)
    if(resp.ok):
        data = json.loads(resp.content)
        return data['rate']['remaining']
    else:
        return 0

if not (apiRequestLeft):
    print("No API requests left to load contributors list. ")
    if(LOGIN is None):
        print ("To get more API requests enter your login data into " +
               "'login.json'")
    sys.exit()

resp = requests.get("https://api.github.com/repos/matze/mtheme/contributors",
                    auth=LOGIN)

latex_string = "\\begin{itemize}\n"
if(resp.ok):
    data = json.loads(resp.content)
    extracted_data = ((c['login'], c['html_url'], c['url']) for c in data)
    for user_name, html_url, url in extracted_data:
        resp = requests.get(url, auth=LOGIN)
        if(resp.ok):
            user_data = json.loads(resp.content)
            try:
                name = user_data['name']
            except:
                name = ""
        else:
            if not (apiRequestLeft):
                name = "Couldn't load name. API request limit exceeded."
            else:
                "Couldn't load name."
        latex_string += str("    \\item \\href{%s}{%s} %s\n" % (html_url,
                                                                user_name,
                                                                name))
else:
    latex_string += "    \\item Couldn't load contributors.\n"
latex_string += "\\end{itemize}\n"

try:
    with open("contributors.tex", "w") as f:
        f.write(latex_string)
        print("Successfully written data to file.")
        print(latex_string)
except IOError:
    print("Error writing to file.")
