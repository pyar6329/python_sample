#!/usr/bin/env python
from random import randint
import sample.utils as utils
import requests

def main():
    num = randint(1, 3)
    utils.print_match(num)

    utils.foo()

    items = requests.get("https://api.github.com/repos/python/cpython/pulls?state=all").json()
    infos = [ utils.correct_info(item) for item in items ]
    for i in infos:
        print(i)

if __name__ == '__main__':
    main()
