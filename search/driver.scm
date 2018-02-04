(load "problem.scm")
(load "node.scm")
(load "8puzzle.scm")
(load "hexturn.scm")
(load "search.scm")
(load "jump.scm")
(require rackunit)
(require rackunit/text-ui)

(define eight-puzzle (eight-puzzle-problem))

(define zero-fun (lambda (x) 0))

(define eight-puzzle-state1 (list 8 (list 1 4 2 3 7 5 6 'x 8)))
(define eight-puzzle-state2 (list 5 (list 6 3 2 1 'x 5 7 4 8)))
(define eight-puzzle-state3 (list 3 (list 3 2 'x 6 1 5 7 4 8)))

(define eight-puzzle-start-node1 (node-init eight-puzzle-state1 zero-fun))

(define bfs-enqueue
  (lambda (new-nodes frontier) 
       (append frontier new-nodes)))

(define dfs-enqueue
  (lambda (new-nodes frontier) 
       (append new-nodes frontier)))

(define heuristic (lambda (state) 0))

(define test-search
  (test-suite
   "Test of search"
   (test-case
    "BFS-state1"
    (check equal? (search state1 eight-puzzle state1 heuristic)