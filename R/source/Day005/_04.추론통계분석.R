# 추론통계분석 : 가설검정
## A학원에 수강하면 성적에 도움이 되느냐?

## 학원을 다니기 전 성적
  before_study <- c(34,76,76,63,73,75,67,78,81,53,58,81,77,80,43,65,76,63,54,64,85,54,70,71,71,55,40,
                    78,76,100,51,93,64,42,63,61,82,67,98,59,63,84,50,67,80,83,66,86,57,48)
  
## 학원을 다닌 후 성적
  after_study <- c(74,87,89,98,65,82,70,70,70,84,56,76,72,69,73,61,83,82,89,75,48,72,80,66,82,71,49,
                   54,70,65,74,63,65,101,82,75,62,83,90,76,87,90,78,63,59,79,74,65,77,74)
  
## boxplot 비교
  boxplot(before_study, after_study, names = c('수강 전', '수강 후'))
  
# t-검정 : 집단간의 차이를 검증하는 도구, t-test()
## t-test(x, y, paired = T/F, var.equal = T/F, alternative = 양측검정, 단측검정)  
### paired = T, 대응표본, 한 집단으로부터 두 번 반복해 샘플을 추출하는 것(표본의 크기가 동일)
### paired = F, 독립표본, 서로 독립된 집단에서 각각 샘플을 추출하는 것
### alternative = 'two.sided' 두 집단이 서로 같은지 비교, 차이가 있냐 없냐만 확인
### alternative = 'less', A less than B, A가 B보다 작은지 비교
### alternative = 'greater' A greater than B, A가 B보다 큰지 비교
## 반드시 한 가지의 가정이 선행되어야 한다. - 정규분포
  
# 샘플 수가 30개 미만이면 정규분포 여부를 반드시 확인해야 한다.
# 동일집단을 대상으로 하는 대응표본
# 가설 : 두 집단이 같ㅌ다
# 대립가설 : 두 집단이 차이가 있다
  t.test(before_study, after_study, paired = T)
# p-value < 0.05, 대립가설을 채택, 귀무가설 기각
  
# 대립가설 : 두 집단의 평균의 차가 0보다 크다  
# 귀무가설 : 
  t.test(before_study, after_study, paired = T, alternative = 'greater')
# p-value > 0.05, 대립가설 기각
# 수강 후 성적이 떨어졌다는 것은 기각한다.
  
# 표본이 1개인 경우(단일표본 t검정)
## A회사의 건전지 수명시간이 1000시간일 때
## 귀무가설 : 건전지의 수명은 1000시간이다.
## 대립가설 : 건전지의 수명은 1000시간이 아니다.
  a <- c(980, 1003, 963, 1032, 1012, 1002, 996, 1102, 1017, 1003)

## 정규분포 여부를 확인 : Shapiro-wilk 검정
### 귀무가설 : 정규분포를 따른다.
### 대립가설 : 정규분포를 따르지 않는다.
  shapiro.test(a)
  
# p-value > 0.05보다 크기때문에 귀무가설 채택
## alternative = two.side, 주어진 샘플이 평균과 다르다.
## alternative = less, 샘플이 주어진 평균보다 작다.
## alternative = greater, 샘플이 주어진 평균보다 크다.
  t.test(a, mu = 1000, alternative = 'two.side')

# 결론 : 건전지의 평균수명시간은 1000시간이다.

# 수학 평균점수가 55점이다.
# 0교시 수업 후 학생들의 성적이 올랐다고 할 수 있는지
## 귀무가설 : 성적이 오르지 않았다.
## 대립가설 : 성적이 올랐다.
  
# 0교시 후 학생들의 수학 점수
  score <- c(58, 49, 39, 99, 32, 88, 62, 30, 55, 65, 44, 55, 57, 53, 33, 42, 39)
  
  shapiro.test(score)
  t.test(score, mu = 55, alternative = 'two.side')

## 피셔검정(fisher's exact Test) : 표본수가 적거나 데이터의 분포가 치우친 경우에 적용
## fisher.test(data)


# -------------------------------------------------------------------------------------------------
# 정수기 회사의 직원 채용 분석 - 몇명의 AS기사 채용이 필요한지 분석
# -------------------------------------------------------------------------------------------------
  purifier_df <- read.table(file = 'clipboard', header = T, 
                            sep = '\t',
                            stringsAsFactors = T)
  
# 데이터 구조 확인
  str(purifier_df)
## purifier : 총 정수기 대여수(전월)
## old_purifier : 10년 이상 노후된 정수기 대여수(전월)
## as_time : AS 소요시간(당월)

# 상관관계 : 총 정수기 대여수와 AS 시간의 상관관계 _ 산점도 그래프
  plot(purifier_df$purifier, purifier_df$as_time, xlab = '총 정수기 대여수', ylab = 'AS시간')

# 상관관계 : 10년 이상 노후된 정수기의 대여수와 AS 시간의 상관관계
  plot(purifier_df$old_purifier, purifier_df$as_time, xlab = '노후 정수기 대여수', ylab = 'AS시간')
  
# 상관계수 : 피어슨 상관계수, 스피어만 상관계수
  cor(purifier_df$purifier, purifier_df$as_time)  # method = 'pearson' 생략가능, 피어슨 상관계수
  
  cor(purifier_df$old_purifier, purifier_df$as_time)

# 상관분석
# 구내식당의 음식값이 매출에 미치는 영향 분석
## 귀무가설 : 상관관계가 없다.
## 대립가설 : 상관관계가 있다.
  x <- c(70, 72, 62, 64, 71, 76, 0, 65, 74, 72)
  y <- c(70, 74, 65, 68, 72, 74, 61, 66, 76, 75)
  
  cor.test(x, y, method = 'pearson')  # x-y 간의 강한 상관관계, p-value < 0.05으로 대립가설 채택
  
# R base 내장 데이터 woman
  data()
  str(women)
  women

  plot(women$height, women$weight)
  
# 상관계수  
  cor(women$height, women$weight)  # 0.9954 아주 강한 상관관계
  
# 회귀방정식 y(weight) = ax(height) + b, y = 종속변수, x = 독립변수, a = 기울기, b = 절편
  
# 회귀분석 : 독립변수와 종속변수
# 체중(종속변수) = 기울기 * 신장(독립변수) + 절편
# formula : 종속변수 ~ 독립변수
  model <- lm(women$weight ~ women$height)  # 선형 회귀 분석
  model  # list 형태
  
# 체중 = 3.45 * 신장 + (-87.52)  
# 신장이 180인 사람의 체중을 얼마인가?  
  model$coefficients[[2]] * 180 + model$cofficients[[1]]
  
  summary(model)

  plot(women$height, women$weight)  
# 회귀선
  abline(model)


# 자동차의 속도와 제동거리 데이터셋 cars
  str(cars)
  
  plot(cars$speed, cars$dist)
  
  cor(cars$speed, cars$dist)  # 강한 상관관계 = 속도가 증가하면 거리가 증가한다.
  
# lm(formula, data)
# 제동거리(종속변수) ~ 속도(독립변수) : 독립변수가 1개
# 제동거리(종속변수) ~ 속도 + 타이어면적(독립변수) : 독립변수가 여러개
# 제동거리(종속변수) ~ .(독립변수, 전체) : 독립변수가 여러개
  
  head(cars, 10)
  
# 차 속도에 따른 제동거리를 확인하는 회귀분석  
  model <- lm(cars$dist ~ cars$speed)
  model <- lm(dist ~ speed, cars)
  model

  summary(model)
  
# 회귀방정식
## 제동거리 = 3.932 * 속도 + (-17.579)

  abline(model)

# 회귀분석의 모델의 평가 요소
## 독립변수의 유의성 - 유일성, 모델의 정확도, 오차항의 정규성

# 가로 2, 세로 2
  par(mfrow = c(2, 2))  # 4분할, 다중회귀분석
  plot(model)
  
# Residuals vs Fitted : 실제값과 예측값, 빨간선 = 0과 같아야 좋은 모델
# Q-Q Residuals : 실제값과 예측값의 차이, 직선에 점들이 가까우면 정규분포를 따른다
# Scale-Location : 빨간선의 기울기가 0에 가깝고 점들은 고르게 분포한 형태로 나타나야 등분산성 만족
# Residuals vs leverage : 이상치 판단

# 예측 : 새로운 독립변수를 대입해서 종속변수의 값을 확인, 과거의 데이터로 분석
# 점 추정과 구간 추정
# 점 추정 : 하나의 점으로 예측 결과를 나타냄, 하나의 값
# 구간 추정 : 범위로 예측 결과를 나타냄
# predict(model, data, interval - 점추정/구간추정 생략하면 점추정, level - 신뢰수준)
  model <- lm(dist ~ speed, cars)

# 독립변수에 여러 값을 담아 예측
  speed <- c(50, 60, 70, 80, 90, 100)
  new_input <- data.frame(speed)
  new_input

## 예측 - 점 추정
  result <- predict(model, new_input)
  str(result)  # 1차원 배열의 형태

  cbind(new_input, result)  # 열 조합

## 예측 - 구간 추정
## interval = 'confidence' : 모델 계수의 불확실성을 감안한 구간 추정
## interval = 'prediction' : 모델 계수의 불확실성과 결과의 오차를 감안한 구간추정
  result <- predict(model, new_input, interval = 'confidence', level = 0.95)
  result  # 점추정, 구간추정
  
  cbind(new_input, result)
  
  
# 수치데이터의 기초통계량
  summary(purifier_df)
  
## 독립변수 : 정수기 총 대여수, 노후된 정수기의 총 대여수  - 유의미한 독립변수 X
  # 정수기 총 대여수 안에는 노후된 정수기의 총 대여수가 포함되어 있기때문에 유의미하지 않다.
## 종속변수 : AS 시간
## 정수기 총 대여수 = 10년 이전 대여수 + 10년 이후 대여수
## 파생변수 : young_purifier
  purifier_df$y_purifier <- purifier_df$purifier - purifier_df$old_purifier
  purifier_df
  
  lm_result <- lm(as_time ~ y_purifier + old_purifier, purifier_df)
  lm_result  

  summary(lm_result)
  
# AS 시간 = 0.08881 * 10년미만 + 0.23977 * 10년이후 + 193.73664
## 월말 총 대여수 300,000대, 그 중 10년 이상 70,000대라고 한다면
  
## 예측
  input_predict <- data.frame(y_purifier = 230000, old_purifier = 70000)
  
  result <- predict(lm_result, input_predict)
  result

# AS 기사 1명이 한 달간 처리하는 AS 시간 : 8 * 20
  result / (8*20)
  
# 구간추정
  result <- predict(lm_result, input_predict, interval = 'confidence', level = 0.95)
  result / (8*20) 
  