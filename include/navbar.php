<!-- Start Nav -->
<nav>
  <div class="container">
    <div class="row flex-column flex-sm-row align-items-center justify-content-between">
      <!-- Title -->
      <h2 class="m-0 mb-3 mb-sm-0">
        <a href="/">Resources</a>
      </h2>
      <!-- Options -->
      <div class="options">
        <span class="option" title="Toggle Dark / Light Mode">
          <a href="/include/toggle.theme.php">
           <i class="fas fa-adjust"></i>
          </a>
        </span>
        <span id="collapseAll"
              class="option collapsed"
              title="Collapse / Expand All Lists" <?= isset($homepage) ? '' : 'style="display: none;"'; ?>>
          <i class="fas fa-plus-square"></i>
        </span>
        <span class="option" title="Bookmarks">
          <a href="/admin/bookmarks/">
           <i class="fas fa-bookmark"></i>
          </a>
        </span>
        <span class="option" title="Links">
          <a href="/admin/links/">
           <i class="fas fa-link"></i>
          </a>
        </span>
        <span class="option" title="Visit Github Repo">
          <a href="https://github.com/salahineo/resources" target="_blank">
            <i class="fab fa-github"></i>
          </a>
        </span>
      </div>
    </div>
  </div>
</nav>
<!-- End Nav -->
