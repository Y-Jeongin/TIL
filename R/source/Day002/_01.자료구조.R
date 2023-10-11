# 산술연산자
  1+2
  (11 + 54 * 2) / 3 - 10  
  9 %% 3  
  5 %/% 2
  5 / 2  
  4 ** 2  
  5 ** 3
  7 ^ 2

# 변수
  x = 5
  x  
  print(x)

# R에서 권장하는 대입연산자
  x <- 10
  x  

# 대입과 출력을 함께할 수 있다.
  (x <- 2)
  x  

# 변수 삭제
  rm(x)
  x  

  x <- 2
  y <- 3

# 현재 사용중인 변수의 목록을 출력
  ls()

# 출력함수 : print()
  help(print)

  x <- "one"
  y <- 'two'
  x  
  y  

  print(x, quote = F)  

# 특수상수 NA
  aaa <- 100
  bbb <- 75
  ccc <- 80
  ddd <- NA
  
  stu <- c(aaa, bbb, ccc, ddd)
  stu  

# is.자료형() : 해당 자료형이 맞습니까? TRUE / FALSE
# as.자료형() : 해당 자료형으로 형변환하는 함수
  is.na(ddd)

# 특수상수 NULL
  x <- NULL
  x  
  is.null(x)  
  is.null(1)
  is.null(NA)

# vector 내장 함수
  val <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)
  val  

## summary() : 수치데이터의 기초 통계량을 한번에 보여주는 함수
  summary(val)

  x <- 10  # 요소가 1개인 벡터로 취급한다. 
  x
  
  10 + 20

  x <- 1:5
  x  

  xy <- rnorm(30)  # 정규분포 난수를 생성하는 함수, r=random
  xy

  length(x)  # 요소의 개수
  range(x)  # 범위, 최소값-최대값
  mean(x)  # 평균
  var(x)  # 분산
  sd(x)  # 표준편차
  
# 벡터의 요소에 접근 : 인덱스(index)
## [인덱스]
## x의 두번째 요소에 접근
  x
  x[2]  

## x의 두번째 요소를 뺀 나머지
  x[-2]
  x[3] <- 30  # 값 할당
  x  
  
## [start:end]
  x[2:4]
  x[c(2, 4)]  # 두개 이상의 값은 반드시 c()함수 사용
  
# 벡터화 연산 : 벡터에 저장된 데이터의 요소단위로 계산을 수행한다.
## 벡터 합치기 : append(a, b) - a, b 두개의 벡터를 연결하는 함수
## append(a, b, after_index) - index 다음 위치에 연결
  x <- c(3, 6, 8, 12, 15)
  y <- c(5, 10, 15, 20, 25)  
  
  z <- append(x, y)
  z  

  w <- append(x, y, 3)  
  w  

  c(1, 2) + c(4, 5)  
  c(1, 2, 3) + 1  # 요소에 각각 더해진다.

  v <- -5:5
  v  

# seq = sequence generation, seq(from, to, by)
  q <- seq(1, 5, 0.5)
  q  

  qq <- seq(10)  # 1일때 from과 by는 생략 가능
  qq

# 두 벡터의 비교연산자
  x <- c(1, 2, 3)  
  y <- c(4, 2, 8)  
  x == y

# rep(벡터, times=반복횟수 or each=개별 반복횟수)
  (x <- rep(c('a', 'b', 'c'), times = 4))

# 중복값을 제거하고 대표값만 추출하는 함수
  y <- unique(x)
  y  

# 문자를 결합 paste
  xx <- c('a', 'b', 'c', 'd', 'd')
  xx
  
  k <- paste(xx[1], xx[2])
  k

  print(xx[1] + xx[2])
  print('hello' + 'world')

  print(paste('hello\n', 'world'))
  cat(paste('hello\n', 'world'))  # \n : 줄바꿈
    
  help(paste)

# sep : 구분 기호, sep = ' ' 한 칸 공백
  paste('aaa', 'bbb', 'ccc')
  paste('aaa', 'bbb', 'ccc', sep='-')
  paste('aaa', 'bbb', 'ccc', sep=',')
  paste('aaa', 'bbb', 'ccc', sep='')  

# substring('문자열', 시작위치, 마지막위치)  # 문자열의 일부분 추출
  substring('abcedfghijklmn', 2 ,5)

# 논리값 : TRUE(T), FALSE(F)
## 논리연산자 : and(&), or(|), not(!)
  TRUE & TRUE
  T & F  # 둘 다 참일때만 참

  TRUE | TRUE
  TRUE | FALSE  # 둘 중 하나만 참이어도 참
  
  !TRUE
  !FALSE
  
  c(TRUE, TRUE) & c(TRUE, FALSE)
  
## 비트연산자(bit = binary digit), 0과 1
## %%, ||, ~
  c(TRUE, TRUE) && c(TRUE, FALSE)

### A && B : A가 TRUE이면 B도 확인, A가 FALSE이면 B는 확인하지 않는다. 
  T && F
  F && T    
  T && T  
  

# factor < vector
  gender <- factor('M', c('M', 'F'))
  gender  

  nlevels(gender)  # level의 개수 
  levels(gender)
  levels(gender)[1]
  
  levels(gender) <- c('male', 'female')
  gender  

  help(factor)  
  ordered(c('a', 'b', 'c'))  # 순서(서열)를 가지고 있는 factor, a < b < c
  factor(c('a', 'b', 'c'), ordered = T)
  
  
# 행렬(matrix)
  help(matrix)
  matrix(1:9, nrow=3)  # ncol = 3, byrow = F 생략된 개념
  matrix(1:9, ncol=3)
  matrix(1:9, nrow=3, byrow = T)
  matrix(1:9, nrow=3, 
         dimnames = list(c('item1', 'item2', 'item3'), c('att1', 'att2', 'att3')))
  
## 행렬의 데이터에 접근하는 방법 : [행인덱스, 열인덱스]
  x <-matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), ncol=3)
  x  

  x[1, 1]
  x[1, 2]
  x[2, 1]
  x[2, 2]
  x[1:2, ]  # 열인덱스가 생략되면 모든 열을 대상으로 추출
  x[-3, ]
  x[c(1, 3), c(1, 3)]
  x[-2, -2]
  
  y <- matrix(1:9, nrow=3,
              dimnames = list(c('item1', 'item2', 'item3'), c('att1', 'att2', 'att3')))
  y['item1', ]

  x 
  x * 2

  x + y
  x * y
  x %*% y

# 전치행렬(행과 열을 바꾸기)
  t(x)
  
  
# 배열(array)
  help(array)
  matrix(1:12, ncol=4)

  array(1:12, dim = c(3, 4))  # dim = 차수, 차원 / 3행 4열 
    
  x <- array(1:12, dim = c(2, 2, 3))  # 2행 2열 3개
  x
  
  dim(x)  # 차원 확인
  
  x[1, 1, 1]  # 1행 1열 1번째
  x[1, 2, 3]
  x[ , , 3]
  
  
# 리스트(list)
  x <- list(name = '홍길동', height = 170)
  x

  x$name  
  x$height  

  x <- list(name = '홍길동', height = c(170, 187, 163))  
  x
  
  x$name
  x$height  
  x$height[2]
  
  list(a = list(val = c(1, 2, 3)), b = list(val = c(1, 2, 3, 4)))  # list 안에 list를 담을 수 있다.
  
# 리스트 내 데이터에 접근하는 방법 : $
## 리스트명$변수명$키 or 리스트[[인덱스]]
  x <- list(name = '홍길동', height = c(1, 3, 5))
  x  

  x$name  
  x$height  
  x[[1]]  # 홍길동
  x[[2]]  # 1 3 5
  x[[2]][2]  # 3
  
  x[1]  # 키와 값이 함께 출력, name 홍길동
  x[2]  # height 1 3 5
  
  
# 데이터 프레임(Data Frame)
  d <- data.frame(x = c(1, 2, 3, 4, 5), y = c(2, 4, 6, 8, 10))  # 레코드의 수 동일
  d
  
  d2 <- data.frame(x = 1:5, y = c(2, 4, 6, 8, 10), z = c('M', 'F', 'M', 'F', 'M'))
  d2  

## 기존의 데이터 프레임에 특정 컬럼 추가
  d2$v <- c(3, 6, 9, 12, 15)
  d2

  d2$x
  d2[, 1]  

  d2[, c('x', 'y')]  
  
  d2[, 'x', drop=F]  # 형태 유지
  

# 타입(data type) = 자료형
## mode(), typeof(), class(), str()
  str(d2)
  
  class(c(1, 2))  # 자료 구조의 타입
  class(matrix(c(1, 2)))
  class(list(c(1, 2)))
  class(data.frame(x = c(1, 2)))
  
  str(c(1, 2))
  str(matrix(c(1, 2)))
  str(list(c(1, 2)))
  str(data.frame(x = c(1, 2)))
  
  typeof(c(1, 2))
  
  mode(c(1, 2))  
  
# is.factor(), is.matrix(), is.data.frame(), is.character()  # 해당 자료형이 맞는지
  is.numeric(c(1, 2, 3))
  is.numeric(c('a', 'b', 'c'))  
  
  is.matrix(matrix(c(1, 2)))

# 형변환 : as.*
  x <-  c('m', 'f')
  is.character(x)  
  
  as.factor(x)
  as.numeric(as.factor(x))  
  