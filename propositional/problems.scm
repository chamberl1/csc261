;; Lab: Propositional Logic
;; CSC 261 
;;
;; File
;;   problems.scm
;;
;; Summary
;;   a test of propositional logic functions
;;
;; Provides
;;   unicorn knowldge base and tests
;;   portia knowledge base and tests
;;   liars knowledge base and tests
(require "weinman-enumeration.scm")

;; Part A: Unicorns!

;; If the unicorn is mythical, then it is immortal,
(define unicorn1 (list '=> 'Mythical 'Immortal))
;; but if it is not mythical, then it is a mortal mammal.
(define unicorn2 (list '=> (list 'not 'Mythical) (list 'and 'Mortal 'Mammal)))
;;  If the unicorn is either immortal or a mammal, then it is horned
(define unicorn3 (list '=> (list 'or 'Immortal 'Mammal) 'Horned))
;; The unicorn is magical if it is horned
(define unicorn4 (list '=> 'Horned 'Magical))
;; (full paragraph)
(define unicorn-kb (list 'and unicorn1 (list 'and unicorn2
                                             (list 'and unicorn3 unicorn4))))
(display "Unicorn Problem\n")
(display "\nEntails magical?\n")
(display (tt-entails? unicorn-kb 'Magical))
(display "\nEntails horned?\n")
(display (tt-entails? unicorn-kb 'Horned))
(display "\nEntails mythical\n")
(display (tt-entails? unicorn-kb 'Mythical))
;; I can prove the unicorn is Magical or Horned, but not that it is Mythical.


;; Part B: Portia's Caskets

;; Gold: The portrait is in this casket
(define gold 'G)
;; Silver: The portrait is not in this casket
(define silver (list 'not 'S))
;; Lead: The portrait is not in the gold casket
(define lead (list 'not 'G))
;; At most one of the statements is true (at least two must be false)
(define inscriptions (list 'or (list 'or (list 'and (list 'not gold)
                                               (list 'not silver))
                                     (list 'and (list 'not gold) (list 'not lead)))
                           (list 'and (list 'not silver) (list 'not lead))))
;; Portrait is in only one casket
(define caskets (list 'or
                      (list 'or (list 'and 'G (list 'and
                                                    (list 'not 'S)
                                                    (list 'not 'L)))
                            (list 'and 'S (list 'and
                                                (list 'not 'G)
                                                (list 'not 'L))))
                      (list 'and 'L (list 'and
                                          (list 'not 'S)
                                          (list 'not 'G)))))
; (define caskets1 (list 'or 'G (list 'or 'L 'S)))
; (define caskets2 (list 'or (list 'and (list 'not 'G) (list 'not 'L))))
;; (full knowledge-base)
(define portia-kb (list 'and inscriptions caskets))

;; The suitor should pick the silver casket and not the gold or lead


;; Part C: Knights, Knaves, and Werewolves

;; Knight and knave is mutually exclusive (do i need this???)
(define knights1 (list '<=> 'Knight (list 'not 'Knave)))
(define a 'A-wolf)
(define b 'B-wolf)
(define c 'C-wolf)
;; Exactly one can be werewolf
(define one-wolf (list 'or (list 'or (list 'and a (list 'and (list 'not b)
                                                        (list 'not c)))
                                 (list 'and b (list 'and (list 'not a)
                                                    (list 'not c))))
                       (list 'and c (list 'and (list 'not a)
                                          (list 'not b)))))
;; Statements:
(define A (list '<=> 'A-knight 'A-wolf))
(define B (list '<=>'B-knight 'B-wolf))
(define at-most-one-knight #f)
(define C (list '<=> 'C-knight at-most-one-knight))
(define at-most-one-knight (list 'or (list 'or (list 'and A (list 'and (list 'not B)
                                                        (list 'not C)))
                                 (list 'and B (list 'and (list 'not A)
                                                    (list 'not C))))
                       (list 'and C (list 'and (list 'not A)
                                          (list 'not B)))))






                       