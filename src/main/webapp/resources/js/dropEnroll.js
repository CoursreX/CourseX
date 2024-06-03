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
            },
            error: function(xhr, status, error) {
                alert('수강포기에 실패했습니다.');
                console.log(error);
            }
        });
    });
});