# 필요 라이브러리 로딩
library(readxl)
library(dplyr)

# 데이터셋 로딩
cafe <- read_excel("C:/K_digital/data/Cafe_Sales.xlsx")
cafe

## 데이터프레임으로 변형
cafe <- as.data.frame(cafe)

# 데이터 내용 탐색
head(cafe)
tail(cafe)

str(cafe)

## Date : 날짜를 나타내는 자료형, 1970년 1월 1일 이후 경과된 일 수를 저장한다.
## POSIXct : 날짜와 시간을 나타내는 자료형, 1970년 1월 1일에서 경과한 초 수와 타임존을 저장한다.
## POSIXt : 날짜와 시간을 나타내는 자료형, 1900년에서 경과된 년수, 월, 일, 시간, 분, 초
## 타임존등을 리스트의 형태로 저장한다.

class(cafe$order_date)

# 현재 시간을 저장
x <- Sys.time()
x

format(x, '%Y-%m-%d %H:%M:%S')  # YYYYMMDD, YYMD
format(x, '%Y-%j %H:%M:%s')  # %j : 365일 기준으로 일수계산
format(x, '%G')  # %G : 네자리 연도로 표시
format(x, '%G-%V-%u %H:%M:%S')  # %V : 주로 계산해서 표시(52주)
## %u 요일(1-7, 1-월요일 ~ 7-일요일)

is.na(cafe$order_id)  # 주문번호
table(is.na(cafe$order_id))
table(is.na(cafe$order_date))
table(is.na(cafe$category))
table(is.na(cafe$item))
table(is.na(cafe$price))

## 전체 데이터 수에 비해 결측의 수가 적으면 대체보다는 삭제
cafe <- na.omit(cafe)  # 결측이 있는 행 전체를 제거
head(cafe, 20)
nrow(cafe)

# 주문 건수 (중복 제거)
length(unique(cafe$order_id))
unique(cafe$order_date)


# 카페에서 가장 많이 판매된 메뉴는 무엇인가?
table(cafe$item)

## 내림차순 정렬
sort(table(cafe$item), decreasing = T)

cafe_item <- data.frame(table(cafe$item))
head(cafe_item)

sales_item <- subset.data.frame(cafe, select = c('item', 'price'))
head(sales_item)

sales_item <- unique(sales_item)
sales_item


# 요일별 판매한 메뉴는 무엇인가?
?weekdays

## 요일을 담는 파생변수 생성
cafe$weekday <- weekdays(cafe$order_date)
head(cafe)

table(cafe$weekday)

## cafe$info <- ifelse(조건식, 참, 거짓)
date_info <- data.frame(weekday = c('월요일', '화요일', '수요일', '목요일', 
                                    '금요일', '토요일', '일요일'), 
                        day = c('평일', '평일', '평일', '평일', '평일', '주말', '주말'))
date_info

## 두개의 데이터 프레임을 합치는 작업
cafe <- merge(cafe, date_info)  # 같은 컬럼이 존재하면 by 생략 가능
head(cafe)

table(cafe$day)


# 계절별로 판매되는 메뉴는 무엇인가?
cafe$month <- months(cafe$order_date)
head(cafe)

# 봄(3-5), 여름(6-8), 가을(9-11), 겨울(12-2)
## 파생변수 season : 봄, 여름, 가을, 겨울
season_info <- data.frame(month = c('1월', '2월', '3월', '4월', '5월', '6월', 
                                    '7월', '8월', '9월', '10월', '11월', '12월'),
                          season = c('겨울', '겨울', '봄', '봄', '봄', '여름', '여름', '여름',
                                     '가을', '가을', '가을', '겨울'))
season_info

cafe <- merge(cafe, season_info)
head(cafe)

table(cafe$season)

season_item <- cafe %>% 
  group_by(season, item) %>% 
  summarise(n_item = n())
season_item

season_item %>% 
  group_by(season) %>% 
  arrange(desc(n_item))


# 매출현황 시각화 작업
library(ggplot2)


## 카테고리별 판매 건수 시각화
n_cate <- cafe %>% 
  group_by(category) %>% 
  summarise(cnt = n())
n_cate <- arrange(n_cate, desc(cnt))
n_cate

ggplot(n_cate, aes(x = category, y = cnt)) + geom_col()

ggplot(n_cate, aes(x = category, y = cnt)) + geom_col() +
  scale_x_discrete(limits = c('coffee', 'Ade/Shake', 'Tea', 'Smoothie/Juice', 'Latte', 'Bakery'))

ggplot(n_cate, aes(x = reorder(category, cnt), y = cnt)) + geom_col()

ggplot(n_cate, aes(x = reorder(category, -cnt), y = cnt)) + geom_col()


## 월별 판매 건수를 시각화
n_month <- cafe %>% 
  group_by(month) %>% 
  summarise(cnt = n())
n_month

ggplot(n_month, aes(x = month, y = cnt)) + geom_col()

ggplot(n_month, aes(x = month, y = cnt)) + geom_col() +
  scale_x_discrete(limits = c('1월', '2월', '3월', '4월', '5월', '6월', '7월', 
                              '8월', '9월', '10월', '11월', '12월'))

ggplot(n_month, aes(x = reorder(month, cnt), y = cnt)) + geom_col()

ggplot(n_month, aes(x = reorder(month, -cnt), y = cnt)) + geom_col()

n_month %>% 
  group_by(month) %>% 
  arrange(desc(cnt), by_group = T)
  

## 요일별 판매 건수를 시각화
n_day <- cafe %>% 
  group_by(weekday) %>% 
  summarise(cnt = n())
n_day

ggplot(n_day, aes(x = weekday, y = cnt)) + geom_col()  

ggplot(n_day, aes(x = weekday, y = cnt)) + geom_col() +
  scale_x_discrete(limits = c('화요일', '수요일', '목요일', '금요일', '토요일', '일요일'))

ggplot(n_day, aes(x = reorder(weekday, cnt), y = cnt)) + geom_col()

ggplot(n_day, aes(x = reorder(weekday, -cnt), y = cnt)) + geom_col()
