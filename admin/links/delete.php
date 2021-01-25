<?php

// Page Title
$page_title = 'Delete Link';

// Include Database
include '../../include/database.php';

// Include Header
include '../../include/header.php';
// Include Navbar
include '../../include/navbar.php';

// Get GET Request ID
if($_SERVER['REQUEST_METHOD'] === 'GET') {
  if(isset($_GET['id']) && !empty($_GET['id'])) {
    // Get Link Of This ID
    $query = 'SELECT * FROM links WHERE link_id = :link_id';
    $stmt = $db->prepare($query);
    $stmt->execute(['link_id' => $_GET['id']]);
    $link = $stmt->fetch();
    // If ID Exists
    if(!$link) {
      // Redirect To Links Page
      header('location: /admin/links');
      exit();
    }
  } else {
    // Redirect To Links Page
    header('location: /admin/links');
    exit();
  }
}

// Check POST Request
if(isset($_POST['delete'])) {
  // Delete All Links Related To This bookmark
  $query = 'DELETE FROM links WHERE link_id = :link_id';
  $stmt = $db->prepare($query);
  $stmt->execute(['link_id' => $_POST['link_id']]);;

  // Redirect To Bookmarks Page
  header('location: /admin/links');
  exit();
}

?>

<!-- Start Content -->
<div class="container">
  <div class="content-body">
    <h3>Delete Link</h3>
    <!-- Delete Link Form -->
    <form class="mt-5" action="<?= $_SERVER['PHP_SELF']; ?>" method="post">
      <div class="form-group mb-3 alerts">
        <div class="alert alert-danger alert-dismissible fade in show">
          <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
          Are you sure to delete this link?
        </div>
      </div>
      <div class="form-group mb-4">
        <label for="link_name">Link Name</label>
        <input type="text"
               name="link_name"
               class="form-control"
               id="link_name"
               value="<?= $link['link_name']; ?>"
               disabled>
      </div>
      <div class="form-group mb-4">
        <label for="link_href">Link Href</label>
        <input type="text"
               name="link_href"
               class="form-control"
               id="link_href"
               value="<?= $link['link_href']; ?>"
               disabled>
      </div>
      <div class="form-group mb-4">
        <label>Link Image</label>
        <div class="img" style="max-width: 50px">
          <img class="img-fluid" src="/favicons/<?= $link['link_image']; ?>" alt="">
        </div>
      </div>
      <input type="hidden" name="link_id" value="<?= $link['link_id']; ?>">
      <a class="btn btn-primary mr-3" href="/admin/bookmarks">Cancel</a>
      <input type="submit" value="Delete" name="delete" class="btn btn-danger">
    </form>
  </div>
</div>
<!-- End Content -->

<?php

// Include Footer
include '../../include/footer.php';

?>

