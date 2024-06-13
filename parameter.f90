module parameter_mod
   !
   !
   implicit none
   !
   !
   integer, parameter :: max_iters = 40
   !
   !		Flow conditions ..
   !
   real*8, parameter :: Mach = 0.7d0
   real*8, parameter :: aoa = 0.0d0
   !
   !
   !		Other parameters ..
   !
   real*8, parameter :: gamma = 1.4d0
   real*8, parameter :: pi=4.0d0*datan(1.0d0)
   real*8, parameter :: theta = aoa*pi/180.0d0
   !
   !
   !		Freestream values of the primitive variables ..
   !
   !
   real*8, parameter :: rho_inf = 1.0d0
   real*8, parameter :: u1_inf = Mach*dcos(theta)
   real*8, parameter :: u2_inf = 0.0d0
   real*8, parameter :: u3_inf = Mach*dsin(theta)
   real*8, parameter :: pr_inf = 1.0d0/1.4d0
   !
   !
   !       The parameter power is used to specify the weights
   !       in the LS formula for the derivatives ..
   !       power = 0.0d0, 2.0d0, 4.0d0, 6.0d0 ..
   !       For example,
   !       power = 1.0 => weights = 1.0
   !       power = 2.0 => weights = 1/d^2
   !
   real*8, parameter :: power = 2.0d0
   !
   !       The following parameter decides the spatial order of accuracy.
   !       If second_order_flag = 0 then we get first-order solution. If
   !       second_order_flag = 1, then it leads to second-order scheme.
   !
   integer, parameter :: second_order_flag = 1
   !
   !       The following parameter decides whether limiter should be used or not.
   !       If the limiter_flag = 1 then limiter is used. Else if limiter_flag = 0
   !       then there is no limiter and the solution is fully second-order accurate.
   !
   integer, parameter :: limiter_flag = 1
   !
   !


   real*8, parameter :: VL_CONST = 290.0d0
   real*8, parameter :: CFL = 0.4d0
   integer, parameter :: inner_iterations = 0

   !	flag for initial conditions.
   !	if flag = 0 => free stream conditions ..
   !	if flag = 1 => read initial conditions from a restart file ..
   !
   integer, parameter :: initial_conditions_flag = 0

   !
   !
   !
end module parameter_mod


