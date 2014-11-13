$(document).ready(function() {
  $('.comment-single').on('click', '.vote-btn', function(event) {
    event.preventDefault();
    $target = $(event.target);
    $target.val("Voting...")
    $form = $target.parent();

    $.ajax({
      url: $form.attr('action'),
      type: $form.attr('method'),
      dataType: 'JSON',
    }).done(function(response) {
      $form.children('.vote_display').html(response.score)
      $target.val("Voted")
    });

  })
});
