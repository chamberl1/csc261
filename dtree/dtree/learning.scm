;; Lab 9:
;;   Decision Tree Learning
;;
;; File
;;   learning.scm
;;
;; Authors
;;   Jerod Weinman
;;     Documentation for decision-tree-learning and choose-attribute
;;   Anonymous students
;;     Implementation for decision-tree-learning and choose-attribute
;;
;; Summary
;;   Implementation of decision-tree learner
;;
;; Provides
;;   (decision-tree-learning examples attribs default)
;;   (choose-attribute examples candidates attrib-values)

(load "mushroom.scm") ; Load procedures for loading mushroom data
(load "dtree.scm")    ; Load decision-tree routines
(load "general.scm")
;;
;; Procedure
;;   choose-attribute
;;
;; Purpose
;;   Find an optimal attribute to split on
;;
;; Parameters
;;   examples, an association list
;;   candidates, a list
;;   attrib-values, an association list
;;
;; Produces
;;   attrib, a value
;;
;; Preconditions
;;   candidates is non-empty
;;   attrib-values is non-empty
;;   Each entry in examples is a pair whose car is a label (any Scheme value)  
;;      whose and cdr is an association list. 
;;   Each association list has identical keys (and in the same order), 
;;      but potentially different values.
;;   Each member of candidates is a key in the association list.
;;   attrib-values is an association list
;;   Each value of the association list for an example's attribute is a member 
;;      of the values for attrib-values under the same key.
;;
;; Postconditions
;;   attrib is the member of candidates with the highest information gain 
;;   (entropy minus average conditional entropy)
(define choose-attribute
  (lambda (examples candidates attrib-values)
    (let loop ([maxgain ;; initial value of max is the
                        ;; information gain of first attribute
                (information-gain examples (car candidates) attrib-values)]
               [best (car candidates)] ;; inital best is first attribute
               [cands (cdr candidates)]) ;; remaining attribute candidates
      
      (cond [(null? cands)  best] ;; if no more attribute candidates return best
               ;; if information gain of next candidate attribute > maxgain
            [( > (information-gain examples (car cands) attrib-values) maxgain)
               ;; then recurse, setting new maxgain
             (loop (information-gain examples (car cands) attrib-values)
                   (car cands) ;; new best attribute
                   (cdr cands))] ;; remaining atteibutes
               ;; otherwise try remaining attributes
            [else (loop maxgain best (cdr cands))]))))
          

;; Procedure
;;   decision-tree-learning
;;
;; Purpose
;;   Learn a decision tree from data
;;
;; Parameters
;;   examples, an association list
;;   attribs, an association list
;;   default, a value
;;
;; Produces
;;   decision-tree, a decision-tree
;;
;; Preconditions
;;   Each entry in examples is a pair whose car is a label (any Scheme value)  
;;      whose and cdr is an association list. 
;;   Each association list has identical keys (and in the same order), 
;;      but potentially different values.
;;   attribs is an association list
;;   Each key in attribs is a key in the example association list
;;   Each value of an attribute in examples a member of the corresponding 
;;      association list values for attribs
;;
;;
;; Postconditions
;;   decision tree-is a decision tree, which is either a label or a list 
;;      whose car is an attribute and whose cdr is an association list 
;;      with attribute values as keys and decision trees as values.
(define decision-tree-learning
  (lambda (examples attribs default)
    (letrec ([tree-helper
              (lambda (attrib-name attrib-value)
                (decision-tree-learning
                   ;; only keep examples with attribute value
                 (filter-examples-by-attribute-value
                  examples attrib-name attrib-value)
                   ;; remove attribute from attribute list
                 (filter-alist attribs attrib-name)
                   ;; set default to most common classification
                 (plurality-value examples)))])
             ;; if no examples left return classification             
    (cond [(null? examples) default]
             ;; if all classifications are the same, return that classification
          [(all-same-label? examples) (caar examples)]
             ;; if no attributes left, return most common classification
          [(null? attribs) (plurality-value examples)]
             ;; otherwise recurse 
          [else (let* ([candidates (map car attribs)] ;; attribute names
                         ;; attribute with highest information gain
                      [A (choose-attribute examples candidates attribs)]
                         ;; possible values for that attribute
                      [avalues (cdr (assoc A attribs))])
                    ;; make tree
                  (cons A
                        (map cons avalues ;; for each attribute value
                             ;; recursively build tree with tree-helper
                        (map (l-s tree-helper A) avalues))))]))))
