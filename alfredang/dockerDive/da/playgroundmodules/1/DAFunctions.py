import re
from docassemble.base.functions import value

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
        return f.readlines()


def get_bounding(block_type : str, yaml_contents : list) -> (int, int):
    '''
        Returns the boundaries containing the objects information.

        Assumptions:
            - only 1 'objects' block per yaml
    '''
    blockSep = '---'
    objectsHeader = 'objects:'
    findRight = False

    if re.match('obj[ect]?s?',block_type):
        block_header = objectsHeader
    for n, line in enumerate(yaml_contents):
        if re.match(objectsHeader,line):
        if re.match(block_header,line):
            lBound = n + 1 # objects start from after the header is listed
            findRight = True
        if findRight and (re.match(blockSep,line)):
            rBound = n
            return (lBound, rBound)

    raise Exception("get_bounding for {} failed".format(block_type))


def yaml_get_agenda(yaml_contents: list) -> list:
    '''
        Returns objects information
    '''
    lb, rb = get_bounding('agenda', yaml_contents)

    agenda_list = []
    for line in yaml_contents[lb:rb]:
        line=re.sub('-|\s','',line)
        agenda_list.append(line)

    return agenda_list


def yaml_get_objects(yaml_contents: list) -> list:
    '''
        Returns objects information
    '''
    lb, rb = get_objects_bounding(yaml_contents)

    obj_list = []
    for line in yaml_contents[lb:rb]:
        line=re.sub('-|\s','',line)
        objName, objType = line.split(':')
        obj_list.append((objName, objType))

    return obj_list

def yaml_call_all_objects(all_objs):
    for objName, objType in all_objs:
        objName = objName + '.value'
        eval(objName)
def yaml_call_object(objName : str):
    value(objName + '.value')
    return

    return

def mainBlock(yaml_path):
    this_file = get_contents(yaml_path)
    objs = yaml_get_objects(this_file)

    yaml_call_all_objects(objs)

    return
