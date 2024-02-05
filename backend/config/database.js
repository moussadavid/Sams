import mysql from "mysql2";

// create the connection to database

const db = mysql.createConnection({
  host: "localhost",
  user: "root", //admin
  password: "root", //Mdpotfm4D6VO8XNu82UH
  database: "db_restaurant", //dbrestaurant
});


db.connect(error => {
  if (error) throw error;
  console.log("Successfully connected to the database.");
});

export default db;