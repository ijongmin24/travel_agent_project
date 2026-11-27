
// google place api 사용중

(g=>{var h,a,k,p="The Google Maps JavaScript API",c="google",l="importLibrary",q="__ib__",m=document,b=window;b=b[c]||(b[c]={});var d=b.maps||(b.maps={}),r=new Set,e=new URLSearchParams,u=()=>h||(h=new Promise(async(f,n)=>{await (a=m.createElement("script"));e.set("libraries",[...r]+"");for(k in g)e.set(k.replace(/[A-Z]/g,t=>"_"+t[0].toLowerCase()),g[k]);e.set("callback",c+".maps."+q);a.src=`https://maps.${c}apis.com/maps/api/js?`+e;d[q]=f;a.onerror=()=>h=n(Error(p+" could not load."));a.nonce=m.querySelector("script[nonce]")?.nonce||"";m.head.append(a)}));d[l]?console.warn(p+" only loads once. Ignoring:",g):d[l]=(f,...n)=>r.add(f)&&u().then(()=>d[l](f,...n))})({
    key: CONFIG.DEMO_KEY,
    v: "weekly",
});

const data = {};

let map;
let center =  { lat: -34.397, lng: 150.644 };

async function initMap() {
    const [{ Map, InfoWindow}, {ControlPosition}] = await Promise.all([
        google.maps.importLibrary("maps"),
        google.maps.importLibrary("core"),
    ]);

    map = new google.maps.Map(document.getElementById("map-container"), {
        center,
        zoom: 8,
        mapId: "DEMO_MAP_ID",
    });

    const textInput = document.getElementById('text-input');
    const textInputButton = document.getElementById('text-input-button');
    const card = document.getElementById('text-input-card');
    map.controls[ControlPosition.TOP_LEFT].push(card);

    textInputButton.addEventListener('click', () => {
        void findPlaces(textInput.value);
    });

    textInput.addEventListener('keydown', (event) => {
        if (event.key === 'Enter') {
            void findPlaces(textInput.value);
        }
    });

    infoWindow = new InfoWindow();
}

let markers = {};
let infoWindow;

async function findPlaces(query) {
    const [{ Place }, { AdvancedMarkerElement }] = await Promise.all([
        google.maps.importLibrary('places'),
        google.maps.importLibrary('marker'),
    ]);

    const request = {
        textQuery: query,
        fields: [
            'displayName',
            'location',
            'formattedAddress',
            'id',
            'nationalPhoneNumber',
            'primaryType','types'
        ],
        language: 'ko',
        maxResultCount: 8,
        minRating: 1, // Specify a minimum rating.
        region: 'jp',
    };

    const { places } = await Place.searchByText(request);

    if (places.length) {
        const { LatLngBounds } = await google.maps.importLibrary('core');
        const bounds = new LatLngBounds();

        // First remove all existing markers.
        for (const id in markers) {
            markers[id].map = null;
        }
        markers = {};

        // Loop through and get all the results.
        let firstPlace = places[0];
        selectPlace(firstPlace);
        $('#place').val(firstPlace.displayName);
        let memo = `
            id : ${firstPlace.id}\n
            latitude : ${firstPlace.location.toJSON().lat}\n
            longitude : ${firstPlace.location.toJSON().lng}\n
            주소 : ${firstPlace.formattedAddress}\n
            전화 번호 : ${firstPlace.nationalPhoneNumber}\n
            카테고리 (영어) : ${firstPlace.primaryType}\n
            type : ${firstPlace.types.join(', ')}\n
        `
        $('#memo').val(memo);

        places.forEach((place) => {

            const marker = new AdvancedMarkerElement({
                map,
                position: place.location,
                title: place.displayName,
                gmpClickable: true,
            });
            markers[place.id] = marker;

            marker.addEventListener('gmp-click', () => {
                selectPlace(place);

                map.panTo(place.location);
                updateInfoWindow(place.displayName, place.id, marker, memo);
            });

            if (place.location != null) {
                bounds.extend(place.location);
            }
        });

        map.fitBounds(bounds);
    } else {
        console.log('No results');
    }
}

// Helper function to create an info window.
function updateInfoWindow(title, content, anchor, memo) {
    infoWindow.setContent(content);
    infoWindow.setHeaderContent(title);
    infoWindow.open({
        map,
        anchor,
        shouldFocus: false,
    });

    $('#place').val(title);
    $('#memo').val(memo);
}

function selectPlace(place) {
    let locationJson = place.location.toJSON();

    data.spot_name = place.displayName;
    data.spot_address = place.formattedAddress;
    data.spot_latitude = locationJson.lat;
    data.spot_longitude = locationJson.lng;
    data.spot_spotcode = place.id;
    data.spot_phone = place.nationalPhoneNumber;
    data.spot_postal = place.formattedAddress.match(/\d+-\d+/)?.[0] || "";
    data.spot_category = place.primaryType;
    data.spot_subcategory = place.types.join(', ');

    console.log(data);
}

initMap();