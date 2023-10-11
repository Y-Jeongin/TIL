import cx_Oracle as cx

conn = cx.connect("scott", "1234", "localhost:1521/xe")
cursor = conn.cursor()

# 자원 닫기
def close():
    cursor.close()
    conn.close()
    

# # 전역변수
# EList = []
# SList = []

# 환전 내역을 등록할 함수
def insert_e(no_e, day_e, type_e, before_e, after_e):
    sql = "insert into exchange valuse(:1, :2, :3, :4, :5)"
    cursor.execute(sql, [no_e, day_e, type_e, before_e, after_e])
    print("환전 내역이 등록되었습니다.")
    conn.commit()

# 지출 내역을 등록할 함수
def insert_s(no, day, type, cate, expense):
    sql = "insert into spend values (:1, :2, :3, :4, :5)"
    cursor.execute(sql, [no, day, type, cate, expense])
    print("지출 내역이 등록되었습니다.")
    conn.commit()    
    
# 작성 내역 조회(1. 환불내역)
def listE():
    cursor.execute("select * from exchange")
    result = cursor.fetchall()
    
    if len(result) == 0:
        print("등록된 내역이 없습니다.")
    else:
        for row in result:
            print(row)

# 작성 내역 조회(2. 지출내역)
def listS():
    cursor.execute("select * from spend")
    result = cursor.fetchall()
    
    if len(result) == 0:
        print("등록된 내역이 없습니다.")
    else:
        for row in result:
            print(row)


    
    
    
    
    
    


# 환전 정보를 관리할 클래스 선언
class Exchange:
    def __init__(self, no_e, date_e, type_e, exchange_b, exchange_a, exchange_r):
        self.name = name
        self.kor = kor
        self.eng = eng
        self.math = math
        
    def get_tot(self):
        return self.kor + self.eng + self.math
    
    def get_avg(self):
        return self.get_tot() / 3
    
    def disp(self):
        print(f"{self.name}\t{self.get_tot()}\t{self.get_avg()}")
        
# 실행파일
def main():
    print()
    
    while True:
        menu()
        ch = int(input("메뉴 ="))
        
        if ch == 1:
            name = input("이름 = ")
            kor = int(input("국어 ="))
            eng = int(input("영어 = "))
            math = int(input("수학 ="))
            stu = Student(name, kor, eng, math)
            stuList.append(stu)
            print("학생 등록이 완료되었습니다.")
            
        elif ch == 2:
            print("== 학생 정보 조회 ==")
            print("[1]학번 [2]이름 [3]뒤로")
            a = int(input("메뉴 = "))
            if a == 1:
                pass
            elif a == 2:
                pass
            elif a == 3:
                menu()
            else:
                print("메뉴의 선택이 올바르지 않습니다.")
        
        elif ch == 3:
            pass
        
        elif ch == 4:
            print("\n프로그램을 종료합니다.")
            break
            
        else:
            print("메뉴의 선택이 올바르지 않습니다.")
        
# 진입점
if __name__ == "__main__":
    main()