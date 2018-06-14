#lang racket/base

(require rackunit)

(define (double a) (* 2 a))

(define (halve b) (/ b 2))

(define (even? y) (= (remainder y 2) 0))

(define (fast* a b)
   (cond ((= b 0) 0)
         ((even? b) (double (fast* a (halve b))))
         (else (+ a (fast* a (- b 1))))))


(check-equal? (fast* 2 10) 20)
(check-equal? (fast* 3 6) 18)
(check-equal? (fast* 31 8) 248)