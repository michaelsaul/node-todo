# Node Todo App for Azure App Service for Linux

A Node app built with MongoDB and Angular. Deployed on Azure for demonstration purposes at the SoCal Node.js Meetup.

Thanks to [Scotch.io](https://github.com/scotch-io/node-todo) for the starter project.

## Requirements

- [Node and npm](http://nodejs.org)
- MongoDB: Make sure you have your own local or remote MongoDB database URI configured as an environment variable named `MONGODB_URL`
- Azure Subscription: Sign up for a [Free Trial](https://azure.microsoft.com/en-us/free/)

## Installation

1. Clone the repository: `git clone https://github.com/michaelsaul/node-todo.git`
2. Install the application: `npm install`
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
4. Start the server: `node server.js`.
5. View in browser at `http://localhost:8080`.
6. Push your changes to a GitHub Repository.

## Deployment to Azure via The Azure Portal

1. Login to the [Azure Portal](https://portal.azure.com).
2. Create a DocumentDB Resource using the Azure Portal by clicking the `+ New` button and search for `DoumentDB`.
  1. Select the `Database as a service for MongoDB (preview)` and click `Create`.
  2. Name the database, select an Azure Subscription, create a new Resource Group, and click `Create`.
3. Once the database is created, make note of the Connection String by clicking on `Connection String` and copying the connection string that begins with `mongodb://...`.
4. Create an Azure App Service Resourece by clicking `Add` in the Resource Group. Search for `Web App On Linux`.
  1. Select the `Web App On Linux (preview)` and click `Create`.
  2. Name the Web App, select an Azure Subscription, use your exsting resource group, create a new App Service plan, select the version of Node.js, and click `Create`.
5. Once the Web App is created. Configure an Environment Variable.
  1. Select the App Service.
  2. Click on `Application settings`.
  3. Under `App settings` create a new key called `MONGODB_URL`. Paste the Connection String from Step 2.
  4. Click `Save`.
6. Configure your newly created Azure Web App to deploy from GitHub.
  1. Select the App Service.
  2. Click on `Deployment options`
  3. Click on `Choose Source`
  4. Select GitHub
  5. Follow the prompts to log in, select the correct repository, and branch.
  6. Click `OK`
7. Browse to the URL of your newly created site.