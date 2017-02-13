# Node Todo App

A Node app built with MongoDB and Angular. Deployed on Azure for demonstration purposes at the SoCal Node.js Meetup.

Thanks to [Scotch.io](https://github.com/scotch-io/node-todo_) for the starter project.

## Requirements

- [Node and npm](http://nodejs.org)
- MongoDB: Make sure you have your own local or remote MongoDB database URI configured as an environment variable named MONGODB_URL
- Azure Subscription: Sign up for a [Free Trial](https://azure.microsoft.com/en-us/free/)

## Installation

1. Clone the repository: `git clone https://github.com/michaelsaul/node-todo.git`
2. Install the application: `npm install`
3. Place your own MongoDB URI in `config/database.js`
4. Start the server: `node server.js`
5. View in browser at `http://localhost:8080`
6. Push your changes to a GitHub Repository

## Deployment to Azure

1. Create a DocumentDB Resource using the Azure Portal. Be sure to select `Database as a service for MongoDB (preview)`
2. Reconfigure Mongoose in server.js from this:
```
// configuration ===============================================================
mongoose.connect(database.localUrl); 	// Connect to local MongoDB instance. A remoteUrl is also available (modulus.io)
```
    To this:
```
// configuration ===============================================================
mongoose.connect(process.env.MONGODB_URL || console.log('Something is wrong with the database'));
```
    You can now remove the `config` directory.
3. Create an Azure App Service Resource. For this demo, we will be using `Web App On Linux (preview)`
4. Configure your newly created Azure Web App to deploy from GitHub by comleting the following:
  1. Select the App Service.
  2. Click on `Deployment source`
  3. Click on `Choose Source`
  4. Select GitHub
  5. Follow the prompts to log in, select the correct repository, and branch.
  6. Click `OK`
5. Browse to the URL of your newly created site.
