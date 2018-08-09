import pandas as pd
from collections import Counter
import sys
file = open(sys.argv[1], 'r')

wordcount = Counter(file.read().split())
dat = pd.DataFrame.from_dict(wordcount, orient='index')

dat = dat.reset_index().sort_values(0, ascending=False)

dat.columns = ['word', 'count']

dat.to_csv(sys.argv[2], index=False)
