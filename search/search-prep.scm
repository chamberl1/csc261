(load "problem.scm")
(load "node.scm")
(load "8puzzle.scm")
(load "search.scm")
(load "jump.scm")

(define eight-puzzle (eight-puzzle-problem))

(define zero-fun (lambda (x) 0))

(define eight-puzzle-state (random-eight-puzzle-state 100))

(define jump (jump-problem 35))

(define jump-state (jump-start-state 35))

(define eight-puzzle-start-node (node-init eight-puzzle-state zero-fun))

(define successors 
        (problem-expand-node eight-puzzle 
                             eight-puzzle-start-node
                             zero-fun))


(define all-successors
  (lambda (lst)
    (map node-state lst)))
