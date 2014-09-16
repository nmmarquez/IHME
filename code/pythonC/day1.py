from IPython.core.pylabtools import figsize # for plotting
import os #operating system tools
import numpy as np # numerical python modules
import pymc as pm # bayes MCMC module
import pandas as pd # data frame module
from matplotlib import pyplot as plt # for plotting
from scipy import stats # for stats


# In[3]:

# make the results reproducible by setting the seed
np.random.seed (123)


# In[4]:

# different data types in base python
print (type (3)) # integer
print (type (3.0)) # float
print (type (True)) # boolean
print (type ("3.0")) # string


# In[5]:

# use python as a calculator
print (3 + 3) # addition
print (3. - 2) # subtraction
print (3 * 3.0) # multiplication
print (3 / 4.0) # division must use floats for accurate results!
print (8.0 // 3) # division rounding down
print (8.0 % 5) # get the remainder
print (1 == 1) # boolean operaters
print (1 != 5)
print (6 >= 3)
print (4 < 4)


# In[8]:

os.chdir ("/home/neal/Downloads") # change directory
gbdChild = pd.io.stata.read_stata ("gbdChildMortality.dta")


# In[65]:

print (gbdChild.columns.values) # variable names
print (gbdChild.shape) # shape of data frame
print (len (gbdChild.columns)) # or get num cols 
print (len (gbdChild.index)) # then num rows
print (gbdChild.dtypes) # then data types of each variable


# In[25]:

print (gbdChild.describe()) # check out stats of numeric variables


# In[53]:

print (gbdChild.gbdRegion.value_counts ()) # summarize factor level data


# In[64]:

print (pd.crosstab (gbdChild.gbdRegion, gbdChild.iso)) # 2 way freq table


# In[76]:

print (gbdChild.neoMR [gbdChild.year >= 2000].describe()) # subset data by year

print (gbdChild.neoMR [(gbdChild.year >= 2000) & 
                       (gbdChild.age1_5Deaths >= 1000)].describe())# then by another factor


# In[80]:

# histogram
plt.figure();
gbdChild.under5Upper.hist()
plt.xlabel ('value')
plt.ylabel ('freq')
plt.title ('This is a histogram')


# In[ ]:



