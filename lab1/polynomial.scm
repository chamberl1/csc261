;; Lab: Recalling Scheme
;; CSC 261 
;;
;; File
;;   polynomial.scm
;;
;; Summary
;;   A collection of routines finding solutions to search space problem
;;
;; Provides
;;   (search start-state problem enqueue heuristic)
;;   (breadth-first-search start-state problem)
;;   (depth-first-search start-state problem)
;;   (uniform-cost-search start-state problem)

;; Procedure:
;;   right-section
;; Parameters:
;;   proc, a binary procedure
;;   right, a value
;; Purpose:
;;
(define right-section
  (lambda (proc right)
    (lambda (left)
      (proc left right))))

(define dot-product
  (lambda (v1 v2)
    ()))   ;;I DONT REMEMBER SCHEME

(define iota
  (lambda (num)
    ()))


     