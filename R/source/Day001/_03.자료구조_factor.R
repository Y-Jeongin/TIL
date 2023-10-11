# factor(팩터) : 범주형 데이터(질적 데이터)를 관리하는 자료구조
## 명목형(ex:혈액형)과 서열형(ex:수우미양가)
## factor(x - 팩터로 바꿀 벡터, levels - 분류하는 항목의 개수, ordered)

  str(iris)
  v_c = c('사과', '복숭아', '사과', '오렌지', '사과', '오렌지', '복숭아')
  v_c  
  
  str(v_c)
  v_factor = factor(v_c)
  str(v_factor)  
  v_factor
  mode(v_factor)  # 데이터 타입, 숫자로 간주
  typeof(v_factor)
  
# is~, as~
## numeric(integer, double), character, logical, complex
## 자료형 확인 : mode(), typeof()
  is.numeric(v_factor)  # 안에 있는 벡터가 numeric 타입인지?
  is.integer(v_factor)

  v_factor = as.character(v_factor)
  str(v_factor)  
  is.character(v_factor)
  
## 팩터 확인
  v_factor
  
  v_num = as.numeric(v_factor)
  v_num
  is.numeric(v_num)