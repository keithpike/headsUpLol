$(function(){
	$('.dashboardNavbarButtons').on('click', '.newPostButton', handleNewPost);
	$('#newPostModal').on('click','#postInputButton', handlePostSubmit);

	function handleNewPost(event){
		event.preventDefault();
		var formFields = makeFormRequest('../' +
			$(event.target).text().toLowerCase() + '_post/new');
		handleModalOpen('#newPostModal');
	};

	function handlePostSubmit(event){
      event.preventDefault();
      var formData = $('#newPostForm').serialize();

      $.ajax({
      	url: '/blogs/' + window.selectedBlogId + '/posts',
      	type: 'POST',
      	data: formData,
      	success: function(response){
      		$('#newPostModal').modal('hide');
          addPostToPage(response);
      	}
			});
	};

	function handleModalOpen(selector){
		var $newPostForm = $('#newPostForm');
		$newPostForm.html("<div class='formLoading'></div>");
		$(selector).modal('show');
	};

	function makeFormRequest(passedUrl){
			 $.ajax({
      	url: passedUrl,
      	type: 'GET',
      	success: function(response){
	  			$('#newPostForm').html(response);
	  			$('textarea#postDescriptionInput, textarea#postCaptionInput').markItUp(mySettings);
          $('#blogIdInputField').attr('value', window.selectedBlogId);
          $filepicker = $("input[type=filepicker-dragdrop]");
          if($filepicker.length){
            filepicker.constructWidget($filepicker[0]);
          }

      	}
			});
  };

  function addPostToPage(serverResponse){
    $('#newPostModal').after(serverResponse)
  };

  function putThatBackground(){
    var $background = $('.everythingWrapper');
    $background.css('background-image', 'url(' + window.selectedBackground + ')');
    $background.css('background-size', 'cover');
  }
  debugger
  putThatBackground();
});