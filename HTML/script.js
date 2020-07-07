$(document).ready(function(){

    window.addEventListener("message", function(event){
      if(event.data.update == true){
        setProgress(event.data.hunger,'.progress-hunger');
        setProgress(event.data.thirst,'.progress-thirst');
        setProgress(event.data.drunk,'.progress-drunk');
        setProgress(event.data.health,'.progress-health');
        setProgress(event.data.armor,'.progress-armor');
      }
    });
  
    // Functions
    // Update health/thirst bars
    function setProgress(percent, element){
      $(element).width(percent);
    }
    
  
  
  
  
  });