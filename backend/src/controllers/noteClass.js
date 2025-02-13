import express from "express";
import mongoose from "mongoose";

import Note from "../models/noteTable.js";

export const createNote = async (req, res) => {
  try {
    const { id, userId, title, content } = req.body;
    const newNote = new Note({
      id,
      userId,
      title,
      content,
    });

    await newNote.save();
    res.status(201).json(newNote);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

export const getAllNotes = async (req, res) => {
  try {
    const notes = await Note.find();
    res.status(200).json(notes);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

export const getNoteById = async (req, res) => {
  try {
    const note = await Note.findOne({ id: req.params.id });
    if (!note) {
      return res.status(404).json({ message: "Note not found" });
    }
    res.status(200).json(note);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

export const updateNote = async (req, res) => {
  try {
    const { title, content } = req.body;
    const updateNote = await Note.findOneAndUpdate(
      { id: req.params.id },
      { title, content },
      { new: true }
    );

    if (!updateNote) {
      return res.status(404).json({ message: "Note not found" });
    }

    res.status(200).json(updateNote);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

export const deleteNote = async (req, res) => {
  try {
    const note = await Note.findOneAndDelete({ id: req.params.id });

    if (!note) {
      return res.status(404).json({ message: "Note not found" });
    }

    res.status(200).json({ message: "Note deleted successfully" });
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};