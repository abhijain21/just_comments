$(document).on('ready', ready);
$(document).on('page:load', ready);

function ready() {
	// vote functionality click handling
	$(".all_comments").on("click", ".votes .vote_button", function() {
		$(this).addClass("active");
		$.ajax({
			url: $(this).data().href,
			method: 'post',
			success: function() {
				$(this).removeClass("active");
			}
		});
	});
	// infinite scroll js
	if ($('.infinite_scroll').size() > 0) {
	  $(window).on('scroll', function() {
	    var more_posts_url;
	    more_posts_url = $('.pagination a[rel=next]').attr('href');
	    if (more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 200) {
	      $('.pagination').html("");
	      $.ajax({
	        url: more_posts_url,
	        success: function(data) {
	          return $(".all_comments").append(data);
	        }
	      });
	    }
	    if (!more_posts_url) {
	      return $('.pagination').html("");
	    }
	  });
	  return;
	}
}