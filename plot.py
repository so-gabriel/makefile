import seaborn as sns
import pandas as pd
import sys

x = pd.read_csv(sys.argv[1])

plot = sns.barplot('word', 'count', data=x.head(10))

fig = plot.get_figure()
fig.savefig(sys.argv[2])
