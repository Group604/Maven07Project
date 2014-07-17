 var lng=25.774252,lat=-80.190262;    
    if(!navigator.geolocation)
    {
        alert("geolocation not supported");
    }
    else
    {
        navigator.geolocation.getCurrentPosition(success,error);
    }        
    function success(position) {
        lng = position.coords.longitude;
        lat = position.coords.latitude;
        
        showMap(document.getElementById('divStore'),lng,lat);        
    }        
    function showMap(div,lng,lat)
    {
        var cpos = new google.maps.LatLng(lat,lng);
        
        var opt = {
            zoom:  18,
            center : cpos,
             mapTypeId: google.maps.MapTypeId.ROADMAP
        }        
        var map = new google.maps.Map(div,opt);
        map.setTilt(0);        
        var marker = new google.maps.Marker(
        {
            position: cpos ,
            tittle : "divStore"
        });
        marker.setMap(map);
    }
    
    function error(error){
            alert(error.code);
    }
    