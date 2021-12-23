from typing import NewType

def jjj():
    UserId = NewType('UserId', int)
    PlayerId = NewType('PlayerId', int)
    some_id = UserId(12)
    add_id = UserId(2) + PlayerId(3)
    print(add_id)
    return some_id
