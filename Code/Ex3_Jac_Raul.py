import re

def find_urls(input_file, output_file):
    url_pattern = re.compile(r'https?://(?:www\.)?[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}(?:/[\w./?=&%+-]*)?')
    
    with open(input_file, 'r') as file:
        content = file.read()
    
    urls = url_pattern.findall(content)
    
    with open(output_file, 'w') as file:
        for url in urls:
            file.write(url + '\n')

input_file = 'C:/Users/raulb/OneDrive/Desktop/FLC_Project_JAC_Raul_Anton_1231EA/Python/Ex3_input.txt'
output_file = 'C:/Users/raulb/OneDrive/Desktop/FLC_Project_JAC_Raul_Anton_1231EA/Python/Ex3_output.txt'
find_urls(input_file, output_file)
