<?php

// Get Database Object
include 'database.php';

// Check POST Request
if(isset($_POST['elementAttributes'])) {
  // Get Element ID
  $elementID = $_POST['elementAttributes']['elementID'];
  // Get Element ID
  $elementOrder = $_POST['elementAttributes']['elementOrder'];
  // Get Element ID
  $elementColumn = $_POST['elementAttributes']['elementColumn'];

  // Update Element Position
  $query = 'UPDATE bookmarks SET bookmark_order = :bookmark_order, bookmark_column = :bookmark_column WHERE bookmark_id = :bookmark_id';
  $stmt = $db->prepare($query);
  $executionStatus = $stmt->execute([
                                      'bookmark_order'  => $elementOrder,
                                      'bookmark_column' => $elementColumn,
                                      'bookmark_id'     => $elementID
                                    ]);
  // Success Return For JS Response
  echo $executionStatus;
}

