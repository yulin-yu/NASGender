# NAS Gender Disparities


The repository contains data and code for running analyses of author-citation ego networks of the members of the National Academy of Sciences (NAS).
The associated paper to this repository can be found here: www.pnas.org/doi/10.1073/pnas.2206070119

## Data：
**T4_normalized_all.csv** contains ego-network features of individual NAS members

**Citation Ego Network**: edges within each NAS member’s ego network extracted from Microsoft Academic Graph database extracted from MAG raw data [1]. MAG raw data are publicly available at https://docs.microsoft.com/en-us/academic-services/graph/.

## Analysis Code
**members_over_time.m**: Matlab code to produce the plot of the number of new NAS members over time

**net_features.m**: Matlab code to produce the plot showing ego-network features for two different classes of NAS members (based on gender or institutional prestige)

**ML task-NASGender-Final.py**: Python notebook that classifies NAS member based on their ego-network features.

**NetworkFeature-NASGender-Final.py**: Python notebook that calcualte ego-network features


References

[1] Sinha et al., “An overview of Microsoft Academic Service (MAS) and applications” in Proceedings of the 24th International Conference on World Wide Web (2015), pp. 243–246
