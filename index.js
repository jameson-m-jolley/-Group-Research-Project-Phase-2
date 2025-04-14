import { ApolloServer } from '@apollo/server';
import { startStandaloneServer } from '@apollo/server/standalone';
import mysql from 'mysql2/promise';

// MySQL connection
const pool = mysql.createPool({
	host: 'localhost',
	user: 'root',
	password: '',   // enter your local password
	database: 'your_social_network',
	waitForConnections: true,
	connectionLimit: 10,
	queueLimit: 0
});


// A schema is a collection of type definitions (hence "typeDefs")
// that together define the "shape" of queries that are executed against
// your data.
const typeDefs = `#graphql
	# Comments in GraphQL strings (such as this one) start with the hash (#) symbol.
	type User {
	id: ID!
	username: String!
	friends: [User!]!
}

type Query {
	users: [User!]!
	user(id: ID!): User
	friendsofuser(id: ID!): [User]
}
`;

	

// Resolvers define how to fetch the types defined in your schema.
// This resolver retrieves books from the "books" array above.
const resolvers = {
	Query: {
		// Get all users
		users: async () => {
			const [rows]=await pool.query('SELECT * FROM Users');
			return rows;
		},

		user: async (_, { id }) => {
			const [rows] = await pool.query('SELECT * FROM Users WHERE id = ?', [id]);
			return rows[0] || null;
	},

	friendsofuser: async (_, { id }) => {
		// Get friend IDs for the given user
		const [user_list] = await pool.query(
			'SELECT F.friend_id FROM Friendships F WHERE F.user_id = ?', [id]
		);
		
		// In case of no friends, we return an empty list
		if (user_list.length === 0) {
			return [];
		}
		

		const friendIds = user_list.map(friend => friend.friend_id); // Extract friend IDs
		const [all_friends] = await pool.query(
			'SELECT * FROM Users WHERE id IN (?)', [friendIds] 
		);
		
		return all_friends;
	}
	 
},
	User: {
		friends: async (parent) => {    // resolving the nested friends attribute
			const [rows] = await pool.query(
				`SELECT u.* FROM Users u 
				 JOIN Friendships f ON f.friend_id = u.id 
				 WHERE f.user_id = ?`, 
				[parent.id]
			);
			return rows;
		}
	}

};

	// The ApolloServer constructor requires two parameters: your schema
// definition and your set of resolvers.
const server = new ApolloServer({
		typeDefs,
		resolvers,
	});
	
	// Passing an ApolloServer instance to the `startStandaloneServer` function:
	//  1. creates an Express app
	//  2. installs your ApolloServer instance as middleware
	//  3. prepares your app to handle incoming requests
	const { url } = await startStandaloneServer(server, {
		listen: { port: 4000 },
	});
	
	console.log(`🚀  Server ready at: ${url}`);