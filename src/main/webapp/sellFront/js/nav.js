/**
 * 
 */
				const currentli = document.querySelector('li.current')
				if (currentli !=null) currentli.classList.remove('current')
					
				const liElements = document.querySelectorAll('ul#menu > li');
				//console.log(liElements)
				const idx = document.querySelector('#datanum').getAttribute("data-num")
				//console.log('**idx', idx)
				liElements[idx].classList.add('current')
				
/*				listItems.forEach(item => {
    const titleElement = item.children[1];
    const title = titleElement ? titleElement.innerText : ''; // titleElement가 존재하지 않을 경우 빈 문자열 반환

    const authorElement = item.children[2];
    const author = authorElement ? authorElement.innerText : ''; // authorElement가 존재하지 않을 경우 빈 문자열 반환

    if (title.includes(keyword) || author.includes(keyword)) {
        searchResult += `<li>${item.innerHTML}</li>`;
    }
});*/
 