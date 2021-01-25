<?php

// Page Title
$page_title = 'Edit Link';

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
    $query = 'SELECT * FROM links WHERE link_id = :link_id';
    $stmt = $db->prepare($query);
    $stmt->execute(['link_id' => $_GET['id']]);
    $link = $stmt->fetch();
    // Check If ID Exists
    if(!$link) {
      // Redirect To Bookmarks Page
      header('location: /admin/links');
      exit();
    }
  } else {
    // Redirect To Bookmarks Page
    header('location: /admin/links');
    exit();
  }
}

// Get Bookmarks Data
$stmt = $db->query('SELECT * FROM bookmarks ORDER BY bookmark_id DESC');
$bookmarks = $stmt->fetchAll();

// Check POST Request Parameters
if(isset($_POST['link_submit'])) {
  // Get Bookmark Of This ID
  $query = 'SELECT * FROM links WHERE link_id = :link_id';
  $stmt = $db->prepare($query);
  $stmt->execute(['link_id' => $_POST['link_id']]);
  $link = $stmt->fetch();
  // Check If ID Exists
  if(!$link) {
    // Redirect To Bookmarks Page
    header('location: /admin/links');
    exit();
  }

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
  } else {
    // Check If Image Not Uploaded
    if($_FILES['link_image']['error'] == 4) {
      // Update Links
      $query = 'UPDATE links SET link_name = :link_name, link_href = :link_href, bookmark_id = :bookmark_id WHERE link_id = :link_id';
      $stmt = $db->prepare($query);
      $stmt->execute([
                       'bookmark_id' => $_POST['link_bookmark'],
                       'link_name'   => $_POST['link_name'],
                       'link_href'   => $_POST['link_href'],
                       'link_id'     => $_POST['link_id']
                     ]);
      // Redirect To Links Page
      header('Location: /admin/links');
      exit();
    } else {
      // Move Image To Favicons Directory
      move_uploaded_file($_FILES['link_image']['tmp_name'], '../../favicons/' . $_FILES['link_image']['name']);
      // Update Links
      $query = 'UPDATE links SET link_name = :link_name, link_href = :link_href, link_image = :link_image, bookmark_id = :bookmark_id WHERE link_id = :link_id';
      $stmt = $db->prepare($query);
      $stmt->execute([
                       'bookmark_id' => $_POST['link_bookmark'],
                       'link_name'   => $_POST['link_name'],
                       'link_href'   => $_POST['link_href'],
                       'link_image'  => $_FILES['link_image']['name'],
                       'link_id'     => $_POST['link_id']
                     ]);
      // Redirect To Links Page
      header('Location: /admin/links');
      exit();
    }
  }
}

?>

<!-- Start Content -->
<div class="container">
  <div class="content-body">
    <h3>Update Link</h3>
    <!-- New Bookmark Form -->
    <form class="mt-5" action="<?= $_SERVER['PHP_SELF']; ?>" method="post" enctype="multipart/form-data">
      <div class="form-group mb-3 alerts">
        <?= isset($alert) ? $alert : ''; ?>
      </div>
      <div class="form-group mb-4">
        <label for="link_name">Link Name</label>
        <input type="text" name="link_name" class="form-control" id="link_name" value="<?= $link['link_name']; ?>">
      </div>
      <div class="form-group mb-4">
        <label for="link_href">Link Href</label>
        <input type="text" name="link_href" class="form-control" id="link_href" value="<?= $link['link_href']; ?>">
      </div>
      <div class="form-group mb-4">
        <label for="link_image">Link Image</label>
        <input type="file" name="link_image" class="form-control" id="link_image">
      </div>
      <div class="form-group mb-4">
        <label>Current Image</label>
        <div class="img" style="max-width: 50px">
          <img class="img-fluid" src="/favicons/<?= $link['link_image']; ?>" alt="">
        </div>
      </div>
      <div class="form-group mb-4">
        <label for="link_bookmark">Link Bookmark</label>
        <select class="form-control" name="link_bookmark" id="link_bookmark">
          <?php
          // Loop Through All Bookmarks
          foreach($bookmarks as $bookmark) {
            ?>
            <option value="<?= $bookmark['bookmark_id']; ?>" <?= $link['bookmark_id'] == $bookmark['bookmark_id'] ? 'selected' : ''; ?>><?= $bookmark['bookmark_name']; ?></option>
            <?php
          }
          ?>
        </select>
      </div>
      <input type="hidden" name="link_id" value="<?= $link['link_id']; ?>">
      <input type="submit" value="Update" name="link_submit" class="btn btn-primary">
    </form>
  </div>
</div>
<!-- End Content -->

<?php

// Include Footer
include '../../include/footer.php';

?>
