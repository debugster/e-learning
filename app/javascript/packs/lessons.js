$(document).on("turbolinks:load", function() {
    let mcqLimit = Number($(".lesson-mcq-table").data("mcq-limit"));

    numberingMcqs();
    toggleAddMcqButton(mcqLimit);
    toggleLessonSubmitButton(mcqLimit);

    $(".lesson-mcq-table").on("cocoon:after-insert cocoon:after-remove", function (e, insertedItem, originalEvent) {
        numberingMcqs();
        toggleAddMcqButton(mcqLimit);
        toggleLessonSubmitButton(mcqLimit);
    });
});

function toggleAddMcqButton(mcqLimit) {
    if ($(".mcq-title").length >= mcqLimit) {
        $(".add-mcq-button").addClass("disabled");
    } else {
        $(".add-mcq-button").removeClass("disabled");
    }
}

function toggleLessonSubmitButton(mcqLimit) {
    if ($(".mcq-title").length != mcqLimit) {
        $(".lesson-submit-button").addClass("disabled");
    } else {
        $(".lesson-submit-button").removeClass("disabled");
    }
}

function numberingMcqs() {
    $(".mcq-title").each(function(index, value) {
        value.innerHTML = `Question # ${index + 1}`;
    });

    $(".mcq-options").each(function(index, value) {
        $(value).prop("id", `mcq-options-${index + 1}`);
        let targetButton = $(value).parent().siblings().first();
        $(targetButton).data("association-insertion-node", `#mcq-options-${index + 1}`);
    });
}