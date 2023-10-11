# 데이터프레임(dataframe) : 데이터베이스의 표(table)
## 단일 자료형을 사용하는 자료 구조 : (변수,) 벡터, 팩터, 행렬, 배열
## 다중 자료형을 사용하는 자료 구조 : 서로 다른 타입의 데이터를 담을 수 있다. 데이터프레임, 리스트
## 데이터 분석의 기본 자료형 : 행(record, 관측 데이터), 열(attribute, feature, 특성)
  help(data.frame)

## 데이터 프레임 생성
## as.data.frame(matrix) → 데이터프레임으로 형변환, 매트릭스는 다 데이터프레임으로 항상 변경가능하나, 데이터프레임은 매트릭스로 항상 변경 불가능
## data.frame(data(벡터형 데이터) / matrix, )
  aa = data.frame(x = c(1, 2, 3, 4, 5), y = c('a', 'b', 'c', 'd', 'e'))
  aa

## 여러개의 벡터를 이용한 데이터 프레임 생성
  names = c('홍길동', '이순신', '장보고', '임꺽정', '김유신')
  ages = c(20, 23, 31, 28, 35)  
  scores = c(80, 95, 87, 100, 79)  
  gender = factor(c('F', 'M', 'M', 'F', 'F'))

  student = data.frame(names, ages, scores, gender)  
  student  

  stu = data.frame(name = names, age = ages, gender = gender, score = scores)  
  stu  

  str(stu)  
  
  stu$name  # $ : 데이터 프레임의 인덱스
  stu$name[3]
  stu[행, 열]
  stu[4, 2]

# gender와  score만 추출
  stu[, 3:4]  
  