Images:

- [M8](https://archive.ph/AWa3I)
- [M15](https://archive.ph/jdhpM)
- [M17](https://archive.ph/Zxagp)

Getting Started:

1. Download M8/M15/M17.tar, move them into M8/M15/M17 directories, and rename to
   images.tar.

   ```
   curl -fsSL -o M8/images.tar https://github.com/yjoer/montage/releases/download/v6.0/M8.tar
   curl -fsSL -o M15/images.tar https://github.com/yjoer/montage/releases/download/v6.0/M15.tar
   curl -fsSL -o M17/images.tar https://github.com/yjoer/montage/releases/download/v6.0/M17.tar
   ```

2. Split images of J/H/K bands into three directories.

   ```
   python3 split.py
   ```

3. Create directories for intermediate results. (HTCondor-only)

   ```
   mkdir band_j/proj band_j/diff band_j/corr band_h/proj band_h/diff band_h/corr band_k/proj band_k/diff band_k/corr
   ```

4. Create a mosaic for each channel.

   ```
   ./montage.sh
   ```

5. Create the colored mosaic.
   ```
   ./montage-colored.sh
   ```

Run a single job:

```
condor_submit p=~/shared_data/montage/M17/band_k jobs/01_imgtbl.submit
```

Run a DAG:

```
cd ~/shared_data/montage/jobs

condor_submit_dag 90_band_parallelism.dag

tail -f 90_band_parallelism.dag.dagman.out
```

Remove logs and output files:

```
cd ~/shared_data/montage
rm -rf **/*.{out,err,log} {M8,M15,M17}/**/*.{out,err,log}
```
