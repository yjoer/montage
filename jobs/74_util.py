def _parse_header(line):
    stack = []
    start = 0

    col_name = ""
    columns = []

    for idx, character in enumerate(line):
        if character == "|":
            if not stack:
                stack.append("|")
                start = idx
                continue

            if "|" in stack:
                stack.pop()

                columns.append((col_name.strip(), idx - start))
                col_name = ""

                # The end of one column is the beginning of another.
                stack.append("|")
                start = idx
                continue

        col_name += character

    return columns


def parse_table(lines):
    header = False
    columns = []
    rows = []

    for line in lines:
        if line.startswith("\\"):
            continue

        if line.startswith("|"):
            if header:
                continue
            else:
                columns = _parse_header(line)
                header = True
                continue

        start_offset = 0
        row = {}

        for key, value in columns:
            row[key] = line[start_offset : start_offset + value].strip()
            start_offset += value

        rows.append(row)

    return rows
