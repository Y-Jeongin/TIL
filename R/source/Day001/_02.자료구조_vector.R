# 자료형(data type) : 변수와 상수의 크기를 규정해 놓은 예약어

## 변수(Variable) : 변하는 수, 상수를 저장하는 기억 장소(공간)
### 변수명을 작성하는 규칙(명명법) : 영문자(대, 소문자), 숫자, 특수문자, 첫글자 문자, _, $, 예약어 불가

## 상수(Constant) : 변하지 않는 수, 컴퓨터가 저장하는 값(data)
## R의 기본 자료형 : 수치형(numeric), 문자형(character), 논리형(logical), 복소수형(complex)

## 대입연산자 또는 치환연산자 : 좌변 = 우변 / v(변수) = c(상수), v(변수), 수식 / 변수 <-c (권장) / -> 변수

### 변수
  x <- 5
  x

  y = 10  
  y  

## 출력함수 print()
  print(x)

## 변수 대입과 동시에 출력
  (z <- 2)

  x  
  x + y 

# 변수 제거 : rm(변수명), rm = remove
  rm(x)
  x

  xx <- print  # 객체 복사

  print('안녕하세요')
  xx('안녕하세요')  

  rm(xx)  

## 현재 메모리에 저장된 변수의 목록을 확인하는 명령
  ls()
  help(ls)  
  
  x <- "one"  
  x
  print(x)  
  print(x, quote = F)   # T = TRUE(기본형), F = FALSE 
  
# 출력 서식을 지정하여 출력하는 함수 sprintf = string print format
## 서식기호 : %s(문자형), %f, %i(정수형)
### 홍길동의 나이는 낭랑 18세입니다.
  print("홍길동의 나이는 낭랑 18세입니다.")
  sprintf("%s의 나이는 낭랑 %i세입니다.", "이순신", 23)  

# 자료 구조 : 데이터를 효율적으로 저장하기 위한 틀
## 벡터(vector) : 하나 이상의 데이터를 관리하는 자료 구조, 요소, 동일한 타입의 데이터만 담을 수 있다.
## 벡터의 특징 : R에서 하나 이상의 데이터를 관리하는 자료구조, scalar도 벡터로 취급
## 벡터의 생성 함수 : c()
## 벡터의 인덱스의 시작값 1부터 (sql/r=1부터, pyrhon=0부터)
## 하나의 벡터에는 하나의 자료형만 사용할 수 있다.
## NA : 결측값 (벡터에서 사용 가능)
  v1 <- c(1, 2, 3, 4, 5)  # 실수
  v2 <- 1 : 5  # 정수
  v3 <- c(1.5, 10, 'two', 5, "five")  # 문자
  v4 <- c(100, "one", T, FALSE, 3.14)  # 논리형이 아닌 문자 취급
  
## start : end, step=1 생략
  x2 = 1:15
  x2  

  x3 = c('one', 'two', 'three')  
  x3  
  
  x1 = c(1, 2, 3, 4)
  x1

# 벡터 합치기 : append(변수1, 변수2)
  x3 = append(x1, x2)
  x3  

  x4 = c(x1, 0, x2)  
  x4  

# vector(length=n) : 요소가 n개인 비어있는 벡터를 생성하는 함수
  vector(length = 5)  # mode = "logical" 기본형, 모드를 생략하며 논리형으로 생성, T와 F의 기본값 = F

# 벡터 안에 또 다른 벡터를 담을 수 있다.
  c(1, 2, 3, c(4:6))
  y = c()
  y = c(y, c(1:3))  # append
  y
  
# seq(start, stop, by(증가치/증감치)) : 순차적으로 증가, by = 1
# seq(from =, to =, by =)
  xx = seq(1, 5)
  yy = c(1, 2, 3, 4, 5)  
  zz = 1:5  
  xx  
  yy
  zz  

  seq(from=1, to=10, by=1)
  seq(1, 10, by=2)  
  
  help(seq)

  seq(0, 1, length.out = 11)  # length.out = 요소의 개수
  
  a = seq(10)  # 10개의 요소
  a

## rep(벡터, times=반복횟수, each=요소별 반복횟수)
  rep(c(1:3), times=3)
  rep(c(1:3), each=2)  

## 자료형을 이용한 벡터의 생성
### numeric(integer, double), character, logical
  integer(length=10)  # 정수형의 기본값 = 0, 실수형의 기본값 = 0.0, 논리형의 기본값 = F
  
## 벡터를 구성하는 자료를 요소(item)라고 부른다.
## 요소의 위치를 인덱스(index)라고 부른다.
## 인덱스의 시작은 1부터이다.
### 인덱스를 이용한 요소에 접근 [], [조건식] 원하는 위치에 있는 값을 얻어온다.
  x = 1:11
  x
  x[5]
  x[2:5]
  x[c(1, 3, 5)]  # 하나 이상의 값을 담을 땐 c함수 사용
  x[-2]  # 해당 인덱스를 제외

# 벡터의 각 셀에 이름을 부여할 수 있다.
  y = c(a=1, b=10, c=7)
  y  
  
  y['a']
  y[c('b', 'c')]  
  
  xx = c(1, 3, 5)
  xx  
  names(xx) = c('lee', 'kim', 'park')  
  xx

  xx[c('lee', 'park')]  
  xx['kim']
  
  names(xx)[2]
  
## 벡터의 주요 내장 함수
  typeof(xx)  # 자료형 확인
  mode(xx)
  xx
  
### 벡터의 길이 = 벡터를 구성하는 요소의 개수, length()
  a = c('x', 'y', 'z')
  length(a)  
  
## NROW() - 대문자, 행렬과 벡터에서 모두 사용, 행의 수
## nrow() - 소문자, 행렬(matrix)에서 행의 개수를 추출하는 함수
  NROW(a)
  nrow(a)  

## 통계함수
### cor() : 상관계수, cumsum() : 누적함수, length() : 요소의 개수
### max() : 최대값, mean() : 평균값, min() : 최소값, range() : 범위
### rank() : 순위, sd() : 표준편차, sum() : 합계, summary() : 기초통계량
  
## 데이터 분석에서 주로 사용되는 함수 : matrix(행과 열을 구성, 자료형이 동일해야함)나 dataframe(표, table)
## head(), tail(), summary()
  
## R에 내장된 데이터셋 - data()
  data()
  
  help(iris)
  iris
  
# 데이터 구조
  str(iris)
  
  head(iris)  # 앞의 데이터 6개의 행 추출
  tail(iris)

  head(iris, 10)

  summary(iris)  

  x = 1:10  
  x  

# 총합 sum()  
  sum(x)  

# 평균 mean()
  mean(x)

# 분산 var()
  var(x)
  
# 표준편차 sd()
  sd(x)

# 중앙값 median()
  median(x)
  
  max(x)
  min(x)
  range(x)  

# 4분위 수 quantile(x)
  quantile(x)
  
  
## 벡터의 연산 : 벡터의 요소들을 이용하여 수정, 삭제, 추가
## 사칙연산과 내장함수

## 스칼라(scalar) : 하나의 요소로 구성된 자료구조(R에서는 사용X)
## 벡터(vector) : 하나 또는 그 이상의 요소로 구성된 자료구조
  x = 10
  x  # 요소가 1개인 벡터
  
  y = c(1:5)
  length(y)  # 벡터 요소의 개수

  10 + 20  # 벡터 + 벡터
    
  x = c(1:5)
  y = c(6:10)  
  x + y  # 벡터화 연산(같은 위치에 있는 요소끼리 더해진다)
  
  z = c(1:3)
  z + x  
  
  x + 9
  x - 9
  x * 3  
  x / 3
  x %/% 3  
  x %% 3  

  x[3] = 30  # 벡터 요소의 값 수정
  x[c(2, 4)] = 9
  x
  
## 벡터 x의 모든 요소의 값을 1로 변경하시오.
  x[1:5] = 1
  x

## 벡터 x의 첫번째 요소 자리에 0을 추가
  x = c(0, x)
  x

## append(벡터 ,벡터)
  x = append(x, 0)
  x
  
  help(append)

  v_a = c('A', 'B', 'C', 'F', 'G')  
  v_b = c('D', 'E')  
  append(v_a, v_b, 3)  # 3번째 위치 뒤에 v_b를 추가, 저장X
  
  v_c = append(v_a, v_b, 3)
  append(v_a, v_b, 3) -> v_c
  v_c  

## 벡터 요소 삭제 : -
  v_a = 11:20
  v_a

# 1, 3, 5, 6 위치의 값만 화면에 표시
  v_a[c(1, 3, 5, 6)]

# 1, 3, 5, 6의 요소를 제외한 값만 화면에 표시
  v_a[-c(1, 3, 5, 6)]

# v_a의 마지막 요소의 값 추출
  length(v_a)
  v_a[10]  
  v_a[length(v_a)]  
  
# v_a의 마지막 요소의 값을 제외하고 추출
  length(v_a)
  v_a[-10]
  v_a[-length(v_a)]
  
# 논리형 벡터 : 논리형(logical), 참 또는 거짓을 판단 - TRUE(T) or FALSE(F)
  v_b = c(FALSE, TRUE, TRUE, FALSE, FALSE)
  v_b  

# and/&, or/|, not/!
  !v_b
  v_b[c(2:3)]
  
# 펜시인덱스
## 논리값을 이용하여 인덱스를 처리하는 기능
  v_t = c('첫번째', '두번째', '세번째', '네번째', '다섯번째')
  v_t
  
## 두번째, 세번째 요소만 추출
  v_t[c(2:3)]
  v_t[v_b]  

## %in% : ~안에 포함 여부를 판단(TRUE or FALSE)하여 출력하는 연산자
  'a' %in% c('a', 'b', 'c')
  
## 합집합(union), 교집합(intersect), 차집합(setdiff)
  setdiff(c('a', 'b', 'c'), c('a', 'd'))
  intersect(c('a', 'b', 'c'), c('a', 'd'))
  union(c('a', 'b', 'c'), c('a', 'd'))
  
## 집합간의 비교 연산
  setequal(c('a', 'b', 'c'), c('a', 'd'))
  setequal(c('a', 'b', 'c'), c('a', 'b', 'b', 'c'))  

## all(), any()
  x = 1:10
  x  

  x > 5  
  all(x > 5)  # x라고 하는 벡터의 모든 요소가 5보다 큰지
  any(x > 5)  # x라고 하는 벡터의 어떤 것 하나라도 5보다 큰지

  head(x)
  tail(x, 3)