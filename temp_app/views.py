from django.http import HttpRequest, HttpResponse

from .templates import TempAppIndex


def index(request: HttpRequest) -> HttpResponse:
    return TempAppIndex(title="Hello, World!", message="Welcome to the Temp App!").render(request)
