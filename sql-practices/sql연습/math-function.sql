-- 함수: 수학

-- abs 절댓값
select abs(-1), abs(1);

-- mod 나눈 나머지
select mod(10, 3);

-- ceil 올림
select ceil(3.14), ceiling(3.14);

-- floor 버림
select floor(3.14);

-- round(x) x에 가장 근접한 정수 (반올림)
-- round(x, d) x값 중에 소수점 d자리에 가장 근접한 실수
select round(1.498), round(1.498, 1), round(1.498, 0);

-- power(x, y), pow(x, y) x의 y승 (지수)
select power(2, 10), pow(2, 10);

-- sign(x) 부호 판별
select sign(20), sign(-100), sign(0);

-- greatest(x, y, ......), least(x, y, .....) 최솟값 & 최댓값
select greatest(10, 20, 40, 50), least(10, 20, 40, 50);
select greatest('b', 'a', 'c'), greatest('hello', 'hellp', 'hellq');