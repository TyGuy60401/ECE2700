import argparse
import string

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--filename', default='op_codes.txt')
    
    args = parser.parse_args()

    with open(args.filename) as fin:
        lines = fin.readlines()
    
    translation = str.maketrans('', '', '\n')
    print("type ram_type is array (0 to 255) of std_logic_vector (7 downto 0);")
    print("signal ram: ram_type := (")
    for line in lines:
        line = line.translate(translation)
        line_split = line.split()
        op_code = line_split[0]
        num_spaces = 5 - (len(op_code))

        part_2 = ""
        if len(line_split) > 1:
            part_2 = f"{num_spaces * ' '}X\"{line_split[1]}\",".upper()

        print(f"op_{op_code},{part_2}")
    print("others=>X\"FF\" );")

if __name__ == '__main__':
    main()