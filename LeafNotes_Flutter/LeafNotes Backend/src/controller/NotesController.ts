import express from "express";
import { Note } from "../models/note_model";
import { getDatabase } from "../config/mongodb_client";




export class NotesController {

    static async addNote(request: express.Request, response: express.Response) {
        let db = getDatabase();
        let notesCollection = db.collection("notes");

        const note: Note = request.body;

        //*                 Add Note Properties
        note.createdAt = Date.now();

        //*                 Insert Note

        const data = await notesCollection.insertOne(note);


        response.status(200).json({
            "status": "success",
            "response": data
        })

    }

    static async getMyNotes(request: express.Request, response: express.Response) {

        let db = getDatabase();

        let notesCollection = db.collection("notes");

        //FETCH UID FROM REQUEST QUERY
        const uid = request.query.uid;

        const data = await notesCollection.find({ creatorId: uid }).toArray();


        response.status(200).json({
            "status": "success",
            "response": data
        })

    }
}