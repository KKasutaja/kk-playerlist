$(function(){
    $(document).keydown(function (event) {
        var keycode = (event.keyCode ? event.keyCode : event.which);

        if (keycode == '27' || keycode == '36') {
            $.post('https://kk-playerlist/closeList', JSON.stringify({}));
        }
    }); 

    window.addEventListener('message', function(event) {
        if (event.data.action == 'open') {
            $('#players').html(''); $('#container').fadeIn()
            $('#player_count').text(statusCounter(event.data.data))
            
            $.each(event.data.data, function(k,v) {
                let pingColor = ''

                if (v.ping < 61) {
                    pingColor = 'text-green-800'
                } else if (v.ping > 60 && v.ping < 90) {
                    pingColor = 'text-yellow-800'
                } else if (v.ping >= 90) {
                    pingColor = 'text-red-800'
                }

                var item = `
                    <div class="px-2 py-1 text-center bg-gray-900 bg-opacity-50 text-gray-500 flex justify-between border-gray-700 border">
                        <div>${v.name}</div>
                        <div>${v.source}</div>
                        <div class="${pingColor}">${v.ping}</div>
                    </div>
                `

                if (v.me) {
                    item = `
                        <div class="px-2 py-1 text-center bg-gray-900 bg-opacity-50 text-gray-500 font-medium flex justify-between border-gray-700 border">
                            <div>${v.name}</div>
                            <div>${v.source}</div>
                            <div class="${pingColor}">${v.ping}</div>
                        </div>
                    `  
                }

                $('#players').append(item);
            });
        } else if (event.data.action == 'close') {
            $('#container').fadeOut()
        }
    });

    function statusCounter(inputs) {
		let counter = 0;

		for (const input of inputs) {
		  	counter += 1;
		}
		
		return counter;
	}
});