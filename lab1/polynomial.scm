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


;; Purpose:
;;   to create a function that runs proc with fixed left value
;; Preconditions:
;;   proc must be a function that takes two parameters
;;   right must be a valid value for proc's left parameter
;; Postconditions:
;;   returns a function that runs proc with the given left value
(define left-section
  (lambda (proc left)
    (lambda (right)
      (proc left right))))
(define l-s left-section)



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
(define r-s right-section)


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


;; Purpose:
;;   to create multiple compositions of a function
;; Preconditions:
;;   num must be an integer greater than 1
;; Postconditions:
;;   return a function that is the composition of doing proc num times
(define nest
  (lambda (proc num)
    (cond
      [(>= 1 num) proc]
      [(compose proc (nest  proc (- num 1)))])))


;; Purpose:
;;   to create a function that runs a multiple derivative with given coefficients
;; Preconditions:
;;   num must be an integer greater than 1,
;;   coeffs must be a list of real numbers, the list of coefficients in ascending order
;; Postconditions:
;;   returns a function that runs the nth derivative of the polynomial with coeffs as coefficients
(define polynomial-deriv
  (lambda (coeffs n)
    (lambda (x)
        ((polynomial
         ((nest polynomial-derivative-coeffs n) coeffs))
         x))))
      
;; Purpose:
;;   to find which terms of a polynomial are present
;; Preconditions:
;;   coeffs must be a list of real numbers, the list of coefficients in ascending order
;; Postconditions:
;;   returns a list of which indices of coefficients in a polynomial are non-zero
(define non-zero-coefficients
  (lambda (coeffs)
    (let f ((lst coeffs) (i 0))
      (cond
        [(null? lst) '()]
        [(zero? (car lst)) (f (cdr lst) (+ i 1))]
        [else (cons i (f (cdr lst) (+ i 1)))]))))


    
     