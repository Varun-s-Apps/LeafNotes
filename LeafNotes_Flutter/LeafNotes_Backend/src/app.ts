import express from "express";
//cross origin resource sharing
import cors from 'cors'
import { connectToDatabase } from "./config/mongodb_client";
import appLogger from './middleware/app_logger'
import userRouter from "./routers/user_router";
import notesRouter from "./routers/notes_router";

//initialising express
const app : express.Application = express();

//MIDDLEWARE
app.use(cors());
app.use(express.json());
app.use(appLogger);
app.use(express.urlencoded({extended : false}))

//ROUTER
app.use("/v1/user", userRouter);
app.use("/v1/notes", notesRouter);

//Defining server address
const hostName = "localhost";
const portNumber = 5001;


//Initialising server
app.listen(portNumber, hostName, async ()  =>{
    await connectToDatabase();
    console.log("LeafNotes Server initialised successfully.")
})