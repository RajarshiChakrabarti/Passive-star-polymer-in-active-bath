     Program Polymer_COM
     Implicit None
 
      Integer, Parameter     :: DP = KIND(1.d0)
      Real*4, Allocatable, Dimension(:) :: P(:), Q(:)
      Integer, Parameter:: Nstep = 1500001, Np = 61
      Integer ::  i, j
      character*80 :: input, output
      Real*4 :: Rx(Nstep*Np), Ry(Nstep*Np)
      Allocate(P(Nstep*Np), Q(Nstep*Np))

      
       Open (unit = 11, file = 'name.dat',status = 'OLD')
      Read(11, *) input
      Read(11, *) output

      Open (unit = 19, file = input, status = 'OLD') 
      
      Open (Unit = 21, File = output, Status = 'UNKNOWN')
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
