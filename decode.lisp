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

(defun macher (l)
	(setq pairs '())
	(setq abc '(#\a #\b #\c #\d #\e #\f #\g #\h #\i #\j 
				#\k #\l #\m #\n #\o #\p #\q #\r #\s #\t 
				#\u #\v #\w #\x #\y #\z ))


)

(defun Gen-Decoder-A (paragraph)
	;you should implement this function



























)

(defun Gen-Decoder-B-0 (paragraph)
  	;you should implement this function
)

(defun Gen-Decoder-B-1 (paragraph)
  	;you should implement this function
)

(defun Code-Breaker (document decoder)
  	;you should implement this function
)

;; -----------------------------------------------------
;; Test code...

(defun test_on_test_data ()
	(print "....................................................")
	(print "Testing ....")
	(print "....................................................")
	(let ((doc (read-as-list "document1.txt")))
		(print doc)
		;(print (read-as-list "document2.txt"))

	)


)


(defun all-permutations (list)
  (cond ((null list) nil)
        ;((null (cdr list)) (list list))
        ((null (cdr list))  (list list))
        (t (loop for element in list          
        		;do(format t "~a~%"  (mapcar (lambda (l) (cons element l)) (all-permutations (remove element list))) ) 
    	        append (mapcar (lambda (l) (cons element l)) (all-permutations (remove element list)))
        	
        	)
        	;(format t "~a~%" (mapcar (lambda (l) (cons element l)))
        )
    
    )
)

(defun all-permutations_unit_test  ()

(setq l1 '(a b c d e f ))
	(format t 	"~a "(all-permutations l1))
;	(all-permutations l1)
)


(defun map-permutations (fun lst)
  (if (null lst) (funcall fun nil)
    (map nil
       (lambda (x)
         (map-permutations 
          (lambda (l) (funcall fun (cons x l))) 
          (remove x lst)))
       lst))
 )


(defun print-list (l1)
	(print l1)
)

(defun map-permutations_unit_test ()

	(map-permutations #'print-list  '(#\a #\b #\c #\d #\e #\f #\g #\h #\i #\j #\k #\l #\m #\n #\o #\p #\q #\r
				#\r #\s #\t #\u #\v #\w #\x #\y #\z ))

)


;; test code...
;(test_on_test_data)
;(spell-checker-0_unit_test)
(map-permutations_unit_test )
;(add-pair_unit_test)



;;(setq list1 (append list1 (list '(erkan))))
;;(print list1)

;(all-permutations_unit_test)

