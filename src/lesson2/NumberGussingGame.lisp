#|
NumberGussingGame:
- Author: user
- Date: 2024-04-01
|#
#|리스프 전역변수 선언 defparameter 함수|#
(defparameter *small* 1)
(defparameter *big* 100)

#|값을 추측 하는 함수|#
(defun guess-my-number ()
	(ash (+ *small* *big*) -1))

(print (guess-my-number))
