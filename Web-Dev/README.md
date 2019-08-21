# Full-Stack Web-Dev Coding Challenge

## Introduction

A new feature that Radius will implement is Organizations (that's the temporary name, we'll probably call it Circles). Users will be able to create organizations such as ACM, Daily Bruin, ACA, Phi Psi, etc. and then other users can join. Once in an organization, the user will be able to see all other users in that organization and can optionally change their home screen to only show people around them that are in a certain organization.

We're hoping that this feature makes Radius very useful for academic and social clubs alike.

## Instructions

You've been given a very bare-bones node.js/Express server. Your task is to implement a single endpoint, `GET /organizations`, with the following requirements:

- The `/organizations` endpoint will receive an organization ID (which is unique for each different organization) and return the organization's name and member count to the client.

- A valid GET request to `/organizations` will have an `id` parameter at the end of the URL

- You must use the function `getOrganization` (which simulates a database call) to retrieve the organization data.

  - `getOrganization` takes in a single string parameter, `id`.
  - It returns a [Promise](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise) that resolves to an `Organization` object if an organization with the specified ID **exists**, and rejects with an Error otherwise.
  - `Organization` objects contain two fields, `name` and `memberCount`.

- If the call to `getOrganization` succeeds, the server should send a JSON response back to the client in the following format:

  ```javascript
  {
  	"name" : string,
  	"memberCount" : int
  }
  ```

- If the call to `getOrganization` fails, or if any other error is encountered, the server should send an appropriate response code to the client (which you are responsible for deciding).

### Notes

- You need to run `npm install` in your Terminal to install the necessary packages.
- You can run `node .` in your Terminal to start the web server. It will then be accessible from a web browser on `localhost:3000`.
- Assume that all requests this endpoint will receive are in a valid format (i.e. don't bother with any validation of the `id` parameter).
- Assume that this endpoint is requested **relatively frequently**.
- The database call is costly; it will randomly take between **1 and 3 seconds** to complete.
- You **may** install any additional npm libraries that you would like.
- You **may not** modify any of the code that already exists; you can only add to it.
- You **are allowed** to create additional files.
- You are responsible for **all error handling** and appropriate server behavior.

## Submission

If you only modified the **server.js** file, just submit that. Otherwise, if you installed any additional node.js libraries or if you created any extra files, zip your `package.json` file/additional files along with **server.js** and name the zip file "\<YourName\>-WebDev.zip".
