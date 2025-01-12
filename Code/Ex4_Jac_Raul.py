import re

def replace_capitals_and_digits(input_file, output_file):
    pattern = re.compile(r'\b[A-Z0-9]+\b')

    with open(input_file, 'r') as file:
        content = file.read()

    modified_content = pattern.sub('$', content)

    with open(output_file, 'w') as file:
        file.write(modified_content)

input_file = 'C:/Users/raulb/OneDrive/Desktop/FLC_Project_JAC_Raul_Anton_1231EA/Python/Ex4_input.txt'
output_file = 'C:/Users/raulb/OneDrive/Desktop/FLC_Project_JAC_Raul_Anton_1231EA/Python/Ex4_output.txt'
replace_capitals_and_digits(input_file, output_file)
