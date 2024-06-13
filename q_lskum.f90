module q_lskum_mod
!
!	First written on 05.02.2021
!
!
   use data_structure_mod
   use generate_connectivity_mod
   use device_fpi_solver_mod
!
!
contains
!
!
   subroutine q_lskum()
!
      implicit none
!
      integer :: t
!



      call generate_split_stencils()
      call fpi_solver()
      call print()

!
      CLOSE(UNIT=104)
!
!
   end subroutine
!
!
!
end module q_lskum_mod
