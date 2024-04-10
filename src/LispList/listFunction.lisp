#|
listFunction:
- Author: tmxhs
- Date: 2024-04-10
|#
#|cons 함수 두 데이터를 연결한다.|#
(print (cons 'chicken 'cat))

#|nil을 연결할 경우|#
(print (cons 'chicken 'nil))

#|nil 과 연결하는 것과 동일한 표현|#
(print (cons 'chicken ()))

#|(beef chicken) 리스트 앞에 cons 함수를 이용해 pork를 넣는다.|#
(print(cons 'pork '(beef chicken)))

#|(beef chicken) 원래는 두 콘셀로 이루어져 있음|#
(print (cons 'beef (cons `chicken ())))

#|리스트 3개를 콘싱할 때 얻는 리스트 하나를 보여준다|#
(print (cons 'pork (cons 'beef (cons 'chicken ()))))

#|car 함수는 콘셀의 첫번째 항목을 구할 때 사용한다.|#
(print (car '(pork beef chicken)))

#|리스트의 나머지를 구하는 함수 cdr|#
(print (cdr '(pork beef chicken)))

#|cdr + car = cadr|#
(print (cadr '(pork beef chicken)))

#|list 함수|#
(print(list 'pork 'beef 'chicken))

#|중첩 리스트|#
(print '(cat ((duck bat) ant)))

#|중첩리스트에서 아이템 가져오기|#
#|car 첫번째 중첩리스트를 가져온다|#
(print (car '((peas carrots tomatoes) (pork beef chicken))))

#|cdr : 2번째 이후의 아이템을 가져온다.|#
(print (cdr '(peas carrots tomatoes)))

#|car + cdr : 첫번째 아이템 가져오고 해당 아이템의 2번째 이후 아이템을 반환|#
(print (cdr (car '((peas carrots tamatoes) (pork beef chicken)))))

#|car + cdr = cdar  , 앞에 cadr이랑순서가 다름 car 먼저 그이후 cdr |#
(print (cdar '((peas carrots tomatoes) (pork beef chicken))))

#|cons 만으로 중첩 리스트를 작성하기|#
(print (cons (cons 'one (cons 'two (cons 'three ())))
             (cons (cons 'four (cons 'five (cons 'six ()))) ())))

#|이 데이터를 이용해 car, cdr에 기반한 다른 함수를 사용하는 예를 보자|#

#|cddr 은 세번쩨 cdr + cdr|#
(print (cddr '((peas carrot tomato) (pork beef chicken) duck)))

#|caddr|#
(print (caddr '((peas carrot tomato) (pork beef chicken) duck)))

#|cddar|#
(print (cddar '((peas carrot tomato) (pork beef chicken) duck)))

#|cadadr|#
(print (cadadr '((peas carrot tomato) (pork beef chicken) duck)))


