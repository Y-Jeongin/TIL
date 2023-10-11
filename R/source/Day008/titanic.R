# classfication과 classifier / 분류 - 분류(지도학습)와 군집(비지도학습)

# 필요 패키지 설치 및 로딩
library(ggplot2)
library(dplyr)

# 데이터 불러오기와 데이터 확인하는 과정
install.packages('readr')  # read_csv
install.packages('descr')

library(readr)
library(descr)

# 데이터 불러오기
train <- readr::read_csv("C:/K_digital/data/titanic/train.csv")
test <- readr::read_csv("C:/K_digital/data/titanic/test.csv")

head(train)
head(test)

str(train)


full <- dplyr::bind_rows(train, test)  # rbind와 cbind

# 변수의 의미 파악
names(train)
names(test)

## PassengerId
## Survived 생존여부 0(사망), 1(생존)
## Pclass 선실의 등급 1, 2, 3
## Name
## Sex
## Age
## SibSp 동반가족수(형제 또는 배우자)
## Parch 동반가족수(부모 또는 자녀)
## Ticket 티켓번호
## Fare 승선비
## Cabin 선실
## Embarked 승선항 C, Q, S

# 사본 titanic
val <- c('Survived', 'Pclass', 'Sex', 'Age', 'SibSp', 'Parch', 'Embarked')
titanic <- train[, val]
titanic

# 변수 속성 변경
table(titanic$Survived)
table(titanic$Pclass)
table(titanic$Embarked)

titanic <- titanic %>% 
  dplyr::mutate(Survived = factor(Survived), 
                Pclass = factor(Pclass), 
                Sex = factor(Sex),
                Embarked = factor(Embarked))

titanic <- as.data.frame(titanic)

str(titanic)

summary(titanic)

# 문제정의
## 전처리 : 결측치와 이상치의 처리
### 결측값 확인
table(is.na(titanic$Age))
table(is.na(titanic$Embarked))

sapply(titanic, function(x){
  sum(is.na(x))
})

### 결측치 대체 - 보간법
### Age : 연속적인 수치형, 평균값
age_mean <- mean(titanic$Age, na.rm = T)
age_mean

titanic$Age <- ifelse(is.na(titanic$Age) == T, age_mean, titanic$Age)


### Embarked : 범주형 데이터, 최빈값
titanic$Embarked <- ifelse(is.na(titanic$Embarked) == T, "S", titanic$Embarked)

titanic$Embarked <- ifelse(titanic$Embarked == "S", 3, titanic$Embarked)

titanic$Embarked <- as.factor(titanic$Embarked)


## 1. 생존비율 - 사망과 생존의 비율
survived <- ggplot(titanic, aes(x = Survived)) + geom_bar()
survived

## 2. 성별에 따른 생존여부
gender <- ggplot(titanic, aes(x = Survived, fill = Sex, width = .8)) + geom_bar()
gender

## 3. 선실등급에 따른 생존여부
c <- titanic %>% 
  group_by(Pclass, Survived) %>% 
  summarise(n = n())
c

pie(c)


pclass <- ggplot(titanic, aes(x = Survived, fill = Pclass)) + geom_bar(position = 'fill')
pclass

## 4. 동반가족수에 따른 생존여부
sibsp <- ggplot(titanic, aes(x = Survived, fill = SibSp)) + geom_bar(position = 'fill')
sibsp

parch <- ggplot(titanic, aes(x = Survived, fill = Parch)) + geom_bar(position = 'dodge')
parch

## 5. 승선항에 따른 생존여부
embarked <- ggplot(titanic, aes(x = Survived, fill = Embarked)) + geom_bar(position = 'fill')
embarked

# 분류 분석(Classification Analysis)
## 학습을 통해 분류 모델을 학습하고 이를 통해 분류 예측하는 분석 기법
## 의사결정트리(Decision Tree), 나이브 베이스 분류, 신경망(ANN), 서포트 벡터(SVM)
