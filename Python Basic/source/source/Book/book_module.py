import pickle

# data = dict()

# 도서 등록
def add_book(no, subject, content):
    data = get_all_book()
    assert no not in data
    
    data[no] = {'no':no, 'subject':subject, 'content':content}
    
    with open('book.pickle', 'wb') as f:
        pickle.dump(data, f)
        
# 도서 정보 읽기
def get_all_book():
    try:
        with open('book.pickle', 'rb') as f:
            return pickle.load(f)
    except FileNotFoundError as e:
        return {}
    
# 도서 검색
def get_book(no):
    data = get_all_book()
    # if len(data) == 0:
        # print("등록된 도서가 존재하지 않습니다.")
        # return {}
    return data[no]