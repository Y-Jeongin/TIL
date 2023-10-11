# 변수
# 벡터(vector) : 1차원 배열
## c(), start:end, seq(from, to, by), rep(vector, times, each)
x <- c(1, 2, 3, 4, 5)
x

y <- 1:5
y

z <- seq(1, 5, 1)
z

z <- seq(1, 5)
z

z <- seq(5)
z

a <- c("1", "2", "3")
a

a <- c("1", "2", "3", 4, 5, 6)
a

# 접근방법 : [index], [condition], [-index]
xx <- c(1, 2, 3, c(4, 5, 6))
xx

xx[3]
xx[4]

## xx에 저장된 데이터중 짝수에 해당하는 값만 추출
xx[c(2, 4, 6)]
xx %% 2 == 0
xx[xx %% 2 == 0]

yy <- c('a', 'b', 'c')
yy[c(1, 2)]
yy[1:2]
yy[-3]
yy

# 벡터의 각 요소에 이름을 부여
names(yy)  # 이름 확인

names(yy) <- c('kim', 'lee', 'park')
yy

yy[2]
yy['lee']

names(yy)[2]


# 벡터의 길이 : length(), or NROW() - 대문자임을 주의!
x <- c('a', 'b', 'c')
length(x)
nrow(x)  # matrix 형에서 사용
NROW(x)

# 벡터 연산
## %in%
'a' %in% x

# 리스트(List) : 파이썬의 딕셔너리(사전) 자료형과 동일
## 키 = 값의 형태로 데이터를 관리한다.
## 키는 중복불가, 값은 중복가능
x <- list(name = 'foo', height = 70)
x

x$name
x$height

x[[1]]
x[[2]]

## 리스트를 구성하고 있는 각 요소는 크기와 자료형이 달라도 가능하다.
x <- list(name = 'foo', height = c(1, 2, 3))
x

x$name
x[[1]]
x$height
x[[2]]

x$height[2]
x[[2]][2]

y <- list(a = list(val = c(1, 2, 3)), b = list(val = c(1, 2, 3, 4)))
y

# 행렬(matrix) : 여러 개의 벡터가 결합되어있는 형태
## matrix(data, nrow, ncol, byrow = T/F) byrow = T > 행 기준으로 채우기
matrix(1:9, nrow = 3)
matrix(1:9, ncol = 3)

matrix(1:9, nrow = 3, byrow = T)

## 행렬에 행과 열의 이름을 부여 dimnames(list())
matrix(1:9, nrow = 3, byrow = T,
       dimnames = list(c('행1', '행2', '행3'), c('열1', '열2', '열3')))

## 행렬에 접근 : [행인덱스, 열인덱스] or [행조건, 열조건]
matrix(1:9, nrow = 3, byrow = T,
       dimnames = list(c('행1', '행2', '행3'), c('열1', '열2', '열3'))) -> m
m

### 1, 2행 추출
m[1:2, ]
### 3행 제외
m[-3, ]
### 1행, 3행, 1열, 3열 추출
m[-2, -2]


# 데이터 프레임 : 행렬과 유사한 구조
df <- data.frame(x = c(1, 2, 3, 4, 5), y = c(2, 4, 6, 8, 10))
df

df$z <- c('M', 'F', 'M', 'F', 'M')
df

df$x

df[1, 2]
df[c(1, 3), 2]

df[-1, -c(2, 3)]

df[, c('x', 'z')]

df[, 'x', drop = F]