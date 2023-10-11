# 데이터 정제 : 이상치와 결측치 처리
## 결측치(missinf value) : 누락된 값
### is.na()
### na.omit() : NA 결측값ㅇ이 존재하는 행 전체를 제거
### na.rm = T or F, na를 제거하고 계산
  str(airquality)
  head(is.na(airquality))
  
  table(is.na(airquality))

  table(is.na(airquality$Temp))
  
  table(is.na(airquality$Ozone))
  
  mean(airquality$Temp)
  
  mean(airquality$Ozone)  # 결측값 존재하여 계산 불가
  
## Ozone에 결측값이 아닌 관측데이터만 추출  
  air_narm <- airquality[!is.na(airquality$Ozone), ]

  mean(air_narm$Ozone)
  
  air_omit <- na.omit(airquality)
  mean(air_omit$Ozone)  
  
  mean(airquality$Ozone, na.rm = T)

  
## 이상치(outlier)
  patients <- data.frame(name = c('환자1', '환자2', '환자3', '환자4', '환자5'), 
                     age = c(22, 30, 41, 27, 38),
                     gender = factor(c('M', 'F', 'M', 'K', 'F')),
                     blood.type = factor(c('A', 'O', 'B', 'AB', 'C')))

  patients
  str(patients)

### 성별에서 이상치를 제거하고 추출
  patients_omit <- patients[patients$gender == 'M' | patients$gender == 'F', ]
  patients_omit

### patients에서 성별과 혈액형에 이상치를 제거하고 추출
  patients_outlier <- patients[(patients$gender == 'M' | patients$gender == 'F') & 
                               (patients$blood.type == 'A' | patients$blood.type == 'B' | 
                                patients$blood.type == 'AB' | patients$blood.type == 'O'), ]
  patients_outlier

  patients1 <- data.frame(name = c('환자1', '환자2', '환자3', '환자4', '환자5'), 
                         age = c(22, 30, 41, 27, 38),
                         gender = c(1, 2, 1, 3, 2),
                         blood.type = c(1, 3, 2, 4, 5))
  patients1  

## 성별의 이상치를 결측값으로 처리
  table(patients1$gender)
  
## patienst1$gender <- ifelse(조건식, 참, 거짓)
  patients1$gender <- ifelse(patients1$gender < 1 | patients1$gender > 2, NA, patients1$gender)

## 혈액형의 이상치를 결측값으로 처리
  patients1$blood.type <- ifelse(patients1$blood.type < 1 | patients1$blood.type > 4, 
                                 NA, patients1$blood.type)

  patients1

  
## 이상치를 판단하기 어려운 데이터의 처리 
  boxplot(airquality[ , 1:4])
  boxplot(airquality[ , 1])$stats

## Ozone 컬럼에 이상치를 찾아 결측처리
### 사본 생성
  air <- airquality
  air$Ozone <- ifelse(air$Ozone < 1 | air$Ozone > 122, NA, air$Ozone)
  table(is.na(air$Ozone))

## cars 데이터셋의 dist의 이상치를 제거한 후 dist의 평균을 계산하시오.
### 단, 이상치의 판단은 boxplot을 이용할 것
  cars1 <- cars
  boxplot(cars1[, 2])$stats
  table(is.na(cars1$dist))
  cars1$dist <- ifelse(cars1$dist < 2 | cars$dist > 93, NA, cars1$dist)
  

## ChickWeight 데이터에서 병아리 무게(weight)의 이상치를 제거한 후 평균 무게를 구하시오.
### 단, 이상치의 판단은 boxplot을 이용할 것
  ChickWeight1 <- ChickWeight
  ChickWeight1
  table(is.na(ChickWeight1$weight))
  boxplot(ChickWeight1[, 1])$stats
  ChickWeight1$weight <- ifelse(ChickWeight1$weight < 35 | ChickWeight1$weight > 309,
                                NA, ChickWeight1$weight)
  