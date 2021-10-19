-- HackerRank Basic Join medium_level Top Competitors

SELECT Hackers.hacker_id, Hackers.name FROM Submissions
INNER JOIN Challenges
    ON Submissions.challenge_id = Challenges.challenge_id
INNER JOIN Difficulty
    ON Challenges.difficulty_level = Difficulty.difficulty_level
INNER JOIN Hackers
    ON Hackers.hacker_id = Submissions.hacker_id
WHERE Submissions.score = Difficulty.score
GROUP BY Hackers.hacker_id, Hackers.name
HAVING COUNT(Hackers.hacker_id) > 1 -- more than one challenge
ORDER BY COUNT(Hackers.hacker_id) DESC, Hackers.hacker_id