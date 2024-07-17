import express from "express";

//initialising express
const app : express.Application = express();

//Defining server address
const hostName = "localhost";
const portNumber = 5000;


//Initialising server
app.listen(portNumber, hostName, () =>{
    console.log("LeafNotes Server initialised successfully.")
})