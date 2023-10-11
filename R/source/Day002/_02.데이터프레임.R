# 데이터 프레임의 내용에 접근
## [인덱스], [행인덱스, 열인덱스]
## [조건식]

### 팬시 인덱스 : 조건에 의해 원하는 값을 추출
  x <- c(FALSE, TRUE, FALSE, FALSE, TRUE)
  y <- c(1, 2, 3, 4, 5)
  x
  mode(x)
  typeof(x)  
  class(x)  
  
  y
  y[c(2, 5)]  
  y[x]  # T에 해당하는 값
  
  a <- matrix(1:9, nrow = 3)
  a  
  
# [행조건식, 열조건식]
  a[, 2]
  a[, 2] > 4  # FALSE TRUE TRUE
  
  a[행조건식, 열조건식]
  a[a[, 2] > 4, ]
  a[2:3, ]  
  
  x <- 1:3  
  a[x %% 2 == 1, ]  # x %% 2 == 1 = 홀수
  
# 데이터 프레임 내용에 접근 $변수명
  d <- data.frame(x = c(1, 2, 3, 4, 5), y = c(2, 4, 6, 8, 10))
  d
  
  d$x
  d$y
  
  d[, 'x']
  d[, 'x', drop=F]
   
# 데이터 프레임의 열이름(colnames) = names(), 행이름(rownames)
  colnames(d)
  names(d)
  rownames(d)  # 문자 취급
  
# 여러 개의 벡터를 이용하여 데이터 프레임을 생성
  name = c('홍길동', '장보고', '유관순', '이순신', '강감찬')
  age = c(20, 25, 19, 22, 31)
  gender = factor(c('M', 'F', 'F', 'M', 'F'))
  blood.type = factor(c('A', 'O', 'AB', 'B', 'O'))
  
  p <- data.frame(name, age, gender, blood.type)  # 변수의 이름이 key의 역할
  p  
  
  p2 <- data.frame(name = c('홍길동', '장보고', '유관순', '이순신', '강감찬'),
                   age = c(20, 25, 19, 22, 31),
                   gender = factor(c('M', 'F', 'F', 'M', 'F')),
                   blood.type = factor(c('A', 'O', 'AB', 'B', 'O')))
  p2  

  p$name  
  p[1, ]  
  p[, 2]  
  p[, 2, drop=F]  

## 유관순 정보만 추출
  p[3, ]
  p[p$name == '유관순', ]
  p[name == '유관순', ]
  
## 이순신의 나이와 혈액형 추출
  p[p$name == '이순신', c(2, 4)]
  p[p$name == '이순신', c('age', 'blood.type')]
  
# 데이터 프레임에 유용한 함수
## R에 내장된 데이터셋
  data()
  
# 자동차의 속도와 제동 거리의 상관 관계를 분석하기 위해 수집된 데이터셋
  cars  
  
## 구조 확인
  str(cars)  # 50개의 관측데이터, 2개의 변수
  
  cars$speed
  cars$dist  

## 데이터 프레임의 속성명을 변수명으로 사용
## attach - 설정, detach - 해제
  speed
  dist    
  
  attach(cars)
  speed
  dist  
  
  detach(cars)
  speed 
  dist
  
# 평균 자동차 속도
  mean(cars$speed)

# 최고 속도
  max(cars$speed)

# with 함수
  with(cars, mean(speed))

# 데이터 프레임의 일부분 추출
  head(cars)
  tail(cars, 10)

# subset(데이터 프레임, 조건식, select - 추출하고 싶은 열 목록, 생략 가능)
## cars 데이터 셋에서 속도가 20을 초과하는 데이터만 추출
  cars$speed > 20
  cars[cars$speed > 20, ]
  
  help(subset)
  subset(cars, speed > 20)
  
## 속도가 20이상 23이하인 데이터 추출
  subset(cars, speed >= 20 & speed <= 23)
  
## 속도가 20이상인 데이터의 dist만 추출
  subset(cars, speed >= 20, dist)  # 데이터 프레임 형식 유지

  cars[cars$speed >= 20 & cars$speed <= 23, 'dist']  
  cars[cars$speed >= 20 & cars$speed <= 23, 'dist', drop=F]  