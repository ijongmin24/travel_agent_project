
function handleSearchDropDown(){
    const listDom = document.querySelector('#search-dropdown-list');
    let currentDisplay = listDom.style.display;

    if(currentDisplay == 'block'){
        listDom.style.display = 'none';
    }
    else{
        listDom.style.display = 'block';
    }
}