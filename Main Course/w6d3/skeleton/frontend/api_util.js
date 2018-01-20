const APIUtil = {

  followUser: id => APIUtil.changeFollowStatus(id, 'POST'),

  unfollowUser: id => APIUtil.changeFollowStatus(id, 'DELETE'),

  changeFollowStatus: (id, method) => (
    $.ajax({
      url: `/users/${id}/follow`,
      dataType: 'json',
      method
    })
  ),

  searchUsers: query => (
    $.ajax({
      url: '/users/search',
      dataType: 'json',
      method: 'GET',
      data: { query }
    })
  ),

  createTweet: data => (
    $.ajax({
      url: '/tweets',
      method: 'POST',
      dataType: 'json',
      data
    })
  ),

  fetchTweets: data => (
    $.ajax({
      url: '/feed',
      method: 'GET',
      dataType: 'json',
      data
    })
  )
};

module.exports = APIUtil;

function exponent(b, n) {
  if (n === 0) {
    return 1;
  }
  if (n > 0) {
    return b * exponent(b, n - 1);
  } else {
    return (1/b) * exponent(b, n + 1);
  }
}
