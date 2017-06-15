function renderHumanDates(){
	$('.cronogram').each(function(){
		date = moment($(this).attr('data-datetime'),"YYYY/MM/DD").locale("pt");
		$(this).html('<span>' + date.fromNow() + '</span>');
	});
}
