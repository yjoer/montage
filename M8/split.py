import gzip
import os
import tarfile

with tarfile.open("images.tar", "r") as tar:
    tar.extractall("images")

target_j = os.path.join("band_j", "images")
target_h = os.path.join("band_h", "images")
target_k = os.path.join("band_k", "images")

os.makedirs(target_j, exist_ok=True)
os.makedirs(target_h, exist_ok=True)
os.makedirs(target_k, exist_ok=True)

for file in os.listdir("images"):
    if not file.endswith(".fits.gz"):
        continue

    new_file = file.replace(".gz", "")

    with gzip.open(os.path.join("images", file), "rb") as f_in:
        if file.startswith("aJ"):
            destination_path = os.path.join(target_j, new_file)
        elif file.startswith("aH"):
            destination_path = os.path.join(target_h, new_file)
        elif file.startswith("aK"):
            destination_path = os.path.join(target_k, new_file)

        with open(destination_path, "wb") as f_out:
            f_out.write(f_in.read())
