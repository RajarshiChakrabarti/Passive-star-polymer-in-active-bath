Program Gyration_Tensor
    implicit none
    
    integer, parameter :: N=61
    integer :: i, n_frames=5000001, j, mass=1.0
    character*80 :: input, output
    real :: coord(2, N), coord_CM(2, N), CM(2), Gyr_ten(2, 2)
   
    
    !Open (unit = 11, file = 'name.dat',status = 'OLD')
      !Read(11, *) input
      !Read(11, *) output

       Open (Unit = 12, File = 'cord_f20.dat', Status = 'OLD')
      Open (Unit = 15, File = 'Pol_rg_tensor_120.dat', Status = 'UNKNOWN')
    
    mass = 1.0
    
    do j=1, n_frames
    
        coord=0.0
        do i=1, N
            read(12, *) coord(:, i) 
            coord_CM(:, i)=coord(:, i)*mass
        end do
    
        CM=sum(coord_CM, dim=2)/N !COM
        


        Gyr_ten=0.0
        do i=1, N
            Gyr_ten(1, 1)=Gyr_ten(1, 1)+(coord(1, i)-CM(1))**2
            Gyr_ten(2, 1)=Gyr_ten(2, 1)+(coord(1, i)-CM(1))*(coord(2, i)-CM(2))
            !Gyr_ten(3, 1)=Gyr_ten(3, 1)+(coord(1, i)-CM(1))*(coord(3, i)-CM(3))
            Gyr_ten(1, 2)=Gyr_ten(1, 2)+(coord(2, i)-CM(2))*(coord(1, i)-CM(1))
            Gyr_ten(2, 2)=Gyr_ten(2, 2)+(coord(2, i)-CM(2))**2
            !Gyr_ten(3, 2)=Gyr_ten(3, 2)+(coord(2, i)-CM(2))*(coord(3, i)-CM(3))
            !Gyr_ten(1, 3)=Gyr_ten(1, 3)+(coord(3, i)-CM(3))*(coord(1, i)-CM(1))
            !Gyr_ten(2, 3)=Gyr_ten(2, 3)+(coord(3, i)-CM(3))*(coord(2, i)-CM(2))
            !Gyr_ten(3, 3)=Gyr_ten(3, 3)+(coord(3, i)-CM(3))**2
        end do
        Gyr_ten=Gyr_ten/N
        write(15, "(2f15.5)") Gyr_ten
        
    end do
    
End Program Gyration_Tensor
