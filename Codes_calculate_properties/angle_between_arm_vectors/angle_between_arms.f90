program chain_angle
    implicit none
    real :: theta, theta_degrees
    real, dimension(2) :: chain1_start, chain1_end, chain2_start, chain2_end
    real, dimension(2) :: vector1, vector2
    real :: dot_product, magnitude1, magnitude2
    integer :: i, num_time_frames
    character(len=100) :: input, output
    integer :: ios

    !input_file = "vec_coord_f10_1_3.dat"
    !ioutput_file = "output_angles_3.txt"

    Open (unit = 11, file = 'name.dat',status = 'OLD')
      Read(11, *) input
      Read(11, *) output

      Open (unit = 12, file = input, status = 'OLD') 
      
      Open (Unit = 15, File = output, Status = 'UNKNOWN')

    ! Count the number of lines in the input file to determine the number of time frames
    num_time_frames = 0
    do
        read(12, *, iostat=ios)
        if (ios /= 0) exit
        num_time_frames = num_time_frames + 1
    end do

    ! Rewind the file to read the coordinates
    rewind(12)

    ! Open the output file
    !open(unit=15, file=output_file, status='replace', action='write', iostat=ios)
    !if (ios /= 0) then
       ! print *, "Error: Cannot open output file."
        !stop
    !end if

    ! Loop through each time frame
    do i = 1, num_time_frames
        ! Read coordinates for the current time frame
        read(12, *) chain1_start(1), chain1_start(2), chain1_end(1), chain1_end(2), &
                     chain2_start(1), chain2_start(2), chain2_end(1), chain2_end(2)

        ! Calculate the direction vectors for each chain
        vector1 = chain1_end - chain1_start
        vector2 = chain2_end - chain2_start

        ! Calculate the dot product of the vectors
        dot_product = sum(vector1 * vector2)

        ! Calculate the magnitudes of the vectors
        magnitude1 = sqrt(sum(vector1**2))
        magnitude2 = sqrt(sum(vector2**2))

        ! Calculate the cosine of the angle between the vectors
        theta = acos(dot_product / (magnitude1 * magnitude2))

        ! Convert the angle to degrees
        theta_degrees = theta * (180.0 / 3.141592653589793)

        ! Write the result for the current time frame to the output file
        write(15, *) i, theta, theta_degrees
    end do

    ! Close the input and output files
    close(12)
    close(15)

end program chain_angle

