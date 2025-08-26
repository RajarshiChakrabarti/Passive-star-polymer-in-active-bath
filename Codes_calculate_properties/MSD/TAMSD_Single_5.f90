      Program Polymer_COM_MSD
      Implicit None
      Integer, Parameter     :: DP = KIND(1.d0)
      Real*4, Allocatable, Dimension(:) :: R(:), tau(:) !, P(:), Q(:), M(:)
      Integer, Parameter:: Nstep = 6000001, Ntau = 5000000
      Integer ::  i, j, k, l
      character*80 :: input, output
     ! Real*4 :: Rx(Nstep*Np), Ry(Nstep*Np), Rz(Nstep*Np), t(Nstep*Np)
      Real*4 ::  dR, x(Nstep), y(Nstep), t(Nstep)
      Allocate(R(Ntau), tau(Ntau)) !P(Nstep*Np), Q(Nstep*Np), M(Nstep*Np), R(Ntau), tau(Ntau))

     
      
      
      Open (Unit = 19, File = 'com_0_3.dat', Status = 'OLD')
      Open (Unit = 21, File = 'msd_0_3.dat', Status = 'UNKNOWN')


      do k = 1, Nstep

      Read(19,*) t(k), x(k), y(k)

      end do
      

       do l = 1, Ntau
     
         tau(l) = (l-1)

         R(l) = 0.0d0
         
        do k = 1, Nstep-l+1
       
            dR =(((x(k+l-1)-x(k))*(x(k+l-1)-x(k)))+((y(k+l-1)-y(k))*(y(k+l-1)-y(k))))
         
           R(l) = R(l) + (dR)

        end do
      
        R(l) = R(l) / (Nstep-l+1)

        write(21, *) tau(l), R(l)

       end do
       CLOSE(19)
       CLOSE(21)
      
      end program Polymer_COM_MSD
    
