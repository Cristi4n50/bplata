$(document).on("ready", main);

function main(){
	
	$("#Inicio").on("click", abrirInicio);
	$("#Registro").on("click", abrirRegistro);
	$("#Cerrarl").on("click", cerrarInicio);
	$("#Cerrarr").on("click", cerrarRegistro);
	$(document).keypress(function(event){
	if (event.which == 0) {
		cerrarRegistro();
		cerrarInicio();
	};  
	})
	$('#comp').click(function(){
		$('#comp').css ('background-image', 'url(assets/comprayvendelogosmall.png)');
		$('#Container1').css ('background-image', 'url(assets/wallpaper_nine.jpg)');
		$('#como').css ('background-image', 'url(#)');
		$('#qui').css ('background-image', 'url(#)');
		$('#ques').css ('background-image', 'url(#)');
		$('#contact').css ('background-image', 'url(#)');
		$('#security').css ('background-image', 'url(#)');
		$('#terminos').css ('background-image', 'url(#)');
		$('#div1').css('display', 'none');
		$('#div3').css('display', 'none');
		$('#div4').css('display', 'none');
		$('#div2').css('display', 'block');
		$('#div5').css('display', 'none');
		$('#div6').css('display', 'none');
		$('#div7').css('display', 'none');
	})
	$('#como').click(function(){
		$('#como').css ('background-image', 'url(assets/comohacerlologosmall.png)');
		$('#Container1').css ('background-image', 'url(assets/wallpaper_seven.jpg)');
		$('#qui').css ('background-image', 'url(#)');
		$('#comp').css ('background-image', 'url(#)');
		$('#ques').css ('background-image', 'url(#)');
		$('#contact').css ('background-image', 'url(#)');
		$('#security').css ('background-image', 'url(#)');
		$('#terminos').css ('background-image', 'url(#)');
		$('#div1').css('display', 'none');
		$('#div2').css('display', 'none');
		$('#div4').css('display', 'none');
		$('#div3').css('display', 'block');
		$('#div5').css('display', 'none');
		$('#div6').css('display', 'none');
		$('#div7').css('display', 'none');
	})
	$('#qui').click(function(){
		$('#qui').css ('background-image', 'url(assets/activerightmenu.png)');
		$('#Container1').css ('background-image', 'url(assets/wallpaper_eight.jpg)');
		$('#como').css ('background-image', 'url(#)');
		$('#comp').css ('background-image', 'url(#)');
		$('#ques').css ('background-image', 'url(#)');
		$('#contact').css ('background-image', 'url(#)');
		$('#security').css ('background-image', 'url(#)');
		$('#terminos').css ('background-image', 'url(#)');
		$('#div1').css('display', 'none');
		$('#div2').css('display', 'none');
		$('#div3').css('display', 'none');
		$('#div4').css('display', 'block');
		$('#div5').css('display', 'none');
		$('#div6').css('display', 'none');
		$('#div7').css('display', 'none');
	})
	$('#ques').click(function(){
		$('#ques').css ('background-image', 'url(assets/qesbitcoinslogosmall.png)');
		$('#Container1').css ('background-image', 'url(assets/wallpaper_seven.jpg)');
		$('#qui').css ('background-image', 'url(#)');
		$('#como').css ('background-image', 'url(#)');
		$('#comp').css ('background-image', 'url(#)');
		$('#contact').css ('background-image', 'url(#)');
		$('#security').css ('background-image', 'url(#)');
		$('#terminos').css ('background-image', 'url(#)');
		$('#div2').css('display', 'none');
		$('#div3').css('display', 'none');
		$('#div4').css('display', 'none');
		$('#div1').css('display', 'block');
		$('#div5').css('display', 'none');
		$('#div6').css('display', 'none');
		$('#div7').css('display', 'none');
	})

	$('#security').click(function(){
		$('#security').css ('background-image', 'url(assets/qesbitcoinslogosmall.png)');
		$('#Container1').css ('background-image', 'url(assets/wallpaper_six.jpg)');
		$('#qui').css ('background-image', 'url(#)');
		$('#como').css ('background-image', 'url(#)');
		$('#comp').css ('background-image', 'url(#)');
		$('#ques').css ('background-image', 'url(#)');
		$('#contact').css ('background-image', 'url(#)');
		$('#terminos').css ('background-image', 'url(#)');
		$('#div2').css('display', 'none');
		$('#div3').css('display', 'none');
		$('#div4').css('display', 'none');
		$('#div1').css('display', 'none');
		$('#div5').css('display', 'block');
		$('#div6').css('display', 'none');
		$('#div7').css('display', 'none');
	})

	$('#contact').click(function(){
		$('#contact').css ('background-image', 'url(assets/qesbitcoinslogosmall.png)');
		$('#Container1').css ('background-image', 'url(assets/wallpaper_three.jpg)');
		$('#qui').css ('background-image', 'url(#)');
		$('#como').css ('background-image', 'url(#)');
		$('#comp').css ('background-image', 'url(#)');
		$('#ques').css ('background-image', 'url(#)');
		$('#security').css ('background-image', 'url(#)');
		$('#terminos').css ('background-image', 'url(#)');
		$('#div2').css('display', 'none');
		$('#div3').css('display', 'none');
		$('#div4').css('display', 'none');
		$('#div1').css('display', 'none');
		$('#div5').css('display', 'none');
		$('#div6').css('display', 'block');
		$('#div7').css('display', 'none');
	})

	$('#terminos').click(function(){
		$('#terminos').css ('background-image', 'url(assets/qesbitcoinslogosmall.png)');
		$('#Container1').css ('background-image', 'url(assets/wallpaper_two.jpg)');
		$('#qui').css ('background-image', 'url(#)');
		$('#como').css ('background-image', 'url(#)');
		$('#comp').css ('background-image', 'url(#)');
		$('#ques').css ('background-image', 'url(#)');
		$('#security').css ('background-image', 'url(#)');
		$('#contact').css ('background-image', 'url(#)');
		$('#div2').css('display', 'none');
		$('#div3').css('display', 'none');
		$('#div4').css('display', 'none');
		$('#div1').css('display', 'none');
		$('#div5').css('display', 'none');
		$('#div6').css('display', 'none');
		$('#div7').css('display', 'block');
	})
}

function abrirInicio(){
	
	$("#ContPreview").fadeIn();
}

function cerrarInicio(){
	
	$("#ContPreview").fadeOut();
}

function abrirRegistro(){
	
	$("#ContPreviewR").fadeIn();
}

function cerrarRegistro(){
	
	$("#ContPreviewR").fadeOut();
}


	
