(load "problem.scm")
(load "node.scm")
(load "8puzzle.scm")

(define eight-puzzle (eight-puzzle-problem))

(define zero-fun (lambda (x) 0))

(define eight-puzzle-state (random-eight-puzzle-state 3))



(define eight-puzzle-start-node (node-init eight-puzzle-state zero-fun))

(define successors 
        (problem-expand-node eight-puzzle 
                             eight-puzzle-start-node
                             zero-fun))


(define all-successors
  (lambda (lst)
    (map node-state lst)))
