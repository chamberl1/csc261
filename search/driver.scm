;; Lab: Uninformed Search
;; CSC 261 
;;
;; File
;;   driver.scm
;;
;; Summary
;;   A test of the uninformed search algorithms
;;
;; Provides
;;   Testing for:
;;   (search start-state problem enqueue heuristic)
;;   (breadth-first-search start-state problem)
;;   (depth-first-search start-state problem)
;;   (uniform-cost-search start-state problem)
;;   (depth-limited-search start-state problem)
;;   (iterative-deepening-search start-state problem)


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

;;Testing Eight Puzzle States
(define eight-puzzle-state1 (list 8 (list 1 4 2 3 7 5 6 'x 8)))
(define eight-puzzle-state2 (list 6 (list 3 1 2 4 5 'x 6 7 8)))
(define eight-puzzle-state3 (list 5 (list 1 2 5 3 'x 4 6 7 8)))

(define eight-puzzle-start-node1 (node-init eight-puzzle-state1 zero-fun))
(define eight-puzzle-start-node2 (node-init eight-puzzle-state2 zero-fun))
(define eight-puzzle-start-node3 (node-init eight-puzzle-state3 zero-fun))
;;breadth-first-search
(define bfs-enqueue
  (lambda (new-nodes frontier) 
       (append frontier new-nodes)))

;; depth-limited-search
(define dls-enqueue
     (lambda (new-nodes frontier)
       (let ((limit-check
              (lambda (node)
                (<= (node-depth node) 3))))
       (append frontier (filter limit-check new-nodes)))))


(define heuristic (lambda (state) 0))



;; Testing: search
(display "Testing search \n")
;;State 1
(display "For state 1\n")
(display (eight-puzzle-state-board-list eight-puzzle-state1))
;;bfs
(display "\n Using breadth-first enqueue function, the result is:\n")
(display (search eight-puzzle-state1 eight-puzzle bfs-enqueue heuristic))
(display "\n Test pass!\n")
;;dls
(display "Using depth-limit enqueue function with a limit of 3, the result is:\n")
(display (search eight-puzzle-state1 eight-puzzle dls-enqueue heuristic))
(display "\n Test pass!\n")

;;State 2
(display "For state 2\n")
(display (eight-puzzle-state-board-list eight-puzzle-state2))
;;bfs
(display "\n Using breadth-first enqueue function, the result is:\n")
(display (search eight-puzzle-state2 eight-puzzle bfs-enqueue heuristic))
(display "\n Test pass!\n")


;;State 3
(display "For state 3\n")
(display (eight-puzzle-state-board-list eight-puzzle-state3))
;;bfs
(display "\n Using breadth-first enqueue function, the result is:\n")
(display (search eight-puzzle-state3 eight-puzzle bfs-enqueue heuristic))
(display "\n Test pass!\n")



;; Testing: breadth-first-search
(display "Testing breadth first search\n")
;;State 1
(display "For state 1\n")
(display (eight-puzzle-state-board-list eight-puzzle-state1))
(display "\n After search\n")
(display (breadth-first-search eight-puzzle-state1 eight-puzzle))
(display "\n Test pass!\n")

;;State 2
(display "For state 2\n")
(display (eight-puzzle-state-board-list eight-puzzle-state2))
(display "\n After search\n")
(display (breadth-first-search eight-puzzle-state2 eight-puzzle))
(display "\n Test pass!\n")



;; Testing: depth-first-search
(display "Testing depth first search\n")
;;State 2
(display "For state 2\n")
(display (eight-puzzle-state-board-list eight-puzzle-state2))
(display "\n After search\n")
(display (depth-first-search eight-puzzle-state2 eight-puzzle))
(display "\n Test pass!\n")

;;State 3
(display "For state 3\n")
(display (eight-puzzle-state-board-list eight-puzzle-state3))
(display "\n After search\n")
(display (depth-first-search eight-puzzle-state3 eight-puzzle))
(display "\n Test pass!\n")



;; Testing: depth-limited-search

(display "Testing depth limited search\n")
;;State 1
(display "For state 1\n")
(display (eight-puzzle-state-board-list eight-puzzle-state1))
;fail
(display "\n After search with a limit of 2\n")
(display (depth-limited-search eight-puzzle-state1 eight-puzzle 2))
;success
(display "\n After search with a limit of 3\n")
(display (depth-limited-search eight-puzzle-state1 eight-puzzle 3))
(display "\n Test pass!\n")

;;State 3
(display "Testing depth limited search\n")
;;State 1
(display "For state 3\n")
(display (eight-puzzle-state-board-list eight-puzzle-state3))
;fail
(display "\n After search with a limit of 3\n")
(display (depth-limited-search eight-puzzle-state3 eight-puzzle 3))
;success
(display "\n After search with a limit of 4\n")
(display (depth-limited-search eight-puzzle-state3 eight-puzzle 4))
(display "\n Test pass!\n")




;; Testing: uniform-cost-search
(display "Testing uniform cost search \n")
;;State 1
(display "For state 1\n")
(display (eight-puzzle-state-board-list eight-puzzle-state1))
(display "\n After search\n")
(display (uniform-cost-search eight-puzzle-state1 eight-puzzle))
(display "\n Test pass!\n")

;;State 2
(display "For state 2\n")
(display (eight-puzzle-state-board-list eight-puzzle-state2))
(display "\n After search\n")
(display (uniform-cost-search eight-puzzle-state2 eight-puzzle))
(display "\n Test pass!\n")



;; Testing: iterative-deepening-search

(display "Testing iterative deepening search\n")
;;State 1
(display "For state 1\n")
(display (eight-puzzle-state-board-list eight-puzzle-state1))
(display "\n After search\n")
(display (iterative-deepening-search eight-puzzle-state2 eight-puzzle))
(display "\n Test pass!\n")

;;State 3
(display "For state 3\n")
(display (eight-puzzle-state-board-list eight-puzzle-state3))
(display "\n After search\n")
(display (iterative-deepening-search eight-puzzle-state3 eight-puzzle))
(display "\n Test pass!\n")




