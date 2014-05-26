$(function(){
	$('.dashboardNavbarButtons').on('click', '.newPostButton', handleNewPost);
	$('#newPostModal').on('click','#postInputButton', handlePostSubmit);

	function handleNewPost(event){
		debugger
		event.preventDefault();
		var formFields = makeFormRequest('../' +
			$(event.target).text().toLowerCase() + '_post/new');
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

	function makeFormRequest(passedUrl){
			debugger
			 $.ajax({
      	url: passedUrl,
      	type: 'GET',
      	success: function(response){
	  			$('#newPostForm').html(response);
					var toolbar = new MarkdownToolbar($("#postDescriptionInput"));
					toolbar.resize_textarea();
      	}
			});
  };

});