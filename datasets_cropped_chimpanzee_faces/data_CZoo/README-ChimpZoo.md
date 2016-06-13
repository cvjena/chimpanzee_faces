Data
====

**Initially provided data**

 -  provided images: 1791
 -  contained faces: 2109

**Data after pre-processing**

 - useable faces: 2109
 - identities: 24
 - age groups: 4
 - splits (each split in 80% training of each category, remaining 20% are hold out for testing, instances are randomly selected)

**Keypoints**

 - keypoints are provided for each face as 1 x 10 vector
 - dimensions correspond to x and y coordinate of  'RightEye'  'LeftEye'  'MouthCenter'  'LeftEarlobe'  'RightEarlobe'
 - if no keypoint information is provided, entries are given as Inf


Initial results
===================

**Identification**
>*Baseline*: CNN features BVLC reference pool5, Linear SVM, Cross-validation, ARR, averaged over 5 runs 
>*Result*: 89.17% +- 1.07%

**Age estimation**
>*Baseline*: CNN features BVLC reference pool5, GP regression, RBF kernel, L2 error, averaged over 5 runs
>*Result*: error 4.51y +- 0.06y

**Age group classification **
>*Baseline*: CNN features BVLC reference pool5, Linear SVM, Cross-validation, ARR, averaged over 5 runs
>*Result*: 89.95% +- 1.90%
   
**Gender estimation **
>*Baseline*: CNN features BVLC reference pool5, Linear SVM, Cross-validation, AUC, averaged over 5 runs
>*Result*: 96.61% +- 1.07%
