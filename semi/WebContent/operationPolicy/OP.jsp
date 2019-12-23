<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/template/header.jsp"></jsp:include>

   <style>
 :root {
    --bg: #fdfdfd;
    --highlight1: #ED4264;
    --highlight2: #FFEDBC;
    --color: #1a1e24;
    --font-number: Montserrat, Roboto, Helvetica, Arial, sans-serif;
    --font-head: "Space Mono", Consolas, Menlo, Monaco, "Courier New", monospace;
    --font: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
}

.list {
    list-style: none;
    width: 600px;
    max-width: 90%;
}

.item {
    display: block;
    clear: both;
    counter-increment: list;
    padding-bottom: 4rem;
    font-size: 0.9rem;
    line-height: 1.375;
    position: relative;
}

.item:before {
    font: bold 2.25rem/1 var(--font-number);
    content: counter(list);
    width: 5rem;
    height: 5rem;
    float: left;
    margin: 0 1.5rem 0.75rem 0;
    color: var(--bg);
    background: var(--highlight1) linear-gradient(to bottom right, var(--highlight1) 25%, var(--highlight2));
    text-shadow: 0 0 2px var(--highlight1);
    border-radius: 50%;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    shape-outside: ellipse();
    z-index: 1;
}

.item:after {
    width: 2.5rem;
    height: 2.5rem;
    position: absolute;
    top: 0;
    left: 0;
    content: "";
    background: var(--highlight1);
    z-index: -1;
    border-top-left-radius: 3px;
}


.headline {
    padding: 0rem 0 0 0;
    margin: 0 0 1rem 0;
    font: normal 2rem var(--font-head);
}

.Opbody {
    width: 100%;
    height: 100%;
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background: var(--bg);
    font-family: var(--font);
    padding: 4rem 0;
}


    </style>

 <article class = "Opbody">
<ol class="list" align="center">
  <li class="item">
    <h2 class="headline">문서관리 방침</h2><span>
    1. 문서란, 글이나 기호 따위를 통해 일정한 관념 따위를 나타낸 것 자체 및 그것을 서술할 수 있는 나무위키 시스템 상의 공간을 이른다. 별도의 설명이 없는 한, 모든 규정에서 문서를 알콜위키의 문서와 같은 의미로 사용한다.<pre></pre>
    
    2. 특정 문서에서 편집 요청 기능을 사용할 수 있으며, 편집권을 가진 이용자는 이를 승인할 수 있다.
    
    <pre></pre>3. 문서 배포 라이선스인 CC BY-NC-SA 2.0 KR 에 호환되지 않는 텍스트를 공정 이용으로 간주할 수 있는 범위를 넘어 무단으로 사용하는 것은 금지된다.<PRE></PRE>
    
    4. 개별 문서에서 작성한 부분의 저작권은 각 부분의 기여자에게 있으며, 나무위키는 해당 문서를 배포할 수 있는 권한을 가진다. 또한 기여한 내용을 알콜위키에 저장한다는 것은 기여자가 알콜위키의 라이선스에 따라 이용을 허락한다는 것을 의미한다.<pre></pre>
    
    5. 저작권법상 성명표시권 등 / CCL등의 자유 배포 라이선스의 '저작자표기' 등에 기반하여, 업로드하는 이미지의 출처 또는 저작자를 반드시 표기하여야 하며, 해당 이미지가 적용하고 있는 라이선스를 정확하게 표시해야 한다.

    </span>
    
    
  </li>
  <li class="item">
    <h2 class="headline">새글 등록 방침</h2><span>
    1.  새글은 스레드 형식을 통해 이루어지며, 발제 → 의견 교환 → 합의안 도출 → 의견 합의 반영 → 스레드 닫기 의 과정으로 진행된다.<pre></pre>
    
    2. 새글을 발제할 때 발제 목적과 배경을 분명히 해야 하며, 합의안이 도출되고 확정된 경우 관리자의 판단하에 스레드가 종료되고 알콜위키 문서에 등제될 수 있으나, 부적합한 글이거나 유의미한 의견 교환이 이뤄지지 않을 경우 운영자의 판단하에 강제로 종료될 수 있다. <pre></pre>
    
    </span>
  </li>
  <li class="item">
    <h2 class="headline">이용자 관리 방침</h2><span>
        1. 제재란 운영진이 알콜위키의 원활한 운영을 위해 규정을 위반한 특정 이용자를 차단하거나 경고를 부여하는 것을 말하며, 차단이란 운영진이 특정 이용자의 이용권 중 편집권과 토론권 및 게시판 이용을 제한하는 것을 말한다.<pre></pre>
        
        2. 운영자는 심각한 규정 위반으로 인해 정상적인 위키 활동 의사가 없다고 판단되거나, 규정 위반으로 인한 차단이 극도로 빈번한 이용자, 문서를 훼손하기 위한 목적으로나 규정에 위배되도록 남용하여 원활한 문서 작성에 피해를 주는 행위를 에 대해 최대 무기한으로 차단할 수 있다.<pre></pre>
        
        3. 제제된 유저가 제제 회피를 위한 부정 접속, 부적절한 계정명 등의 시도를 할경우에도 최대 무기한으로 차단될 수 있으며, ip 우회 수단을 이용하여 알콜 위키를 사용하려 할 경우에 해당 ip 는 무기한 차단된다.<pre></pre>
        
        4. 차단된 이용자는 차단에 대한 이의 혹은 규정 위반에 대해 반성하는 경우 운영자에게 소명 글을 전달하여 운영자의 판단 하에 차단의 재조정, 무효화, 기간 경감 또는 사면 하거나 소명을 각하할 수 있다.
        
          
    </span>
  </li>
</ol>

</article>


<jsp:include page="/template/footer.jsp"></jsp:include>