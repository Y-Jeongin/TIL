from project_function import *

codeList = {'미국':1, '일본':2, '홍콩':3, '중국':4, '말레이시아':5, '필리핀':6, '대만':7}

def start():
    while True:
        print()
        print("====== 여행 정보 ======")
        print("1. 등록")
        print("2. 조회")
        print("3. 삭제")
        print("4. 메인")
        print("=" * 22)
        menu = int(input("메뉴 = "))
        

        if menu == 1:
            print()
            country = input("여행국가 = ")
            city = input("도시 = ")
            
            code = codeList.get(country, 0)
    
            while True:
                departure = input("출발일자(형식:YYYY-MM-DD) = ")
                try:
                    departure_date = datetime.datetime.strptime(departure, 
                                                                "%Y-%m-%d")
                    break
                except ValueError:
                    print("올바른 형식으로 입력하세요.")

            while True:
                arrival = input("도착일자(형식:YYYY-MM-DD) = ")
                try:
                    arrival_date = datetime.datetime.strptime(arrival, "%Y-%m-%d")
                    if arrival_date >= departure_date:
                        break
                    else:
                        print("도착일은 출발일보다 이른 날짜일 수 없습니다.")
                except ValueError:
                    print("올바른 형식으로 입력하세요.")

            insert_t(code, country, city, departure, arrival)


        elif menu == 2:
            print()
            List_t()


        elif menu == 3:
            print()
            List_t()
            no_t = int(input('삭제하고 싶은 데이터의 no_t를 입력하세요 = '))
            if no_t_check(no_t):
                delete_t(no_t)
            else:
                print("해당 내역이 존재하지 않습니다.")


        elif menu == 4:
            break


        else:
            print("메뉴의 선택이 올바르지 않습니다.")


    print("메인으로 돌아갑니다.")