from functools import reduce
import seaborn as sns
import pandas as pd
import sys

dflist = [pd.read_csv(i) for i in sys.argv[1:]]

dat = reduce(lambda x, y: pd.merge(x, y, on='word'), dflist)
dat = dat.set_index('word').sum(axis=1).reset_index().sort_values(0, ascending=False)
dat.columns = ['word', 'count']
plot = sns.barplot('word', 'count', data=dat.head(10))

fig = plot.get_figure()
fig.savefig('books/finalout.png')
