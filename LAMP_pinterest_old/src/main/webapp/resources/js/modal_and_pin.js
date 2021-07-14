/**
 * 
 */
const add_pin_modal = document.querySelector('.add_pin_modal');

document.querySelector('.add_pin').addEventListener('click', () => {
    add_pin_modal.style.opacity = 1;
    add_pin_modal.style.pointerEvents = 'all';
});

document.querySelector('.add_pin_modal').addEventListener('click', event => {
    if (event.target === add_pin_modal) {
        reset_modal();
    }
});

let pin_image_blob = null;

document.querySelector('#upload_img').addEventListener('change', event => {

	console.log(event);
    if (event.target.files && event.target.files[0]) {
        if (/image\/*/.test(event.target.files[0].type)) {
            const reader = new FileReader();

            reader.onload = function () {
                const new_image = new Image();

                new_image.src = reader.result;
                pin_image_blob = reader.result;

                new_image.onload = function () {
                    const modals_pin = document.querySelector('.add_pin_modal .modals_pin');

                    new_image.classList.add('pin_max_width');

                    document.querySelector('.add_pin_modal .pin_image').appendChild(new_image);
                    document.querySelector('#upload_img_label').style.display = 'none';

                    modals_pin.style.display = 'block';

                    if (
                        new_image.getBoundingClientRect().width < new_image.parentElement.getBoundingClientRect().width ||
                        new_image.getBoundingClientRect().height < new_image.parentElement.getBoundingClientRect().height
                    ) {
                        new_image.classList.remove('pin_max_width');
                        new_image.classList.add('pin_max_height');
                    }

                    modals_pin.style.opacity = 1;
                }
            }

            reader.readAsDataURL(event.target.files[0]);
        }
    }

    document.querySelector('#upload_img').value = '';
});

document.querySelector('.save_pin').addEventListener('click', () => {
     
   	const users_data = {
        pin_title: document.querySelector('#pin_title').value,
        pin_description: document.querySelector('#pin_description').value,
        upload_img: pin_image_blob,
        pin_size: document.querySelector('#pin_size').value
    }
    
    //console.log(users_data);
    
	create_pin(users_data);
    
	reset_modal();
});


function create_pin(pin_details) {

    const new_pin = document.createElement('DIV');
    const new_image = new Image();
   
    new_image.src = pin_details.upload_img;
    new_pin.style.opacity = 0;
    
    console.log(new_image);
    console.log(new_pin);
	
    new_image.onload = function () {
    	
        new_pin.classList.add('card');
        
        new_pin.classList.add(`card_${pin_details.pin_size}`);
       
        new_image.classList.add('pin_max_width');
        
        console.log("new_image.onload");
        console.log(new_image);
		console.log(new_pin);
		console.log(new_pin.classList);
		
	

        new_pin.innerHTML = `<div class="pin_title">${pin_details.title}</div>
<div class="pin_modal">
    <div class="modal_head">
       
    </div>
    <div class="modal_foot">
        
    </div>
</div>
<div class="pin_image">
</div>`;

        document.querySelector('.pin_container').appendChild(new_pin);
        new_pin.children[2].appendChild(new_image);

        if (
            new_image.getBoundingClientRect().width < new_image.parentElement.getBoundingClientRect().width ||
            new_image.getBoundingClientRect().height < new_image.parentElement.getBoundingClientRect().height
        ) {
            new_image.classList.remove('pin_max_width');
            new_image.classList.add('pin_max_height');
        }

        new_pin.style.opacity = 1;
    }
    
	
	const pin_title = $("#pin_title").val();
    const pin_description = $("#pin_description").val();
	const upload_img = $("#upload_img").val();
    const pin_size = $("#pin_size").val();
    
    $.ajax({
		url : "/galleryWrite",
		type : "get",
		data : {
 		 pin_title : pin_title,
   		 pin_description : pin_description,
   		 upload_img : pin_image_blob,
  		  pin_size : pin_size
		},
		dataType : "json",
		success : function(data){
		console.log(data);
		},
		error : function(e){
		console.log(e);
		}
		});
		//console.log("저장까지 됨");
}


function reset_modal() {
    const modals_pin = document.querySelector('.add_pin_modal .modals_pin');

    add_pin_modal.style.opacity = 0;
    add_pin_modal.style.pointerEvents = 'none';
    document.querySelector('#upload_img_label').style.display = 'block';
    modals_pin.style.display = 'none';
    modals_pin.style.opacity = 0;

    if (modals_pin.children[0].children[0]) modals_pin.children[0].removeChild(modals_pin.children[0].children[0]);
    document.querySelector('#pin_title').value = '';
    document.querySelector('#pin_description').value = '';
   
    document.querySelector('#pin_size').value = '';
    pin_image_blob = null;
} 