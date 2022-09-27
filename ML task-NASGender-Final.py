#!/usr/bin/env python
# coding: utf-8


import pandas as pd
import numpy as np
from ast import literal_eval
from scipy.stats import ttest_ind
from os import listdir
from os.path import isfile, join
import pandas as pd
from sklearn import preprocessing
from scipy.stats import mannwhitneyu
from igraph import Graph, mean
import warnings
warnings.filterwarnings('ignore')

from sklearn.model_selection import train_test_split
from sklearn.model_selection import cross_val_score
from sklearn.metrics import roc_auc_score
import matplotlib.pyplot as plt
from sklearn import datasets, metrics, model_selection, svm
from sklearn.metrics import confusion_matrix
import matplotlib.pyplot as plt
from sklearn import datasets, metrics, model_selection, svm
from sklearn.ensemble import RandomForestClassifier



T4_all = pd.read_csv('T4_normalized_all.csv')



T4_all.replace(-1, np.nan, inplace=True)



import numpy as np
def getrank(df):
    if df > 100:
        return 0
    if df < 101:
        return 1
    else:
        return np.nan
    


need = [
 'mutual_edge',
 'ego_edge',
 'hub',
 'authority',
 'average_degress',
 'density',
 'shortest_path',
 'transitivity',
 'num_community',
 'neighbour_paper_mean',
 'neighbour_citation_mean',
 'neighbour_gender_ratio','gender', 'ranking']

need2 = [
 'mutual_edge',
 'ego_edge',
 'hub',
 'authority',
 'average_degress',
 'density',
 'shortest_path',
 'transitivity',
 'num_community',
 'neighbour_paper_mean',
 'neighbour_citation_mean',
 'neighbour_gender_ratio']



T4_all['ranking'] = T4_all['2015Ranking'].apply(getrank)



ap1 =  T4_all[need].dropna()



f = ap1[ap1.gender == 1].sample(n=93, random_state=1)
m = ap1[ap1.gender == 0].sample(n=93, random_state=1)
ap2 =  f.append(m)



boston_X_train, boston_X_test, boston_y_train, boston_y_test = train_test_split(
                                ap2[need2], ap2['gender'], test_size=0.25, random_state=200)



rf_classifier = RandomForestClassifier(random_state = 600).fit(boston_X_train, boston_y_train)



from matplotlib import pyplot as plt
plt.barh(need2, rf_classifier.feature_importances_)
plt.xlim(0,0.14)
plt.title('gender classification features important')




metrics.plot_roc_curve(rf_classifier, boston_X_test, boston_y_test) 
plt.title('gender classification randon forest')





f = ap1[ap1.ranking == 1].sample(n=76, random_state=1)
m = ap1[ap1.ranking == 0].sample(n=76, random_state=1)
ap2 =  f.append(m)




boston_X_train, boston_X_test, boston_y_train, boston_y_test = train_test_split(
                                ap2[need2], ap2['ranking'], test_size=0.25, random_state=200)




rf_classifier = RandomForestClassifier(random_state = 600).fit(boston_X_train, boston_y_train)




from matplotlib import pyplot as plt
plt.barh(need2, rf_classifier.feature_importances_,color ='orange')
plt.xlim(0,0.14)
plt.title('ranking prediction features important')




metrics.plot_roc_curve(rf_classifier, boston_X_test, boston_y_test,color ='orange')
plt.title('ranking prediction random forest')






