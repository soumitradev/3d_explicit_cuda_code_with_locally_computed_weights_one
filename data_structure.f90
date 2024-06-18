module data_structure_mod
   !
   use parameter_mod
   !
   implicit none
   !
   type :: points
      !
      !		geometry based attributes ..
      !
      real*8, dimension(:), allocatable :: x,y,z
      real*8, dimension(:,:), allocatable :: tan1, tan2, nor
      integer, dimension(:), allocatable :: status
      integer, dimension(:), allocatable :: nbhs
      integer, dimension(:,:), allocatable :: conn
      real*8, dimension(:,:), allocatable :: weights
      real*8, dimension(:), allocatable :: min_dist
      !
      integer, dimension(:), allocatable :: xpos_nbhs,xneg_nbhs
      integer, dimension(:), allocatable :: ypos_nbhs,yneg_nbhs
      integer, dimension(:), allocatable :: zpos_nbhs,zneg_nbhs
      integer, dimension(:,:), allocatable :: xpos_conn,xneg_conn
      integer, dimension(:,:), allocatable :: ypos_conn,yneg_conn
      integer, dimension(:,:), allocatable :: zpos_conn,zneg_conn
      real*8, dimension(:,:), allocatable :: xpos_weights,xneg_weights
      real*8, dimension(:,:), allocatable :: ypos_weights,yneg_weights
      real*8, dimension(:,:), allocatable :: zpos_weights,zneg_weights
      !
      !		flow field based attributes ..
      !
      real*8, dimension(:,:), allocatable :: prim
      real*8, dimension(:,:), allocatable :: flux_res
      real*8, dimension(:,:), allocatable :: q
      real*8, dimension(:,:,:), allocatable :: qm
      real*8, dimension(:,:,:), allocatable :: dq
      real*8, dimension(:,:,:), allocatable :: dq_temp
      real*8, dimension(:), allocatable :: delt
      real*8, dimension(:,:,:), allocatable :: temp_wall_pts_flux_res, temp_interior_pts_flux_res, temp_outer_pts_flux_res

      !		For the implicit code based on LUSGS

      !real*8, dimension(:,:), allocatable :: U, delUp, delUn
      real*8, dimension(:), allocatable :: D_inv

      !
   end type points
   !
   type(points) :: point
   !
   !
   integer :: max_points
   integer ::  interior_points, wall_points, outer_points
   integer :: supersonic_inlet_points, supersonic_outlet_points
   !
   integer, dimension(:), allocatable :: interior_points_index
   integer, dimension(:), allocatable :: wall_points_index
   integer, dimension(:), allocatable :: outer_points_index
   integer, dimension(:), allocatable :: supersonic_outlet_points_index
   integer, dimension(:), allocatable :: supersonic_inlet_points_index

   !
   real*8 res_old, res_new, max_res, residue
   integer max_res_point

   !
contains
   !
   subroutine allocate_size()
      !
      implicit none
      !
      allocate(point%x(max_points))
      allocate(point%y(max_points))
      allocate(point%z(max_points))
      allocate(point%tan1(3,max_points))
      allocate(point%tan2(3,max_points))
      allocate(point%nor(3,max_points))
      allocate(point%status(max_points))
      allocate(point%nbhs(max_points))
      allocate(point%conn(40,max_points))
      allocate(point%weights(40,max_points))
      allocate(point%min_dist(max_points))
      allocate(point%xpos_nbhs(max_points))
      allocate(point%xneg_nbhs(max_points))
      allocate(point%ypos_nbhs(max_points))
      allocate(point%yneg_nbhs(max_points))
      allocate(point%zpos_nbhs(max_points))
      allocate(point%zneg_nbhs(max_points))
      allocate(point%xpos_conn(25,max_points))
      allocate(point%xneg_conn(25,max_points))
      allocate(point%ypos_conn(25,max_points))
      allocate(point%yneg_conn(25,max_points))
      allocate(point%zpos_conn(25,max_points))
      allocate(point%zneg_conn(25,max_points))
      allocate(point%xpos_weights(25,max_points))
      allocate(point%xneg_weights(25,max_points))
      allocate(point%ypos_weights(25,max_points))
      allocate(point%yneg_weights(25,max_points))
      allocate(point%zpos_weights(25,max_points))
      allocate(point%zneg_weights(25,max_points))
      allocate(point%prim(5,max_points))
      allocate(point%flux_res(5,max_points))
      allocate(point%delt(max_points))
      allocate(point%q(5,max_points))
      allocate(point%qm(5,2,max_points))
      allocate(point%dq(3,5,max_points))
      allocate(point%dq_temp(3,5,max_points))

      ! allocate(point%U(5,max_points))
      ! allocate(point%delUp(5,max_points))
      ! allocate(point%delUn(4,max_points))
      allocate(point%D_inv(max_points))
      allocate(point%temp_wall_pts_flux_res(6,5,max_points))
      allocate(point%temp_interior_pts_flux_res(6,5,max_points))
      allocate(point%temp_outer_pts_flux_res(6,5,max_points))

   end subroutine


   subroutine print()
      implicit none
      integer :: k
      do k = 1, 3!max_points
         !   if(point%status(k) == 1) then
         ! write(*, *) "k = ", k
         ! write(*, *)" x = ", point%x(k), " y = ", point%y(k)
         ! write(*, *) "status = ", point%status(k)
         ! write(*, *) "conn = ", point%conn(:, k)
         ! write(*, *) "weights = ", point%weights(:, k)
         ! write(*, *) "xpos_nb = ", point%xpos_nbhs(k)
         ! write(*, *) "xpos_conn = ", point%xpos_conn(:, k)
         ! write(*, *) "xpos_wgts = ", point%xpos_weights(:, k)
         ! write(*, *) "xneg_nbh = ", point%xneg_nbhs(k)
         ! write(*, *) "xneg_conn = ", point%xneg_conn(:, k)
         ! write(*, *) "xneg_wgts = ", point%xneg_weights(:, k)
         ! write(*, *) "ypos_nbh = ", point%ypos_nbhs(k)
         ! write(*, *) "ypos_conn = ", point%ypos_conn(:, k)


         ! write(*, *) "D_inv = ", k, point%D_inv(k)
         ! write(*, *) "U = ", point%U(1,k), point%U(2,k), point%U(3,k), point%U(4,k)
         ! write(*, *) "delUp = ", point%delUp(1,k), point%delUp(2,k), point%delUp(3,k), point%delUp(4,k)
         ! write(*, *) "delUn = ", point%delUn(1,k), point%delUn(2,k), point%delUn(3,k), point%delUn(4,k)
         ! ! &"nbhs = ", point%nbhs(k)
         !  write(*, *) "q = ", k,point%q(1,k), point%q(2,k), point%q(3,k), point%q(4,k)
         !  write(*, *) "dq[1] = ", point%dq(1,1,k), point%dq(1,2,k), point%dq(1,3,k), point%dq(1,4,k)
         !   write(*, *) "dq[2] = ", point%dq(2,1,k), point%dq(2,2,k), point%dq(2,3,k), point%dq(2,4,k)
         !   write(*, *) "flux residual = ",k, point%flux_res(1,k), point%flux_res(2,k),&
         !  & point%flux_res(3,k), point%flux_res(4,k)
         !  write(*, *) "prim = ", point%prim(1,k), point%prim(2,k), point%prim(3,k), point%prim(4,k)
         !   write(*, *) "delt = ", point%delt(k)
         ! endif
      enddo
   end subroutine


end module data_structure_mod

