.PHONY : mytask
mytask : finalout.png %.csv %.png

finalout.png : plotfigs.py theidiot.csv mobydick.csv walden.csv senseandsensibility.csv
	python $^

%.csv : wordcount.py books/%.txt
	python $^ $*.csv

%.png : plot.py %.csv
	python $^ $*.png
# Count words.
# mobydick.csv : wordcount.py books/mobydick.txt
# 	python $^ $@
# # Wild Cards:
# # $^: all dependencies in order
# # $@: target
# # $<: first dependency
# mobydick.png : plot.py mobydick.csv
# 	python $^ $@
#
# theidiot.csv : wordcount.py books/theidiot.txt
# 	python $^ $@
#
# theidiot.png : plot.py theidiot.csv
# 	python $^ $@
#
# walden.csv : wordcount.py books/walden.txt
# 	python $^ $@
#
# walden.png : plot.py walden.csv
# 	python $^ $@
#
# senseandsensibility.csv : wordcount.py books/senseandsensibility.txt
# 	python $^ $@
#
# senseandsensibility.png : plot.py senseandsensibility.csv
# 	python $^ $@

.PHONY : clean
clean :
	rm *.csv
