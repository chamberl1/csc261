;; Lab: Adversarial Search
;; CSC 261 
;;
;; File
;;   driver.scm
;;
;; Summary
;;   A driver that shows the functions work
;;

(require "game.scm")
(require "minimax.scm")
(require "barranca.scm")
(require "tictactoe.scm")
(require "mancala.scm")
(require "mancala-player.scm") 
(require "cutoff-minimax.scm")
(require "evaluation.scm")
(require "alphabeta.scm")

(define barranca (make-barranca-game 6 30))
(define barranca-player1 (make-alpha-beta-player barranca 2
                                                 (barranca-utility-fun #t 30)))
(define barranca-player2 (make-alpha-beta-player barranca 2
                                                 (barranca-utility-fun #f 30)))


(display "Barranca game between two alpha-beta players\n")
(game-play barranca barranca-player1 barranca-player2)

(define minimax-player1 (make-minimax-player barranca 
                                                 (barranca-utility-fun #t 30)))
(define minimax-player2 (make-minimax-player barranca 
                                                 (barranca-utility-fun #f 30)))
(display "Same game with minimax players\n")
(game-play barranca minimax-player1 minimax-player2)