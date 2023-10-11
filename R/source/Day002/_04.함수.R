# 함수(Function)
## 내장 함수와 사용자 정의 함수

### R에서 함수를 정의 하는 방법
  help(readline)

  gugu <- function(){
    dan <- readline('단을 입력하세요 : ')  # readline : 줄단위로 구분
    dan <- as.integer(dan)
    
    for(i in 1:9){
      cat(paste(dan, 'x', i, '=', dan * i, '\n'))
    }
  }
  
# 함수 호출
  gugu()
  
  # 구구단 출력, 다중 for문
  for(dan in 2:9){
    for(i in 1:9){
      cat(paste(dan, 'x', i, '=', dan * i, '\n'))  # for(2:9) → 8번, for(1:9) → 9번 반복
    }
  }
  
  for(dan in 2:9){
    cat(paste('\n', dan, '단 결과값', '\n'))
    for(i in 1:9){
      cat(paste(dan, 'x', i, '=', dan * i, '\n'))
    }
  }
  
  ## 1부터 10까지의 합을 계산하여 출력하는 프로그램
  tot <- 0
  
  for(i in 1:10){
    tot <- tot + i
  }
  
  tot
  
  ## while
  tot <- 0
  i <- 1
  
  while(i < 11){
    tot <- tot + i
    i <- i + 1
  }
  
  tot  
  
  ## repeat 반복 함수
  tot <- 0
  i <- 1
  
  repeat{  # 조건이 없음, 무한 Loop
    tot <- tot + i
    i <- i + 1
    if(i > 10) break  # 탈출 조건
  }
  
  tot