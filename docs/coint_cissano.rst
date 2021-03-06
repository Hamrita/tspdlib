coint_cissano
==============================================

Purpose
----------------

Lagrange Multiplier‐type statistic to test the null hypothesis of cointegration allowing for the possibility of a structural break.

Format
----------------
.. function:: { SCols, TBols, SCdols, TBdols, lambda, cv } = coint_cissano(y, x, model, bwl, varm, trimm, q)


    :param y: Dependent variable.
    :type y: Nx1 matrix

    :param x: Independent variable.
    :type x: NxK matrix

    :param model: Model to be implemented.

          =========== ==============
          1           Model An: Level shift.
          2           Model A:  Level shift with trend.
          3           Model D:  Regime shift.
          4           Model E:  Regime and trend shift.
          =========== ==============

    :type model: Scalar

    :param bwl: Bandwidth length for long-run variance computation.
    :type bwl: Scalar

    :param varm: Long-run consistent variance estimation method

         =========== ==============
         1           iid.
         2           Bartlett.
         3           Quadratic Spectral (QS).
         4           SPC with Bartlett /see (Sul, Phillips & Choi, 2005)
         5           SPC with QS
         6           Kurozumi with Bartlett
         7           Kurozumi with QS
         =========== ==============

    :type varm: Scalar

    :param trimm: Trimming rate.
    :type trimm: Scalar

    :param q: Number of leads and lags for DOLS estimation.
    :type q: Scalar

    :return SCols: SC test based on OLS estimation
    :rtype SCols: Scalar

    :return TBols: Break location based on OLS estimation.
    :rtype TBols: Scalar

    :return SDols: SC test based on DOLS estimation
    :rtype SDols: Scalar

    :return TBDols: Break location based on DOLS estimation.
    :rtype TBDols: Scalar

    :return lamdba: Fraction of break (TB/T)
    :rtype lambda: Scalar

    :return cv: 1%, 5%, 10% critical values for the chosen model
    :rtype cv: Vector
Examples
--------

::

  library tspdlib;

  // Load the data
  data = loadd(__FILE_DIR $+ "TScoint.dat");

  // Define y and x matrix
  y = data[., 1];
  x = data[., 2:cols(data)];

  T = rows(data);

  // Maximum number of lags
  pmax = 12;

  // Trimming rate
  trimm = 0.10;

  // Long-run consistent variance estimation method
  varm = 3;

  // Bandwidth for kernel estimator
  bwl = round(4 * (T/100)^(2/9));

  // Leads & Lags for DOLS estimation
  q = int(4*(T/100)^(2/9));

  // Level shifts
  model = 1;
  { SCols, TBols, SCdols, TBdols, lambda, cv } =
      coint_cissanso(y, x, model, bwl, varm, trimm, q);


Source
------

coint_cissano.src

.. seealso:: Functions :func:`coint_egranger`
