;; Lab: Heuristic Search
;; CSC 261
;;
;; File
;;   driver.scm
;;
;;
;; Summary 
;;   Provides tests for jump-heuristic function and a-star-search
;;
;; Provides
;;   [none]

(require "search.scm")
(require "problem.scm")
(require "sort.scm")
(require "node.scm")
(require "jump.scm")
(load "heuristic.scm")
(load "8puzzle.scm")

;;
;; Heuristic Tests
;; Our function returns inf if it is impossible to reach a solution
;;   from the current state
;; It returns the "best-estimate" or optimal-jump-speed from that
;;   node if the momentum is the optimal speed or one greater
;;   {optimal-jump speed meaning N in (N + N-1 + N-2 ... 3 + 2 + 1)
;;   which would allow the agent to reach the goal in fewest moves
;;   while still slowing down sufficiently}
;; It returns one greater than best-estimate otherwise

;; Course Length 10
(define jumpstate10-1 (list 10 0 0))
(define jumpstate10-2 (list 10 0 4))
(define jumpstate10-3 (list 10 2 2))
(define jumpstate10-4 (list 10 2 1))
(define jumpstate10-6 (list 10 2 4))
(define jumpstate10-5 (list 10 7 5))
(display "\nheuristic function on state: (10 0 0) expected output: 5\n actual:")
(display (jump-heuristic jumpstate10-1))
;; returns best-estimate + 1 because it is slower than the optimal speed 4
(display "\nheuristic function on state: (10 0 4) expected output: 4\n actual:")
(display (jump-heuristic jumpstate10-2))
;; returns best-estimate  because it is the optimal speed 4
(display "\nheuristic function on state: (10 2 2) expected output: 5\n actual:")
(display (jump-heuristic jumpstate10-3))
;; returns best-estimate + 1 because it is slower than the optimal speed 4
(display "\nheuristic function on state: (10 2 1) expected output: 5\n actual:")
(display (jump-heuristic jumpstate10-4))
;; returns best-estimate + 1 because it is slower than the optimal speed 4
(display "\nheuristic function on state: (10 2 4) expected output: 4\n actual:")
(display (jump-heuristic jumpstate10-6))
;; returns best-estimate  because it is the optimal speed 4
(display "\nheuristic function on state: (10 7 5) expected output: inf\n actual:")
(display (jump-heuristic jumpstate10-5))
;; returns inf because it is faster than possible to reach a solution

;; Course Length 5
(define jumpstate5-1 (list 5 0 0))
(define jumpstate5-2 (list 5 5 5))
(define jumpstate5-3 (list 5 2 2))
(display "\nheuristic function on state: (5 0 0) expected output: 4\n actual:")
(display (jump-heuristic jumpstate5-1))
;; returns best-estimate + 1 because it is slower than the optimal speed 3
(display "\nheuristic function on state: (5 5 5) expected output: inf\n actual:")
(display (jump-heuristic jumpstate5-2))
;; returns inf because it is faster than possible to reach a solution

;;
;; A* Search Tests
;;

(define jump10 (jump-problem 10))
(define state10 (list 10 0 0))

(display "\n\nA* search on course length 10\n")
(display (a-star-search state10 jump10 jump-heuristic))
(display "\n1 + 3 + 3 + 2 + 1 = 10, and all the moves are valid so it is  a real solution\n")
(display "BFS returns same length solution:\n")
(display (breadth-first-search state10 jump10))

(define jump20 (jump-problem 20))
(define state20 (list 20 0 0))

(display "\n\nA* search on course length 20\n")
(display (a-star-search state20 jump20 jump-heuristic))
(display "\n1 + 3 + 5 + 4 + 3 + 2 + 1 + 1 = 20, and all the moves are valid so it is  a real solution\n")
(display "BFS returns same length solution:\n")
(display (breadth-first-search state20 jump20))


(define jump200 (jump-problem 200))
(define state200 (list 200 0 0))

(display "\n\nA* search on course length 200\n")
(display (a-star-search state200 jump200 jump-heuristic))
(display "\n this sum equals 200, and all the moves are valid so it is  a real solution\n")







