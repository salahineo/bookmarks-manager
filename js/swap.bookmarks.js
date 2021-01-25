$(function () {
  // Sort Bookmarks From Column To Another
  $(".column").sortable({
    connectWith: ".column",
    handle: ".portlet-header",
    cancel: ".portlet-toggle",
    placeholder: "portlet-placeholder ui-corner-all",
    update: function (event, ui) {
      // Check Values For Receive Only
      if (this === ui.item.parent()[0]) {
        // Get Draggable Element Order In Current Column
        let elementOrder = parseInt($(this).find("#" + ui["item"].attr("id")).index()) + 1;
        // Store Element Attributes [ID, Order, Column]
        let elementAttributes = {
          elementID: ui["item"].attr("id"),
          elementOrder: elementOrder,
          elementColumn: $(this).attr("data-column")
        };
        // Send Element Attribute With AJAX To Update Database
        $.ajax({
          url: "/include/swap.bookmarks.php",
          method: "POST",
          data: {
            elementAttributes: elementAttributes
          },
          dataType: "json",
          success: function (response) {
            // Check Returned Response
            if (response === 1) {
              // Get Message Container
              let layoutMessage = $("#layout-message");
              // Store Message Alert
              layoutMessage.html(
                `<div class="alert alert-success alert-dismissible fade in show">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    <i class="fas fa-check-circle mr-2"></i>
                                    Layout Saved Successfully
                                  </div>`
              );
              // Fade Alert
              layoutMessage.fadeIn(300).delay(2000).fadeOut(500);
            }
          }
        });
      }
    }
  });

  // Move Bookmark From Column To Another
  $(".portlet")
  .addClass("ui-widget ui-widget-content ui-helper-clearfix ui-corner-all")
  .find(".portlet-header")
  .addClass("ui-widget-header ui-corner-all")
  .prepend("<span class='ui-icon ui-icon-minusthick portlet-toggle'></span>");

  // Bookmark Moving Helper
  $(".portlet-toggle").on("click", function () {
    var icon = $(this);
    icon.toggleClass("ui-icon-minusthick ui-icon-plusthick");
    icon.closest(".portlet").find(".portlet-content").toggle();
  });
});
