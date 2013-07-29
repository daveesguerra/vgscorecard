var i = 1;

$(".course_holes_hole_number input").each(function() {
  $(this).val(i)
  i++;
});

$('#course_course_type_id').change(function() {
  if ($(this).val() == 2) {
	$(".course_holes_par input").each(function() {
	  $(this).val("3");
	});
  } else {
    $(".course_holes_par input").each(function() {
	  $(this).val("");
    })
  }
});
