<?php

// Page Title
$page_title = 'New Bookmark';

// Include Database
include '../../include/database.php';

// Include Header
include '../../include/header.php';
// Include Navbar
include '../../include/navbar.php';

// Check POST Request Parameters
if(isset($_POST['bookmark_submit'])) {
  if(empty($_POST['bookmark_name'])) {
    // Check Name If Empty
    $alert = '<div class="alert alert-danger alert-dismissible fade in show">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Bookmark name can\'t be empty.
              </div>';
  } elseif(strlen($_POST['bookmark_name']) > 100) {
    // Check Name Length
    $alert = '<div class="alert alert-danger alert-dismissible fade in show">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Bookmark name can\'t be more than 100 character.
              </div>';
  } else {
    // Insert New Bookmark
    $query = 'INSERT INTO bookmarks(bookmark_name, bookmark_order) VALUE (:bookmark_name, :bookmark_order)';
    $stmt = $db->prepare($query);
    $stmt->execute([
                     'bookmark_name'  => $_POST['bookmark_name'],
                     'bookmark_order' => $_POST['last_bookmark_order'] + 1
                   ]);
    // Redirect To Bookmarks Page
    header('Location: /admin/bookmarks');
    exit();
  }
}

?>

<!-- Start Content -->
<div class="container">
  <div class="content-body">
    <h3>Add New Bookmark</h3>
    <?php
    // Get Last Bookmark Order
    $stmt = $db->query('SELECT bookmark_order FROM bookmarks WHERE bookmark_column = 1 ORDER BY bookmark_order DESC LIMIT 1');
    $lastBookmarkOrder = $stmt->fetch();
    ?>
    <!-- New Bookmark Form -->
    <form class="mt-5" action="<?= $_SERVER['PHP_SELF']; ?>" method="post">
      <div class="form-group mb-3 alerts">
        <?= isset($alert) ? $alert : ''; ?>
      </div>
      <div class="form-group mb-4">
        <label for="bookmark_name">Bookmark Name</label>
        <input type="text" name="bookmark_name" class="form-control" id="bookmark_name">
        <input type="hidden" name="last_bookmark_order" value="<?= $lastBookmarkOrder['bookmark_order']; ?>">
      </div>
      <input type="submit" value="Add" name="bookmark_submit" class="btn btn-primary">
    </form>
  </div>
</div>
<!-- End Content -->

<?php

// Include Footer
include '../../include/footer.php';

?>

