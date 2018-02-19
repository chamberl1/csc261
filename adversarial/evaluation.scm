(module evaluation lang/plt-pretty-big
        (provide best-mancala-eval)
        (require "mancala.scm") ; add any other modules you may need


(define simple-mancala-eval
  (lambda (player)
    (lambda (state)
      (let ((board (cdr state)))
	(list-ref board (if player 6 13))))))
  
(define best-mancala-eval1
  (lambda (player)
    (lambda (state)
      (let ((total-stones (cdr state)))
        (if player
            (-0 (+ (list-ref total-stones 0)
               (list-ref total-stones 1)
               (list-ref total-stones 2)
               (list-ref total-stones 3)
               (list-ref total-stones 4)
               (list-ref total-stones 5)))
            (- 0 (+ (list-ref total-stones 7)
               (list-ref total-stones 8)
               (list-ref total-stones 9)
               (list-ref total-stones 10)
               (list-ref total-stones 11)
               (list-ref total-stones 12))))))))

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
                 (total-stones (map check-zero board)))
         (if player
            (+ (list-ref total-stones 0)
               (list-ref total-stones 1)
               (list-ref total-stones 2)
               (list-ref total-stones 3)
               (list-ref total-stones 4)
               (list-ref total-stones 5))
            (+ (list-ref total-stones 7)
               (list-ref total-stones 8)
               (list-ref total-stones 9)
               (list-ref total-stones 10)
               (list-ref total-stones 11)
               (list-ref total-stones 12)))))))

  (define best-mancala-eval3
    (lambda (player)
      (lambda (state)
        (if (equal? player (car state))
            (+ 1 ((simple-mancala-eval player) state))
            (+ 1 ((simple-mancala-eval player) state))))))
      
         
                 




  ); module
