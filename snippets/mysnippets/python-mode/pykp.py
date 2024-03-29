# -*- mode: snippet -*-
# name: pykp
# key: pykp
# --
from __future__ import print_function
# import numpy as np
# import numpypy as np
import sys
input = sys.stdin.readline

def eprint(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)
    return

import math
import string
import fractions
from fractions import Fraction
from fractions import gcd

def lcm(n,m):
    return int(n*m/gcd(n,m))

import re
import array
import copy
import functools
import operator

import collections
import itertools
import bisect
import heapq


from heapq import heappush
from heapq import heappop
from heapq import heappushpop
from heapq import heapify
from heapq import heapreplace

from queue import PriorityQueue as pq

def reduce(p, q):
    common = fractions.gcd(p, q)
    return (p//common , q//common )
# from itertools import accumulate
# from collections import deque

import random


def main():
    $1
    return

if __name__ == '__main__':
    main()
