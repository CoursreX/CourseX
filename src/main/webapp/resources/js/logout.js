function logout() {
    const decision = confirm("로그아웃 하시겠습니까?");

    if(decision) {
        loadContent("logout.jsp");
        alert('로그아웃 되었습니다.');
        return;
    }
}