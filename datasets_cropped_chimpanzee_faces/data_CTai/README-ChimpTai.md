Data
====

**Initially provided data**

 -  provided images: 3905
 -  contained faces: 5078

**Data after pre-processing**

 - useable faces: 4377 (removed annotated faces where identity, age, or age group is not reliably given)
 - identities: 78
 - age groups: 5
 - splits (each split in 80% training of each category, remaining 20% are hold out for testing, instances are randomly selected)

**Keypoints**

 - keypoints are provided for each face as 1 x 10 vector
 - dimensions correspond to x and y coordinate of  'RightEye'  'LeftEye'  'MouthCenter'  'LeftEarlobe'  'RightEarlobe'
 - if no keypoint information is provided, entries are given as Inf


Initial results
===================

**Identification**
>*Baseline*: CNN features, Linear SVM, Cross-validation, ARR, averaged over 5 runs
>*Result*: 76.60% +- 1.25%

**Age estimation**
>*Baseline*: CNN features, GP regression, RBF kernel, L2 error, averaged over 5 runs
>*Result*: error 6.79y +- 0.08y

**Age group classification **
>*Baseline*: CNN features, Linear SVM, Cross-validation, ARR, averaged over 5 runs
>*Result*: 85.33% +- 0.97%

**Gender estimation **
>*Baseline*: CNN features BVLC reference pool5, Linear SVM, Cross-validation, AUC, averaged over 5 runs
>*Result*: 90.49% +- 1.23%