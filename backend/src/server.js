import express from "express";
import mongoose from "mongoose";
import cors from "cors";
import bodyParser from "body-parser";
import noteRouter from "./routes/noteRoute.js";  
import dotenv from 'dotenv';

dotenv.config();

const app = express();

// Middleware
app.use(cors());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());


mongoose.connect(process.env.MONGO_URL, {

}).then(() => {
    console.log("Connected to MongoDB");

    // Use routes
    app.use("/notes", noteRouter);
  })
  .catch((err) => {
    console.error("Failed to connect to MongoDB:", err);
  });

// Start the Server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on PORT: ${PORT}`);
});
