

(require "jump.scm")

(define jump-heuristic
  (lambda (jump-state)
    (let ([best-estimate (optimal-jump-speed jump-state)])
      (cond
        ((> (caddr jump-state)  (add1 best-estimate))
          +inf.0)
        ((< (caddr jump-state)  best-estimate)
         (add1 best-estimate))
         (else
          best-estimate)))))


(define optimal-jump-speed
  (lambda (jump-state)
    (let* ([constant
           (* 2 ( - (car jump-state) (cadr jump-state)))]
           [discriminant (- 1 (* -4 constant))])
     (ceiling (/ (sub1 (sqrt discriminant)) 2)))))

(define extra-heuristic
  (lambda (jump-state)
    (let* ([length (car jump-state)]
          [distance (- (car jump-state) (cadr jump-state))]
          [speed (caddr jump-state)])
      (cond
        ((= 0 distance) 0)
        ((< 2 (/ length distance))  speed)
        (else (- length speed))))))

            