#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Feb 20 14:38:33 2020

@author: justin
"""
import random
import argparse

path_to_dict = './1-1000.txt'
filename = 'f1.txt'

wordlist = [line.rstrip('\n') for line in open(path_to_dict)]


def file_gen(filename, size=100):
    curr_size = 0
    with open(filename, "w") as f:
        while curr_size < size:
            word = random.choice(wordlist)
            if size - curr_size < len(word):
                # fill
                filler = size - curr_size
                while filler > 1:
                    f.write(' ')
                    filler -= 1
                f.write('\n')
                break
            f.write(word)
            f.write('\n')
            curr_size += len(word) + 1

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Create a wordlist file of certain size.')
    parser.add_argument('filename', metavar='o', type=str, 
                    help='name of the output file')
    parser.add_argument('size', metavar='s', type=int,
                    help='size of the output file (in bytes)')
    args = parser.parse_args()
    
    file_gen(args.filename, args.size)
    print('Done.')