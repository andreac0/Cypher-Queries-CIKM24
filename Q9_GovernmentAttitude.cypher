//Q9-GovernmentAttitude
MATCH  p = (g1:Government)<-[:UNDER_GOVERNMENT]-(l1:Law)-
[:HAS_ARTICLE]->(a1:Article)-[ab:ABROGATE]->(a:Article)<-[:HAS_ARTICLE]-
(l:Law)-[:UNDER_GOVERNMENT]->(g2:Government)
MATCH  (g2)-[:SUCCEDED_BY*1..2]->(g1)
WITH  g1.name AS GovAbr, g2.name AS GovU, count(ab) as n, 
      duration.inDays(g1.startDate,g1.endDate).days as Duration
RETURN GovAbr, GovU, toFloat(n)/toFloat(Duration) as f