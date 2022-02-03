#!/usr/bin/python3
""" Module that exports data in the CSV format """
import csv
import json
import requests
from sys import argv
import urllib.request


def main():
    """ Method that recordsall tasks that are owned by employee """
    url = 'https://jsonplaceholder.typicode.com'
    user = '{}/users/{}'.format(url, argv[1])
    todos = '{}/todos/?userId={}'.format(url, argv[1])

    # GET info from URLs
    res = requests.get(user)
    info = res.json()
    tasks = requests.get(todos)
    todo = tasks.json()

    file_name = "{}.csv".format(argv[1])

    with open(file_name, 'w', newline='') as file:
        w = csv.writer(file, quoting=csv.QUOTE_ALL)
        for task in todo:
            w.writerow([int(argv[1]), info.get('username'),
                        task.get('completed'), task.get('title')])

if __name__ == "__main__":
    main()
