;; Lab 9:
;;   Decision Tree Learning
;;
;; File
;;   driver.scm
;;
;; Authors
;;   Anonymous students
;;
;; Summary
;;   Testing of decision-tree learner
;;
;; Provides
;;

(load "mushroom.scm")
(load "restaurant.scm")
(load "dtree.scm")    
(load "learning.scm")
(load "general.scm")

; Load the attributes list for mushrooms
(define mushroom-attributes
  (load-mushroom-attributes "mushroom-attribs.txt"))
; Load all the mushroom examples (labels with attribute association lists)
(define mushroom-examples
  (load-mushroom-examples "mushrooms.txt" mushroom-attributes))

(printf "Testing decision-tree-learning on mushrooms\n")
(print (decision-tree-learning mushroom-examples mushroom-attributes #\p))
(newline)
(newline)
(printf "Testing decision-tree-learning on restaurants\n")
(print (decision-tree-learning restaurant-examples restaurant-attributes #t))
(newline)
(newline)
(newline)
(newline)

;; TEST CHOOSE-ATTRIBUTE
(printf "Testing choose-attribute\n")
(printf "choose-attribute: ")
(print (choose-attribute mushroom-examples (map car mushroom-attributes) mushroom-attributes))
(newline)
(newline)
(printf "information-gain: \n")
(printf "cap-shape: " )
(print (information-gain mushroom-examples "cap-shape" mushroom-attributes))
(newline)
(printf "cap-surface: " )
(print (information-gain mushroom-examples "cap-surface" mushroom-attributes))
(newline)
(printf "cap-color: " )
(print (information-gain mushroom-examples "cap-color" mushroom-attributes))
(newline)
(printf "bruises?: " )
(print (information-gain mushroom-examples "bruises?" mushroom-attributes))
(newline)
(printf "odor: " )
(print (information-gain mushroom-examples "odor" mushroom-attributes))
(newline)
(printf "gill-attachment: " )
(print (information-gain mushroom-examples "gill-attachment" mushroom-attributes))
(newline)
(printf "gill-spacing: " )
(print (information-gain mushroom-examples "gill-spacing" mushroom-attributes))
(newline)
(printf "gill-size: " )
(print (information-gain mushroom-examples "gill-size" mushroom-attributes))
(newline)
(printf "gill-color: " )
(print (information-gain mushroom-examples "gill-color" mushroom-attributes))
(newline)
(printf "stalk-shape: " )
(print (information-gain mushroom-examples "stalk-shape" mushroom-attributes))
(newline)
(printf "stalk-surface-above-ring: " )
(print (information-gain mushroom-examples "stalk-surface-above-ring" mushroom-attributes))
(newline)
(printf "stalk-surface-below-ring: " )
(print (information-gain mushroom-examples "stalk-surface-below-ring" mushroom-attributes))
(newline)
(printf "stalk-color-above-ring: " )
(print (information-gain mushroom-examples "stalk-color-above-ring" mushroom-attributes))
(newline)
(printf "stalk-color-below-ring: " )
(print (information-gain mushroom-examples "stalk-color-below-ring" mushroom-attributes))
(newline)
(printf "veil-type: " )
(print (information-gain mushroom-examples "veil-type" mushroom-attributes))
(newline)
(printf "veil-color: " )
(print (information-gain mushroom-examples "veil-color" mushroom-attributes))
(newline)
(printf "ring-number: " )
(print (information-gain mushroom-examples "ring-number" mushroom-attributes))
(newline)
(printf "ring-type: " )
(print (information-gain mushroom-examples "ring-type" mushroom-attributes))
(newline)
(printf "spore-print-color: " )
(print (information-gain mushroom-examples "spore-print-color" mushroom-attributes))
(newline)
(printf "population: " )
(print (information-gain mushroom-examples "population" mushroom-attributes))
(newline)
(printf "habitat: " )
(print (information-gain mushroom-examples "habitat" mushroom-attributes))
(newline)

(printf " 'odor' has the highest information-gain value, ")
(printf "thus it is the best attribute according to choose-attribute\n")





