import re

def plus_one(num):
    return num + 1


def path_convert(fname):
    '''
    Converts pathnames of static files that are served to the user, to the actual yaml file.

    TODO: While this will work when using playground files, I doubt that actual packaged yaml files will function in the same way.
          Perhaps it might be wiser to implement this within the module itself?

          - have a function that checks whether it is within a "playground" or "deployed" status
          - given the playground/deployed state, implement pathConvert accordingly
    '''
    return re.sub('playgroundstatic','playground',fname)

def get_contents(fname):
    with open(fname, 'r') as f:
        return "\n".join(f.readlines())
