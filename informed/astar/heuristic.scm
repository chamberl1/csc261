;; Lab: Heuristic Search
;; CSC 261
;;
;; File
;;   heuristic.scm
;;
;;
;; Summary 
;;   Provides a collection of heursitic functions for the jump problem 
;;
;; Provides
;;   (jump-heuristic jump-state)
;;   (extra-heuristic jump-state)


(require "jump.scm")


;;
;; Procedure
;;   jump-heuristic
;;
;; Purpose
;;   Estimate the cost (the number of steps needed to reach goal-state) for
;;   a given jump-state  
;;
;; Parameters
;;   jump-state, a list of integers that encodes the jump state for a
;;    jump-problem
;;   jump-state is (list N pos m), where N is the course length, pos is the
;;   agent's current position and m is the agent's momentum 
;;
;; Produces
;;   estimate, a non-negative integer
;;
;; Preconditions
;;   jump-state is a valid jump-state as per the constraints of the jump problem
;;
;; Postconditions
;;   estimate is a non-negative integer
;;   estimate is never less than (optmial-jump-speed jump-state)

(define jump-heuristic
  (lambda (jump-state)
    (let* ([optimal-jump-speed
            ;; a helper function that returns int, the optimal momentum
            (lambda (jump-state)
              (let* ([constant
                      ;; this part solves quadratic formula for a series sum
                      ;; 1 + 2 ... + N = (distance from  goal)
                      ;; to find N, the optimal jump speed
                      (* 2 ( - (car jump-state) (cadr jump-state)))]
                     [discriminant (- 1 (* -4 constant))])
                (ceiling (/ (sub1 (sqrt discriminant)) 2))))]
         
           [best-estimate (optimal-jump-speed jump-state)] ;; optimal jump
           [momentum (caddr jump-state)]) ;; current momentum
      (cond
        ((> momentum  (add1 best-estimate))
         +inf.0) ;; if the agent is faster than possible to reach goal,
                 ;; return infinity
        ((< momentum  best-estimate)
         (add1 best-estimate)) ;; if agent is slower than optimal jump speed
                               ;; return best-estimate plus 1
        (else
         best-estimate))))) ;; return best-estimate if momentum is optimal jump
                            ;; or 1 greater


;; Procedure
;;   extra-heuristic 
;;
;; Purpose
;;   Estimate the cost (the number of steps needed to reach goal-state) for
;;   a given jump-state  
;;
;; Parameters
;;   jump-state, a list of integers that encodes the jump state for a
;;    jump-problem
;;   jump-state is (list N pos m), where N is the course length, pos is the
;;   agent's current position and m is the agent's momentum 
;;
;; Produces
;;   estimate, a non-negative integer
;;
;; Preconditions
;;   jump-state is a valid jump-state as per the constraints of the jump problem
;;
;; Postconditions
;;   estimate is a non-negative integer

(define extra-heuristic
  (lambda (jump-state)
    (let* ([length (car jump-state)]
          [distance (- (car jump-state) (cadr jump-state))]
          [speed (caddr jump-state)])
      (cond
        ((= 0 distance) 0)
          ;; if at goal return 0
        ((< 2 (/ length distance))  speed) 
          ;; if less than halfway to goal prefer speeding up
        (else (- length speed))))))
          ;; if more than halfway to goal prefer slowing down

