import csv

def calculate_sum_and_product(input_file, output_file):
    with open(input_file, newline='') as csvfile:
        reader = csv.reader(csvfile)
        next(reader) 
        integers = [int(row[3]) for row in reader]

    print(f"Extracted integers: {integers}")  

    total_sum = sum(integers)
    total_product = 1
    for num in integers:
        total_product *= num

    with open(output_file, 'w') as outfile:
        outfile.write(f'The sum is: {total_sum}\n')
        outfile.write(f'The multiplication is: {total_product}\n')

if __name__ == "__main__":
    input_file = 'C:/Users/raulb/OneDrive/Desktop/FLC_Project_JAC_Raul_Anton_1231EA/Python/Ex7_csv.csv'
    output_file = 'C:/Users/raulb/OneDrive/Desktop/FLC_Project_JAC_Raul_Anton_1231EA/Python/Ex7_output.txt'

    calculate_sum_and_product(input_file, output_file)
