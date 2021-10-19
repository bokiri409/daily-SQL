-- Âü°í : https://mjs1995.tistory.com/95

SELECT M.hacker_id, H.name, SUM(M.score) AS total_score
FROM (
    SELECT hacker_id, challenge_id, MAX(score) AS score FROM Submissions 
    GROUP BY hacker_id, challenge_id) AS M
JOIN Hackers AS H
ON H.hacker_id = M.hacker_id
GROUP BY M.hacker_id, H.name
HAVING total_score > 0
ORDER BY total_score DESC, M.hacker_id;