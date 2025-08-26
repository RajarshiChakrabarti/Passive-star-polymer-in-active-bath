      Program Polymer_COM_MSD
      Implicit None
      Integer, Parameter     :: DP = KIND(1.d0)
      Real*4, Allocatable, Dimension(:) :: R(:), tau(:) !, P(:), Q(:), M(:)
      Integer, Parameter:: Nstep = 6000001, Ntau = 2000000
      Integer ::  i, j, k, l
      character*80 :: input, output
     ! Real*4 :: Rx(Nstep*Np), Ry(Nstep*Np), Rz(Nstep*Np), t(Nstep*Np)
      Real*4 ::  dR, x(Nstep), y(Nstep), z(Nstep), t(Nstep)
      Allocate(R(Ntau), tau(Ntau)) !P(Nstep*Np), Q(Nstep*Np), M(Nstep*Np), R(Ntau), tau(Ntau))

     
      
      
       Open (unit = 11, file = 'name.dat',status = 'OLD')
      Read(11, *) input
      Read(11, *) output

      Open (unit = 12, file = input, status = 'OLD') 
      
      Open (Unit = 15, File = output, Status = 'UNKNOWN')



      do k = 1, Nstep

      Read(12,*) t(k), x(k), y(k)

      end do
      

       do l = 1, Ntau
     
         tau(l) = (l-1)

         R(l) = 0.0d0
         
        do k = 1, Nstep-l+1
       
            dR = cos(6.28*((x(l+k-1)-x(k)) + (y(l+k-1)-y(k))))
         
           R(l) = R(l) + (dR)

        end do
      
        R(l) = R(l) / (Nstep-l+1)

        write(15, *) tau(l), R(l)

       end do
       CLOSE(12)
       CLOSE(15)
      
      end program Polymer_COM_MSD
    
