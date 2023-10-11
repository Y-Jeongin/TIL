# 모듈
import cx_Oracle as cx
import pandas as pd
from sqlalchemy import create_engine
import datetime

conn = cx.connect("scott", "1234", "localhost:1521/xe")
cursor = conn.cursor()

engine = create_engine('oracle+cx_oracle://scott:1234@localhost:1521/xe') 


# 자원 닫기
def close():
    cursor.close()
    conn.close()
    engine.dispose()


# 1-2. (1)환전 : 환전 내역을 등록할 함수
def insert_e(date_e, type_e, krw, change, rate, code):
    sql = "insert into exchange(date_e, type_e, krw, change, rate, code) values(:1, :2, :3, :4, :5, :6)"
    cursor.execute(sql, [date_e, type_e, krw, change, rate, code])
    print()
    print("환전 내역이 등록되었습니다.")
    conn.commit()
    
    
# 1-1. 환전 내역 등록시 구분을 위한 넘버링
#def insert_e_s(select):
#    sql = "insert into exchange(select) values(:1)"
#    cursor.execute(sql, [select])
#    print()
#    print("환전 내역이 등록되었습니다.")
#    conn.commit()
    
    
# 1-2. (2)지출 : 지출 내역을 등록할 함수
def insert_s(date_s, type_s, cate, details, expense, code):
    sql = "insert into spend(date_s, type_s, cate, details, expense, code) values (:1, :2, :3, :4, :5, :6)"
    cursor.execute(sql, [date_s, type_s, cate, details, expense, code])
    print()
    print("지출 내역이 등록되었습니다.")
    conn.commit()
    
    
# 1-2. (3) 조회 : 환전 내역을 조회할 함수    
def Liste():
    query = "select * from exchange order by date_e, type_e"
    df = pd.read_sql(query, engine)
    
    df['no_e'] = range(1, len(df)+1)
    df = df.set_index('no_e')
    
    engine.execute("delete from exchange")

    df.to_sql("exchange", engine , if_exists='append')
    
    print(df)
    

# 3-1-1. 총 환전 금액 표시   
def sum_e():
    cursor.execute("select sum(krw) from exchange")
    result = cursor.fetchone()
    return result


# 1-2. (2-1). 나라별 총 환전 금액 표시   
def sum_code_e():
    df = pd.read_sql("select code as 국가코드, sum(change) as 총액 from exchange group by code", conn)
    return df






# 3-2. 지출 내역을 조회할 함수  
def Lists():
    query = "select * from spend order by date_s, type_s"
    df = pd.read_sql(query, engine)
    
    df['no_s'] = range(1, len(df)+1)
    df = df.set_index('no_s')
    
    engine.execute("delete from spend")
    
    df.to_sql("spend", engine , if_exists='append')
    
    print(df)
    
    
# 3-2-1. 총 지출 금액 표시
def sum_s():
    cursor.execute("select sum(expense) from spend")
    result = cursor.fetchone()
    return result[0]



# 1-2. (2-2). 나라별 총 지출 금액 표시   
def sum_code_s():
    df = pd.read_sql("select code as 국가코드, sum(expense) as 총액 from spend group by code", conn)
    return df
    
    
    
    
    


# 3-2-2. 카테고리별 지출 내역 합계 표시
def sum_cate():
    query = "select cate, sum(expense) as sum from spend group by cate"
    df = pd.read_sql(query, conn)
    
    print(df)


# 4-1. 환전 내역을 수정할 함수
def update_e(no_e, date_e, type_e, krw, change, rate):
    sql = "update exchange set date_e = :1, type_e = :2, krw = :3, change = :4, rate = :5 where no_e = :6"
    cursor.execute(sql, [date_e, type_e, krw, change, rate, no_e])
    print("내역이 수정되었습니다.")
    conn.commit()
    
# 4-1-1. 환전 내역 인덱스 체크를 위한 함수
def no_e_check(no_e):
    sql = "select * from exchange"
    cursor.execute(sql)
    
    sw = False
    for row in cursor:
        if row[0] == no_e:
            sw = True
    return sw


# 4-2. 지출 내역을 수정할 함수
def update_s(no_s, date_s, type_s, cate, details, expense):
    sql = "update spend set date_s = :1, type_s = :2, cate = :3, details = :4, expense = :5 where no_s = :6"
    cursor.execute(sql, [date_s, type_s, cate, details, expense, no_s])
    print("내역이 수정되었습니다.")
    conn.commit()
    
    
# 4-2-1. 지출 내역 인덱스 체크를 위한 함수
def no_s_check(no_s):
    sql = "select * from spend"
    cursor.execute(sql)
    
    sw = False
    for row in cursor:
        if row[0] == no_s:
            sw = True
    return sw


# 5-1. 환전 내역을 삭제할 함수
def delete_e(no_e):
    sql = "delete from exchange where no_e = :1"
    cursor.execute(sql, [no_e])
    print("내역이 삭제되었습니다.")
    conn.commit()
    
    
# 5-2. 지출 내역을 삭제할 함수
def delete_s(no_s):
    sql = "delete from spend where no_s = :1"
    cursor.execute(sql, [no_s])
    print("내역이 삭제되었습니다.")
    conn.commit()
    
    
    
    
    
# 1-1. (1)등록 : 여행 정보를 등록할 함수
def insert_t(code, country, city, departure, arrival):
    sql = "insert into travel(code, country, city, departure, arrival) values(:1, :2, :3, :4, :5)"
    cursor.execute(sql, [code, country, city, departure, arrival])
    print()
    print("여행지가 등록되었습니다.")
    conn.commit()
    
    
    
# 1-1. (2)조회 : 여행 정보 테이블 조회
def List_t():
    query = "select * from travel"
    df = pd.read_sql(query, engine)
    
    df['no_t'] = range(1, len(df)+1)
    df = df.set_index('no_t')
    
    engine.execute("delete from travel")
    
    df.to_sql("travel", engine , if_exists='append')
    
    print(df)
    
    
    
    
    
# 1-1. (3)삭제 : 여행 정보 테이블 삭제
def delete_t(no_t):
    sql = "delete from travel where no_t = :1"
    cursor.execute(sql, [no_t])
    print("내역이 삭제되었습니다.")
    conn.commit()
    
    

    
    
# 1-1. (3-1) 여행 정보 테이블 체크
def no_t_check(no_t):
    sql = "select * from travel"
    cursor.execute(sql)
    
    sw = False
    for row in cursor:
        if row[0] == no_t:
            sw = True
    return sw




#
def travel(i):
    cursor.execute("select country, city, arrival-departure from travel")
    result = cursor.fetchall()
    print(f"{result[i][0]}, {result[i][1]}\t{result[i][2]}박 {result[i][2]+1}일")