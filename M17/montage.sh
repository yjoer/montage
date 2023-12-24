# Band J
cd band_j

## Part 1
mkdir proj diff corr

mImgtbl images images.tbl
mMakeHdr images.tbl template.hdr
mProjExec -p images images.tbl template.hdr proj stats.tbl
mImgtbl proj/ images_p.tbl
mAdd -p proj/ images_p.tbl template.hdr m17_uncorrected.fits
mViewer -ct 1 -gray m17_uncorrected.fits -1s max gaussian-log -out m17_uncorrected.png

## Part 2
mOverlaps images_p.tbl diffs.tbl
mDiffExec -p proj/ diffs.tbl template.hdr diff
mFitExec diffs.tbl fits.tbl diff

mBgModel images_p.tbl fits.tbl corrections.tbl
mBgExec -p proj/ images_p.tbl corrections.tbl corr

mAdd -p corr/ images_p.tbl template.hdr m17.fits
mViewer -ct 1 -gray m17.fits -1s max gaussian-log -out m17.png

# Band H
cd ../band_h

## Part 1
mkdir proj diff corr

mImgtbl images images.tbl
mMakeHdr images.tbl template.hdr
mProjExec -p images images.tbl template.hdr proj stats.tbl
mImgtbl proj/ images_p.tbl
mAdd -p proj/ images_p.tbl template.hdr m17_uncorrected.fits
mViewer -ct 1 -gray m17_uncorrected.fits -1s max gaussian-log -out m17_uncorrected.png

## Part 2
mOverlaps images_p.tbl diffs.tbl
mDiffExec -p proj/ diffs.tbl template.hdr diff
mFitExec diffs.tbl fits.tbl diff

mBgModel images_p.tbl fits.tbl corrections.tbl
mBgExec -p proj/ images_p.tbl corrections.tbl corr

mAdd -p corr/ images_p.tbl template.hdr m17.fits
mViewer -ct 1 -gray m17.fits -1s max gaussian-log -out m17.png

# Band K
cd ../band_k

## Part 1
mkdir proj diff corr

mImgtbl images images.tbl
mMakeHdr images.tbl template.hdr
mProjExec -p images images.tbl template.hdr proj stats.tbl
mImgtbl proj/ images_p.tbl
mAdd -p proj/ images_p.tbl template.hdr m17_uncorrected.fits
mViewer -ct 1 -gray m17_uncorrected.fits -1s max gaussian-log -out m17_uncorrected.png

## Part 2
mOverlaps images_p.tbl diffs.tbl
mDiffExec -p proj/ diffs.tbl template.hdr diff
mFitExec diffs.tbl fits.tbl diff

mBgModel images_p.tbl fits.tbl corrections.tbl
mBgExec -p proj/ images_p.tbl corrections.tbl corr

mAdd -p corr/ images_p.tbl template.hdr m17.fits
mViewer -ct 1 -gray m17.fits -1s max gaussian-log -out m17.png
