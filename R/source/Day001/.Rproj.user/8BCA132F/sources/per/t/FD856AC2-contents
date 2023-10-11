# R 내장 데이터
data()
iris

#데이터 표 형태로 데이터를 보여주는 View()
View(iris)
str(iris)


#데이터 셋 목록 확인
library(help=datasets)

#실제 데이터를 사용할 때
data(mtcars)

##파일 입출력
##csv 파일 입출력 : read.csv(파일먕, header=TRUE)

x <- read.csv('C:/k_digital/data/a.csv', fileEncoding = 'euc-kr',
              encoding = 'utf-8');x

x$name <- as.factor(x$name)
x$name <- as.character(x$name)
str(x)

x <- read.csv('C:/k_digital/data/a.csv', fileEncoding = 'euc-kr',
               stringAsFactors=T);x 

#만약 데이터의 score에 숫자하나대신 dk 라는 문자가 들어갔다 치자.
#str(x)하면 score는 chr처리된다
#따라서 특정 문자를 결측 처리하는 na.strings 사용

x <- read.csv('C:/k_digital/data/a.csv', fileEncoding = 'euc-kr',
              na.strings = 'dk');x
#다시 숫자로 바뀜

# is.na() 는 결측값이 있는지 여부를 판단함
is.na(x$score)

table(is.na(x$score)) #F랑 T갯수가 나옴


#데이터를 파일로 저장하는 방법
getwd()
write.csv(x, '저장할파일의이름.csv','저장경로', row.names=F)

#R객체를 그대로 파일로 저장하고 불러오는 함수, RData
x <- 1:5
y <- 6:10

save(x,y, file = 'xy.RData')

##현재 메모리상에 읶는 모든 객체를 삭제라는 작업
rm(list=ls())
x

load('xy.RData')


#외부 데이터 가져오기 : 엑셀파일
## 별도의 새로운 패키지 설치
install.packages('readxl')
##패키지 불러오기
library(readxl)

##엑셀파일 불러오기

ex_data <- read_excel('C:/k_digital/data/ex_data.xlsx');View(ex_data)

#rbind(), cbind():  행 또는 열 형태로 데이터를 합쳐서 행렬 또는 데이터프레임생성

rbind(c(1,2,3),c(4,5,6))
cbind(c(1,2,3),c(4,5,6))

x <- data.frame(id=c(1,2), name=c('a','b'), stringsAsFactors=F);str(x)
x
y <- rbind(x,c(3,'c'));y

#apply 계열의 함수들 : 벡터, 행렬, 리슽트, 데이터프레임에 반복적으로 적용되는 함수
##apply, lapply, sapply, tapply
### apply(행렬, 방량, 함수) : 행 또는 열방향으로 특정 함수를 적용할 때 사용

sum(1:10)

d <- matrix(1:9, ncol=3);d
#행들의 합 구하기
apply(d,1,sum) ##1-행방향, 2-열방향
apply(d,2,sum)


View(iris)


###iris 데이터의 각 컬럼(feature)의 합을 계산
#apply(iris[행인덱스,열인덱스], 2, sum)
apply(iris[,1:4], 2, sum)

#### rowSums(), colSums(), rowMeans(), colMeans()
colSums(iris[, 1:4]) #위랑 같은 결과

# lapply(x,함수), x - 벡터 또는 리스트
###결과가 리스트로 반환이 된다
result <- lapply(1:3, function(x){x*2});result

###리스트를 벡터로 변환하는 함수 unlist
unlist(result)

##리스트 생성: 키와 값을 쌍으로 관리하는 자료구조
x <- list(a=1:3, b=4:6);x

lapply(x,mean)

colMeans(iris[,1:4]) #열별 평균

##리스트를 데이터프레임으로 변환할 때 
####1.unlist로 리스트를 벡터로 변환
unlist(lapply(iris[,1:4],mean))
####2.matrix함수를 통해 벡터를 행렬로 변환
matrix(unlist(lapply(iris[,1:4],mean)), ncol=4, byrow=T) #열머리글 소멸
####3.as.data.frame 으로 행렬을 데이터프레임으로 변환
as.data.frame(matrix(unlist(lapply(iris[,1:4],mean)), ncol=4, byrow=T))
####4.names()를 이용해서 리스트로부터 컬럼명을 얻어와 데이터프레임에 담아야함
names(iris[1:4])

d <- as.data.frame(matrix(unlist(lapply(iris[,1:4],mean)), ncol=4, byrow=T))

names(d) <- names(iris[,1:4]);d

#sapply : lapply와 유사하지만 리스트대신 행렬, 벡터 등으로 결과반환
##iris 컬럼별 평균 계산
lapply(iris[,1:4],mean) #리스트

sapply(iris[,1:4],mean) #벡터

class(sapply(iris[,1:4],mean))

x <- sapply(iris[,1:4],mean);x

as.data.frame(t(x)) #t로 전치행렬

sapply(iris, class)

result <- sapply(iris[,1:4], function(x){x>3});
class(result)
head(result)


#tapply: 그룹별 처리를 위한 apply함수
##tapply(데이터,색인,함수)

tapply(1:10, rep(1,10),sum) #rep으로 색인은 다 똑같은 1로 부여
tapply(1:10, rep(c(1,2),5),sum)
#또는
tapply(1:10, 1:10%%2==1,sum)

###행렬(행-계절, 열-성별)
m <- matrix(1:8, ncol=2, dimnames=list(c('spring', 'summer', 'fall', 'winter'),
                                        c('male','female')));m


###분기별 남성과 여성의 합계를 구하시오.
####상반기(봄, 여름), 하반기(가을,겨울)

#교수님은 노가다했는데 더 나은 방법이 있을듯?
  
  
#doBy 패키지
##summaryBy(), orderBy(), splitBy(), sampleBy()

summary(iris)

install.packages('doBy')
library(doBy)

quantile(iris$Sepal.Length)

quantile(iris$Sepal.Length, seq(0,1,by=0.1))


#formula식 : 독립변수~종속변수, 독립변수1+독립변수2~종속변수
summaryBy(Sepal.Length + Sepal.Width ~Species, iris)

##formula식 .(all)
orderBy( ~Sepal.Width, iris)

orderBy( ~ Species + Sepal.Width, iris)

order(iris$Sepal.Width) #이건 팩터로나옴

iris[order(iris$Sepal.Width),]

sample(1:10, 5)
sample(1:10, 5, replace=T) #중복허용
#만약 작은데서 엄청뽑을거면 반드시 중복허용 해놔야함

#데이터를 무작위로 섞어 추출하는 역할로도 사용한다
##iris데이터를 무작위로 섞는 작업
iris[sample(NROW(iris), NROW(iris)), ]


#하지만 우리는doBy가 있으니 이렇게 가능

sampleBy(~ Species, frac = 0.1, data=iris) #각 품종별로 적어도 10%씩추출

##split(데이터, 분리조건) - 리스트로 반환된다.

split(iris, iris$Species)

lapply(iris[ ,1:4], mean)

lapply(split(iris$Sepal.Length, iris$Species),mean)

#subset
subset(iris, Species =='setosa')

subset(iris, Species == 'setosa' & Sepal.Length > 5.0)

subset(iris, select = c(Sepal.Length, Species))


#merge : join과 같은 역할을 하는 함수

x <- data.frame(name = c('a', 'b', 'c'), math=c(1,2,3));x

y <- data.frame(name=c('c','b','a'), kor=c(4,5,6));y


cbind(x,y) #name이 두개뜬다.

merge(x,y, all = T) # full output join 일치하지 않더라도 조인


#sort(), order() : 데이터를 정렬하는 함수

x <- c(20,11,33,50,43);x

sort(x)

order(x) #정렬후 인덱스 반환
order(-x)

x[order(x)]

#with, within
mean(iris$Sepal.Length)
print(mean(iris$Sepal.Length))
print(mean(iris$Sepal.Width))

with(iris, {
  print(mean(iris$Sepal.Length))
  print(mean(iris$Sepal.Width))
})

x <- data.frame(val=c(1,2,3,4,NA,5,NA));x
mean(x$val) #NA로뜬다

is.na(x$val)
mean(is.na(x$val))
mean(x$val, na.rm=T) #둘이 값이 다르다.

#ifelse(조건식, 참일때, 거짓일때)

##수치데이터의 결측값을 보간하는 방법 : 평균값or최빈값
x <- within(x, {
            val <- ifelse(is.na(val), median(val,na.rm=T), val)
})
x

x$val[is.na(x$val)] <- median(x$val, na.rm =T)
x


iris[1,1] <- NA
head(iris)

#결측값이 존재하는 해당 품종의 중앙값으로 대체하는 작업
## step1. setosa 품종의 Sepal.Length의 중앙값을 구한다
rs <- sapply(split(iris$Sepal.Length, iris$Species), median, na.rm = T);rs
rs[iris$Species]

## step2. 해당 중앙값으로 결측값을 채운다
iris <- within(iris, {
               Sepal.Length <- ifelse(is.na(Sepal.Length), rs[Species], Sepal.Length)
})

head(iris)

#attach,detach

iris$Sepal.Length

attach(iris)
Sepal.Length

detach(iris)


#which, which.max, which.min
## which 함수는 벡터나 배열에서 주어진 조건에 만족하는 값이 있는 인덱스 반환
x <- c(2,4,6,7,10)
x%%2

which(x%%2==0)
x[which(x%%2==0)]

which.max(x)

sort(x)[1] #which.min()
sort(x, decreasing=T)


#aggregate : 그룹별 연산을 수행하는 함수
## aggregate(데이터, 그룹조건, 함수) 또는 aggregate(formula,데이터,함수)

### iris 데이터에서 품종별로 Sepal.Width의 평균 계산
aggregate(Sepal.Width ~ Species, iris, mean)



