  program DUMB

    implicit none
    integer (kind = 8) :: i

    integer :: start_time, end_time, rate

    call SYSTEM_CLOCK(start_time, rate)

    do i=0,2**32
       if (MOD(i, 1000000) == 0) then
          write (*,*) i
       end if
    end do

    call SYSTEM_CLOCK(end_time)

    print *, end_time - start_time
    
  end program DUMB
