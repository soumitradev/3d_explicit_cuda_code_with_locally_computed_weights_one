!
!	First written on 02.02.2021
!
!
program meshfree_solver
!
!
   use data_structure_mod
   use point_preprocessor_mod
   use initial_conditions_mod
   use q_lskum_mod
   use post_processor_mod
!
!
   implicit none
!
!
!	Reading the input data ..
!
   call read_input_point_data()
!
!	Assign the initial conditions for the primitive variables ..
!
   call initial_conditions()
!
!	Primal fixed point iterative solver ..
!
   call q_lskum()
!
!	Printing the output (post-processing) ..
!
   call print_primal_output()
!
!
end program meshfree_solver
