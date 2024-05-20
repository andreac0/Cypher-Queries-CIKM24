//Q8-Dependencies
MATCH p=(l:Law)-[r:HAS_ARTICLE|IN_PREAMBLE*]->(l2:Law)
WHERE l.id <> l2.id AND l2.id = "2024|8"
RETURN p