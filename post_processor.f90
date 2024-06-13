module post_processor_mod
!
!	First written on 05.02.2021
!

!
   use data_structure_mod
!
!
contains
!
!
   subroutine print_primal_output()
      !
      !
      implicit none
!
      integer :: k

      OPEN(UNIT=101,FILE="primal-solution.dat",FORM="FORMATTED",STATUS="REPLACE",ACTION="WRITE")
      !OPEN(UNIT=102,FILE="restart-file.dat",ACTION="WRITE")
!

      do k = 1, max_points
         write(101,*) point%x(k), point%y(k), point%z(k), point%prim(1,k),point%prim(2,k),point%prim(3,k),point%prim(4,k),point%prim(5,k)
         !write(102,*) point%prim(1,k), point%prim(2,k), point%prim(3,k), point%prim(4,k), point%prim(5,k)
      enddo
!
!
      !
      CLOSE(UNIT=101)
      !
   end subroutine
!
!
!
!
end module post_processor_mod
