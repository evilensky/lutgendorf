function customSlider (element, value_array) {


  var rangeFloor = parseInt($(element).attr('min'));
  var rangeCeil = parseInt($(element).attr('max'));

  var midRange;
  
  if((rangeCeil - rangeFloor)%2 == 0){
    midRange = (rangeCeil - rangeFloor)/2;
  }
  else{
    midRange = Math.ceil((Math.floor(rangeCeil - rangeFloor)/2 + Math.ceil(rangeCeil - rangeFloor)/2)/ 2);
  }
  $(element).wrap('<div class="slider-container"><div class="slider"></div></div>');
  $(element).parent().prepend('<output class="rangevalue" id="'+$(element).attr('name')+'" for="'+$(element).attr('name')+'"></output>');

 
  $(element).change(function () {
    if(value_array){
      $(this).prev().val(semanticTranslation(Math.floor($(this).val()), value_array));
    }
    else{
      $(this).prev().val(Math.floor($(this).val()));
    }
  });

  if(value_array){
    $('[for="'+$(element).attr("name")+'"]').text(semanticTranslation(midRange, value_array)).css('width', '20%');
  }
  else{
    $('[for="'+$(element).attr("name")+'"]').text(midRange);
  }

}

function semanticTranslation (integer, schema) {
  return schema[integer];
} 