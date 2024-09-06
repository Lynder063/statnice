const express = require("express");
const { Pool } = require("pg");
const app = express();
const port = 3000;
require("dotenv").config();

// Middleware for parsing JSON bodies
app.use(express.json());

// PostgreSQL connection configuration
const pool = new Pool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT,
});

// Helper function for error logging
const logError = (err, res) => {
  console.error("Error:", err.message || err);
  res.status(500).json({ error: "Internal server error" });
};

// Route to get all subjects
app.get("/predmet", async (req, res) => {
  try {
    const result = await pool.query("SELECT * FROM predmet");
    res.json(result.rows);
  } catch (err) {
    logError(err, res);
  }
});

// Route to get a specific subject by ID
app.get("/predmet/:id", async (req, res) => {
  const { id } = req.params;
  try {
    const result = await pool.query(
      "SELECT * FROM predmet WHERE predmet_id = $1",
      [id]
    );
    if (result.rows.length === 0) {
      res.status(404).json({ error: "Subject not found" });
    } else {
      res.json(result.rows[0]);
    }
  } catch (err) {
    logError(err, res);
  }
});

// Route to create a new subject
app.post("/predmet", async (req, res) => {
  const { nazev, popis, okruh_id } = req.body;
  try {
    const result = await pool.query(
      "INSERT INTO predmet (nazev, popis, okruh_id) VALUES ($1, $2, $3) RETURNING *",
      [nazev, popis, okruh_id]
    );
    res.status(201).json(result.rows[0]);
  } catch (err) {
    logError(err, res);
  }
});

// Route to update a subject
app.put("/predmet/:id", async (req, res) => {
  const { id } = req.params;
  const { nazev, popis, okruh_id } = req.body;
  try {
    const result = await pool.query(
      "UPDATE predmet SET nazev = $1, popis = $2, okruh_id = $3 WHERE predmet_id = $4 RETURNING *",
      [nazev, popis, okruh_id, id]
    );
    if (result.rows.length === 0) {
      res.status(404).json({ error: "Subject not found" });
    } else {
      res.json(result.rows[0]);
    }
  } catch (err) {
    logError(err, res);
  }
});

// Route to delete a subject
app.delete("/predmet/:id", async (req, res) => {
  const { id } = req.params;
  try {
    const result = await pool.query(
      "DELETE FROM predmet WHERE predmet_id = $1 RETURNING *",
      [id]
    );
    if (result.rows.length === 0) {
      res.status(404).json({ error: "Subject not found" });
    } else {
      res.json(result.rows[0]);
    }
  } catch (err) {
    logError(err, res);
  }
});

// Start the server
app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
