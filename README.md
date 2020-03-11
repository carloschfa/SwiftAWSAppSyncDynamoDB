# DemoDatabase
DemoDatabase

## AWS AppSync Schema:

```
type Mutation {
	insertObject(
		objectId: String!,
		category: String!,
		text: String!,
		number: Int!,
		boolean: Boolean!,
		createdAt: String!
	): MutationResponse!
	updateObject(
		objectId: String!,
		text: String!,
		number: Int!,
		boolean: Boolean!,
		updatedAt: String!
	): MutationResponse!
	deleteObject(objectId: String!): MutationResponse!
}

type MutationResponse {
	success: Boolean!
	message: String!
}

type Object {
	objectId: String!
	category: String!
	text: String!
	number: Int!
	boolean: Boolean!
	createdAt: String!
	updatedAt: String
}

type Query {
	objects: [Object]!
	objectsByCategories(category: [String]): [Object]
}

type Subscription {
	objectsSubscription: MutationResponse
		@aws_subscribe(mutations: ["insertObject","updateObject","deleteObject"])
}
