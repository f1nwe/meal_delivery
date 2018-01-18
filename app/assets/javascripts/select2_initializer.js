function init_select2(){
  $( ".select2" ).select2({
    theme: "bootstrap",
  });
  $( ".select2-singular" ).select2({
    theme: "bootstrap",
    maximumSelectionLength: 1
  });
}
