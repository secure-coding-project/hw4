$("#file").on('change',function(){
  var fileName = $("#file").val();
  $(".upload-name").val(fileName);
});

function list_open() {
    var decoyDiv = document.querySelector('.decoy_div');
    decoyDiv.style.display = 'flex';

    var matChangeDiv = document.querySelector('.mat_change');
    matChangeDiv.style.display = 'block';

    var matSearchDiv = document.querySelector('.mat_search');
    matSearchDiv.style.display = 'none';

    var forHwakinDiv = document.querySelector('.for_hwakin');
    forHwakinDiv.style.display = 'flex';

    var forHwakin2Div = document.querySelector('.for_hwakin2');
    forHwakin2Div.style.display = 'flex';
}
function list_open2() {
    var decoyDiv = document.querySelector('.decoy_div');
    decoyDiv.style.display = 'flex';

    var matChangeDiv = document.querySelector('.mat_change');
    matChangeDiv.style.display = 'block';

    var matSearchDiv = document.querySelector('.mat_search');
    matSearchDiv.style.display = 'none';
    var forHwakinDiv = document.querySelector('.for_hwakin');
    forHwakinDiv.style.display = 'none';

    var forHwakin2Div = document.querySelector('.for_hwakin2');
    forHwakin2Div.style.display = 'flex';
}
function search() {
       var decoyDiv = document.querySelector('.decoy_div');
    decoyDiv.style.display = 'flex';
    var matChangeDiv = document.querySelector('.mat_change');
    matChangeDiv.style.display = 'none';

    var matSearchDiv = document.querySelector('.mat_search');
    matSearchDiv.style.display = 'block';

    var forHwakinDiv = document.querySelector('.for_hwakin');
    forHwakinDiv.style.display = 'none';

    var forHwakin2Div = document.querySelector('.for_hwakin2');
    forHwakin2Div.style.display = 'flex';
}

function list_close(){
     var materialListDiv = document.querySelector('.decoy_div');

     // 현재 display 속성을 가져와서 토글
     var currentDisplayStyle = window.getComputedStyle(materialListDiv).display;
     materialListDiv.style.display = 'none';
}
function complete(){
   list_close();
}

function searchgo(){
      /*main에 뜨는 리스트 변경 함수 넣어야됨*/
   response.redirect("Search_page.jsp");
   list_close();

}

function post_insert_open() {
    var decoyDiv = document.querySelector('.decoy_div');
    decoyDiv.style.display = 'block';

    var matChangeDiv = document.querySelector('.mat_change');
    matChangeDiv.style.display = 'block';

}