SELECT W.id, WP.age, W.coins_needed, W.power
FROM (SELECT code, MIN(coins_needed) as coins_needed, power FROM Wands
      GROUP BY code, power) AS C  -- code, power로 그룹화 하고, coins_needed가 최대값인 데이터를 먼저 조회하고 다른 테이블 조인
INNER JOIN Wands AS W
    ON C.code = W.code AND C.coins_needed = W.coins_needed AND C.power = W.power
INNER JOIN Wands_Property AS WP
    ON W.code = WP.code
WHERE WP.is_evil = 0       -- which wand is not evil
ORDER BY W.power DESC, WP.age DESC