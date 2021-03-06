# Modeling Causes of Death using CODEm  

## Background  
  * Estimating COD is difficult  
  * There are many different...  
	* Data Sources  
	* Data coding  
	* Levels of coverage  
	* Areas to cover  
  * Not to mention missing and lackluster data  
  * Whats the best approach to estimating COD?  
  
## The strategy
### 1) Identify all the data sources  
  * VR, National Registration  
  * Most are available through national sources or WHO  
  * There are also subnational, specialty registries, etc.  
	
### 2) Maximize Comparibility  
  * Map across revisions of the ICD  
  * Variation in garbage coding  
  * Misclassification  
  * Lots of literature on recoding/redistibuting of garbage codes  
  * **Uncertainty should carry over!!!**  
  * Take into account the completeness of death records  
  
### 3) Develop a diverse set of plausible models  
  * cast a wide net of possible models  
  * make sure models are theoretically sound  
  
### 4) Assess the predictive validity of each plausible model  
  * out-of-sample testing is a must  
  * how do we hold out data though?  
  * There are 5 types of missing data  
    1. no data  
    2. missing middle years  
    3. missing prior years  
    4. missing later years  
    5. missing age groups  
  * Make sure your hold outs resemble the type of data you need to infer  
  * Continue holdouts until predictions stabalize  
  * There are generally speaking three assesment metrics to use  
    1. Assessing error (RMSE)  
    2. Acurately predicting trends  
	3. Good confidence intervals  

## Developing Plausible models  
  * Model Families  
    * Linear Mixed Models vs Spatio-Temporal Models  
    * Ln (Cause Specific Death Rate) vs Logit (Cause Fraction)  
  * In addition multiple combanatins of possible covariates are used  
  * These could lead to hundreds of different models  

## Covariate selection Algorithm  
  * Choose **n** possible covariates  
  * Label them in 1 of three catagories  
    1. Strong proximal relationship with known biological pathway  
    2. Strong proxy relationship with upstream connections  
    3. Weak association that is distant  
  * Assign a direction to each covariate  
  * Test all 2^(n) - 1 combination of lvl 1 covariates  
    * Keep all models where the p value is significant and in the expected direction  
  * Add level 2 covariates to each model and remove from all models unless  
    * leaves unchanges the status of all lvl 1 variables  
    * Is also significant and in the expected direction  
  * Do the same shit for lvl 3  
  * we end up with a possible (2^(n) - 1) * 2^(m) * 2(l) models to choose from  
