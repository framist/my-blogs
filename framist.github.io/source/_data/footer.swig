<script>
    let body = document.getElementsByTagName('body')[0];
    body.addEventListener('click', (e) => {
        let contentArr = ['欧拉~','ˋ( ° ▽、° ) ','RGB!','_(:з」∠)_','哼','?','¿框架?','QAQ',':3','<3','疯掉了',
                            'whoami',
                            'whoareU',
                            'NULL',
                            'None',
                            ' ',
                            '代价是什么呢？',
                            '...',
                            'Big Brother is Watching You',
                            '喵~', '嗷~', '呜~', '哞~', '咩~', '咕~', '嘎~', '嘤~',
                            '你看到了。',
                            '¿爱情障眼法?','¿物种认同障碍?',
                            '微润欧美，小润终南山，中润润与市，大润中南海',
                            'init param:<br/>1LTKvNaux7CjrNHJ09C0y87Eo7/Rrbu3zfm4tKOsus7Ksbb41rmjv9a5zqrWucv51rmjrLTLzsTT1rrOtOajvw==',
                            '这里没有时间的意义',
                            '嘿嘿嘿，好想被随机异或哦，<br/>嘿嘿嘿，嘿嘿嘿，异或我的异或',
                            '记忆赋予时间的意义，而不是时间赋予记忆的意义',
                            '放弃 P ∨ ¬P 吧！',
                            '抽象是普适性的代价 —— 3b1b',
                            '得易见平凡，仿照上例显然',
                            '留作习题答案略，读者自证不难',
                            '反之亦然同理，推论自然成立',
                            '略去过程 Q . E . D ，由上可知证毕'];
        let randomNum = function (n) {
            return Math.floor(Math.random() * n)
        }
        let span = document.createElement('span');
        span.innerHTML = `${contentArr[randomNum(contentArr.length)]}`;
        span.style.color = `rgb(${randomNum(256)},${randomNum(256)},${randomNum(256)})`;
        span.style.position = 'absolute';
        span.style.top = `${e.pageY}px`;
        span.style.left = `${e.pageX}px`;
        span.style.transition = 'all 1s ease';
        span.style.zIndex = 20000;
        body.appendChild(span)
        setTimeout(()=>{
            span.style.top = span.offsetTop - 25 + 'px';
            span.style.opacity = 0;
            setTimeout(()=>{span.remove()},1000)
        },700)
    })
</script>


<div style="width: 100px; height: 100px; margin: 0 auto;">
<script type="text/javascript" id="clstr_globe" src="//clustrmaps.com/globe.js?d=gRWtX21uVt_tIdj_T64nMvo4FK1UrTWME23CVLOzNCg"></script>
</div>
<!--
<script type="text/javascript" 
color="255,255,255" 
pointColor='64,184,209' 
opacity='1' 
zIndex="-1" 
count="233" 
src="https://cdn.jsdelivr.net/npm/canvas-nest.js@1/dist/canvas-nest.js">
</script>
-->
