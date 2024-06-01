$(document).ready(function() {
    $(document).on('submit', '#searchForm', function(event) {
        event.preventDefault();
        const year = $('#year').val();
        const semester = $('#semester').val();

        $.ajax({
            url: 'http://localhost:8080/CourseX_war_exploded/ajax/enrollSearch.jsp',
            type: 'GET',
            data: {
                year: year,
                semester: semester
            },
            success: function(response) {
                $('.table__body').html(response);
            },
            error: function(xhr, status, error) {
                console.error(xhr, status, error);
                $('.search__result').html('<div>문제가 발생하여 데이터를 가져올 수 없습니다.</div>');
            }
        });
    });
});


function handleRadio(event) {
    const searchFilterElements = document.querySelectorAll('.search__filter__element');
    searchFilterElements.forEach(element => element.style.display = 'none');

    if(event.target.value === 'code') {
        searchFilterElements[0].style.display = 'block';
    } else if(event.target.value === 'name') {
        searchFilterElements[1].style.display = 'block';
    } else if(event.target.value === 'category') {
        searchFilterElements[2].style.display = 'block';
    }
}
