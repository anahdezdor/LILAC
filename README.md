# LILAC

# Some traits in personality and attitude measurement, particularly clinical traits and extreme beliefs have extreme (rightly skewed) item distributions and are possibly best modeled by assuming that there are unipolar. A unipolar trait is one that is not equally meaningful at both ends of the continuum. For example, in a clinical scale that measures symptoms, the low end merely reflects absence of pathology (low relevance/meaning). In contrast, the upper end reflects the different levels of severity of those people who suffer from the pathology, and so, is far more relevant or meaningful (Reise et al. 2018).
# Item response models for items measuring unipolar trait have been proposed so far for binary and graded items (Lucke, 2013, 2015, Reise et al., 2018). Our LILAC program fits a continuous version of Lucke’s Log-Logistic model intended for items with a response format that can be considered (approximately) as continuous, such as graded responses with a sizable number of points, feeling thermometers, visual analogues scales etc. The model is named LL-C.
# The program usage is now described: it consists of a main function called “LILAC.R” that, in turn, calls other sub-functions for: 
# The program usage is now described: it consists of a main function called “LILAC.R” that, in turn, calls other sub-functions for: 
#   (a)	Data – preprocessor: the original item scores are linearly re-scaled in order to obtain finite transformed scores in the range 0.01 to 0.99. 
#   (b)	Item calibration and goodness of fit assessment:  The calibration step is implemented through a sub-function that, in turn, needs the 'cfa' function from the lavaan package (Rosseel, 2012). The ‘cfa’ function requires a model syntax object to be specified. (See below for details).
#   (c)	Individual scoring and conditional/marginal reliability assessment: the user can choose between maximum likelihood (ML) or Bayes expected a posteriori (EAP) scoring. ML or EAP Factor score point estimates and amount of information (if the user chooses ML) or posterior standard deviation (PSD) (if  EAP is chosen) are obtained. From these results, conditional and marginal reliability estimates for the corresponding scores are next computed and reported. 
# The function usage is as follows: 
# LL_C(data, type, model, estimator, method) 
# In which the arguments are: 
# # •	data: a data frame of raw scores. These scores can be in graded or Continuous (e.g. visual analogue) format.
# # •	type: determines the type of data that has been entered. A “0” should be put if the data is in a continuous format already scaled from 0 to 1, “1” if the data is in a continuous scale in a different interval from 0 to 1; and “2” if the data are on a graded format.
# # •	model: model description using lavaan syntax. A V and the number of the item that is to be referred to will be used as variable names. For example, to name “item 1”, the expression “V1” will be used.
# # •	estimator: all lavaan estimators are available for calibration: ML, GLS, WLS, DWLS, ULS, DLS. PML as well as their robust variants. 
# # •	method: refers to the scoring choices of which two are provided: maximum likelihood “ML” or Bayes expected a posteriori “EAP”. 

# The LILAC output is saved directly in a txt file named: “LILACresults.txt” and consists of several modules:
# (1)	The first module contains the item parameter estimates of the LL-C model. For each item there are: intercept (alpha), slope (beta) standard error of beta and difficulty index (delta).
# (2)	The second module displays the goodness of fit results, and returns all the fit indices computed by lavaan. The user can decide which of these indices will use in her/his report.
# (3)	For each respondent, the third module includes (a) the factor score point estimate, (b) the amount of information or PSD (depending on the type of scoring chosen by the user) and (c) the conditional reliability.
# (4)	The last module, finally, provides the marginal reliability for all set of scores as a whole.
# As a working example, a database (“LILAC.dat”) has been made available to anyone interested in testing the program. The needed commands are found in the file commands.R
# At the moment of making LILAC available, the theoretical foundations and detailed description of the model have been submitted as a research paper. We expect to be able to provide a detailed guide in the near future.

 
# Lucke, J. F. (2013). Positive trait item response models. In R. E. Millsap, L. A. van der Ark, D. M. Bolt, and C. M. Woods (Eds.), New developments in quantitative psychology (pp. 199–213). Springer. 
# Lucke, J. F. (2015). Unipolar item response models. In S. P. Reise and D. A. Revicki (Eds.), Handbook of item response theory modeling: Applications to typical performance assessment (pp. 272–284). Routledge/Taylor & Francis Group. https://doi.org/10.4324/9781315736013 
# Reise, S. P., Rodriguez, A., Spritzer, K. L., & Hays, R. D. (2018). Alternative approaches to addressing non-normal distributions in the application of IRT models to personality measures. Journal of Personality Assessment, 100, 363–374. https://doi.org/10.1080/00223891.2017.1381969
# Rosseel, Y. (2012). lavaan: An R package for structural equation modeling. Journal of statistical software, 48, 1-36. https://doi.org/10.18637/jss.v048.i02
