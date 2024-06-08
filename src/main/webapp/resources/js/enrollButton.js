function handleEnrollButtonClick(courseId, courseNo) {
    location.href = "enrollCourse.jsp?courseId=" + courseId + "&courseNo=" + courseNo;
    alert('신청이 완료되었습니다');
}