const apiKey = CONFIG.SPOT_API_KEY;
const spotApiHost = 'navitime-spot.p.rapidapi.com';
const mapApiHost = 'navitime-maps.p.rapidapi.com';

// Maps API의 Javascript 파일을 동적으로 읽기
const mapContainer = document.getElementById('map-container');
const mapScriptUrl = `https://navitime-maps.p.rapidapi.com/map_script?host=localhost`;

async function loadMapScript() {
    // ヘッダー付きでスクリプトを読み込む
    options = {
        method: 'GET',
        headers: {
            'x-rapidapi-host': mapApiHost,
            'x-rapidapi-key': apiKey
        }
    };

    try {
        const response = await fetch(mapScriptUrl, options);

        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        const scriptContent = await response.text();

        // 스크립트 내용을 동적으로 실행
        const script = document.createElement('script');
        script.textContent = scriptContent;

        console.log(typeof window.navitime);
        console.log(scriptContent.length);
        console.log(scriptContent.substring(0, 300));

        document.head.appendChild(script);

        // 스크립트가 실행 되면 지도를 초기화
        setTimeout(() => {
            initializeMap();
        }, 100);
    } catch (error) {
        console.error('地図スクリプトの読み込みに失敗しました:', error);
    }
}

function initializeMap() {
    // 지도 초기화
    map = new navitime.geo.Map('map-container', new navitime.geo.LatLng(35.681236, 139.767125), 16);

    // 지도 중심 좌표 습득
    const center = map.getCenter();

    // 중심점 마커 작성
    // 마커의 이미지는 추후 수정 바람
    // pin = new navitime.geo.overlay.Pin({
    //     icon : './pin.png',
    //     position: center,
    //     draggable: true,
    //     map: map
    // });

    // 마커 표시
    // pin.setVisible(true);
}

// 지도 스크립트 가져오기
loadMapScript();
