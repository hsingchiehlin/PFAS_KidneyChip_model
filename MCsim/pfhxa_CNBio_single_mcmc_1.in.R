Integrate (Lsodes, 1e-6, 1e-6, 1);

MCMC ("MCMC.default.out",      # output file
      "",                      # name of restart file
      "",                      # name of data file
      300000, 0,                 # iterations, print predictions flag,
      30, 300000,                 # printing frequency, iters to print
      1482062504);                      # random seed 4, 6699, 11010, 101023

Level { # top
  
  
  Distrib(p_1, Normal, -6.907755, 11.51293); #(1e-3, 1e5)
  Distrib(p_2, Normal, -6.907755, 11.51293);
  Distrib(p_3, Normal, -6.907755, 11.51293);
  Distrib(p_4, Normal, -6.907755, 11.51293);
  Distrib(GSD_error_C1_blood, LogUniform, 1.1, 10);
  Distrib(GSD_error_C1_cell, LogUniform, 1.1, 10);
  Distrib(GSD_error_C2_cell, LogUniform, 1.1, 10);
  Distrib(GSD_error_C2_lumen, LogUniform, 1.1, 10);
  #Distrib(GSD_error_A3_cell, LogUniform, 1.1, 10);
 
  
  Likelihood(Data(C1_blood), LogNormal, Prediction(C1_blood), GSD_error_C1_blood);
  Likelihood(Data(C1_cell), LogNormal, Prediction(C1_cell), GSD_error_C1_cell);
  Likelihood(Data(C2_cell), LogNormal, Prediction(C2_cell), GSD_error_C2_cell);
  Likelihood(Data(C2_lumen), LogNormal, Prediction(C2_lumen), GSD_error_C2_lumen);
  #Likelihood(Data(A3_cell), LogNormal, Prediction(A3_cell), GSD_error_A3_cell);
  
  
  Simulation {
    
    A1_lumen_init = Events (A1_lumen, 1, 0,
                            Add,
                            0.00375);
    A2_blood_init = Events (A2_blood, 1, 0,
                            Add,
                            0.001);
    #A3_blood_init = Events (A3_blood, 1, 0, Add, 0.0004);
    #A3_lumen_init = Events (A3_lumen, 1, 0, Add, 0.0015);
    
    Print(  
      C1_blood,      # Quantity in blood compartment (micromoles)
      C2_lumen,      # Quantity in lumen compartment (micromoles)
      2, 4, 24, 48);
    
    Data(C1_blood, 0.132868052,	0.282518787,	1.000162394,	1.687951595);
    Data(C2_lumen, 0.009046408,	0.023126744,	0.205974814,	0.351435101);

    
    Print(  
      C1_cell,       # Quantity in cell lysate compartment (micromoles)
      C2_cell,       # Quantity in cell lysate compartment (micromoles)
      #A3_cell,       # Quantity in cell lysate compartment (micromoles)
      48);
    
    Data(C1_cell, 96.62491355);		
    Data(C2_cell, 31.97350928);
    #Data(A3_cell, 2.44667E-06);
  }
}

END.
