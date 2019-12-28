<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Naver Toast UI Editor</title>

    <!-- naver toast ui editor를 쓰기 위해 필요한 준비물 -->
    <link rel="stylesheet" type="text/css" href="../lib/toast/css/codemirror.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/toast/css/github.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/toast/css/tui-color-picker.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/toast/dist/tui-editor.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/toast/dist/tui-editor-contents.min.css">

    <script src="../dist/tui-editor-Editor-full.min.js"></script>
    <!-- naver toast ui editor를 쓰기 위해 필요한 준비물 -->

    <script>
        //naver toast ui를 만들기 위한 코드
        function createViewer(){
            //editor 옵션
            var options = {
                //el(element) : 에디터가 될 영역
                el:document.querySelector(".naver-viewer"),
                
                viewer:true,
                //height : 생성될 에디터의 높이
                height:'auto',
                
            };
            //editor 생성 코드
            var editor = tui.Editor.factory(options);
            var input = document.querySelector(".naver-viewer + input");
            var text = input.value;
            editor.setValue(text);
        }
        //body가 없는 경우에는 다음과 같이 작성
        // - 예약 실행(callback)
        window.onload = createViewer;
    </script>
</head>
<body>
    <!-- 
        이 div 태그가 뷰어로 변함
    -->
    <div class="naver-viewer"></div>    
    <input type="hidden" name="content" value="# hello">
</body>
</html>