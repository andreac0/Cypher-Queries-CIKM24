//Q6-AttchementPerDomain
MATCH (l:Law)-[:HAS_ATTACHMENT]->(a:Attachment)
WHERE a.type = 'table'
RETURN l.domain AS Domain, COUNT(a) as Frequency