Images:

- [M8](https://archive.ph/AWa3I)
- [M15](https://archive.ph/jdhpM)
- [M17](https://archive.ph/Zxagp)

Getting Started:

1. Download M8/M15/M17.tar, move them into M8/M15/M17 directories, and rename to
   images.tar.

2. Split images of J/H/K bands into three directories.
   ```
   python split.py
   ```

3. Create a mosaic for each channel.
   ```
   ./montage.sh
   ```

4. Create the colored mosaic.
   ```
   ./montage-colored.sh
   ```
