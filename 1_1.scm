;;; CHAPTER 1: BUILDING ABSTRACTIONS WITH PROCEDURES
;;  SECTION 1.1: The Elements of Programming
;   SUBSECTION 1.1.1: Expressions

486 ;486
(+ 137 349) ;486
(- 1000 334) ;666
(* 5 99) ;495
(/ 10 5) ;2
(+ 2.7 10) ;12.7

(+ 21 35 12 7) ;75
(* 25 4 12) ;1200

(+ (* 3 5) (- 10 6)) ;19

(+ (* 3 (+ (* 2 4) (+ 3 5))) (+ (- 10 7) 6)) ;57

(+ (* 3
      (+ (* 2 4)
         (+ 3 5)))
   (+ (- 10 7)
      6))             ;57

;   SUBSECTION 1.1.2: NAMING THE ENVIRONMENT

(define size 2)

size ;2
(* 5 size) ;10

(define pi 3.14159)
(define radius 10)

(* pi (* radius radius)) ;314.159

(define circumference (* 2 pi radius))
circumference ;62.8318

;   SUBSECTION 1.1.3: Evaluating Combinations

(* (+ 2 (* 4 6)) (+ 3 5 7)) ;390

;   SUBSECTION 1.1.4: Compound Procedures

(define (square x) (* x x))

(square 21)         ;441
(square (+ 2 5))    ;49
(square (square 3)) ;81

(define x 3)
(define y 5)
(+ (square x) (square y)) ;34 

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(sum-of-squares 3 4) ;25

(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))

(f 5) ;136

;   SUBSECTION 1.1.5: The Substitution Model for Procedure Application
;   SUBSECTION 1.1.6: Conditional Expressions and Predicates

(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))

(define (abs x)
  (cond ((< x 0) (- x))
        (else x)))

(define (abs x)
  (if (< x 0)
    (- x)
    x))

(and (> x 5) (< x 10))

(define (>= x y)
  (or (> x y) (= x y)))

(define (>= x y)
  (or (> x y) (= x y)))

;;; EXERCISE 1.1
10                               ; 10
(+ 5 3 4)                        ; 12
(- 9 1)                          ; 8
(/ 6 2)                          ; 3

(+ (* 2 4) (- 4 6 ))             ; 6

(define a 3)
(define b (+ a 1))
(+ a b (* a b))                  ; 19

(= a b)                          ; #f

(if (and (> b a) (< b (* a b)))  
  b
  a)                             ; 4 

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))                 ; 16

(+ 2 (if (> b a) b a))           ; 6

(* (cond (( > a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))                      ; 16

;;; Exercise 1.2
(/ (+ 5
      4
      (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3
      (- 6 2)
      (- 2 7)))                       ; -37/150

;;; Exercise 1.3
(define (is-smallest x y z)
  (and (<= x y) (<= x z)))

(define (square x) (* x x))
(define (sumsq x y) (+ (square x) (square y)))

(define (sumsq-two-largest x y z)
  (cond ((is-smallest x y z) (sumsq y z))
        ((is-smallest y x z) (sumsq x z))
        ((is-smallest z x y) (sumsq x y))))

