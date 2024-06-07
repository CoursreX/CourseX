$(document).ready(function() {
    $(document).on('submit', '#searchForm', function(event) {
        event.preventDefault();
        const year = $('#year').val();
        const semester = $('#semester').val();

        $.ajax({
            url: 'http://localhost:8080/CourseX_war_exploded/ajax/searchEnroll.jsp',
            type: 'GET',
            data: {
                year: year,
                semester: semester
            },
            success: function(response) {
                // 조회 결과가 없는 경우
                if (response.trim() === "") {
                    $('.table__body').html('<tr>\n' +
                        '    <td class="table__cell" colspan="9">조회 결과가 없습니다.</td>\n' +
                        '</tr>');
                    $('.show__total__credits').empty().hide();
                } else {
                    $('.table__body').html(response);

                    //정보 확인용
                    console.log(hasResults, totalCredits, studentName)
                    if (hasResults) { // 총 학점이 있는 경우에만 보이기
                        $('.show__total__credits').html( '<div class="show_display">' +
                            '<h3 class="show__item">' + studentName + '</h3>' +
                            '<p> 님의 총 수강 학점은 </p>' +
                            '<h3 class="show__item">' + totalCredits + '</h3>' + ' <p> 학점입니다.' +
                            '</div>').show();
                    } else {
                        $('.show__total__credits').empty().hide();
                    }
                }
            },
            error: function(xhr, status, error) {
                console.error(xhr, status, error);
                $('.search__result').html('<div>문제가 발생하여 데이터를 가져올 수 없습니다.</div>');
            }
        });
    });
});