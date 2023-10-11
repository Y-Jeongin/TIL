#기술 통계량 : 데이터를 요약하는 대푯값
##데이터를 의미있는 숫자로 요약하여 데이터의 특성을 파악하는 방법

### 평균 : mean

## 각 식당의 배달시간

storeA <- c(20,21,23,22,26,28,35,35,41,42,43,45,44,45,46,47,47,46,47,58,58,59,60,56,57,57,80)
storeB <- c(5,6,11,13,15,16,20,20,21,23,22,27,27,30,30,32,36,37,37,40,40,43,44,45,51,54,70,600)
storeC <- c(5,5,5,12,10,11,20,20,20,20,20,21,20,30,32,31,31,31,36,40,40,51,61,51,61,61,70)

## A식당과 B식당중 어느식당이 배달시간이 가장 빠른지 분석
mean(storeA)

mean(storeB) #600땜에 너무 올라가버림


##중앙값 median

nums <- c(1,5,2,3,1000)
median(nums)

#사분위수
nums <- 1:17

quantile(nums)

##중앙값이 동일한 집단 벡터 생성
A <- c(0,1,1,1,5,9,9,9,10)
B <- c(0,4,4,4,5,6,6,6,10)


#boxplot
boxplot(storeB) #이상치가 보임

boxplot(storeA, storeB, names = c('A식당', 'B식당'))

storeB <- storeB[storeB < 600]
boxplot(storeA, storeB, names = c('A식당', 'B식당'))


#데이터 시각화 : plot, barplot, boxplot, hist, pie
## plot() : 산점도 그래프
##plot(y축데이터, 옵션) or plot(x축데이터, y축데이터, 옵션)
y <- c(1,1,2,2,3,3,4,4,5,5)
plot(y, pch=18)
#pch : 심볼모양

x <- 1:10
y <- 1:10
plot(x,y)


#plot 내 옵션중 axes = 축 표시여부, axis = 사용자 지정 축값,
#              type = 그래프 종류(l=line, p=point, b=both),
#             lty(line type) 

cars
plot(cars$speed, cars$dist, 
     xlab = '속도', ylab='거리', main='속도와 거리 상관관계',
     type = 'b',pch = '*', col = 'blue')


x <- runif(100)
y <- runif(100)


#y의 값이 0.5보다 크면 1, 아니면 18
plot(x,y, pch = ifelse(y > 0.5,1,18))


##산점도, 텍스트 추가
library(MASS)

str(Animals)

plot(Animals$body, Animals$brain, pch=16, col='blue', 
    xlab = 'body weight(kg)', ylab = 'brain weight(g)',
    xlim = c(0,250), ylim=c(0,1400))

#데이터에 각주를 달아줘보자. 
text(x=Animals$body, y=Animals$brain,labels = row.names(Animals), pos =4)

plot(iris$Sepal.Length, iris$Sepal.Width, pch=rep(15:17, each=50),
    col = c('red','green','blue')[iris$Species], cex = 1.5)
legend('topright', legend= levels(iris$Species), pch=15:17, 
       col = c('red','green','blue'), cex=1.2, bty='n')


#막대그래프 : barplot, 도수분포표, 빈도

sales <- c(0.12, 0.3, 0.26, 0.16, 0.04, 0.12)
barplot(sales,
        names.arg = c('berry','cherry','apple','banana','candy','cream'),
        horiz=T)

#누적 막대그래프

xx <- matrix(1:6, nrow=3);xx

barplot(xx)


#시즌별 티켓판매량을 그래프로 표현
aaa <- c(110,300,150,280,310)
bbb <- c(180,200,210,190,170)
ccc <- c(210,150,260,210,70)

data <- matrix(c(aaa,bbb,ccc),5,3);data

barplot(data, main= '스포츠 경기별 티켓 판매량',
        xlab='스포츠 종목', ylab='판매량', beside =T,
        names.arg = c('야구', '축구', '농구'), border = 'blue',
        col = rainbow(5), ylim = c(0,400))
#beside를 안주면 누적그래프가 된다

legend(16,400, c('야구', '축구', '농구'), cex=0.8, fill=rainbow(5))


##ggplot2
library(ggplot2) #단순하게 그래프를 그리는 qplot(x,y,옵션)

qplot(Sepal.Length, Petal.Length, data=iris)

#꽃잎 그래프(sun flower graph)
x <- c(1,1,1,2,2,2,2,2,2,2,3,3,4,5,6)
y <- c(2,1,4,2,3,2,2,2,2,2,2,2,1,1,1)

dt <- data.frame(x,y);dt

sunflowerplot(dt)

data(mtcars)
stars(mtcars[1:4], flip.labels=F, key.loc=c(13,1.5))

##ggplot 시각화하는 단계 - 레이어 구조
## step1. 도화지(캔버스 배경) - 축을 그린다.
ggplot(data=mpg, aes(x=displ, y=hwy))

##step2. 그래프의 종류
###geom_bar() : 막대그래프
###geom_boxplot() : 박스플롯
###뭐 이런식으로 앞에 geom_ 붙이고 씀
ggplot(data=mpg, aes(x=displ, y=hwy)) + geom_point() + xlim(3,6) + ylim(10,30)





