//Q7-AttachementPerDomain
MATCH (l:Law)-[:HAS_ATTACHMENT]->(a:Attachment)
WHERE a.type = 'table'
RETURN l.domain, COUNT(a) as Frequency