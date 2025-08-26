      Program Polymer_COM_MSD
      Implicit None
      Integer, Parameter     :: DP = KIND(1.d0)
     ! Real*4, Allocatable, Dimension(:) :: R(:), tau(:) !, P(:), Q(:), M(:)
      Integer, Parameter:: Nstep = 1500001, Np = 2
      Integer ::  i, j, k, l
      character*80 :: input, output
     ! Real*4 :: Rx(Nstep*Np), Ry(Nstep*Np), Rz(Nstep*Np), t(Nstep*Np)
      Real*4 ::  R, dR, x(Nstep*2), y(Nstep*2), ser(Nstep*2), t(Nstep*2)
      !Allocate(R(Ntau), tau(Ntau)) !P(Nstep*Np), Q(Nstep*Np), M(Nstep*Np), R(Ntau), tau(Ntau))

     
      
      
      Open (unit = 11, file = 'name.dat',status = 'OLD')
      Read(11, *) input
      Read(11, *) output

      Open (unit = 12, file = input, status = 'OLD') 
      
      Open (Unit = 15, File = output, Status = 'UNKNOWN')


      do k = 1, Nstep*2

      Read(12,*) t(k), x(k), y(k)
      end do
     
      do i = 1, Nstep
       R = 0.0
      
       dR = (x(i)-x(i+Nstep))**2 + (y(i)-y(i+Nstep))**2 
       R = R+dR
     write(15, *) dR
       end do
        
    
       CLOSE(12)
       CLOSE(15)
      
      end program Polymer_COM_MSD
    
