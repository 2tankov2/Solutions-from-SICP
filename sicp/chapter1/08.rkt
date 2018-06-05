#lang racket/base

(require rackunit)

(define (square x) (* x x))

(define (cube x) (* x x x))

(define (qbrt-iter guess x) 
  (if (good-enough? guess x) guess
       (qbrt-iter (improve guess x)
                x)))
  
(define (improve guess x) 
   (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? guess x)
   (< (abs (- (cube guess) x)) 0.0000000001))

(define (qbrt x)
   (qbrt-iter 1.0 x)) 

(check-equal? (qbrt 125) 5.0)
(check-equal? (qbrt 0.000125) 0.050000000019136154)
(check-equal? (qbrt 278445077) 653.0)