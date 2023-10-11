from project_function import *

# 환율 23.09.06 기준
rateList = {1:1330.8, 2:9.05, 3:169.68, 4:182.03, 5:285.24, 6:23.38, 7:41.64}

def account():
    List_t()
    print()
    code = int(input("가계부를 작성할 여행지의 코드(code)를 입력하세요 = "))
    
    while True:
        print()
        print("====== 여행 가계부 ======")
        print("1. 환전")
        print("2. 지출")
        print("3. 조회")
        print("4. 삭제")
        print("5. 메인")
        print("=" * 22)
        menu = int(input("메뉴 = "))


        if menu == 1:
            print()

            while True:
                date_e = input("일자(형식:YYYY-MM-DD) = ")
                try:
                    datetime.datetime.strptime(date_e, "%Y-%m-%d")
                    break
                except ValueError:
                    print("올바른 형식으로 입력하세요.")

            while True:
                type_e = int(input('구분(1.은행 2.카드 3.ATM 4.사설환전소) = '))
                if type_e in [1, 2, 3, 4]:
                    break
                else:
                    print("선택이 올바르지 않습니다.")

            krw = eval(input('KRW(한화) = '))
            rate = rateList.get(code, 1)
            change = round(krw / rate, 2)
            code = code

            insert_e(date_e, type_e, krw, change, rate, code)


        elif menu == 2:
            print()

            while True:
                date_s = input("일자(형식:YYYY-MM-DD) = ")
                try:
                    date = datetime.datetime.strptime(date_s, "%Y-%m-%d")
                    break
                except ValueError:
                    print("올바른 형식으로 입력하세요.")

            while True:
                type_s = int(input('구분(1.카드 2.현금 3.QR코드) = '))
                if type_s in [1, 2, 3]:
                    break
                else:
                    print("선택이 올바르지 않습니다.")

            cate = input('카테고리 = ')
            details = input('세부 내역 = ')
            code = code

            while True:
                expense = eval(input('지출 금액 = '))

                sum_exchange = 0
                sum_spend = 0

                code_sum = sum_code_e()
                for idx, row in code_sum.iterrows():
                    if code == row['국가코드']:
                        sum_exchange = row['총액']
                        break

                spend_sum = sum_code_s()
                for idx, row in spend_sum.iterrows():
                    if code == row['국가코드']:
                        sum_spend = row['총액']
                        break

                if sum_exchange == 0:
                    print("환전 내역을 먼저 등록해주세요.")
                    break
                    
                else:
                    if sum_exchange < (sum_spend + expense):
                        print("환전 금액보다 지출 금액이 더 많습니다.")
                    elif sum_exchange >= (sum_spend + expense):
                        insert_s(date_s, type_s, cate, details, expense, code)
                        break




        elif menu == 3:
            print()
            serch = int(input("1.환전내역조회 2.지출내역조회 : "))
            print()

            if serch == 1:
                Liste()
                print(f"\n총 환전 금액 : 한화 {sum_e()[0]}원")
                print("\n나라별 환전 금액")
                print(sum_code_e())

            elif serch == 2:
                Lists()
                print(f"\n총 지출 금액 : 외화 {sum_s()}원")
                print("\n나라별 지출 금액")
                print(sum_code_s())
                detail = input("\n카테고리별 내역을 확인하시겠습니까?(Y/N) : ")
                print()
                if detail == 'Y' or detail == 'y':
                    sum_cate()
                elif detail == 'N' or detail == 'n':
                    continue
                else:
                    print("선택이 올바르지 않습니다.")
            else:
                print("선택이 올바르지 않습니다.")


#         elif menu == 4:
#             print()
#             update = int(input("1.환전내역 2.지출내역 : "))
#             print()

#             if update == 1:
#                 while True:
#                     no_e = int(input('순번 = '))
#                     if no_e_check(no_e) == 0:
#                         print("해당 내역이 존재하지 않습니다.")
#                     else:
#                         break                

#                 while True:
#                     date_e = input("일자(형식:YYYY-MM-DD) = ")
#                     try:
#                         date = datetime.datetime.strptime(date_e, "%Y-%m-%d")
#                         break
#                     except ValueError:
#                         print("올바른 형식으로 입력하세요.")  

#                 while True:
#                     type_e = int(input('형식(1.은행 2.카드 3.ATM 4.사설환전소) = '))
#                     if type_e in [1, 2, 3, 4]:
#                         break
#                     else:
#                         print("선택이 올바르지 않습니다.")

#                 krw = eval(input('KRW(한화) = '))
#                 change = eval(input('외화 = '))
#                 rate = round(krw / change, 2)

#                 update_e(no_e, date_e, type_e, krw, change, rate)

#             elif update == 2:
#                 while True:
#                     no_s = int(input('순번 = '))
#                     if no_s_check(no_s) == 0:
#                         print("해당 내역이 존재하지 않습니다.")
#                     else:
#                         break

#                 while True:
#                     date_s = input("일자(형식:YYYY-MM-DD) = ")
#                     try:
#                         date = datetime.datetime.strptime(date_s, "%Y-%m-%d")
#                         break
#                     except ValueError:
#                         print("올바른 형식으로 입력하세요.")  

#                 while True:
#                     type_s = int(input('형식(1.카드 2.현금 3.QR코드) = '))
#                     if type_e in [1, 2, 3]:
#                         break
#                     else:
#                         print("선택이 올바르지 않습니다.")

#                 cate = input('카테고리 = ')
#                 details = input('세부 내역 = ')
#                 expense = eval(input('지출 금액 = '))

#                 update_s(no_s, date_s, type_s, cate, details, expense)

#             else:
#                 print("선택이 올바르지 않습니다.")


        elif menu == 4:
            print()
            delete = int(input("1.환전내역 2.지출내역 : "))
            print()

            if delete == 1:
                Liste()
                no_e = int(input('삭제하고 싶은 데이터의 no_e를 입력하세요 = '))
                if no_e_check(no_e):
                    delete_e(no_e)
                else:
                    print("해당 내역이 존재하지 않습니다.")

            elif delete == 2:
                Lists()
                no_s = int(input('삭제하고 싶은 데이터의 no_s를 입력하세요 = '))
                if no_s_check(no_s):
                    delete_s(no_s)
                else:
                    print("해당 내역이 존재하지 않습니다.")

            else:
                print("선택이 올바르지 않습니다.")


        elif menu == 5:
            break


        else:
            print("메뉴의 선택이 올바르지 않습니다.")


    print("메인으로 돌아갑니다.")