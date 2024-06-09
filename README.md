# DNA-Models-Cancer-Prediction
Research reports 

Report I: DNA-Models-Cancer-Prediction/Report I.pdf at main · migutierrez940605/DNA-Models-Cancer-Prediction (github.com)

Report II: DNA-Models-Cancer-Prediction/Report II.pdf at main · migutierrez940605/DNA-Models-Cancer-Prediction (github.com)

Abstract 

These reports present three methodologies leading to five classification models for predicting oncological diseases from DNA microarray data. This project aims to clean and transform the data of implementing models with the "sensitivity", "specificity", and “accuracy” measures in SQL Server and visualize the results in Tableau to gain insight into which is most efficient for predicting cancer diseases.

1-DNA Microarray Data:

In this research report, 6 binary microarray data sets are studied. A brief description of these data sets is shown in the Table below.

![TABLE DNA](https://github.com/migutierrez940605/DNA-Models-Cancer-Prediction/assets/143429236/4fe87578-b7e1-4d66-bec6-2294ca31d4bb)

The Colon, DLBCL, and Ovarian data sets were downloaded from the Kent Ridge Bio-Medical Repository, from the Agency for Science, Technology, and Research, the CNS/Embryonal-T data set was downloaded from the Dataset Repository, from the Bioinformatics Research Group of Universidad Pablo de Olavide. In contrast, the GLI-85 and SMK-CAN-187 data sets were downloaded from the Feature Selection Dataset repository, from Arizona State University.
The parameters n and p correspond to the number of samples and genes respectively. At the same time, IR represents the imbalance rate defined as the number of samples of negative classes divided by the number of positive classes, according to the IR measure. The data sets that have measured close to 1 are of complexity I and the others are of complexity II.

2-Methodologies

a)The methodology proposed below consists of three stages: 
 
Stage I: Dimension reduction. 

Stage II: Construction of the classification model. 

Stage III: Validation of the classification model. In the first stage, the dimension of the data is reduced using the following linear feature extraction methods: 

Principal component analysis (PCA). 

Supervised Principal Component Analysis (SPCA). 

Partial Least Squares (PLS). 

After having obtained the kth components using the previous methods, a classification model is built by Linear Discriminant Analysis (LDA) using, depending on the data set, the following criteria: For microarray sets that do not present a test set, leave-one-out cross-validation is used. The classification model is built with the training set for microarray sets with a test set, and holdout validation is used for the test set. Finally, the confusion matrix is obtained for each extraction method and the sensitivity (Se), specificity (Es), and accuracy (Ex) measures are used to determine how good the classification model is. These are described in terms of true positives (TP), true negatives (TN), false negatives (FN) and false positives (FP): 

Se= TP /( TP + FN);0⩽Se⩽1 

Es= TN /( TN + FP); 0⩽Es⩽1  

Ex=(TP + TN)/( TP + TN + FN + FP); 0⩽Ex⩽1  

Sensitivity and specificity indicate that the classification model solves the problem of class imbalance, while accuracy shows that the model corrects the issue of data complexity.

b) Double dimension reduction (CUR-PLS).
Next, the methodology is presented, which consists of five stages to obtain a classification model: 

Stage I: Dimension reduction by CUR. 

Stage II: Dimension reduction by feature extraction methods. 

Stage III: Construction of the classification model. 

Stage IV: Validation of the classification model. 

Stage V: Ordering of the variables concerning the latent component. In the first stage, the dimension of the data is reduced using the CUR matrix decomposition to obtain the C matrix. The dimension is reduced from matrix C using the Partial Least Squares method.

After obtaining the kth components using the previous methods, a classification model is built by Linear Discriminant Analysis (LDA), using the following criteria depending on the data set: For microarray sets that do not present a test set, leave-one-out cross-validation is used. The classification model is built with the training set for microarray sets with a test set, and “holdout” validation is used for the test set. Subsequently, the confusion matrix is obtained for each extraction method.

c)Double dimension reduction in parallel (CUR-PLS-Par) 

The Double Dimension Reduction methodology proposed in the previous section considers a model that may not be the most suitable for prediction. To eliminate this problem of selecting the correct model, a methodology is presented whose central idea is to transform the high-dimensional classification problem into several lower-dimensional classification problems, distributing the data in parallel to find a k<p number of variables with a high predictive capacity. This methodology referred to by Double dimension reduction in parallel has six stages, the first four being carried out in parallel. This methodology is presented below: 

Stage I: Dimension reduction by CUR. 

Stage II: Dimension reduction by feature extraction methods. 

Stage III: Construction of the m classification models. 

Stage IV: Validation of the m classification models. 

Stage V: Selection of the best model.

Stage VI: Ordering of the variables concerning the latent component. The first stage consists of reducing the dimension of the data through the CUR matrix decomposition, obtaining m matrices C so that their columns satisfy the inequality. Once the m matrices C are obtained, the dimension is reduced using the following linear feature extraction methods: Principal component analysis, Supervise Principal Component Analysis, and Partial Least Squares. After receiving the kth components using the previous methods, a classification model is built by LDA for each reduced data matrix, using the following criteria depending on the data set: For microarray sets that do not present a test set, leave-one-out cross-validation is used. The classification model is built with the training set for microarray data with a test set, and “holdout” validation is used for the test set. Subsequently, the confusion matrix is obtained for the extraction method used in each m model. 

Results

We use SQL Server to remove the duplicate data and create a column with a type of complexity. In the next link we can see the codes in SQL Server:

DNA-Models-Cancer-Prediction/SQLDataDNA.sql at main · migutierrez940605/DNA-Models-Cancer-Prediction (github.com)

Also, we implemented the methodologies in R, the details are in the reports above. In addition, we create a dynamic Tableau visualization (link below) where we can see the three measure values of each model.

Cancer Predictive Models | Tableau Public


