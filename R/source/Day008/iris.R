# data()
str(iris)
?iris

## 데이터 설명
### Sepal.Width 꽃받침의 너비 cm
### Sepal.Length 꽃받침의 길이
### Petal.Width 꽃잎의 너비
### Petal.Length 꽃잎의 길이
### Species 붓꽃의 품종 setosa, versicolor, virginica, 범주형 변수

## 데이터 내용 확인
head(iris, 10)


# 3차원 배열형태로 저장된 iris 데이터셋
iris3

# 기술통계
summary(iris)

# 시각화 - 다변량 상관분석
plot(iris)

plot(iris$Sepal.Length)
plot(iris$Species)
plot(iris$Species ~ iris$Sepal.Length, data = iris)

plot(iris$Sepal.Length, col = as.numeric(iris$Species))
plot(iris$Sepal.Width, col = as.numeric(iris$Species))
plot(iris$Petal.Length, col = as.numeric(iris$Species))
plot(iris$Petal.Width, col = as.numeric(iris$Species))


install.packages('caret')
library(caret)

featurePlot(iris[, 1:4], iris$Species, 'ellipse')


# 정규화 - 로그변환, z-값
scale(iris[1:4])

cbind(as.data.frame(scale(iris[1:4])), iris$Species)


# 주성분분석 : PCA 차원축소 알고리즘 - 비지도학습
p <- princomp(iris[, 1:4], cor = T)
summary(p)

plot(p, type = 'l')


# Decision Tree : 의사결정 트리
## 이해하기 쉽고 직관적인 알고리즘
## 앙상블 기법
## 의사결정 트리 관련 패키지 : rpart, party, tree
## rpart, tree 패키지는 과대적합을 해결하기 위해 가지치기가 필요
## party는 입력변수의 레벨이 31개로 제한

# 품종 레벨 확인
levels(iris$Species)

# 분할 : train과 test를 분리해서 학습한다.
## train - 70(80)%, test - 30(20)%
## train - 60%, test - 20%, valid - 20%

# iris 행수
nrow(iris)

# 품종별 레코드 수
table(iris$Species)

head(iris, 10)
tail(iris, 10)

# createDataPartition(y, p, list)
## y - 추출할 팩터
## p - 비율(확률)
## list - 추출할 벡터의 위치 정보(리스트타입으로 받을 때 TRUE)
iris_row_idx <- createDataPartition(iris$Species, p = 0.8, list = F)
str(iris_row_idx)

iris_train <- iris[iris_row_idx, ]
table(iris_train$Species)

iris_test <- iris[-iris_row_idx, ]
table(iris_test$Species)


# 의사결정 트리 패키지 설치
install.packages('rpart')
library(rpart)

# rpart(formula, data, control)
# 종속변수(반응변수) - 독립변수(설명변수)
model <- rpart(Species ~ ., data = iris_train, control = rpart.control(minsplit = 2))
model


# 시각화
install.packages('rpart.plot')
library(rpart.plot)

rpart.plot(model)


# 가지치기(CP)
## CP값 조회
model$cptable

model_prune <- prune(model, cp = 0.025)
rpart.plot(model_prune)



# party 패키지 - ctree()
install.packages('party')
library(party)

# ctree(formula, data)
iris_ctree <- ctree(Species ~ ., data = iris_train)
iris_ctree

plot(iris_ctree, type = 'simple')
plot(iris_ctree)


# 예측하기 : predict(model, new_data, type = class, prob)
str(iris_test)

predict(model, newdata = iris_test, type = 'class')

# 실제값과 예측값을 데이터프레임으로 생성
## actual : 실제값, expect : 예측값
actual <- iris_test$Species
expect <- predict(model, newdata = iris_test, type = 'class')

result_df <- data.frame(actual, expect)
result_df


# 혼동행렬, confusion Matrix
table(result_df)

# 정확도
(10 + 10 + 8) / nrow(iris_test)
