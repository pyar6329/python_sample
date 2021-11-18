def print_match(num: int):
    match num:
        case 2:
            print(f'{num}')
        case _:
            print('otherwise')

def correct_info(item):
    """
    it should be return first match
    >>> correct_info({'state': 'open', 'number': 29604, 'title': '[3.9] [docs] Add missing word'})
    {'state': 'open', 'number': 29604, 'title': '[3.9] [docs] Add missing word', 'closed_at': None}
    """
    match item:
        case {'state': 'open', 'number': number, 'title': title}:
            return {'state': 'open', 'number': number, 'title': title, 'closed_at': None}
        case {'state': 'closed', 'number': number, 'title': title, 'closed_at': closed_at}:
            return {'state': 'closed', 'number': number, 'title': title, 'closed_at': closed_at}
        case _:
            return {'state': 'unknown', 'number': None, 'title': None, 'closed_at': None}
