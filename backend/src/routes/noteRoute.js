import express from "express";
import { createNote, getAllNotes, getNoteById, deleteNote, updateNote } from '../controllers/noteClass.js';


const router = express.Router();

router.post("/add", createNote);

router.post("/list", getAllNotes);

router.post("/byId/:id", getNoteById);

router.put("/update/:id", updateNote);

router.delete("/:id", deleteNote);

export default router;