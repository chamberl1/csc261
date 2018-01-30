;; Lab: Recalling Scheme
;; CSC 261 
;;
;; File
;;   test-polynomial.scm
;;
;; Summary
;;   A series of tests for functions in polynomial.scm
;;
 
(load "polynomial.scm")

;; Procedure: right-section
(display "Testing right section")
(display "\n((right-section expt 5) 2) = ")
(display ((right-section expt 5) 2))
(display "\n((right-section expt 5) 5)) = ")
(display ((right-section expt 5) 5))
(display "\n((right-section cons '(1 2 3)) 45)) = ")
(display ((right-section cons '(1 2 3)) 45))

;; Procedure: dot-product
(display "\nTesting dot-product")
(display "\n(dot-product '(2 2 3) '(1 2 3)) = ")
(display (dot-product '(2 2 3) '(1 2 3)))
(display "\n(dot-product '(2 15 3 4 7) '(1 2 3 5 6)) = ")
(display (dot-product '(2 15 3 4 7) '(1 2 3 5 6)))
(display "\n(dot-product '(1 1 1 1 1) '(1 2 3 5 6)) = ")
(display (dot-product '(1 1 1 1 1) '(1 2 3 5 6)))

;; Procedure: iota
(display "\nTesting iota")
(display "\n(iota 0) = ")
(display (iota 0))
(display "\n(iota 1) = ")
(display (iota 1))
(display "\n(iota 5) = ")
(display (iota 5))
(display "\n(iota 11) = ")
(display (iota 11))

;; Procedure: polynomial-term
(display "\nTesting polynomial-term")
(display "\n(define four-x-cubed (polynomial-term 4 3))")
(define four-x-cubed (polynomial-term 4 3))
(display "\n(four-x-cubed 2) = ")
(display (four-x-cubed 2))
(display "\n(four-x-cubed 4) = ")
(display (four-x-cubed 4))
(display "\n(define zero-x5 (polynomial-term 0 5))")
(define zero-x5 (polynomial-term 0 5))
(display "\n(zero-x5 3) = ")
(display (zero-x5 3))
(display "\n(zero-x5 399) = ")
(display (zero-x5 399))
(display "\n(define 4x0 (polynomial-term 4 0))")
(define 4x0 (polynomial-term 4 0))
(display "\n(4x0 2) = ")
(display (4x0 2))
(display "\n(4x0 33) = ")
(display (4x0 33))


;; Procedure: polynomial
(display "\nTesting polynomial")
(display "\n(define quadratic (polynomial (list 7 1 11)))")
(define quadratic (polynomial (list 7 1 11)))
(display "\n(quadratic 5) = ")
(display (quadratic 5))
(display "\n(quadratic 0) = ")
(display (quadratic 0))
(display "\n(define anotherone (polynomial (list 1 1)))")
(define anotherone (polynomial (list 1 1)))
(display "\n(anotherone 5) = ")
(display (anotherone 5))
(display "\n(anotherone 0) = ")
(display (anotherone 0))

;; Procedure: polynomial-term
(display "\nTesting polynomial-term")
(display "\n(polynomial-derivative-coeffs (list 8 9 0 -54 11)) = ")
(display (polynomial-derivative-coeffs (list 8 9 0 -54 11)))
(display "\n(polynomial-derivative-coeffs (list 1)) = ")
(display (polynomial-derivative-coeffs (list 1)))
(display "\n(polynomial-derivative-coeffs (list 1 12)) = ")
(display (polynomial-derivative-coeffs (list 1 12)))

;; Procedure: nest
(display "\nTesting nest")
(display "\n(define expt3 (nest (r-s expt 3) 3))")
(define expt3 (nest (r-s expt 3) 3))
(display "\n(expt3 5) =")
(display (expt3 5))
(display "\n(expt3 1) =")
(display (expt3 1))
(display "\n(expt3 2) =")
(display (expt3 2))
(display "\n(define cdddddr (nest cdr 5))")
(define cdddddr (nest cdr 5))
(display "\n(cdddddr '( 1 2 3 4 5 6 7)) =")
(display (cdddddr '( 1 2 3 4 5 6 7)))

;; Procedure: polynomial-deriv
(display "\nTesting polynomial-deriv")
(display "\n(define 3-cubic (polynomial-deriv (list 1 0 11 -23) 3)) =")
(define 3-cubic (polynomial-deriv (list 1 0 11 -23) 3))
(display "\n(3-cubic 3) = ")
(display (3-cubic 3))
(display "\n(3-cubic 1) = ")
(display (3-cubic 1))
(display "\n(define 3-func (polynomial-deriv (list 1 0 11 -23 34 5 2 7) 3)) =")
(define 3-cubic (polynomial-deriv (list 1 0 11 -23 34 5 2 7) 3))
(display "\n(3-func 3) = ")
(display (3-cubic 3))
(display "\n(3-func 1) = ")
(display (3-cubic 1))

;; Procedure: non-zero-coefficients
(display "\nTesting non-zero-coefficients")
(display "\n(non-zero-coefficients (list 8 9 7 0 2 4 0 0)) =")
(display (non-zero-coefficients (list 8 9 7 0 2 4 0 0)))
(display "\n(non-zero-coefficients (list 0 1 0 1)) =")
(display (non-zero-coefficients (list 0 1 0 1)))
(display "\n(non-zero-coefficients (list 0 0 0 0)) =")
(display (non-zero-coefficients (list 0 0 0 0)))

