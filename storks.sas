PROC IMPORT DATAFILE='/folders/myfolders/7/data/storks.csv' 
	DBMS=CSV 
	OUT=storks; 
	GETNAMES=YES; 
RUN; 
PROC SGPLOT DATA=storks; 
	scatter x=storks y=children; 
RUN; 
PROC REG DATA=storks;  
	Model children = storks; 
RUN; 
data storks2; 
storks = 1000; 
Run; 
DATA storks2; 
	set storks storks2; 
run; 
PROC REG DATA=storks2 PLOTS(ONLY)=(FITPLOT DIAGNOSTICS);  
	Model children = storks / R CLM CLI; 
RUN; 

