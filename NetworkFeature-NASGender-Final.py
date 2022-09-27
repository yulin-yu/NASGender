#!/usr/bin/env python
# coding: utf-8

# In[1]:


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
import igraph
import warnings
import numpy as np
import math
from igraph import Graph, mean, clustering,VertexClustering
import igraph
import numpy as np
import csv 
from scipy import stats
warnings.filterwarnings('ignore')


# In[2]:


# directed network feature


def mutual_edge(g):
    try:
        all_list = g.is_mutual()
        allm = all_list.count(True)/len(all_list) 
        return allm
    except:
        return np.nan
    
def ego_edge(ids,g):
    try: 
        listall = [e.tuple for e in igraph.EdgeSeq(g)]
        idindex= g.vs["attr"].index(ids)
        need_ego = [i for i in listall if idindex in i]
        len_ego = [g.is_mutual(i) for i in need_ego]
        ego_m = len_ego.count(True)/len(len_ego)
        return ego_m
    except:
        return np.nan

def hub(g,ids):
    try:
        arr = g.hub_score(scale=True)
        arr1 = stats.rankdata(arr, "average") / len(arr)
        idindex= g.vs["attr"].index(ids)
        hub = arr1[idindex]
        return hub
    except:
        return np.nan    
    
    
def auth(g,ids):
    try:
        arr = g.authority_score()
        arr2 = stats.rankdata(arr, "average") / len(arr)
        idindex= g.vs["attr"].index(ids)
        hub2 = arr2[idindex]
        return hub2 
    except:
        return np.nan    


# In[4]:


# indirect network feature, convey to indirect network first

def ave_deg(vv):
    try:
        ave_deg = mean(vv.degree()) 
        return ave_deg
    except:
        return np.nan
    
def density(vv):
    try:
        density =  vv.density(loops=False) 
        return density
    except:
        return np.nan
    
def shortest_paths(vv):
    try:
        short_p = np.mean(vv.shortest_paths())
        return short_p
    except:
        return np.nan

def transitivity(vv):
    try:
        trans = vv.transitivity_undirected()
        return trans
    except:
        return np.nan

def num_comm(vv):
    try:
        num_comm = len(vv.community_multilevel())
        return num_comm
    except:
        return np.nan    

