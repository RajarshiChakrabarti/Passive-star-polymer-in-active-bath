     Program Polymer_Radius_Gyration_COM
     Implicit None
 
      Integer, Parameter     :: DP = KIND(1.d0)
      !Real*4, Allocatable, Dimension(:) :: P(:), Q(:), Rgx(:), Rgy(:), RG(:)
      Integer, Parameter:: Nstep = 1500001
      Integer ::  i, j, k, l, m
      character*80 :: input, output
      Real*4 :: Rx(Nstep), Ry(Nstep), asp, anum, den, tasp, rg, trg
      
      !Allocate(P(Nstep*Np), Q(Nstep*Np), Rgx(Nstep*Np), Rgy(Nstep*Np), RG(Nstep*Np))

     Open (unit = 11, file = 'name.dat',status = 'OLD')
      Read(11, *) input
      Read(11, *) output

      Open (unit = 12, file = input, status = 'OLD') 
      
      Open (Unit = 15, File = output, Status = 'UNKNOWN')
      
      do i = 1, Nstep

      Read(12, *)  Rx(i), Ry(i)

      end do
      
      do j = 1, Nstep
      
       
          den =  ((Rx(j)+Ry(j))**2)  

          anum =  ((Rx(j)-Ry(j))**2)
          
          rg = Rx(j)+Ry(j)
          
          asp = anum/den
          
          
          
       write(15,*) asp, rg
        end do
        !do k = 1, Nstep
        !tasp = tasp+asp
        !trg  = trg+ rg
        !end do
        !write(15,*) tasp, tasp/Nstep, trg, trg/Nstep
         
          
          
 
 
      
      
      !write(15,*)  rgsq, avgasp, rgsq/543178.0, avgasp/543178.0
      
  
      CLOSE(12)
      CLOSE(15)
         
      end program Polymer_Radius_Gyration_COM
      
      
      
    
