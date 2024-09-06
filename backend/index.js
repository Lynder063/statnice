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

// Endpoint pro získání všech odpovědí
app.get("/odpoved", async (req, res) => {
  try {
    const result = await pool.query("SELECT * FROM public.odpoved");
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).send("Server Error");
  }
});

// Endpoint pro získání všech okruhů
app.get("/okruh", async (req, res) => {
  try {
    const result = await pool.query("SELECT * FROM public.okruh");
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).send("Server Error");
  }
});

// Endpoint pro získání všech otázek
app.get("/otazka", async (req, res) => {
  try {
    const result = await pool.query("SELECT * FROM public.otazka");
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).send("Server Error");
  }
});

// Endpoint pro získání všech předmětů
app.get("/predmet", async (req, res) => {
  try {
    const result = await pool.query("SELECT * FROM public.predmet");
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).send("Server Error");
  }
});

// Start the server
app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
