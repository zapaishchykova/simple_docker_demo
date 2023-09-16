import tensorflow as tf
import nibabel as nib
import numpy as np
import matplotlib.pyplot as plt


img = nib.load('data/sub-pixar066_anat_sub-pixar066_T1w.nii.gz')  
image_array, affine = img.get_fdata(), img.affine

fg = plt.figure(figsize=(5, 5), facecolor='k')
plt.imshow(image_array[:, :, 100], cmap='gray')
plt.imsave("output/brain.png", image_array[:, :, 100], cmap='gray')
print("Finito")
    