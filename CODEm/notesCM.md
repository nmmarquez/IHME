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
  
### Develop a diverse set of plausible models  
  * cast a wide net of possible models  
  * make sure models are theoretically sound  
  
### Assess the predictive validity of each plausible model  
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
	
