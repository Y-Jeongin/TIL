# 복지패널 데이터를 이용한 데이터 분석 - 한국인의 삶을 파악하라

## step 1. 필요 패키지 설치 및 로딩
  install.packages('foreign')  # spss 전용파일 등 외부 파일을 불러올 때
  
  library(foreign)
  library(readxl)
  library(ggplot2)
  library(dplyr)
  
## step 2. 데이터셋 로딩
  raw <- read.spss(file = 'C:/K_digital/data/Koweps_hpc10_2015_beta1.sav', to.data.frame = T)
  
## step 3. 사본 생성, 문제 발생시 여기서부터 다시 시작
  welfare <- raw
  
## step 4. 기본 데이터 분석 - 데이터 기본 정보 확인
  dim(welfare)  # 행과 열의 수 확인
  str(welfare)
  
## step 5. 파생변수 생성 또는 변수의 이름 변경 - 가독성
  welfare <- rename(welfare, 
             gender = h10_g3,
             year = h10_g4,
             marriage = h10_g10,
             religion = h10_g11,
             code_job = h10_eco9,
             income = p1002_8aq1,
             code_region = h10_reg7)
  
  
## 1. 성별에 따른 급여의 차이는 있을까?
### 성비 분석 : 도수분포표
  table(welfare$gender)
  addmargins(table(welfare$gender))  # 결측값 x

### M(1)과 F(2)로 변환
  welfare$gender <- ifelse(welfare$gender == 1, 'M', 'F')
  table(welfare$gender) 
  
  ggplot(welfare, aes(gender)) + geom_bar()
  
### 급여정보 데이터 분석
  summary(welfare$income)
  table(welfare$income)
  
# 결측치 처리, 0
  gender_income <- welfare %>% 
    filter(!is.na(income)) %>% 
    group_by(gender) %>% 
    summarise(mean_income = mean(income))
  gender_income

# 시각화 자료 추가
  
  
## 2. 나이와 급여의 관계는 있을까?
### 파생변수(age) = 현재연도(2015) - 출생연도(year) + 1
  table(is.na(welfare$year))
  summary(welfare$year)
  
  welfare$age <- 2015 - welfare$year + 1
  summary(welfare$age)
  
  age_income <- welfare %>% s
    filter(!is.na(income)) %>% 
    group_by(age) %>% 
    summarise(mean_income = mean(income))
  head(age_income, 10)
  
## 시계열 분석
  ggplot(age_income, aes(x = age, y = mean_income)) + geom_line()

## 3. 연령대에 따른 급여의 차이는 있을까?
### 연령대 : 청소년(30세미만) - young, 중장년(60세미만) - middle, 노년 - old
  welfare$gen <- ifelse(welfare$age < 30, 'young', 
                        ifelse(welfare$age < 60, 'middle', 'old'))
  table(welfare$gen)
  
  ages_income <- welfare %>% 
    filter(!is.na(income)) %>% 
    group_by(gen) %>% 
    summarise(mean_income = mean(income))
  ages_income
  
# 시각화
  ggplot(ages_income, aes(x = gen, y = mean_income)) + 
    geom_col() +
    scale_x_discrete(limits = c('young', 'middle', 'old'))
  
## 4. 연령대와 성별에 따른 급여의 차이는 있을까?
  agen_income <- welfare %>% 
    filter(!is.na(income)) %>% 
    group_by(gen, gender) %>% 
    summarise(mean_income = mean(income))
  agen_income
  
  ggplot(agen_income, aes(x = gen, y = mean_income, fill = gender)) +
    geom_col() +
    scale_x_discrete(limits = c('young', 'middle', 'old'))

## 5. 직업별 급여의 차이는 있을까?
### 엑셀파일에서 특정 시트에 있는 내용을 불러오는 작업
  jobList <- read_excel("C:/K_digital/data/Koweps_Codebook.xlsx", sheet = 2, col_names = T)
  head(jobList)
  dim(jobList)  # = str(jobList) = nrow(jobList)
  
### welfare 데이터프레임에 열 추가, 하나의 데이터프레임으로 합치는 작업
  welfare <- left_join(welfare, jobList, by = 'code_job')
  welfare$job 
  table(welfare$code_job)
  summary(welfare$code_job)
  
  job_income <- welfare %>% 
    filter(!is.na(job) & !is.na(income)) %>% 
    group_by(job) %>% 
    summarise(mean_income = mean(income))
  job_income
  
  top10 <- head(arrange(job_income, desc(mean_income)), 10)
  top10
  
  ggplot(top10, aes(x = reorder(job, mean_income), y = mean_income)) + geom_col() +
    coord_flip()

## 6. 성별에 따른 선호하는 직군이 있는가?

  
  age_job <- welfare %>% 
    filter(gender) %>% 
    group_by(gender) %>% 
    summarise(n_job = n(job))
  
## 7. 직군별 급여의 차이는 있는가?

## 8. 종교 유무에 따른 이혼율의 차이는 있는가?
### 이혼율 : 이혼건수 / 전체결혼건수
### 이혼율 : 이혼건수 / 15세 이상 인구수

## 9. 지역별 연령대 비율은 어떤가?