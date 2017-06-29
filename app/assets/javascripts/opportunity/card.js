function applyGrid(){
	var $container = $('.grid')
	$container.imagesLoaded( function(){
		$container.masonry({
			itemSelector: '.grid-item',
			columnWidth: '.grid-sizer',
			percentPosition: true
		});
	});

  $container.infinitescroll({
    navSelector  : 'nav.pagination',    // selector for the paged navigation
    nextSelector : 'nav.pagination a[rel=next]',  // selector for the NEXT link (to page 2)
    itemSelector : '.grid-item',     // selector for all items you'll retrieve
    loading: {
        finishedMsg: 'Isso é tudo, em breve novas oportunidades estarão disponíveis',
        img: 'http://i.imgur.com/6RMhx.gif'
      },
    loadingText  : "Carregando mais oportunidades...",
    },
    // trigger Masonry as a callback
    function( newElements ) {
      // hide new items while they are loading
      var $newElems = $( newElements ).css({ opacity: 0 });
      // ensure that images load before adding to masonry layout
      $newElems.imagesLoaded(function(){
        // show elems now they're ready
        $newElems.animate({ opacity: 1 });
        $container.masonry( 'appended', $newElems, true );
      });
    }
  );

}

