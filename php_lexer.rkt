#lang racket

(define operators
  '(
    ;;; 3 len ;;;;
    ("!==" "T_IS_NOT_IDENTICAL" 281)
    ("===" "T_IS_IDENTICAL" 282)
    ("<<<" "T_START_HEREDOC" 378)
    ("**=" "T_POW_EQUAL" 268)
    (">>=" "T_SR_EQUAL" 268)
    ("<<=" "T_SL_EQUAL" 269)
    ;;;; 2 len ;;;;
    ("**" "T_POW" 300)
    (".." "T_ELLIPSIS" 389)
    ("^=" "T_XOR_EQUAL" 270)
    ("|=" "T_OR_EQUAL" 271)
    ("&=" "T_AND_EQUAL" 272)
    ("%=" "T_MOD_EQUAL" 273)
    (".=" "T_CONCAT_EQUAL" 274)
    ("/=" "T_DIV_EQUAL" 275)
    ("*=" "T_MUL_EQUAL" 276)
    ("-=" "T_MINUS_EQUAL" 277)
    ("+=" "T_PLUS_EQUAL" 278)
    ("||" "T_BOOLEAN_OR" 279)
    ("&&" "T_BOOLEAN_AND" 280)
    ("!=" "T_IS_NOT_EQUAL" 283)
    ("==" "T_IS_EQUAL" 284)
    (">=" "T_IS_GREATER_OR_EQUAL" 285)
    ("<=" "T_IS_SMALLER_OR_EQUAL" 286)
    (">>" "T_SR" 287)
    ("<<" "T_SL" 288)
    ("%>" "T_CLOSE_TAG" 376)
    ("--" "T_DEC" 297)
    ("++" "T_INC" 298)
    ("::" "T_DOUBLE_COLON" 382)
    ("::" "T_PAAMAYIM_NEKUDOTAYIM" 382)
    ))

(define define-list
  (λ (lst)
    (λ (str)
      (letrec ([iterator
              (lambda (lst)
                (cond
                  [(null? lst)
                   #f]
                  [(string=? str (caar lst))
                   #t]
                  [else 
                   (iterator (cdr lst))]))])
      (iterator lst)))))

;; (define operator?
;;   (lambda (str)
;;     (letrec ([iterator
;;               (lambda (lst)
;;                 (cond
;;                   [(null? lst)
;;                    #f]
;;                   [(string=? str (car lst))
;;                    #t]
;;                   [else 
;;                    (iterator (cdr lst))]))])
;;       (iterator oprator))))
              

(define keywords
  '(
    ("require_once" "T_REQUIRE_ONCE" 258)
    ("require" "T_REQUIRE" 259)
    ("eval" "T_EVAL" 260)
    ("include_once" "T_INCLUDE_ONCE" 261)
    ("include" "T_INCLUDE" 262)
    ("or" "T_LOGICAL_OR" 263)
    ("xor" "T_LOGICAL_XOR" 264)
    ("and" "T_LOGICAL_AND" 265)
    ("print" "T_PRINT" 266)
    ("instanceof" "T_INSTANCEOF" 289)
    ("unset" "T_UNSET_CAST" 290)
    ("(bool)|(boolean)" "T_BOOL_CAST" 291)
    ("(object)" "T_OBJECT_CAST" 292)
    ("(array)" "T_ARRAY_CAST" 293)
    ("(string)" "T_STRING_CAST" 294)
    ("(double)|(real)|(float)" "T_DOUBLE_CAST" 295)
    ("(int)" "T_INT_CAST" 296)
    ("clone" "T_CLONE" 299)
    ("new" "T_NEW" 300)
    ("exit" "T_EXIT" 301)
    ("if" "T_IF" 302)
    ("elseif" "T_ELSEIF" 303)
    ("else" "T_ELSE" 304)
    ("endif" "T_ENDIF" 305)

    ("echo" "T_ECHO" 317)
    ("do" "T_DO" 318)
    ("while" "T_WHILE" 319)
    ("endwhile" "T_ENDWHILE" 320)
    ("for" "T_FOR" 321)
    ("endfor" "T_ENDFOR" 322)
    ("foreach" "T_FOREACH" 323)
    ("endforeach" "T_ENDFOREACH" 324)
    ("declare" "T_DECLARE" 325)
    ("enddeclare" "T_ENDDECLARE" 326)
    ("as" "T_AS" 327)
    ("switch" "T_SWITCH" 328)
    ("endswitch" "T_ENDSWITCH" 329)
    ("case" "T_CASE" 330)
    ("default" "T_DEFAULT" 331)
    ("break" "T_BREAK" 332)
    ("continue" "T_CONTINUE" 333)
    ("got" "T_GOTO" 334)
    ("function" "T_FUNCTION" 335)
    ("const" "T_CONST" 336)
    ("return" "T_RETURN" 337)
    ("field" "T_YIELD" 267)
    ("try" "T_TRY" 338)
    ("catch" "T_CATCH" 339)
    ("finally" "T_FINALLY" 340)
    ("throw" "T_THROW" 341)
    ("use" "T_USE" 342)
    ("insteadof" "T_INSTEADOF" 343)
    ("global" "T_GLOBAL" 344)
    ("public" "T_PUBLIC" 345)
    ("protected" "T_PROTECTED" 346)
    ("private""T_PRIVATE" 347)
    ("final" "T_FINAL" 348)
    ("abstract" "T_ABSTRACT" 349)
    ("static" "T_STATIC" 350)
    ("var" "T_VAR" 351)
    ("unset" "T_UNSET" 352)
    ("isset" "T_ISSET" 353)
    ("empty" "T_EMPTY" 354)
    ("__halt_compiler" "T_HALT_COMPILER" 355)
    ("class" "T_CLASS" 356)
    ("trail" "T_TRAIT" 357)
    ("interface" "T_INTERFACE" 358)
    ("extends" "T_EXTENDS" 359)
    ("implements" "T_IMPLEMENTS" 360)
    ("->" "T_OBJECT_OPERATOR" 361)
    ("=>" "T_DOUBLE_ARROW" 362)
    ("list" "T_LIST" 363)
    ("array" "T_ARRAY" 364)
    ("callable" "T_CALLABLE" 365)
    ("__CLASS__" "T_CLASS_C" 366)
    ("__TRAIT__" "T_TRAIT_C" 367)
    ("__METHOD__" "T_METHOD_C" 368)
    ("__FUNC__" "T_FUNC_C" 369)
    ("__LINE__" "T_LINE" 370)
    ("__FILE__" "T_FILE" 371)
    ("${" "T_DOLLAR_OPEN_CURLY_BRACES" 380)
    ("{$" "T_CURLY_OPEN" 381)
    ("namespace" "T_NAMESPACE" 383)
    ("__namespace__" "T_NS_C" 384)
    ("__DIR__" "T_DIR" 385)
    ("\\" "T_NS_SEPARATOR" 386)
    ))

(define operator? (define-list operators))
(define keywords? (define-list keywords))

(operator? "+=")
(keywords? "functiona")

;; (define spec
;;   '(
;;     '("r((\d+)|(0[1-7]+)|(0x[1-9A-Fa-f]+))" "T_LNUMBER" 306)
;;     '("r([+-]?\d+(\.\d+([Ee][+-]?\d+))?)" "T_DNUMBER" 307)
;;     '("r('.*?'|\".*?\")" "T_STRING" 308)
;;     '("r(${a)" "T_STRING_VARNAME" 309)
;;     '("T_VARIABLE" 310)
;;     '("T_NUM_STRING" 311)
;;     '("T_INLINE_HTML" 312)
;;     '("T_CHARACTER" 313)
;;     '("T_BAD_CHARACTER" 314)
;;     '("T_ENCAPSED_AND_WHITESPACE" 315)
;;     '("T_CONSTANT_ENCAPSED_STRING" 316)
;;     '("r(/**/|//)" "T_COMMENT" 372)
;;     '("r(/** */)" "T_DOC_COMMENT" 373)
;;     '("r(<?php|<?|<%)" "T_OPEN_TAG" 374)
;;     '("r(<?=|<%=)" "T_OPEN_TAG_WITH_ECHO" 375)

;;     '("r(\t\r\n)" "T_WHITESPACE" 377)
;;     '("" "T_END_HEREDOC" 379)
;;     ))

(define define-string
  (λ (str)
    (λ (ch)
      (letrec ([lst (string->list str)]
             [iterator
              (λ (ch lst)
                (cond
                  [(null? lst)
                   #f]
                  [(char=? ch (car lst))
                   #t]
                  [else
                   (iterator ch (cdr lst))]))])
        (iterator ch lst)))))

;; code prefix with string 
(define prefix
  (λ (code str start)
    (let ([len (string-length str)]
          [c-len (string-length code)])
      (if (<= (+ len start) c-len)
          (if (string=? (substring code start (+ start len)) str)
              #t
              #f)
          #f))))
(prefix "abnnn" "abnnn" 0)
(prefix "abnnn" "abnnnn" 0)

;; (define prefix-with
;;   (λ (lst)
          

(define whitespace "\t\r\n ")
(define  delimirator ";(){}[],~@`=+/-*.$|^&<>%!?:\"'\\")

(define whitespace? (define-string whitespace))
(define delimirator? (define-string delimirator))

(whitespace? #\space)
(delimirator? #\;)



;; (define delimirator?
;;   (λ (ch)
;;     (letrec ([lst (string->list delimitor)]
;;              [iterator
;;               (λ (ch lst)
;;                 (cond
;;                   [(null? lst)
;;                    #f]
;;                   [(string=? ch (car lst))
;;                    #t]
;;                   [else
;;                    (iterator ch (cdr lst))]))])
;;       (iterator ch lst))))

(define html-mode #t)

(define code "<?php 
echo $i=5+3+2;
echo \"Hello, word\";?>")

(define max-len (string-length code))

(define find-next
  (lambda (code str start)
    (cond
      [(> (+ start (string-length str)) (string-length code))
       -1]
      [(prefix code str start)
       start]
      [else
       (find-next code str (+ start 1))])))

(find-next "ntttttt*/" "*/" 0)





(define !eof
  (λ (idx)
    (if (<= idx (string-length code))
        #t
        #f)))

(!eof 1)

;(struct                                 ;
  


(define lexer-1
  (λ (code start)
    (if (!eof start)
        (let* ([index start]
               [ch (string-ref code index)])
          (cond
            [(whitespace? ch)
             (let loop ([buffer `(,ch)]
                        [next (+ 1 index)])
               (if (and (!eof next) (whitespace? (string-ref code next)))
                   (loop (append buffer (list (string-ref code next))) (+ 1 next))
                   (list buffer next)))]
            
            [(or (prefix code "/*" index)
                 (prefix code "/**" index))
             (let ([pos (find-next code "*/" index)])
               (if (< pos 0)
                   (error "can't find */")
                   (substring code index (+ pos (string-length "*/")))))]
            
            [else
             (error "other condition")]))
        (error "end of code"))))

(lexer-1 "
/*
@aa
bb
cc
@author
****/" 0)
             
;               [ch (string-ref code index)])
          

;; (define lexer-h
;;   (λ (start token type)
    
;;     (let loop ([index start])

;;       (if (!eof index)
;;           (let ([ch (string-ref code index)])
;;             (cond
;;               [(whitespace? ch)
               
;;                ]
;;          (display (string-ref code index))
;;          (loop (+ 1 index) len)]
        
;;         [else
;;          (display 'end)]))))
           
