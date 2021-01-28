<?php

// Check Cookie Storage
if(isset($_COOKIE['theme'])) {
  // Toggle Current Value
  $_COOKIE['theme'] === 'dark' ? setcookie('theme', 'light', time() + (12 * 30 * 24 * 60 * 60), '/') : setcookie('theme', 'dark', time() + (12 * 30 * 24 * 60 * 60), '/');;
  // Return To Previous Page
  header('location: ' . $_SERVER['HTTP_REFERER']);
  exit();
} else {
  // Set New Cookie
  setcookie('theme', 'light', time() + (12 * 30 * 24 * 60 * 60), '/');
  // Return To Previous Page
  header('location: ' . $_SERVER['HTTP_REFERER']);
  exit();
}
