$(document).ready(function() {
  $('form.upvote, form.downvote').submit(function(event) {
    event.preventDefault();
    var vote = {
      vote: {
        upvote: this.vote_upvote.value
      }
    };

    var request = $.ajax({
      method: "POST",
      data: vote,
      url: this.action,
      dataType: 'json'
    });

    request.done(function(data) {
      $('.votecount-' + data.review_id).html(data.votecount);
    });

    request.fail(function() {
      window.location.assign("/users/sign_in");
    })
  });
});
