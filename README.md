# GraphQL-through-REST-API-Rick-and-Morty

Sure, you've likely heard of a creature called GraphQL at least once. Some of you may have even had the wonderful experience of working with it. If not, don't worry; the primary goal of this proj is to demonstrate how to work with GraphQL without relying on the Apollo GraphQL client. Instead, in your Swift code, you will interact with the GraphQL server using the tried-and-tested traditional networking API provided by Apple – URLSession (to interact with RESTful APIs) and formatted to JSON queries.

To illustrate this approach, I'm utilizing the free Rick and Morty GraphQL API - Rick and Morty GraphQL API (https://studio.apollographql.com/public/rick-and-morty-a3b90u/variant/current/home).

As seen on the Apollo Studio GraphQL platform, this API is based on the television show Rick and Morty, offering access to data about hundreds of characters, images, and episodes. We'll explore available objects in the schema, focusing on a single Query – Characters.
The Characters query returns a list of characters that will be displayed within a UITableView. It includes two arguments: filter and page, allowing you to retrieve the desired data effectively.
