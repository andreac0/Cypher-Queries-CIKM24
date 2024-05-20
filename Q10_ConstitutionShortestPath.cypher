//Q10-ConstitutionShortestPath
MATCH(l1:Law), (l2:Law {id: 'costituzione'}), p = shortestPath((l1)<-[:HAS_ARTICLE|HAS_ATTACHMENT|IN_PREAMBLE*]-(l2))
WHERE l1.id <> 'costituzione' 
WITH l1.typeLaw AS TypeLaw, length(p) AS DistanceConstitution
RETURN TypeLaw, AVG(DistanceConstitution)
