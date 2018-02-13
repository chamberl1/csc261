(require "search.scm")
(require "problem.scm")
(require "sort.scm")
(require "node.scm")
(require "jump.scm")
(load "heuristic.scm")
(load "8puzzle.scm")


;;adapted from uniform-cost-search from Jerod Weinman
(define a-star-search
  (lambda (start-state problem heuristic)
    (search
     start-state
     problem
     (lambda (new-nodes sorted-queue)
       ;; Sort the new new nodes according to total cost
       (let ([sorted-children (list-keyed-insertion-sort
                               new-nodes
                               node-total-cost
                               <=)])
         ;; Insert the new nodes efficiently into the already-sorted frontier
         (let insert ([remaining sorted-children] ;; Items to insert
                      [queue sorted-queue])       ;; List of sorted nodes
           (cond
             [(null? remaining) ;; Nothing left to insert?
              queue] ;; Return the queue (which is sorted)
             [(null? queue) ;; If the queue is empty, we can simply return the
              remaining]      ;; remaining items, because they're already sorted
             [(< (node-total-cost (car remaining))  ;; Compare total costs
                 (node-total-cost (car queue)))  
              (cons (car remaining) ;; List of the first remaining item and the
                    (insert (cdr remaining) queue))] ;;rest inserted into queue
             [else
              (cons (car queue) ;; List of the queue front and insert remaining
                    (insert remaining (cdr queue)))])))) ;;  into rest of queue
     ;; Heuristic function
     heuristic))) 

(define jump (jump-problem 200))
(define zero-fun (lambda (x) 0))
(define jump-state (list 200 0 0))
(define jump-start-node (node-init jump-state zero-fun))