$(function(){
	$('.dashboardNavbarButtons #newPostText').on('click', handleNewTextPost);
	$('.dashboardNavbarButtons #newPostPhoto').on('click', handleNewPhotoPost);
	$('.dashboardNavbarButtons #newPostQuote').on('click', handleNewQuotePost);
	$('.dashboardNavbarButtons #newPostLink').on('click', handleNewLinkPost);
	$('.dashboardNavbarButtons #newPostChat').on('click', handleNewChatPost);
	$('.dashboardNavbarButtons #newPostAudio').on('click', handleNewAudioPost);
	$('.dashboardNavbarButtons #newPostVideo').on('click', handleNewVideoPost);
	$('#postInputButton').on('click', handlePostSubmit);

	function handleNewTextPost(event){
		event.preventDefault();
		var formFields = makeFormRequest('../text_post/new');
		handleModalOpen('#newPostModal');
	};

	function handleNewPhotoPost(event){
		event.preventDefault();
		var formFields = makeFormRequest('../photo_post/new');
		handleModalOpen('#newPostModal');
	};

	function handleNewQuotePost(event){
		event.preventDefault();
		var formFields = makeFormRequest('../quote_post/new');
		handleModalOpen('#newPostModal');
	};

	function handleNewLinkPost(event){
		event.preventDefault();
		var formFields = makeFormRequest('../link_post/new');
		handleModalOpen('#newPostModal');
	};

	function handleNewChatPost(event){
		event.preventDefault();
		var formFields = makeFormRequest('../chat_post/new');
		handleModalOpen('#newPostModal');
	};

	function handleNewAudioPost(event){
		event.preventDefault();
		var formFields = makeFormRequest('../audio_post/new');
		handleModalOpen('#newPostModal');
	};

	function handleNewVideoPost(event){
		event.preventDefault();
		var formFields = makeFormRequest('../video_post/new');
		handleModalOpen('#newPostModal');
	};

	function handlePostSubmit(event){
      event.preventDefault();
      var formData = $('#newPostForm').serialize();
     	
      $.ajax({
      	url: '/blogs/' + window.blogId + '/posts',
      	type: 'POST',
      	data: formData,
      	success: function(){
      		$('#newPostModal').modal('hide');

      	}
			});
	};

	function handleModalOpen(selector){
		var $newPostForm = $('#newPostForm');
		$newPostForm.html("<div class='formLoading'></div>");
		$(selector).modal('show');
	};

	function makeFormRequest(url){
			 $.ajax({
      	url: '../text_post/new',
      	type: 'GET',
      	success: function(response){
	  			$('#newPostForm').html(response);
      	}
			});
  };

});