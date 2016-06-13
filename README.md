COPYRIGHT
=========

This dataset can be used for any non-commercial purpose, e.g., research or education, given that the following paper is adequately cited:

>*Alexander Freytag and Erik Rodner and Marcel Simon and Alexander Loos and Hjalmar Kühl and Joachim Denzler:* **"Chimpanzee Faces in the Wild: Log-Euclidean CNNs for Predicting Identities and Attributes of Primates"**, German Conference on Pattern Recognition (GCPR), 2016 .

![Chimpanzee faces from CZoo (top) and CTai (bottom)](http://www.inf-cv.uni-jena.de/dbvmedia/de/Research/Fine_grained+Recognition/dataset_chimpanzee_faces/chimpanzee_faces_teaser.png)

PROVIDED DATA
=========

**Images**   

We provide two datasets of cropped chimpanzee faces: CZoo and CTai.  For details of both datasets, please refer to the corresponding paper (e.g., available at [this pdf link](http://hera.inf-cv.uni-jena.de:6680/pdf/Freytag16_CFW.pdf) ).  

**Labels**   
In addition to the pure images, the dataset comes with annotations of identity, gender, age, and age group. All annotations have been provided by experts.  More details about statistics of data are shown in the supplementary material (e.g., available at [this pdf link](http://hera.inf-cv.uni-jena.de:6680/supplementary/Freytag16_CFW.pdf) ).  

**Train/Test Splits**   
We provide five splits intro train and test which have been used to produce the results in Table 1 of the GCPR'16 paper. The demo script (see below) shows how to access data accordingly.


HOW TO ACCESS
=========

Access via Matlab (recommended)
-------------------------------

We provided a tiny matlab script which loads one of the datasets, requests the splits, and loops through the images. Depending on your needs, you might want to use this as a starting point for your own evaluations.
>cd demo_access_data/  
>demo_chimp_loading  

![Results of our attribute prediction models](http://www.inf-cv.uni-jena.de/dbvmedia/de/Research/Fine_grained+Recognition/Freytag16_CFW_teaser_wide.png)

Access via Textfiles (not recommended)
-------------------------------
For persons without access to Matlab, we additionally provide the entire set of attributes in a separate text file for each dataset. To read all data, go to the dataset directory:

> cd datasets_cropped_chimpanzee_faces/data_CZoo/   

and look into the provided annotations file:
>vim annotations_czoo.txt

Layout of the annotations is as follows. 

 - all information for a single image in one line
 - fields are separated by white space
 - linebreak is done by \n
 - Keypoints are given as (x-coordinate y-coordinate) pairs

Order of fields is

 1. Filename *(string)*
 2. Age *(float, NaN if unavailable)*
 3. Age_Group *(string, Unknown if unavailable)*
 4. Gender *(string, Unknown if unavailable)*
 5. Keypoint RightEye *(int, Inf if unavailable)*
 6. Keypoint LeftEye *(int, Inf if unavailable)*
 7. Keypoint MouthCenter *(int, Inf if unavailable)*
 8. Keypoint LeftEarlobe *(int, Inf if unavailable)*
 9. Keypoint RightEarlobe *(int, Inf if unavailable)*



ACKNOWLEDGEMENTS
=========
The authors thank Peter Pan and Cinderella from Leipzig Zoo for providing and annotating the collection of ape images.