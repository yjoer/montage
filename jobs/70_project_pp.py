import argparse
import math
import os
import subprocess


def parse_table(lines):
    return


with open("74_util.py") as f:
    exec(f.read())

parser = argparse.ArgumentParser()

parser.add_argument("--program", help="The program to run", required=True)
parser.add_argument("--output-dir", help="The output directory", required=True)
parser.add_argument("--table", help="A metadata table for input images", required=True)
parser.add_argument("--template", help="The template to use", required=True)
parser.add_argument("--split", help="A split to use", required=True, type=int)
parser.add_argument("--total-splits", help="The total number of splits", required=True, type=int)  # fmt:skip

args = parser.parse_args()

program = args.program
output_dir = args.output_dir
table = args.table
template = args.template
split = int(args.split)
total_split = int(args.total_splits)

with open(table) as f:
    lines = f.readlines()
    t = parse_table(lines)

chunk_size = math.ceil(len(t) / total_split)
ranges = [range(x, min(x + chunk_size, len(t))) for x in range(0, len(t), chunk_size)]

for i in ranges[split]:
    in_file = t[i]["fname"]
    out_file = os.path.join(output_dir, t[i]["fname"].split("/")[-1])

    command = [program, in_file, out_file, template]
    subprocess.run(command)