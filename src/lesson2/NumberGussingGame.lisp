#|
NumberGussingGame:
- Author: user
- Date: 2024-04-01
|#
#|리스프 전역변수 선언 defparameter 함수|#
(defparameter *small* 1)
(defparameter *big* 100)

#|값을 추측 하는 함수 나누기 2 한다음 소수점 버림|#
(defun guess-my-number ()
	(ash (+ *small* *big*) -1))


(defun smaller ()
  (setf *big* (1- (guess-my-number)))
  (guess-my-number))

(defun bigger ()
  (setf *small* (1+ (guess-my-number)))
  (guess-my-number))

(defun start-over()
  (defparameter *small* 1)
  (defparameter *big* 100)
  (guess-my-number))

#|flet 예시|#
(print (flet ((f (n)
        (+ n 10))
       (g (n)
        (- n 3)))
 (g (f 5))))

#|labels 예시|#
(print (labels ((a (n)
            (+ n 5))
         (b (n)
            (+ (a n) 6)))
  (b 10)))

