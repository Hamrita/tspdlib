new;
cls;
library tspdlib;

// Load date file
y = loadd("D:/development/GitHub/tspdlib/examples/ts_full.dat");
y = setcoldateformats(y, "%m/%Y", "Date");

/*
** Using the defaults 
** for maximum number of lags,
** information criterion,
** innovational outlier,
** and trimming rate. 
*/

// Include break in level
model = 0;    

// Implement test
{ ADFGLS_min, p, PT_min, MZa_min, MZt_min, MSB_min, MPT_min, s2, 
        tb1_min, lambda, cvPT, cvMPT, cvMZt, cvDFGLS, cvMSB, cvMZa} = gls_1break(y, model);

// Include break in trend
model = 1;    

// Implement test
{ ADFGLS_min, p, PT_min, MZa_min, MZt_min, MSB_min, MPT_min, s2, 
        tb1_min, lambda, cvPT, cvMPT, cvMZt, cvDFGLS, cvMSB, cvMZa} = gls_1break(y, model);

// Include break in level and trend
model = 2;    

// Implement test
{ ADFGLS_min, p, PT_min, MZa_min, MZt_min, MSB_min, MPT_min, s2, 
        tb1_min, lambda, cvPT, cvMPT, cvMZt, cvDFGLS, cvMSB, cvMZa} = gls_1break(y, model);

