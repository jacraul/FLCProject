import re

def switch_case_remove_uppercase(input_string):
    switched_case_string = re.sub(r'[a-zA-Z]', lambda x: x.group(0).swapcase(), input_string)
    removed_uppercase_string = re.sub(r'[A-Z]', '', switched_case_string)
    return switched_case_string, removed_uppercase_string

list = [
    "StuDeNT",
    "Hello World",
    "PyThOn PrOgRaMmInG",
    "Regex is FUN"
]

for string in list:
    switched_case, no_uppercase = switch_case_remove_uppercase(string)
    print(f"Original: {string}")
    print(f"Step 1 (Switched Case): {switched_case}")
    print(f"Step 2 (Removed Uppercase): {no_uppercase}")
    print()

