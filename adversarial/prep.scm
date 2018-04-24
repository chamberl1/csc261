(require "game.scm")
(require "minimax.scm")
(require "barranca.scm")
(require "tictactoe.scm")
(require "mancala.scm")
(require "mancala-player.scm") 
(require "cutoff-minimax.scm")
(require "evaluation.scm")
(require "alphabeta.scm")




(define barranca (make-barranca-game 4 7))
(define barranca-player1 (make-alpha-beta-player barranca 2 (barranca-utility-fun #t 7)))
(define barranca-player2 (make-alpha-beta-player barranca 2 (barranca-utility-fun #f 7)))

(define ttt (make-tictactoe-game))
(define ttt-smart-player1 (make-alpha-beta-player ttt 2 (tictactoe-utility-fun #t))) 
(define ttt-smart-player2 (make-alpha-beta-player ttt 2 (tictactoe-utility-fun #f))) 

(define ttt-lazy-player 
   (lambda (state)
      (caar ((game-successors-fun ttt) state))))

(define mancala (make-mancala-game))
(define mancala-player1-eval (simple-mancala-eval #t))

(define mancala-player1 
  (make-cutoff-minimax-player mancala 4 mancala-player1-eval))


(define mancala-lazy-player
  (lambda (state)
    (caar ((game-successors-fun mancala) state))))

(define mancala-player2-eval (best-mancala-eval #f))

(define mancala-player2 
  (make-cutoff-minimax-player mancala 4 mancala-player2-eval))
