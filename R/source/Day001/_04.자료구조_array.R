# R의 자료구조
## 변수 → 벡터 → 행렬 → 배열
## 행렬 → 데이터프레임 → 리스트
## 데이터 분석에 특화된 자료 구조 → 데이터프레임

# 행렬(matrix) : 벡터의 확장
## 행과 열로 구성된 2차원 배열
## 행렬(matrix)은 2차원만 가능하고, 배열(array)은 n차원이 가능한 자료구조
## cbind(열단위), rbind(행단위)는 기존 벡터를 묶어 배열을 생성할 때 사용한다.

  help(matrix)
  
# 3행 3열 행렬 생성
## norw = 행의 수, ncol = 열의 수
  matrix(1:9, nrow=3)  # 열의 값은 자동으로 생성
  
## matrix 참조[행의 위치, 열의 위치]
  
  matrix(1:9, nrow=3, byrow = TRUE)  # 행단위로 데이터 값 채우기
  
## 행렬의 이름을 부여하는 함수 dimnames
  dimnamex = list(c('r1', 'r2', 'r3'), c('c1', 'c2', 'c3'))
  x = matrix(1:9, nrow=3, byrow = TRUE, dimnames = dimnamex)
  x

## 행렬의 요소 추출 : 인덱스[행의 위치, 열의 위치]
  x[2, 2]
  x[1, ]  # 1행의 모든 열
  x[, 3]  # 모든 행의 3열
   
  x[1:2, 1:3]
  x[1:2, ]
  x[c(1, 2), ]
  x[-3, ]
  
  x[2:3, 2:3]
  x[-1, -1]
  
  x[, 'c2']

  x['r3', ]  
  
  x[c(1, 3), c(1, 3)]
  x[-2, -2]
  
  y = matrix(1:9, nrow=3)  # 열 우선
  y
  
  y + 2
  y - 3
  y * 5
  y / 2
  
  a = matrix(1:4, nrow=2)
  a

  b = matrix(5:8, nrow=2)  
  b
  
  a + b
  a - b  
  a * b  
  a / b  

  a %*% b  # 행렬 곱, 앞에 있는 행의 개수와 뒤에 있는 열의 개수가 같아야 함
  
## 전치행렬 : 행과 열의 위치를 바꿔주는 함수
  t(a)
  
  nrow(x)
  
  xx = matrix(1:6, ncol=3)
  nrow(xx)
  ncol(xx)  
  
  a
  b

  cbind(a, b)  # 열 기준
  rbind(a, b)  # 행 기준
  
## 배열 : array(벡터형 데이터, dim = c(행, 열))
## 3행 4열 2차원 배열을 생성
  x = array(1:12, dim = c(3, 4))
  x

  dim(x)

# 2행 2열 행렬 3개를 생성하시오.
  yy = array(1:12, dim = c(2, 2, 3))
  yy  

  yy[1, 1, 1]  # [행, 열, 행렬]
  yy[1, 2, 3]
  yy[, , 3]
  
# 행렬 연산 apply(행렬데이터, 방향, 연산함수)
## 방향 : 1(행단위), 2(열단위)
  z = array(1:12, c(3, 4))  # 'dim =' 생략 가능
  z
  
  sum(z)  # 전체 합계
  mean(z)
  
  apply(z, 1, sum)  # 행단위 합계
  apply(z, 2, mean)  # 열단위 평균
  
# sample() : 벡터나 배열에서 샘플 추출
  w = array(1:12, c(3, 4))
  w

  sample(w, 10)  # replace = FALSE(기본값, 중복 허용X)
  
  sample(1:45, 6)
  
  sample(1:15, 20, replace=T)  # 중복 가능
  