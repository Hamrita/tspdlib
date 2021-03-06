new;
cls;
library tspdlib;


// Load date file
y = loadd(__FILE_DIR $+ "TSe.dat");

/*
** Use defaults for
** bandwidth,
** LR variance computation,
** information criterion,
** and maximum number of Fourier
*/


// With constant
model = 1;
{ KPSS, k, cv } = Fourier_KPSS(y, model);

// With constant and trend
model = 2;
{ KPSS, k, cv } = Fourier_KPSS(y, model);


