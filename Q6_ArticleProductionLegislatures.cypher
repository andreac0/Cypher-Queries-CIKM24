//Q6-ArticleProductionLegislatures
MATCH (a:Art)<-[:HAS_ART]-(l:Law)-[:UNDER_LEGISLATURE]->(k:Legislature)
WITH k.name as Legislature, COUNT(a.id) as EnactedArts, 
duration.inDays(k.startDate, k.endDate).days AS days
RETURN Legislature, toFloat(EnactedArts)/toFloat(days) AS Frequency