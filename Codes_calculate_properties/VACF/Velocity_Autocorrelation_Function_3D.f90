      ! A Code for Time Averaged Velocity Autocorrelation Function
      Program VACF
      Implicit None
 
      Integer, Parameter     :: DP = KIND(1.d0)
      Real*8, Allocatable, Dimension(:) ::  tau(:), C(:)
      Integer, Parameter:: Nstep = 300001
      Integer, Parameter:: Ntau = 50000 !no. of data points written to 
                                        !correlation function output file


      Integer ::  i, j, k
      character*40 :: input, output
      Real*8 :: Cxt, Cyt, Czt, dt, Ct0, vprod
      Real*8 :: Vx(Nstep), Vy(Nstep), sum_v, t(Nstep)!, Tot
      Allocate(tau(Ntau), C(Ntau))


      Open (unit = 12, file = 'name.dat', status = 'OLD') 
      Read(12,*) input
      Read(12,*) output
      Open (Unit = 13, File = input, Status = 'OLD')
      Open (Unit = 15, File = output, Status = 'UNKNOWN')

      !Open (Unit = 21, File = 'Datafile_tracer.dat', Status = 'OLD')
      !Open (Unit = 22, File = 'Tracer_VACF.dat', Status = 'UNKNOWN')

      Ct0 = 0.D0
      do i = 1, Nstep

          Read(13,*) t(i), Vx(i), Vy(i)     
          Ct0 = Ct0 + ((Vx(i)*Vx(i)) + (Vy(i)*Vy(i))) 
  
      end do
      Ct0 = Ct0/Nstep

      write(*,*) Ct0

      do k=1, Ntau
  
         tau(k) = (k-1)
         C(k) = 0.D0
         do i = 1, (Nstep-k+1)
             vprod=(Vx(i)*Vx(i+k-1))+(Vy(i)*Vy(i+k-1))
             C(k)=C(k)+(vprod)
         enddo
         C(k)=C(k)/(Nstep-k+1)
         C(k)=C(k)/Ct0
      write(15, *) tau(k), C(k)
      enddo

      end program VACF
