"""Mustache."""

import chevron


if __name__ == '__main__':
    data = {
            'name': 'World'
    }
    with open('sample1.md', 'r') as file:
        output = chevron.render(file, data)
    print(output)
