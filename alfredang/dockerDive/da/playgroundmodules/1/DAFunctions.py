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
        Returns the boundaries containing the appropriate information.

        Assumptions:
            - only 1 'objects' block per yaml
            - only 1 'agenda' metadata block per yaml
    '''
    blockSep = '---'
    objectsHeader = 'objects:'
    agendaHeader = '[\s]*agenda:'
    findRight = False

    if re.match('obj[ect]?s?',block_type):
        block_header = objectsHeader
    elif re.match('ag.?n[da]?',block_type):
        block_header = agendaHeader

    for n, line in enumerate(yaml_contents):
        if re.match(block_header,line):
            lBound = n + 1 # items start from after the header is listed
            findRight = True
        if findRight and (re.match(blockSep,line)): # block seperator denotes end of list
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


def yaml_get_objects(yaml_contents: list) -> dict:
    '''
        Returns objects information
    '''
    lb, rb = get_bounding('objects',yaml_contents)

    obj_nameType = {}
    for line in yaml_contents[lb:rb]:
        line=re.sub('-|\s','',line)
        objName, objType = line.split(':')
        obj_nameType[objName] = objType

    return obj_nameType

def yaml_call_object(objName : str):
    value(objName + '.value')
    return

def yaml_form_agenda(yaml_path : str):
    this_file = get_contents(yaml_path)
    all_agenda = yaml_get_agenda(this_file)

    for objName in all_agenda:
        yaml_call_object(objName)
    return

def yaml_form_objects(yaml_path : str):
    this_file = get_contents(yaml_path)
    objs = yaml_get_objects(this_file)

    for objName in objs.keys():
        yaml_call_object(objName)
    return

