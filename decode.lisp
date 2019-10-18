; *********************************************
; *  341 Programming Languages                *
; *  Fall 2019                                *
; *  Author: Yakup Genc                       *
; *********************************************

;; utility functions 
(load "include.lisp") ;; "c2i and "i2c"

(defun symbol-or-string-to-string (x)
       (typecase x
         (symbol (symbol-name x))
         (string x)
         (otherwise (error "Wrong type")))
      )





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
         		




         		;(setq words (append words (list (string-downcase (symbol-or-string-to-string sym)))))
        )
       (close infile)
    )

 

	(return-from read-as-list (nreverse words))
)












;; -----------------------------------------------------
;; HELPERS
;; *** PLACE YOUR HELPER FUNCTIONS BELOW ***

(defun spell-checker-0 (word)
	;you should implement this function
)

(defun spell-checker-1 (word)
 	;you should implement this function
)


;; -----------------------------------------------------
;; DECODE FUNCTIONS

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
	(let (doc (read-as-list "document1.txt"))
		;(print doc)
		(print (read-as-list "document1.txt"))

	)
)


;; test code...
(test_on_test_data)

	;(print (read-as-list "document2.txt"))

;;(setq list1 (append list1 (list '(erkan))))
;;(print list1)


