(load "mushroom.scm") ; Load procedures for loading mushroom data
(load "dtree.scm")    ; Load decision-tree routines
(load "learning.scm")
(load "general.scm")

; Load the attributes list for mushrooms
(define mushroom-attributes
  (load-mushroom-attributes "mushroom-attribs.txt"))
; Load all the mushroom examples (labels with attribute association lists)
(define mushroom-examples
  (load-mushroom-examples "mushrooms.txt" mushroom-attributes))

(define test-list (list (cons "hi" 2) (cons "bye" 56) (cons "soup" 3)))


(define pull-keys
  (lambda (assoc-list)
    (map car assoc-list)))

(define examples-stalk-val1
    (filter-examples-by-attribute-value mushroom-examples
                                        "stalk-shape"
                                        #\e))

(define examples-stalk-val2
    (filter-examples-by-attribute-value mushroom-examples
                                        "stalk-shape"
                                        #\t))
  

(define gills
  (map (lambda (a-value)
         (cons a-value (label-counts (filter-examples-by-attribute-value mushroom-examples
                                             "gill-size"
                                             a-value))))
         (cdr (assoc "gill-size" mushroom-attributes))))


(define decision-stump
  (cons "gill-size"
        (list (cons #\b #\e)
              (cons #\n #\p))))

(define first-instance (cdar mushroom-examples))
         
(cdr (assoc (cdr (assoc "gill-size" first-instance))
            (cdr decision-stump)))