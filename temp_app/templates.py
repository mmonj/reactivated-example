from typing import NamedTuple

from reactivated import template


@template
class TempAppIndex(NamedTuple):
    title: str
    message: str
