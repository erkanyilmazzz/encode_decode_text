; *********************************************
; *  341 Programming Languages                *
; *  Fall 2019                                *
; *  Author: Erkan Yılmaz                     *
; *********************************************

;; utility functions 
(load "include.lisp") ;; "c2i and "i2c"



(defun read-as-list (filename)
	; Reads a file containing one word per line and returns a list of words (each word is in turn a list of characters)."

	; Implement this function...

	(format t "~%")
	(setq words '( ))

				(setq words '( ))
         		(setq word '( ))	
         		(setq l '())


 	(with-open-file (infile filename
                              :direction :input)
       (do (
       			(sym 
       				(read-char  infile nil 'eof) 
       				(read-char  infile nil 'eof)
       			)

       		)
         		((eql sym 'eof) 'done)
         		(when (or (char= sym #\Space) (char= sym #\Newline))

         			(nreverse word )
         			(push word words)	
         			(setq word '())
         		)
         		(when (and (not (char= sym #\Space)) (not (char= sym #\Newline)))
         			(setq word (push  sym word))
         		)
        )
       (close infile)
    )
 	(nreverse words)
)
;; -----------------------------------------------------
;; HELPERS
;; *** PLACE YOUR HELPER FUNCTIONS BELOW ***

(defun spell-checker-0 (word dic)
	;you should implement this function


;	(cond  ( (equal word (car dic))   t   )
;		   ( (eq    (car dic) nil )	 nil  )
;		   ((spell-checker-0 word (cdr dic)))
;	)

(dolist (n dic)
	(cond ((equal n word)    (return-from spell-checker-0 t))
	)
)

nil
)


(defun spell-checker-0_unit_test()

	(let ((doc (read-as-list "dictionary2.txt")))
		;(format t "~a" doc)
		(setq word '(#\t #\h #\i #\s ))
		(cond ((spell-checker-0 word doc)  (print "buldu"))
			((print "bulamadı"))	
		)

	)
)


(defun spell-checker-1 (word)
 	;you should implement this function
)


;; -----------------------------------------------------
;; DECODE FUNCTIONS

(defun add-pair (l1 p1 p2 )
    (setq l1 (cons (cons p1 p2) l1) )

)

(defun add-pair_unit_test ()
	(setq l '())

	(setq l (add-pair l 1 2))
	(setq l (add-pair l 5 2))
	(setq l (add-pair l 1 4))
	(setq l (add-pair l 7 2))

	(print l)
)


(defun change_words (words pairs)
  (setq changed_words '())
  (loop for i in words
      do(setq changed_words (push   (change_word i pairs) changed_words))
      
  )
  (nreverse changed_words)
)
(defun change_word (word pairs)
  (setq changed_word (copy-list word))
  (setq counter 0)
  
  (loop for i in changed_word
    do(loop for j in pairs
        do(if (eql i (car j))
          (progn
              (replace changed_word (list (cdr j)):start1 counter)  
            )
          )
    )
    (setq counter (+ 1 counter))
  )
  
  changed_word
)


(defun change_word_unit_test ()
  (setq pairs '())
    (setq pairs (add-pair pairs #\a #\a))
    (setq pairs (add-pair pairs #\b #\b))
    (setq pairs (add-pair pairs #\c #\c))
    (setq pairs (add-pair pairs #\d #\d))
    (setq pairs (add-pair pairs #\e #\e))
    (setq pairs (add-pair pairs #\f #\f))
    (setq pairs (add-pair pairs #\g #\g))
    (setq pairs (add-pair pairs #\h #\h))
    (setq pairs (add-pair pairs #\i #\i))
    (setq pairs (add-pair pairs #\o #\o))
    (setq pairs (add-pair pairs #\u #\u))
    (setq pairs (add-pair pairs #\z #\z))
    (setq pairs (add-pair pairs #\t #\t))
    (setq pairs (add-pair pairs #\r #\p))
  (setq word '( #\g #\r #\a #\m #\m #\a #\r))
    (change_word word pairs)
)


(defun change_words_unit_test()
  (setq pairs '())
    (setq pairs (add-pair pairs #\a #\a))
    (setq pairs (add-pair pairs #\b #\b))
    (setq pairs (add-pair pairs #\c #\c))
    (setq pairs (add-pair pairs #\d #\d))
    (setq pairs (add-pair pairs #\e #\e))
    (setq pairs (add-pair pairs #\f #\f))
    (setq pairs (add-pair pairs #\g #\g))
    (setq pairs (add-pair pairs #\h #\t))
    (setq pairs (add-pair pairs #\i #\i))
    (setq pairs (add-pair pairs #\o #\o))
    (setq pairs (add-pair pairs #\u #\u))
    (setq pairs (add-pair pairs #\z #\z))
    (setq pairs (add-pair pairs #\t #\h))
    
  (setq words (read-as-list "text.txt"))

  (format t "words :::::::~a~%~%" words)  
  (format t "changedwords:~a~%" (change_words words pairs))
  (format t "words::::::::~a~%~%" words)  
)

(defun map-permutations (fun lst  dict words )
  (if (null lst) (funcall fun nil dict words)
    (map nil
       (lambda (x)
            (map-permutations 
            (lambda (l dict words) 

              (if (not(equal nil (funcall fun (cons x l) dict words)))
                (progn
                     (return-from map-permutations (funcall fun (cons x l) dict words))
              
                )                
              )

              ) 
            (remove x lst) dict words)
        )
    lst)
  )
)
(defun print-list (l1)
  (print l1)
)
(defun map-permutations_unit_test ()
  (setq dict  (read-as-list "dictionary2.txt"))
  (setq words (read-as-list "text.txt" ))
  (map-permutations #'matcher  '(#\a #\b #\c #\d #\e #\f #\g #\h #\i #\j #\k #\l #\m #\n #\o #\p #\q 
        #\r #\s #\t #\u #\v #\w #\x #\y #\z )   dict  words)
)


(defun matcher (l dict words)
  ;(format t "words:::;;;;;::::~a ~%" words)
  (setq pairs '())
	(setq abc '(#\a #\b #\c #\d #\e #\f #\g #\h #\i #\j 
				#\k #\l #\m #\n #\o #\p #\q #\r #\s #\t 
				#\u #\v #\w #\x #\y #\z ))
  (dotimes (n 26)
    (setq pairs (add-pair pairs (car abc) (car l)))
    (setq abc (cdr abc))
    (setq l   (cdr l  ))
  )
  ;;generate pairs
  
  (setq changed_words (change_words words pairs))
 

  (setq counter 0)
  (loop for i in changed_words 
      do(if ( spell-checker-0 i dict)
          (setq counter (+ counter 1))
      )
  )

 ;(format t   "counter: ~a word :~a~%" counter (list-length words))
  (if (= counter (list-length words))
 ;     (print "buldu")
      (progn 
        ;(format t "changed words::::~a ~%" changed_words)
       #'(lambda (text)
            (setq changed_words '())
            (loop for i in text
                do(setq changed_words (push   (change_word i pairs) changed_words))
      
            )
                    ;(format t "~a "(nreverse changed_words))
                   (nreverse changed_words)
          )

      )
      nil
  )

)



(defun Gen-Decoder-A (paragraph)
	;you should implement this function
      (setq dict  (read-as-list "dictionary2.txt"))
    ;  (format t  "~a " words)

  (map-permutations #'matcher  '(#\a #\b #\c #\d #\e #\f #\g #\h #\i #\j #\k #\l #\m #\n #\o #\p #\q 
        #\r #\s #\t #\u #\v #\w #\x #\y #\z )   dict  paragraph)
)

(defun Gen-Decoder-B-0 (paragraph)
  	;you should implement this function
)

(defun Gen-Decoder-B-1 (paragraph)
  	;you should implement this function
)

(defun Code-Breaker (document decoder)
 
    (format t "~a"     (funcall decoder document ))

)
(defun test_on_test_data ()
	(print "....................................................")
	(print "Testing ....")
	(print "....................................................")
	(let ((doc (read-as-list "document1.txt")))
		(print doc)
	)
)


;; -----------------------------------------------------
;; Test code...





;; test code...
;(test_on_test_data)
;(spell-checker-0_unit_test)
;(map-permutations_unit_test )
;(add-pair_unit_test)
;(change_word_unit_test)
;(change_words_unit_test)
;;(setq list1 (append list1 (list '(erkan))))
;;(print list1)
;(all-permutations_unit_test)
    

(setq words (read-as-list "text.txt" ))
    
(Code-Breaker words (Gen-Decoder-A words) )
