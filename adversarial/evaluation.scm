;; Lab: Adversarial Search
;; CSC 261 
;;
;; File
;;   evaluation.scm
;;
;; Summary
;;   evaluation functions for mancala game states
;;
;; Provides
;;   (best-mancala-eval player)
;;

(module evaluation lang/plt-pretty-big
        (provide best-mancala-eval)
        (require "mancala.scm") ; add any other modules you may need

;;
;; Procedure
;;   best-mancala-eval
;;
;; Parameters
;;   player, a boolean
;;
;; Produces
;;   an evaluation function
;;
;; Preconditions
;;   player is #t or #f
;;
;; Postconditions
;;   returns a function that evaluated mancala game states
;;   this function returns higher numbers for favorable game states for player
;;   it calculates good states based on number of stones in own mancala
;;   and empty pockets across from potential jackpots
(define best-mancala-eval
   (lambda (player)
     (lambda (state)
       (let* ((board (cdr state))
                 (first 0)
                 (check-zero
                  (lambda (num)
                    (if (= 0 num)
                        1
                        0)))
                 (empty-holes (map check-zero board)))
         (if player
            (+ (* 0.2 (+
               (* (list-ref empty-holes 0) (list-ref empty-holes 7))
               (* (list-ref empty-holes 1)  (list-ref empty-holes 8))
               (* (list-ref empty-holes 2) (list-ref empty-holes 9))
               (* (list-ref empty-holes 3) (list-ref empty-holes 10))
               (* (list-ref empty-holes 4) (list-ref empty-holes 11))
               (* (list-ref empty-holes 5) (list-ref empty-holes 12))))
               (list-ref board 6))
            (+ (* 0.2 (+ (* (list-ref empty-holes 7) (list-ref empty-holes 0))
               (* (list-ref empty-holes 8) (list-ref empty-holes 1))
               (* (list-ref empty-holes 9) (list-ref empty-holes 2))
               (* (list-ref empty-holes 10) (list-ref empty-holes 3))
               (* (list-ref empty-holes 11) (list-ref empty-holes 4))
               (* (list-ref empty-holes 12)  (list-ref empty-holes 5))))
               (list-ref board 13)))))))

  
(define best-mancala-eval-trial1
  (lambda (player)
    (lambda (state)
      (let ((total-stones (cdr state)))
        (if player
            (+ (list-ref total-stones 0)
               (list-ref total-stones 1)
               (list-ref total-stones 2)
               (list-ref total-stones 3)
               (list-ref total-stones 4)
               (list-ref total-stones 5)
               (list-ref total-stones 6))
            (+ (list-ref total-stones 7)
               (list-ref total-stones 8)
               (list-ref total-stones 9)
               (list-ref total-stones 10)
               (list-ref total-stones 11)
               (list-ref total-stones 12)
               (list-ref total-stones 13)))))))

  ); module
