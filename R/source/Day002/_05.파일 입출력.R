# 파일 입출력

## 벡터 데이터 생성
  no <- c(1, 2, 3, 4)
  name <- c('apple', 'banana', 'peach', 'berry')
  price <- c(500, 300, 800, 200)
  qty <- c(5, 2, 7, 9)

## 벡터 데이터를 이용하여 데이터 프레임 생성  
  fruit <- data.frame(No = no, Name = name, Price = price, Qty = qty)
  fruit  

## 현재 선언된 변수 목록 확인
  ls()

## no, name, fruit를 test.dat 파일로 저장
  save(no, name, fruit, file ='C:/K_digital/data/test.dat')
  
# 변수 삭제
  rm(no, name, fruit)
  no
  name
  fruit  # not found

  
# 저장된 데이터 불러오기
  load('C:/K_digital/data/test.dat')
  no
  name  
  fruit  
  
# csv 형태로 저장된 파일을 읽어오는 작업
  # help(read.csv)
  # x <- read_csv('C:/K_digital/data/a.csv', locale = locale('ko', encoding = 'cp949'))
  # x  

  # install.packages("readr")
  # library(readr)
  # data01 <- read_csv("C:/K_digital/data/a.csv",locale=locale('ko',encoding='cp949'))
  # data01
    
  x <- read.csv('C:/k_digital/data/a.csv',
                fileEncoding = 'euc-kr',
                encoding = 'utf-8');
  x

# 열머리글이 없는 파일  
  y <- read.csv('C:/k_digital/data/b.csv', header = F,
                fileEncoding = 'euc-kr',
                encoding = 'utf-8');
  y
  
# 텍스트 파일의 형식을 읽어오는 작업
## 텍스트 파일은 배열 형태로 읽어들인다.
## 공백 문자, 탭, 줄바꿈 등을 기준으로 단어 단위로 배열에 저장되어 처리된다.
## what = '자료형', 다양한 자료형이 섞여 있을 경우 what = ''
## UTF-8로 저장하면 한글이 깨질 수 있다. 메모장 windows 한글지원(ms949)
  a <- scan('C:/k_digital/data/sample.txt', what='')
  a
  
  a[4]

## 데이터 프레임 형태로 읽어오는 작업
  c <- read.table('C:/k_digital/data/sample.txt', header = T, sep='\t')  # tqp = \t
  c
  
# 엑셀파일을 읽어오는 방법
## 별도의 패키지를 불러오는 작업 : readxl
  install.packages('readxl')
  library(readxl)
  
  df_exam <- read_excel('C:/k_digital/data/excel_exam.xlsx')
  df_exam  

  mean(df_exam$english)  
  mean(df_exam$science)  
  
  df_exam_novar <- read_excel('C:/k_digital/data/excel_exam_novar.xlsx')
  df_exam_novar  
  
  df_exam_novar <- read_excel('C:/k_digital/data/excel_exam_novar.xlsx', col_names = F)
  df_exam_novar

  df_exam_sheet <- read_excel('C:/k_digital/data/excel_exam_sheet.xlsx', sheet = 3)  
  df_exam_sheet  
  