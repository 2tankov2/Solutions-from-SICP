#lang racket/base

(require rackunit)

(define (square x) (* x x))

(define (even? y) (= (remainder y 2) 0))

(define (fast-expt b n)
    (fast-expt-iter b n 1))
(define (fast-expt-iter b counter product)
       (if (= counter 0) product
           (if (even? counter) (fast-expt-iter (square b) (/ counter 2) product)
                               (fast-expt-iter b (- counter 1) (* b product)))))

(check-equal? (fast-expt 2 8) 256)
(check-equal? (fast-expt 3 6) 729)
(check-equal? (fast-expt 4 1) 4)