def hi():
    print('hi')
    
def _hello():  # 모듈을 벗어나면 사용할 수 없다.
    print('hello')
    
def show():
    hello()