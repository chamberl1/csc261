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



(define left-section
  (lambda (proc left)
    (lambda (right)
      (proc left right))))

;; Procedure:
;;   right-section
;; Parameters:
;;   proc, a binary procedure
;;   right, a value
;; Purpose:
;;   to create a function that runs proc with fixed right value
;; Preconditions:
;;   proc must be a function that takes two parameters
;;   right must be a valid value for proc's right parameter
;; Postconditions:
;;   returns a function that runs proc with the given right value
(define right-section
  (lambda (proc right)
    (lambda (left)
      (proc left right))))


;; Purpose:
;;   computes the dot product of two lists
;; Preconditions:
;;   v1 and v2 must be integer lists of equal length
;; Postconditions:
;;   returns an integer that is the dot product
(define dot-product
  (lambda (v1 v2)
    (apply + (map * v1 v2))))


;; Purpose:
;;   to create a list of numbers up to a point
;; Preconditions:
;;   num must be an integer greater than 0
;; Postconditions:
;;   returns a list of integers from 0 up to num-1, ascending
(define iota
  (lambda (num)
    (let f((lst '()) (i (- num 1)))
      (if (< i 0) lst
         (f (cons i lst) (- i 1) )))))

;; Purpose:
;;   to create a function that runs a paraticular polynomial function
;; Preconditions:
;;   c and n must be reals
;; Postconditions:
;;   returns the function f(x)=c*x^n
(define polynomial-term
  (lambda (c n)
    (lambda (x)
      (* c (expt x n)))))

;; Purpose:
;;   to create a function that runs a paraticular polynomial function
;;   given a list of coefficients
;; Preconditions:
;;   coeffs must be a list of real numbers starting with the coefficient for x^0
;;   all the way up to x^n, where n is the list length - 1
;; Postconditions:
;;   returns the polynomial function that takes a single number and runs the polynomial with the
;;   given coefficients
(define polynomial
  (lambda (coeffs)
    (lambda (x)
      (let f ((lst coeffs) (ret '()) (i 0))
        (if [null? lst]
            [apply + ret]
            [f (cdr lst)
               (cons (* (car lst) (expt x i)) ret)
               (+ i 1)])))))


;; Purpose:
;;   to find the coefficients of the derivative of a polynomial function
;; Preconditions:
;;   coeffs must be a list of real numbers starting with the coefficient for x^0
;;   all the way up to x^n, where n is the list length - 1
;; Postconditions:
;;   returns a list of coefficients where each new coefficient is c*n
;;   where n was the exponent of that term
(define polynomial-derivative-coeffs
  (lambda (coeffs)
      (let f ((lst (cdr coeffs)) (i 1))
        (cond
          [(null? lst) '()]
          [else (cons (* i (car lst)) (f (cdr lst)
               (+ i 1)))]))))

(define lst1 '(1 2 3 4))
(define lst2 '(4 5 6 7))
     