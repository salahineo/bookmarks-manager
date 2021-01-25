<?php

// Page Title
$page_title = 'Edit Bookmark';

// Include Database
include '../../include/database.php';

// Include Header
include '../../include/header.php';
// Include Navbar
include '../../include/navbar.php';

// Get GET Request ID
if($_SERVER['REQUEST_METHOD'] === 'GET') {
  if(isset($_GET['id'])) {
    // Get Bookmark Of This ID
    $query = 'SELECT * FROM bookmarks WHERE bookmark_id = :bookmark_id';
    $stmt = $db->prepare($query);
    $stmt->execute(['bookmark_id' => $_GET['id']]);
    $bookmark = $stmt->fetch();
    // Check If ID Exists
    if(!$bookmark) {
      // Redirect To Bookmarks Page
      header('location: /admin/bookmarks');
      exit();
    }
  } else {
    // Redirect To Bookmarks Page
    header('location: /admin/bookmarks');
    exit();
  }
}

// Check POST Request Parameters
if(isset($_POST['bookmark_submit'])) {
  // Get Bookmark Of This ID
  $query = 'SELECT * FROM bookmarks WHERE bookmark_id = :bookmark_id';
  $stmt = $db->prepare($query);
  $stmt->execute(['bookmark_id' => $_POST['bookmark_id']]);
  $bookmark = $stmt->fetch();

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
    // Insert Name
    $query = 'UPDATE bookmarks SET bookmark_name = :bookmark_name WHERE bookmark_id = :bookmark_id';
    $stmt = $db->prepare($query);
    $stmt->execute([
                     'bookmark_name' => $_POST['bookmark_name'],
                     'bookmark_id'   => $_POST['bookmark_id']
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
    <h3>Update Bookmark</h3>
    <!-- New Bookmark Form -->
    <form class="mt-5" action="<?= $_SERVER['PHP_SELF']; ?>" method="post">
      <div class="form-group mb-3 alerts">
        <?= isset($alert) ? $alert : ''; ?>
      </div>
      <div class="form-group mb-4">
        <label for="bookmark_name">Bookmark Name</label>
        <input type="text"
               name="bookmark_name"
               class="form-control"
               id="bookmark_name"
               value="<?= $bookmark['bookmark_name']; ?>">
        <input type="hidden" name="bookmark_id" value="<?= $bookmark['bookmark_id']; ?>">
      </div>
      <input type="submit" value="Update" name="bookmark_submit" class="btn btn-primary">
    </form>
  </div>
</div>
<!-- End Content -->

<?php

// Include Footer
include '../../include/footer.php';

?>

