LOAD CSV WITH HEADERS FROM "file:///C:/Users/Elmar/Documents/Github%20Desktop%20Projecten%20Plaats/neo4j-subtypes/data/import/dogs.cql" AS line
MERGE (animalType:AnimalType {name: "Dog"})
MERGE (breedGroup:BreedGroup {name: line.BreedGroup})
MERGE (breed:Breed {name: line.PrimaryBreed})
MERGE (animal:Animal {id: line.TagIdentity, primaryColour: line.PrimaryColour, size: line.Size})

MERGE (animalType)<-[:PARENT]-(breedGroup)
MERGE (breedGroup)<-[:PARENT]-(breed)
MERGE (breed)<-[:PARENT]-(animal)
