<?php

// Database Credentials
const DB_HOST = 'localhost';
const DB_NAME = 's_resources';
const DB_USER = 'root';
const DB_PASSWORD = 'root';
const DB_OPTIONS = array(
  PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES UTF8'
);

// Try Ro Connect With DB
try {
  // Create Connection
  $db = new PDO('mysql:host=' . DB_HOST . ';dbname=' . DB_NAME, DB_USER, DB_PASSWORD, DB_OPTIONS);
  // Set Fetch Mode To Associative Array Globally
  $db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
} catch(PDOException $e) {
  echo 'Failed To Connect With Database ' . $e->getMessage();
}
