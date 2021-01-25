<?php

// Page Title
$page_title = 'New Link';

// Include Database
include '../../include/database.php';

// Include Header
include '../../include/header.php';
// Include Navbar
include '../../include/navbar.php';

// Get Bookmarks Data
$stmt = $db->query('SELECT * FROM bookmarks ORDER BY bookmark_id DESC');
$bookmarks = $stmt->fetchAll();

// Check POST Request Parameters
if(isset($_POST['link_submit'])) {
  if(empty($_POST['link_name']) || empty($_POST['link_href'])) {
    // Check Fields If Empty
    $alert = '<div class="alert alert-danger alert-dismissible fade in show">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                All fields are required.
              </div>';
  } elseif(strlen($_POST['link_name']) > 100) {
    // Check Name Length
    $alert = '<div class="alert alert-danger alert-dismissible fade in show">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Link name can\'t be more than 100 character
              </div>';
  } elseif($_FILES['link_image']['error'] == 4) {
    // Check If Image Not Uploaded
    $alert = '<div class="alert alert-danger alert-dismissible fade in show">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Please upload an image
              </div>';
  } else {
    // Move Image To Favicons Directory
    move_uploaded_file($_FILES['link_image']['tmp_name'], '../../favicons/' . $_FILES['link_image']['name']);
    // Insert Links
    $query = 'INSERT INTO links(bookmark_id, link_name, link_href, link_image) VALUE (:bookmark_id, :link_name, :link_href, :link_image)';
    $stmt = $db->prepare($query);
    $stmt->execute([
                     'bookmark_id' => $_POST['link_bookmark'],
                     'link_name'   => $_POST['link_name'],
                     'link_href'   => $_POST['link_href'],
                     'link_image'  => $_FILES['link_image']['name'],
                   ]);
    // Redirect To Links Page
    header('Location: /admin/links');
    exit();
  }
}

?>

<!-- Start Content -->
<div class="container">
  <div class="content-body">
    <h3>Add New Link</h3>
    <!-- New Bookmark Form -->
    <form class="mt-5" action="<?= $_SERVER['PHP_SELF']; ?>" method="post" enctype="multipart/form-data">
      <div class="form-group mb-3 alerts">
        <?= isset($alert) ? $alert : ''; ?>
      </div>
      <div class="form-group mb-4">
        <label for="link_name">Link Name</label>
        <input type="text" name="link_name" class="form-control" id="link_name">
      </div>
      <div class="form-group mb-4">
        <label for="link_href">Link Href</label>
        <input type="text" name="link_href" class="form-control" id="link_href">
      </div>
      <div class="form-group mb-4">
        <label for="link_image">Link Image</label>
        <input type="file" name="link_image" class="form-control" id="link_image">
      </div>
      <div class="form-group mb-4">
        <label for="link_bookmark">Link Bookmark</label>
        <select class="form-control" name="link_bookmark" id="link_bookmark">
          <?php
          // Loop Through All Bookmarks
          foreach($bookmarks as $bookmark) {
            ?>
            <option value="<?= $bookmark['bookmark_id']; ?>"><?= $bookmark['bookmark_name']; ?></option>
            <?php
          }
          ?>
        </select>
      </div>
      <input type="submit" value="Add" name="link_submit" class="btn btn-primary">
    </form>
  </div>
</div>
<!-- End Content -->

<?php

// Include Footer
include '../../include/footer.php';

?>
