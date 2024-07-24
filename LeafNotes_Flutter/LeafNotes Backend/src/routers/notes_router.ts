import express  from "express";
import { NotesController } from "../controller/NotesController";




const noteRouter: express.Router = express.Router();

noteRouter.post("/addNote", NotesController.addNote);
noteRouter.get("/getMyNotes", NotesController.getMyNotes);


export default noteRouter