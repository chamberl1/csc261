;;
;; File
;;   enumeration.scm
;;
;; Author
;;   Jerod Weinman (Documentation)
;;
;; Summary
;;   Provides a collection of routines for truth-table enumeration entailment
;;
;; Provides
;;   (tt-entails? knowledge-base query)
;;   (tt-check-all knowledge-base query symbols model)
;;   (pl-true? sentence model)
;;
;; Practica
;;   A sentence is either a boolean value, a symbol (representing a
;;   variable), or a list. When the sentence is a list, the first item
;;   must be one of the symbols 'not, 'and, 'or, '=>, or '<=>. If the
;;   symbol is 'not, the list must have only a second element, another
;;   sentence, otherwise the list must have two subsequent elements,
;;   sentences, that represent the arguments to the specified logical
;;   connectives.
;;
;;   More formally, a sentence is defined as follows:
;; 
;;     sentence := boolean | symbol | (not sentence) | 
;;                 (and sentence sentence) |
;;                 (or sentence sentence) |
;;                 (=> sentence sentence) |
;;                 (<=> sentence sentence)
;;
;;   A model is an association list whose keys (car of elements) are
;;   symbols and whose values (cdr of elements) are booleans.




;;
;; Procedure
;;   tt-entails?
;;
;; Purpose
;;   Determine whether a knowledge-base entails a given sentence
;;
;; Parameters
;;   knowledge-base, a sentence
;;   query, a sentence
;;
;; Produces
;;   entails, a boolean
;;
;; Preconditions
;;   [No additional.]
;;
;; Postconditions
;;   entails is true when query is true in every model in which
;;   knowledge-base is true. Otherwise, entails is false.
      
	   



;;
;; Procedure
;;   tt-check-all
;;
;; Purpose
;;   Enumerate all assignments to symbols to determine entailment
;;
;; Parameters
;;   knowledge-base, a sentence
;;   query, a sentence
;;   symbols, a list
;;   model, an association list
;;
;; Produces
;;   entails, a boolean
;;
;; Preconditions
;;   All keys in model are Scheme symbols and all values in model are
;;   Scheme booleans.  If symbols is empty, all symbols in both
;;   knowledge-base and query have entries in model.
;;
;; Postconditions
;;   entails is true when query is true in every model in which
;;   knowledge-base is true. Otherwise, entails is false.



;;
;; Procedure
;;   pl-true?
;;
;; Purpose
;;   Determine whether a sentence is satisfied by a model
;;
;; Parameters
;;   sentence, a sentence
;;   model, an association list
;;
;; Produces
;;   result, a boolean
;;
;; Preconditions
;;   All keys in model are Scheme symbols and all values in model are
;;   Scheme booleans. All symbols in the sentence have an entry in the model.
;;
;; Postconditions
;;   result is true when the sentence holds within the model and false 
;;   otherwise.
