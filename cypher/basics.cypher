# Find :Patch nodes having a relationship with more than one :File node

match ()-[r:CONTAINS]->(p:Patch) WITH p, COUNT(r) AS rc
WHERE rc > 1
MATCH (f:File)-->(p)
RETURN f,p
