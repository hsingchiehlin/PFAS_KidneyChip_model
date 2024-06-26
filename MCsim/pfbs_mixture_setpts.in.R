Integrate (Lsodes, 1e-6, 1e-6, 1);

SetPoints ("","pfbs_setpts.out",0,
           p_1, p_2, p_3, p_4, GSD_error_C1_blood, GSD_error_C1_cell, GSD_error_C2_cell, GSD_error_C2_lumen); #GSD_error_A3_cell


Simulation {
  
  A1_lumen_init = Events (A1_lumen, 1, 0,
                          Add,
                          0.0015);
  A2_blood_init = Events (A2_blood, 1, 0,
                          Add,
                          4e-04);
  #A3_blood_init = Events (A3_blood, 1, 0, Add, 0.0004);
  #A3_lumen_init = Events (A3_lumen, 1, 0, Add, 0.0015);
  
  PrintStep(  
    # 1: Lumen (A) to Blood (B) study
    C1_blood,      # Quantity in blood compartment (micromoles)
    C1_cell,       # Quantity in cell lysate compartment (micromoles)
    C1_lumen,      # Quantity in lumen compartment (micromoles)
    
    # 2: Blood (B) to Lumen (A) study
    C2_blood,      # Quantity in blood compartment (micromoles)
    C2_cell,       # Quantity in cell lysate compartment (micromoles)
    C2_lumen,      # Quantity in lumen compartment (micromoles)
    
    # 3: Both add study
    #A3_blood,      # Quantity in blood compartment (micromoles)
    #A3_cell,       # Quantity in cell lysate compartment (micromoles)
    #A3_lumen,       # Quantity in lumen compartment (micromoles)
    0, 48, 1);

}

End. 