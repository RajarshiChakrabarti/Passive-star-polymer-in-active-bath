#bin/bash
sed -i '/TIMESTEP/, +8d' poly_pos_equil_extend_20_3.dat

    awk '{if ($1>0 && $1<22) print $3,$4}' poly_pos_equil_extend_20_3.dat > arm_20_3_1.dat
    awk '{if ($1>20 && $1<42) print $3,$4}' poly_pos_equil_extend_20_3.dat > arm_20_3_2.dat
   awk '{if ($1>41 && $1<62 || $1==21) print $3,$4}' poly_pos_equil_extend_20_3.dat > arm_20_3_3.dat 
   
 #gyration of arms  
    for n in {1..3..1}
 do
       
       
         echo arm_20_3_$n.dat > name.dat
         echo rg_tensor_20_3_$n.dat >> name.dat
         gfortran Tensor_Gyration.f90 -o a.out
         chmod +x a.out
         ./a.out 
         
         
         
        

echo $n
done  


 #################################################################
 
 #Arm to arm separation
     
 
 for n in {1..3..1}
 do
       
      
         echo arm_20_3_$n.dat > name.dat
         echo com_20_3_$n.dat >> name.dat
         gfortran Polymer_COM_Long.f90 -o a.out
        chmod +x a.out
         ./a.out 
         
   
echo $n
done  
cat com_20_3_1.dat com_20_3_2.dat > cat_com_20_3_1.dat
cat com_20_3_1.dat com_20_3_3.dat > cat_com_20_3_2.dat
cat com_20_3_2.dat com_20_3_3.dat > cat_com_20_3_3.dat

 for n in {1..3..1}
 do
  
         echo cat_com_20_3_$n.dat > name.dat
         echo com_com_distance_20_3_$n.dat >> name.dat
         gfortran end-to-end_com_of_arm.f90 -o a.out
         chmod +x a.out
         ./a.out
         
echo $n
done         


                    
                    
                   ############## ##############
    
    #center of mess displacement of the polymer
     sed -i '/TIMESTEP/, +8d' poly_pos_equil_extend_20_3.dat
     awk '{print $3, $4}' poly_pos_equil_extend_20_3.dat > cord_20_3.dat
     
          echo cord_20_3.dat
          gfortran Polymer_COM.f90 -o a.out
          chmod +x a.out
          ./a.out
         
         
        
         echo 	com_20_3.dat
         
         gfortran TAMSD_Single_5.f90 -o a.out
         chmod +x a.out
         ./a.out

                    ##########################
                    
           #end to end distance         
            awk '{if($1==1) print $3,$4}' poly_pos_equil_extend_20_3.dat > terminalA_20_3.dat
	    awk '{if($1==21) print $3,$4}' poly_pos_equil_extend_20_3.dat > central_20_3.dat
            awk '{if($1==41) print $3,$4}' poly_pos_equil_extend_20_3.dat > terminalB_20_3.dat
	    awk '{if($1==61) print $3,$4}' poly_pos_equil_extend_20_3.dat > terminalC_20_3.dat 
           cat central_20_3.dat terminalA_20_3.dat terminalB_20_3.dat terminalC_20_3.dat > output_20_3.dat
           echo output_20_3.dat 
            
            gfortran end-to-end.f90 -o a.out
         chmod +x a.out
        ./a.out     
        
        
        ####################
        #angle between arms
        paste central_20_3.dat terminalA_20_3.dat > first_vect_3_20_coord.dat    
        paste central_20_3.dat terminalB_20_3.dat > second_vect_3_20_coord.dat
        paste central_20_3.dat terminalC_20_3.dat > third_vect_3_20_coord.dat 
        
        paste first_vect_3_20_coord.dat second_vect_3_20_coord.dat > vec_20_coord_frame_3_1.dat
        paste first_vect_3_20_coord.dat third_vect_3_20_coord.dat > vec_20_coord_frame_3_2.dat
        paste second_vect_3_20_coord.dat third_vect_3_20_coord.dat > vec_20_coord_frame_3_3.dat
        
        
        
        
           for n in {1..3..1}
 do
       
         
  
         echo vec_20_coord_frame_3_$n.dat > name.dat
         echo output_angle_20_3_$n.dat >> name.dat
         gfortran angle_between_arms.f90 -o a.out
         chmod +x a.out
         ./a.out 
         
         
         
        

echo $n
done  
     
        
                ############

