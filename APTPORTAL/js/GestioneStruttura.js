$(document).ready(function () {
    $(".aperturaAnnuale :checkbox").click(function () {
        if ($(this).is(":checked")) {
            $(".datePicker").attr("disabled", "disabled");
        }
        else {
            $(".datePicker").attr("disabled", "");
        }
    });
});

