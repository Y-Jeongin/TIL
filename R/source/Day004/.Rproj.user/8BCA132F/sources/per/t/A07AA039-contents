# dplyr 패키지 : 데이터 프레임을 핸들링할 때 가장 기본적으로 사용되는 함수
# install.packages('dplyr')
  install.packages('dplyr')
  library(dplyr)

## filter(df, x) : 행 추출, subset()
## select(df, x, y) : 열 추출, df[, c('x', 'y')]
## mutate(df, z = x + y) : 열 추가(파생 변수), df$z <- df$x + df$y, transform()
## arrange(df, x) : 정렬, order(), sort()
## distinct(df, x) : unique 행 추출, unique()
## rename(df, y = x) : 변수명 변경, names(df)[names(df) == 'x'] <- 'y'
## summarise() : 집계, aggregate()
## group_by() : 그룹별 집계
## inner_join(df1, df2) : merge(df1, df2)
## left_join(df1, df2) : merge(df1, df2, all.x = T)
  
## 체인연산자 %>%

# 세계 각국의 기대수명과 1인당 국내 총 생산, 인구에 대한 정보를 집계한 데이터셋  
  install.packages('gapminder')
  library(gapminder)

  str(gapminder)
  head(gapminder, 20)
  
## 각 나라별 기대수명 추출
  gapminder[, c('country', 'lifeExp')]

## 각 나라별 기대수명과 측정년도
  gapminder[, c('country', 'lifeExp', 'year')]

  select(gapminder, country, lifeExp)
  
  gapminder %>%
    select(country, lifeExp)
  
  View(gapminder)

  gapminder[gapminder$country == 'Croatia',]
  
  gapminder[gapminder$country == 'Croatia', 'pop']

  gapminder[gapminder$country == 'Croatia', c('pop', 'lifeExp')]  
  
# Croatia의 1990년 이후의 기대수명과 인구를 추출
  gapminder[gapminder$country == 'Croatia' & gapminder$year > 1990, 
            c('pop', 'lifeExp')]

# Croatia의 기대수명과 인구의 평균을 추출하시오.
## apply(데이터셋, 방향, 함수), 방향(1-행, 2-열)
  gapminder[gapminder$country == 'Croatia', c('pop', 'lifeExp')]
  
  apply(gapminder[gapminder$country == 'Croatia', c('pop', 'lifeExp')], 2, mean)

# Croatia 정보 추출
  filter(gapminder, country == 'Croatia')

  gapminder %>%
    filter(country == 'Croatia')

## Croatia의 기대수명과 인구만 추출
  df <- filter(gapminder, country == 'Croatia')
  df  

  select(df, 'lifeExp', 'pop')
  
  gapminder %>%
    filter(country == 'Croatia') %>%
      select(lifeExp, pop)

# 인구(pop) 평균
  mean(gapminder$pop)
  
  summarise(gapminder, mean(pop))

# 대륙별 인구의 평균
  summarise(group_by(gapminder, continent), mean(pop))

  gapminder %>%
    group_by(continent) %>%
      summarise(mean(pop))
  
# 대륙별 나라의 인구 평균
  gapminder %>%
    group_by(continent, country) %>%
      summarise(mean(pop))
  
# ------------------------------------------------------------------------------------------------
# mtcars
# ------------------------------------------------------------------------------------------------
  str(mtcars)
## 행추출 : filter(데이터셋, 조건)
## 실린더(cyl)의 개수가 4기통에 해당하는 자동차의 정보만 추출하시오.
  filter(mtcars, cyl == 4)
  
  mtcars %>%
    filter(cyl == 4)

### 실린더가 6기통 이상이고 연비가(mpg) 20을 초과하는 자동차의 정보만 추출
  filter(mtcars, cyl >= 6 & mpg > 20)
  
  mtcars %>%
    filter(cyl >= 6 & mpg > 20)

## 열추출 : select(데이터셋, 변수명)
### mtcars 데이터셋에서 변속기(am)과 기어(gear) 데이터만 추출
  select(mtcars, am, gear)
  
  mtcars %>%
    select(am, gear)
  
## 정렬 : arrange(데이터셋, 변수명1, 변수명2), arrange(데이터셋, desc(변수명))
### mtcars 데이터셋의 무게(wt)를 기준으로 오름차순 정렬한 후 상위 6개만 추출
  head(arrange(mtcars, wt))
  
  head(arrange(mtcars, desc(wt)))
  
## 열추가 : mutate(데이터셋, 추가할 변수 이름 = 조건)
### mtcars 데이터셋에 year라는 생산년도를 담을 열을 추가한 후 1974라는 값을 표시
  head(mutate(mtcars, year = '1974'))

### 자동차별 연비(mpg)의 순위를 구하여 mpg_rank 열을 추가하여 표시
  head(mutate(mtcars, mpg_rank = rank(mpg)))

## 중복값 제거 : distinct(데이터셋, 변수명)
### mtcars 데이터셋의 실린더 개수(cyl)에 따른 종류와 기어 개수(gear)에 따른 종류 추출
  distinct(mtcars, cyl)
  
  distinct(mtcars, gear)
  
  distinct(mtcars, cyl, gear)
  
## 요약 : summarise(데이터셋, 요약변수명 = 기술통계함수)
### 자동차 실린더(cyl) 개수의 평균, 최소값, 최대값 추출
  summarise(mtcars, cyl_mean = mean(cyl), cyl_min = min(cyl), cyl_max = max(cyl))

## 그룹 설정 : group_by(데이터셋, 변수명)
### 동일한 실린더 개수를 가진 차가 몇대인지 추출
  gp <- group_by(mtcars, cyl)
  summarise(gp, n())  # 중복값을 제거하고 건수 구하기 : n_distinct()

# 동일한 실린더 개수를 가진 차들 중 기어값이 중복인 데이터를 제외한 건수를 추출
  gp <- group_by(mtcars, cyl)
  summarise(gp, n_distinct(gear))

# ------------------------------------------------------------------------------------------------
# EDA(탐색적 데이터 분석)
# ------------------------------------------------------------------------------------------------
  tips <- read.csv('https://raw.githubusercontent.com/mwaskom/seaborn-data/master/tips.csv')
## stringsAsFactor
  
  str(tips)
  head(tips, 10)
  tips
# total_bill : 계산서 금액
# tip : 팁 액수
# sex : 계산한 사람의 성별
# smoke : 흡연자 포함 여부
# day : 요일
# time : 시간
# size : 동석자 수


  summarise(tips, tip_mean = mean(tip), tip_min = min(tip), tip_max = max(tip))

  tips_mean <- tips %>%
    filter(tip >= 3) %>%
      select(sex, day, time)
  
  gb <- group_by(tips_mean, time)
  summarise(gb, n())
  
  tips_50 <- head(arrange(tips, desc(tip)), 50)
  tips_50
  
  table(tips_50$smoker)
  table(tips_50$day)
  table(tips_50$sex)
  table(tips_50$time)
  
  summarise(tips_50, mean(total_bill), mean(tip), mean(size))


  ggplot(tips, aes(x = total_bill, y = tip)) + geom_point()
  
  
  gt <- group_by(tips, day)
  summarise(gt, mean(total_bill))
  
  gt <- group_by(tips, day)
  summarise(gt, n(time))  
  
  
  ggplot(tips, aes(x = day)) + geom_bar()
  
    summarise(group_by(day), sum(total_bill))
    
  tips %>%
    group_by(day) %>%
      summarise(mean(total_bill))
  
  tips %>%
    group_by(day) %>%
    summarise(tot = sum(total_bill)) -> data
  
  ggplot(data, aes(day, tot)) + geom_bar()
  
  tips %>%
    group_by(day) %>%
    mutate(tot = sum(total_bill)) -> tot_data
  tot_data

# ------------------------------------------------------------------------------------------------
## 요약보고서 summary
  head(tips, 10)
  summary(tips)
  
  tips$sex <- as.factor(tips$sex)
  tips$smoker <- as.factor(tips$smoker)
  tips$day <- as.factor(tips$day)
  tips$time <- as.factor(tips$time)
  
# 동석자 수의 분포
  tips %>%
    ggplot(aes(size)) + geom_histogram()
## 2명이 같이 오는 경우가 월등히 많다.

# 총계산금액에 따른 팁액수를 분석
  tips %>%
    ggplot(aes(total_bill, tip)) + geom_point()
  
  tips %>%
    ggplot(aes(total_bill, tip)) + geom_point(aes(col = day))  # 요일별 색상

# 결제한 성별에 따른 볼릿기호  
  tips %>%
    ggplot(aes(total_bill, tip)) + geom_point(aes(col = day, pch = sex), size = 3)  
  
# ------------------------------------------------------------------------------------------------
# 탐색적 데이터 분석 : mpg
# ------------------------------------------------------------------------------------------------
  str(mpg)
  ggplot2::mpg  # ggplot2가 ::(소유)하고 있는 데이터
  mpg <- as.data.frame(ggplot2::mpg)
  
  head(mpg, 10)
  
## 자동차 배기량(displ)에 따라 고속도로 연비(hwy)
  table(mpg$displ)

  median(mpg$displ)

## 자동차 배기량이 4이하인 자동차와 5이상인 자동차 중 어떤 자동차의 고속도로 연비가 높은지 분석
  m4 <- filter(mpg, displ <= 4)
  summarise(m4, mean(hwy))  # = mean(m4$hwy)
  
  m5 <- filter(mpg, displ > 5)
  summarise(m5, mean(hwy))  # = mean(m5$hwy)
  
## 자동차의 제조회사별 도시 연비(cty)가 어떤지 분석
  gm <- group_by(mpg, manufacturer)
  summarise(gm, mean(cty))

## chevrolet, ford, honda 자동차의 고속도로 연비 평균 추출
  mm <- filter(mpg, manufacturer %in% c('chevrolet', 'ford', 'honda'))
  mean(mm$hwy)
  
  
# gridExtra : 히나의 도화지에 여러 개의 그림을 담는 것
  p1 <- ggplot()
  p2 <- ggplot()
  grid.arrange(p1, p2, ncol = 2)
  