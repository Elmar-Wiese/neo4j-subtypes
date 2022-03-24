LOAD CSV WITH HEADERS FROM "C:\Users\Elmar\Documents\Github Desktop Projecten Plaats\neo4j-subtypes\data\dogs.csv" AS line
MERGE (animalType:AnimalType {name: "Dog"})
MERGE (breedGroup:BreedGroup {name: line.BreedGroup})
MERGE (breed:Breed {name: line.PrimaryBreed})
MERGE (animal:Animal {id: line.TagIdentity, primaryColour: line.PrimaryColour, size: line.Size})

MERGE (animalType)<-[:PARENT]-(breedGroup)
MERGE (breedGroup)<-[:PARENT]-(breed)
MERGE (breed)<-[:PARENT]-(animal)
