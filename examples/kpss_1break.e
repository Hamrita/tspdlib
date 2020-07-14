new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "TSe.dat");
T = rows(y);

// bandwidth lag
bwl = round(4 * (T/100)^(2/9));

// Trimming rate
trimm = 0.10;

format /m1 /rd 8,4;
// Iterate through LR variance options

for i(1, 7, 1);
    varm = i;
    
    print "LR Variance estimation method";
    if varm == 1;
        print "iid";
    endif;
    if varm == 2;
        print "Bartlett";
    endif;
    if varm == 3;
        print "Quadratic Spectral (QS)";
    endif;
    if varm == 4;
        print "SPC with Bartlett /see (Sul, Phillips & Choi, 2005)";
    endif;
    if varm == 5;
        print "SPC with QS";
    endif;
    if varm == 6;
        print "Kurozumi with Bartlett";
    endif;
    if varm == 7;
        print "Kurozumi with QS";
    endif;
    
    /*
    ** 1=Model A: break in level
    ** 2=Model C: break in level and trend
    */
    model = 1;
    
    if model == 1;
        "--------Model A: Break in level        -----";
    endif;
    if model == 2;
        "--------Model C: Break in level & trend-----";
    endif;
    
    "One break KPSS test (Kurozumi, 2002)";
    { KPSS, tb1, lambda, cv } = KPSS_1break(y, model, bwl, varm, trimm);
    "       KPSS test       ";;
    KPSS;
    "       Break date      ";;
    tb1;
    "       Fraction        ";;
    lambda;
    "       CV (10%, 5%, 1%)";;
    cv;
    "";
    
    /*
    ** 1=Model A: break in level
    ** 2=Model C: break in level and trend
    */
    model = 2;
    
    if model == 1;
        "--------Model A: Break in level        -----";
    endif;
    if model == 2;
        "--------Model C: Break in level & trend-----";
    endif;
    
    "One break KPSS test (Kurozumi, 2002)";
    { KPSS, tb1, lambda, cv } = KPSS_1break(y, model, bwl, varm, trimm);
    "       KPSS test       ";;
    KPSS;
    "       Break date      ";;
    tb1;
    "       Fraction        ";;
    lambda;
    "       CV (10%, 5%, 1%)";;
    cv;
    "";
endfor;

