$(document).ready(function() {
    $(document).on('click', '.drop__enroll__button', function(event) {
        const enrollId = event.target.dataset.enrollId;
        const courseName = event.target.dataset.courseName;
        const courseNo = event.target.dataset.courseNo;
        const decision = confirm(`과목명: ${courseName}\n분반: ${courseNo}\n해당 과목의 수강을 포기하겠습니까?`);
        if(!decision) return;

        $.ajax({
            url: 'http://localhost:8080/CourseX_war_exploded/ajax/dropEnroll.jsp',
            type: 'POST',
            data: { enrollId: enrollId },
            success: function(response) {
                alert('수강포기가 완료되었습니다.');
                $('.table__body').html(response);

                $.ajax({
                    url: 'http://localhost:8080/CourseX_war_exploded/views/userInfo.jsp', // userInfo.jsp의 경로에 맞게 수정
                    success: function(userInfoResponse) {
                        console.log('userInfo.jsp를 새로 로드합니다.');
                        $('.content__right').html(userInfoResponse);
                    },
                    error: function(xhr, status, error) {
                        alert('userInfo.jsp를 로드하는데 실패했습니다.');
                    }
                });
            },
            error: function(xhr, status, error) {
                alert('수강포기에 실패했습니다.');
            }
        });
    });
});