$(function() {
    marked.setOptions({
        langPrefix: ''
    });

	update();
	$('#editing').keyup(update);

	$('#hide').click(hide);
	$('#show').click(show);
});

function update() {
	var html = marked($('#editing').val());
	$('#preview').html(html);

	$('#preview pre code').each(function(i, e) {
		hljs.highlightBlock(e, e.className);
	});
};

function hide() {
	toggle();

	$("#preview").animate(
		{width: "100%"},
		{
			duration: "fast",
			easing: "linear",
		}
	);
};

function show() {
	toggle();

	$("#preview").animate(
		{width: "50%"},
		{
			duration: "fast",
			easing: "linear",
		}
	);
};

function toggle() {
	$("#editing").animate(
		{width: "toggle", opacity: "toggle"},
		{
			duration: "fast",
			easing: "linear",
		}
	);

	$('#hide').toggle();
	$('#show').toggle();
};
