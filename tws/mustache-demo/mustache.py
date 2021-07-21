"""Mustache."""

import chevron
import json
import sys

from argparse import ArgumentParser


def arguments():
    """Arguments."""
    props = {
            'allow_abbrev': False
    }
    parser = ArgumentParser(**props)
    parser.add_argument(
            'template',
            type=str,
            nargs=1
    )
    parser.add_argument(
            'data',
            type=str,
            nargs=1
    )
    return parser


def parse_args(argv):
    """Parse arguments."""
    parser = arguments()
    args = parser.parse_args(argv)
    return args


def execute(args):
    """Execute."""
    process(args.template[0], args.data[0])


def process(template='sample1.md', data='data.json'):
    """Process."""
    with open(data, 'r') as file:
        data = json.load(file)
    with open(template, 'r') as file:
        output = chevron.render(file, data)
    print(output)


if __name__ == '__main__':
    args = parse_args(sys.argv[1:])
    execute(args)
