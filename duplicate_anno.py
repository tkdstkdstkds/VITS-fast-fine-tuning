import argparse

def create_map(input_text):
    lines = input_text#input_text.split('\n')
    # create a result_map which key is string, value is list of string
    

    result_map = {}
    
    for line in lines:
        if '|' in line:
            # line remove \n
            line = line.replace('\n', '')

            columns = line.split('|')
            key = columns[1]

            if key in result_map:
                value = result_map[key]
                value.append(line)
            else:
                value = [line]
                result_map[key] = value
    
    return result_map


# parse command line --file test.txt
parser = argparse.ArgumentParser(description='Python Command Line Argument Parser')
parser.add_argument('--anno', type=str, help='character anno file, default is short_character_anno.txt', default='short_character_anno.txt')
parser.add_argument('--mix_anno', type=str, help='character mix output anno file, default is mix_short_character_anno.txt', default='mix_short_character_anno.txt')
# parse command line --mix_count 3
parser.add_argument('--mix_count', type=int, help='character mix count, default is 2', default=2)
args = parser.parse_args()

# load text file by encodeing utf- 8 and read all lines
with open(file=args.anno, encoding='utf-8', mode='r') as f:
    input_text = f.readlines()

output_map = create_map(input_text)

# write text file by encodeing utf- 8
with open(file=args.mix_anno, encoding='utf-8', mode='w') as f:
    for key, value in output_map.items():
        # find current key index in output_map
        key_index = list(output_map.keys()).index(key)

        # for loop value
        for i in range(len(value)):
            f.write(value[i] + '\n')

        #for loop range in mixCount
        for offset in range(1, args.mix_count + 1):
            # find the next key index
            next_key_index = key_index + offset
            if next_key_index >= len(output_map):
                next_key_index = next_key_index - len(output_map)

            # find the next key
            next_key = list(output_map.keys())[next_key_index]
            # find the next value
            next_value = output_map[next_key]
            # next_value replace all next key by current key
            for i in range(len(next_value)):
                f.write(next_value[i].replace(f"|{next_key}|", f"|{key}|") + '\n')




