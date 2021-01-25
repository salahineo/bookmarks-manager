/* ------------------------------------------- Preloader ------------------------------------------ */

// Get Preloader
let preloader = document.getElementById("preloader");

// Fade Out Preloader After 800 ms
setTimeout(function () {
  preloader.setAttribute("style", "opacity: 0");
}, 700);

// Remove Preloader In 1000 ms
setInterval(function () {
  preloader.remove();
}, 1000);

/* ------------------------------------- Check Local Storage ------------------------------------ */

// Check Toggle All Value
if (localStorage.getItem("bookmarksToggleAll") !== null) {
  if (localStorage.getItem("bookmarksToggleAll") === "on") {
    toggleAllOn();
  } else {
    toggleAllOff();
  }
}

// Check Color Theme Value
if (localStorage.getItem("bookmarksColorTheme") !== null) {
  if (localStorage.getItem("bookmarksColorTheme") === "dark") {
    // Change Body Attribute
    document.body.setAttribute("data-theme", "dark");
  } else {
    // Change Body Attribute
    document.body.setAttribute("data-theme", "light");
  }
}

/* ----------------------------------------- List Toggle ---------------------------------------- */

// Get Toggle Icon
let toggleList = document.querySelectorAll(".toggle");

// Add Event Listener To All Togglers
toggleList.forEach((element) => {
  element.addEventListener("click", toggleLinks);
});

// Toggle Function
function toggleLinks(e) {
  // Get Body Of The List [Related With Clicked Toggler]
  let relatedBody = e.target.parentElement.parentElement.nextElementSibling;

  // Check For Height
  if (relatedBody.style.maxHeight) {
    // Add CSS Properties And Change HTML Content
    relatedBody.style.maxHeight = null;
    relatedBody.style.padding = "0 20px";
    e.target.parentElement.innerHTML = "<i class=\"fas fa-plus\"></i>";
  } else {
    // Add CSS Properties And Change HTML Content
    relatedBody.style.maxHeight = relatedBody.scrollHeight + 20 + "px";
    relatedBody.style.padding = "20px";
    e.target.parentElement.innerHTML = "<i class=\"fas fa-minus\"></i>";
  }
}

/* --------------------------------- Collapse / Expand All Icon --------------------------------- */

// Get Collapse All Nav Icon
let collapseAll = document.getElementById("collapseAll");

// Get All Lists Body
let listsBody = document.querySelectorAll(".bookmark .body");

// Default Local Storage Var
let collapseLocal;

// On Click Trigger Function
collapseAll.addEventListener("click", toggleAllLists);

function toggleAllLists() {
  // Check Button Class
  if (collapseAll.getAttribute("class") === "option collapsed") {
    // Loop Through All Lists Body
    listsBody.forEach((element) => {
      // Add CSS Properties And Change HTML Content
      element.style.maxHeight = element.scrollHeight + 20 + "px";
      element.style.padding = "20px";
      collapseAll.innerHTML = "<i class=\"fas fa-minus-square\"></i>";
      // Change List Toggler
      element.previousElementSibling.firstChild.nextElementSibling.nextElementSibling.innerHTML =
        "<i class=\"fas fa-minus\"></i>";
    });
    // Change Button Class
    collapseAll.setAttribute("class", "option expanded");
    // Set Local Storage Value
    collapseLocal = localStorage.setItem("bookmarksToggleAll", "on");
  } else {
    // Loop Through All Lists Body
    listsBody.forEach((element) => {
      // Add CSS Properties And Change HTML Content
      element.style.maxHeight = null;
      element.style.padding = "0 20px";
      collapseAll.innerHTML = "<i class=\"fas fa-plus-square\"></i>";
      // Change List Toggler
      element.previousElementSibling.firstChild.nextElementSibling.nextElementSibling.innerHTML =
        "<i class=\"fas fa-plus\"></i>";
    });
    // Change Button Class
    collapseAll.setAttribute("class", "option collapsed");
    // Set Local Storage Value
    collapseLocal = localStorage.setItem("bookmarksToggleAll", "off");
  }
}

// Toggle All On Function For Local Storage
function toggleAllOn() {
  // Get Collapse All Nav Icon
  let collapseAll = document.getElementById("collapseAll");

  // Get All Lists Body
  let listsBody = document.querySelectorAll(".bookmark .body");

  // Loop Through All Lists Body
  listsBody.forEach((element) => {
    // Add CSS Properties And Change HTML Content
    element.style.maxHeight = element.scrollHeight + 20 + "px";
    element.style.padding = "20px";
    collapseAll.innerHTML = "<i class=\"fas fa-minus-square\"></i>";
    // Change List Toggler
    element.previousElementSibling.firstChild.nextElementSibling.nextElementSibling.innerHTML =
      "<i class=\"fas fa-minus\"></i>";
  });
  // Change Button Class
  collapseAll.setAttribute("class", "option expanded");
}

// Toggle All Off Function For Local Storage
function toggleAllOff() {
  // Get Collapse All Nav Icon
  let collapseAll = document.getElementById("collapseAll");

  // Get All Lists Body
  let listsBody = document.querySelectorAll(".bookmark .body");

  // Loop Through All Lists Body
  listsBody.forEach((element) => {
    // Add CSS Properties And Change HTML Content
    element.style.maxHeight = null;
    element.style.padding = "0 20px";
    collapseAll.innerHTML = "<i class=\"fas fa-plus-square\"></i>";
    // Change List Toggler
    element.previousElementSibling.firstChild.nextElementSibling.nextElementSibling.innerHTML =
      "<i class=\"fas fa-plus\"></i>";
  });
  // Change Button Class
  collapseAll.setAttribute("class", "option collapsed");
}

/* -------------------------------------- Toggle Color Mode ------------------------------------- */

// Get Toggle Mode Nav Icon
let toggleMode = document.getElementById("toggleMood");

// Local Storage Var
let modeLocal;

// On Click Trigger Function
toggleMode.addEventListener("click", toggleTheme);

// Toggle Theme function
function toggleTheme() {
  // Check Body Attribute
  if (document.body.getAttribute("data-theme") === "dark") {
    // Change Body Attribute
    document.body.setAttribute("data-theme", "light");
    // Set Local Storage Value
    modeLocal = localStorage.setItem("bookmarksColorTheme", "light");
  } else {
    // Change Body Attribute
    document.body.setAttribute("data-theme", "dark");
    // Set Local Storage Value
    modeLocal = localStorage.setItem("bookmarksColorTheme", "dark");
  }
}

/* -------------------------------------- Trigger Datatable ------------------------------------- */

$(function () {
  // Call Datatable Plugin
  $(".dataTable").DataTable({
    "order": [],
    lengthMenu: [[5, 10, 25, 50, 75, -1], [5, 10, 25, 50, 75, "All"]]
  });
  // Define Pagination Numbers Limit
  $.fn.DataTable.ext.pager.numbers_length = 8;
});

/* -------------------------------------- Copyright Year ------------------------------------- */

// New date Object
let currentDate = new Date();
// Get Copyright Year Span
document.getElementById("footer-copyright-year").innerHTML = String(currentDate.getFullYear());

