# 하나의 수치형 변수의 분포 분석
## 수치형 변수의 중심점이 어디있냐, 가장 빈번하게 발생하는 수치는 뭐냐
## 수치형 변수의 값이 얼마나 넓게 퍼져있느냐, 특정값의 중심에 몰려있느냐
## 분포가 대칭적이냐 아니면 비대칭이냐
## 이상치 존재 여부 등

# 중심 경향을 분석하는 통계량 : 평균과 중위수
## mean(벡터) or mean(데이터프레임$컬럼)


### course 데이터의 총점의 평균 추출
library(bizstatp)
library(ggplot2)
library(dplyr)

mean(course$score)

mean(course$mid)
mean(course$mid, na.rm = T)


### 중앙값 median() : n/2(짝수), n+1/2(홀수)
median(course$score)

median(course$mid)
median(course$mid, na.rm = T)


### var(), sd()


# 산점도
## ggplot(data, aes(x, y)) + geom_point()
ggplot(course, aes(x = mid, y = final)) + geom_point()

plot(course[, 5:8])


# 추세선 : geom_smooth()
ggplot(course, aes(x = mid, y = final)) + geom_point() + geom_smooth()

ggplot(course, aes(x = mid, y = final)) + geom_point() + geom_smooth(method = 'lm') 


# ggpairs() : 확률밀도 그래프, 산점도
install.packages('GGally')
GGally::ggpairs(course, 5:8)  # library X


diamonds
str(diamonds)

# slice_sample()
diamonds_sample <- slice_sample(diamonds, prop = 0.1)
diamonds_sample

ggplot(diamonds_sample, aes(x = carat, y = price)) + geom_point() + geom_smooth()

cor(diamonds_sample$carat, diamonds_sample$price)

ggplot(diamonds_sample, aes(x = carat, y = price)) + 
  geom_point() + 
  geom_smooth() +
  scale_x_log10() + scale_y_log10()

cor(log10(diamonds_sample$carat), log10(diamonds_sample$price))


# 범주형 변수를 조건으로 수치형 변수의 상관성 분석
ggplot(diamonds_sample, aes(x = carat, y = price, color = cut)) + 
  geom_point() + 
  geom_smooth(se = F) +  # 회색 범위 지우기
  scale_x_log10() + scale_y_log10()

ggplot(diamonds_sample, aes(x = carat, y = price, color = cut)) + 
  geom_smooth() +  
  scale_x_log10() + scale_y_log10()

ggplot(diamonds_sample, aes(x = carat, y = price, color = clarity)) + 
  geom_point(alpha = 0.1) +
  geom_smooth() +  
  scale_x_log10() + scale_y_log10()

ggplot(diamonds_sample, aes(x = carat, y = price)) + 
  geom_point() +
  geom_smooth() +  
  scale_x_log10() + scale_y_log10() +
  facet_wrap(~ clarity)
