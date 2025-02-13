// Steps
// 1. Define Schema -> Note: id, userId, title, content, deteadded
// 2. Create Model -> <model name> <schema> Note
import mongoose from "mongoose";


const noteSchema = mongoose.Schema({
  id: {
    type: String,
    unique: true,
    required: true,
  },
  userId: {
    type: String,
    required: true,
  },
  title: {
    type: String,
    required: true,
  },
  content: {
    type: String,
    default: "",
  },
  dateAdded: {
    type: Date,
    default: Date.now,
  }
});

export default mongoose.model("Note", noteSchema);


