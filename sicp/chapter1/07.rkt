#lang racket/base

(require rackunit)

(define (square x) (* x x))

(define (sqrt-iter guess x) 
  (if (good-enough? guess x) guess
       (sqrt-iter (improve guess x)
                x)))
  
(define (improve guess x) 
   (average guess (/ x guess)))

(define (average x y)
   (/ (+ x y) 2))

(define (good-enough? guess x)
   (< (abs (- (square guess) x)) 0.00000000000001))

(define (sqrt x)
   (sqrt-iter 1.0 x)) 

(check-equal? (sqrt 9) 3.0)
(check-equal? (sqrt 0.000025) 0.005)
(check-equal? (sqrt 100000000000000) 10000000.0)
