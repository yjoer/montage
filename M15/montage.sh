# Band J
cd band_j

## Part 1
mkdir proj diff corr

mImgtbl images images.tbl
mMakeHdr images.tbl template.hdr
mProjExec -p images images.tbl template.hdr proj stats.tbl
mImgtbl proj/ images_p.tbl
mAdd -p proj/ images_p.tbl template.hdr m15_uncorrected.fits
mViewer -ct 1 -gray m15_uncorrected.fits -1s max gaussian-log -out m15_uncorrected.png

## Part 2
mOverlaps images_p.tbl diffs.tbl
mDiffExec -p proj/ diffs.tbl template.hdr diff
mFitExec diffs.tbl fits.tbl diff

mBgModel images_p.tbl fits.tbl corrections.tbl
mBgExec -p proj/ images_p.tbl corrections.tbl corr

mAdd -p corr/ images_p.tbl template.hdr m15.fits
mViewer -ct 1 -gray m15.fits -1s max gaussian-log -out m15.png

# Band H
cd ../band_h

## Part 1
mkdir proj diff corr

mImgtbl images images.tbl
mMakeHdr images.tbl template.hdr
mProjExec -p images images.tbl template.hdr proj stats.tbl
mImgtbl proj/ images_p.tbl
mAdd -p proj/ images_p.tbl template.hdr m15_uncorrected.fits
mViewer -ct 1 -gray m15_uncorrected.fits -1s max gaussian-log -out m15_uncorrected.png

## Part 2
mOverlaps images_p.tbl diffs.tbl
mDiffExec -p proj/ diffs.tbl template.hdr diff
mFitExec diffs.tbl fits.tbl diff

mBgModel images_p.tbl fits.tbl corrections.tbl
mBgExec -p proj/ images_p.tbl corrections.tbl corr

mAdd -p corr/ images_p.tbl template.hdr m15.fits
mViewer -ct 1 -gray m15.fits -1s max gaussian-log -out m15.png

# Band K
cd ../band_k

## Part 1
mkdir proj diff corr

mImgtbl images images.tbl
mMakeHdr images.tbl template.hdr
mProjExec -p images images.tbl template.hdr proj stats.tbl
mImgtbl proj/ images_p.tbl
mAdd -p proj/ images_p.tbl template.hdr m15_uncorrected.fits
mViewer -ct 1 -gray m15_uncorrected.fits -1s max gaussian-log -out m15_uncorrected.png

## Part 2
mOverlaps images_p.tbl diffs.tbl
mDiffExec -p proj/ diffs.tbl template.hdr diff
mFitExec diffs.tbl fits.tbl diff

mBgModel images_p.tbl fits.tbl corrections.tbl
mBgExec -p proj/ images_p.tbl corrections.tbl corr

mAdd -p corr/ images_p.tbl template.hdr m15.fits
mViewer -ct 1 -gray m15.fits -1s max gaussian-log -out m15.png
