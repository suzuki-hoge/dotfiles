
$(function() {
    marked.setOptions({
        langPrefix: ''
    });

	update();
	$('#editing').keyup(update);
});

function update() {
	var html = marked($('#editing').val());
	$('#preview').html(html);

	$('#preview pre code').each(function(i, e) {
		hljs.highlightBlock(e, e.className);
	});
};
