import express  from "express";
import { NotesController } from "../controller/NotesController";




const notesRouter: express.Router = express.Router();

notesRouter.post("/addNote", NotesController.addNote);
notesRouter.get("/getNotes", NotesController.getMyNotes);


export default notesRouter