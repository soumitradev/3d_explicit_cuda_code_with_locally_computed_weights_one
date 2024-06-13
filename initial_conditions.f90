module initial_conditions_mod
   !
   use data_structure_mod
   !
contains
   !
   !
   subroutine initial_conditions()
      !
      implicit none
      !
      integer k

      OPEN(UNIT=101,FILE="/home/anil/mayuri/3d_explicit_code_serial_code/&
      &restart-file-from-500-iters-inner-iters-zero.dat",FORM="FORMATTED",STATUS="OLD",ACTION="READ")
      !

      if(initial_conditions_flag == 0) then

         do k=1, max_points

            point%prim(1,k) = rho_inf
            point%prim(2,k) = u1_inf
            point%prim(3,k) = u2_inf
            point%prim(4,k) = u3_inf
            point%prim(5,k) = pr_inf
         enddo

      elseif (initial_conditions_flag == 1) then

         do k=1, max_points
            read(101,*) point%prim(1,k), point%prim(2,k), point%prim(3,k), point%prim(4,k), point%prim(5,k)
         enddo
      end if


      !
      !                        CLOSE(UNIT=101)

   end subroutine
   !
   !
end module initial_conditions_mod

