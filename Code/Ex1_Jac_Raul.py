import re

def to_snake_case(input_string):
    snake_case_string = re.sub(r'\s+', '_', input_string)
    snake_case_string = snake_case_string.lower()
    return snake_case_string

list = [
    "Hello JavaScript",
    "This is an Example",
    "Convert This String",
    "Python Is Awesome"
]

for string in list:
    print(f"{string} -> {to_snake_case(string)}")
