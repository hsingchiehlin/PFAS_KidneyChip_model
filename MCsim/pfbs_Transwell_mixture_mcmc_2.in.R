Integrate (Lsodes, 1e-6, 1e-6, 1);

MCMC ("MCMC.default.out",      # output file
      "",                      # name of restart file
      "",                      # name of data file
      300000, 0,                 # iterations, print predictions flag,
      30, 300000,                 # printing frequency, iters to print
      533215502);                      # random seed 4, 6699, 6699789, 7896234

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
                            0.0015);
    A2_blood_init = Events (A2_blood, 1, 0,
                            Add,
                            4e-04);
    #A3_blood_init = Events (A3_blood, 1, 0, Add, 0.0004);
    #A3_lumen_init = Events (A3_lumen, 1, 0, Add, 0.0015);
    
    Print(  
      C1_blood,      # Quantity in blood compartment (micromoles)
      C2_lumen,      # Quantity in lumen compartment (micromoles)
      2, 4, 24, 48);
    
    Data(C1_blood, 0.008448333,	0.008015015,	0.287053212,	0.539196019);
    Data(C2_lumen, 0.010619715,	0.006496554,	0.06270664,	0.098023063);
    
    
    Print(  
      C1_cell,       # Quantity in cell lysate compartment (micromoles)
      C2_cell,       # Quantity in cell lysate compartment (micromoles)
      #A3_cell,       # Quantity in cell lysate compartment (micromoles)
      48);
    
    Data(C1_cell, 8.732486321);		
    Data(C2_cell, 6.732135774);
    #Data(A3_cell, 7.26667E-07);
  }
}

END.

