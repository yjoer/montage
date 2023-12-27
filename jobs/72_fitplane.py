import argparse
import math
import os
import subprocess


def _parse_header(line):
    return


def parse_table(lines):
    return


with open(os.path.join(os.path.dirname(__file__), "74_util.py")) as f:
    exec(f.read())

parser = argparse.ArgumentParser()

parser.add_argument("--program", help="The program to run", required=True)
parser.add_argument("--input-dir", help="The input directory", required=True)
parser.add_argument("--output-dir", help="The output directory", required=True)
parser.add_argument("--table", help="A metadata table for input images", required=True)
parser.add_argument("--split", help="A split to use", required=True, type=int)
parser.add_argument("--total-splits", help="The total number of splits", required=True, type=int)  # fmt:skip

args = parser.parse_args()

program = args.program
input_dir = args.input_dir
output_dir = args.output_dir
table = args.table
split = int(args.split)
total_split = int(args.total_splits)

with open(table) as f:
    lines = f.readlines()
    t = parse_table(lines)

chunk_size = math.ceil(len(t) / total_split)
ranges = [range(x, min(x + chunk_size, len(t))) for x in range(0, len(t), chunk_size)]

header = "|     plus|    minus|               a|               b|               c|        crpix1|        crpix2|      xmin|      xmax|      ymin|      ymax|      xcenter|      ycenter|       npixel|             rms|            boxx|            boxy|        boxwidth|       boxheight|          boxang|"
header_dict = _parse_header(header)

output_file = open(os.path.join(output_dir, f"fits.{split}.tbl"), "w")

for i in ranges[split]:
    in_file = os.path.join(input_dir, t[i]["diff"])

    command = [program, in_file]
    result = subprocess.run(command, stdout=subprocess.PIPE, text=True)
    print(result.stdout)

    result_dict = (
        result.stdout.replace("[struct ", "")
        .replace("]", "")
        .replace('"', "")
        .replace("\n", "")
        .split(", ")
    )

    result_dict = dict([item.split("=") for item in result_dict])
    row_string = ""

    if split == 0 and i == 0:
        output_file.write(header + "\n")

    for k, v in header_dict:
        if k == "plus":
            row_string += f"{t[i]['cntr1']:>{v}}"
            continue

        if k == "minus":
            row_string += f"{t[i]['cntr2']:>{v}}"
            continue

        row_string += f"{result_dict[k]:>{v}}"

    output_file.write(row_string + "\n")

output_file.close()
