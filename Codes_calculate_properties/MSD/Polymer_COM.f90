     Program Polymer_COM
     Implicit None
 
      Integer, Parameter     :: DP = KIND(1.d0)
      Real*4, Allocatable, Dimension(:) :: P(:), Q(:)
      Integer, Parameter:: Nstep = 6000001, Np = 61
      Integer ::  i, j
      character*80 :: input, output
      Real*4 :: Rx(Nstep*Np), Ry(Nstep*Np)
      Allocate(P(Nstep*Np), Q(Nstep*Np))

      
       Open (Unit = 19, File = 'cord_0_3.dat', Status = 'OLD')
      Open (Unit = 21, File = 'com_0_3.dat', Status = 'UNKNOWN')
      
      do i = 1, Nstep*Np

      Read(19, *)  Rx(i), Ry(i)

      end do
      
      do j = 1, Nstep*Np, Np
      
         P(j) = 0.0d0
         Q(j) = 0.0d0
        

        do i= 1, Np
       

          P(j)= (P(j) + Rx(i+j-1))  

          Q(j)= (Q(j) + Ry(i+j-1))  

     
        end do
         
          write(21,*) j, P(j)/Np, Q(j)/Np
          
      end do
      CLOSE(19)
       CLOSE(21)

      end program Polymer_COM
