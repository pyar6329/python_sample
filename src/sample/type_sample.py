# from typing import NewType, TypeAlias, Union
from typing import *

# 型alias
# UUID = str # 3.9まで
UUID: TypeAlias = str # 3.10から

def jjj():
    # 変数代入時の型宣言
    some_uuid : UUID = 'b20149b3-f549-49cd-b946-f8b4bd28b249'

    # Union Type
    # some_number : Union[int, float] = 1 # 3.9まで
    some_number : int | float = 1 # 3.10から
    another_number : int | float = 2.2
    another_number2 : int | float = 'aaaa'  # NOTE: ここはエラー


    UserId = NewType('UserId', int)
    PlayerId = NewType('PlayerId', int)

    some_id = UserId(12)
    add_id = UserId(2) + PlayerId(3) # エラーにならない
    print(add_id)
    return some_id
