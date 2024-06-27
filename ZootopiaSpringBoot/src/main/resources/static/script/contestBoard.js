let category = location.href.split("category=")[1].split("&")[0]?location.href.split("category=")[1].split("&")[0]:"";
let pagenum = location.href.split("pagenum=")[1].split("&")[0]?location.href.split("pagenum=")[1].split("&")[0]:"";
let search = location.href.split("search=")[1].split("&")[0]?location.href.split("search=")[1].split("&")[0]:"";
let listData;
let paging;
document.querySelectorAll(".contest_list li").forEach((elem,index)=>{
    let indexdate = begin - index;
    elem.querySelector(".date_num .index").innerHTML = indexdate;
    elem.querySelector(".go_btn").href="zootopia.do?command=contestcount&cseq="+elem.querySelector(".go_btn").dataset.url+"&index="+indexdate
        +"&contestDetailCount=1";
});

var swiper = new Swiper(".mySwiper", {
    slidesPerView: 'auto',
    freeMode: true,
});

document.querySelector('input[name="category"]').value = category;



    fetch("/contestBoard?category="+category+"&pagenum="+pagenum+"&search="+search)
        .then(response => response.json())
        .then(data => {
            console.log(data);
            listData = data;
            setTimeout(()=>{
                setinit();
            });
        }).catch(error => {
        console.error('Error fetching data:', error);
    });


    function setinit(){
        let searchInfo = document.querySelector(".searchinfo");
        document.querySelector(".contest-countnum").innerText=` (${listData.allcout})`;
        //현재 검색어 확인하고 넣기
        if(listData.search !== "" ) {
            searchInfo.style.display="block";
            searchInfo.querySelector(".text").innerText = listData.search;
            searchInfo.querySelector(".count").innerText = listData.allcout;
            document.querySelector("input[name='search']").value =listData.search;
        }

        listData.cdtoList.forEach((elem , index)=>{
            let className;
            let lastDate = new Date(elem.lastdate).getTime();
            if(elem.useyn == "W")  className = "wating";
            else if(lastDate < Date.now() )  className = "end";
            document.querySelector(".contest_list ul").innerHTML +=
                `<li class='${className}'>
                    <div class="date_num">
                    <span class="cseq">NO. <span class="index">${elem.cseq}</span> <br>
                        <span style="font-size:14px; display:block; margin:5px 0 10px;">개최자 - ${elem.userid}</span>
                    </span>
                        <div class="left-box">
                            <p>조회수(${elem.cnt})</p>
                            <span class="lastdate">${elem.lastdate} 까지 등록가능</span>
                        </div>
                    </div>
                    <div class="title-box">
                        <h1>${elem.subject}</h1>
                       <p>${elem.content}</p>
                    </div>
                    <div class="bottom-wrap">
                    <div class="listcpist">
                        ${elem.cpdList.length <= 0 ? '<div class="no_pet"> 아직 참가한 애완동물이 없습니다! 지금 참가해주세요!</div>' : '<div class="swiper mySwiper"><div class="swiper-wrapper"></div></div>'}
                    </div>   
                    <div class="button-wrapper">
                       ${(lastDate < Date.now() && elem.useyn != 'W') ?
                    (elem.pcnt > elem.cpdList.length ? "<p>" + (elem.pcnt - elem.cpdList.length) + "마리 더 도전할수 있어요!</p>" : "<p>" + elem.pcnt + "마리 모두 도전완료</p>")
                    : " "}
                       ${elem.useyn == 'W' ? "<p>대기가 끝날 때까지 기다려주세요♥</p>" : ""}
                    ${lastDate < Date.now() && elem.useyn != 'W' ?
                    "<span>투표기간이 완료되었습니다.<br/>결과를 같이 확인해주세요!</span>" : ""}
                        ${elem.useyn == 'W' ?
                    '<a className="go_btn watingText">대기 중'+ (elem.plusdays < 8?'<span>'+ elem.plusdays +'일</span>':'') +'</a>':""}
                        ${elem.useyn != 'W' ? "<a class='go_btn' href='contestdetail?cseq="+elem.cseq+"'>자세히 보러가기</a>" : ""}
                    </div>
                </li>`;

            //슬라이드 추가
            elem.cpdList.forEach((elem2, idx) => {
                document.querySelectorAll(".contest_list li")[index].querySelector(".swiper-wrapper").innerHTML +=`
                    <div class="swiper-slide">
                        <img src="/images/${elem2.saveimage}">
                        <div class="rank">
                        ${idx + 1}
                        </div>
                    </div>
                `;
           });

            //페이지 네이션 구현
            paging =listData.paging;

        });


        for(let i = paging.beginPage; i < paging.endPage; i++ ){
            if(i == paging.page) document.querySelector(".pagenation-wrapper").innerHTML+= `<span>${i}</span>`
            else document.querySelector(".pagenation-wrapper").innerHTML+=`<a href="contestlist?category=${category}&pagenum=${i}&search=${search}">${i}</a>`;
        }

        if(paging.next){
            document.querySelector(".nextBtn_wrap").innerHTML = `<a  class="nextBtn" href="contestlist?category=${category}&pagenum=${paging.paging.startNum+1}&search=${search}"><img src="images/arrow.svg"></a>`;
        }

        if(paging.prev){
            document.querySelector(".nextBtn_wrap").innerHTML = `<a  class="prevBtn" href="contestlist?category=${category}&pagenum=${paging.paging.beginPage-1}&search=${search}"><img src="images/arrow.svg"></a>`;
        }

    }


document.querySelector("."+category).classList.add("select");



