re.scene('load')
.enter(function(){
  
  re.tile.sizeX = re.tile.sizeY = 25;
  
  re.main().clearColor = '#D6F8FA';
  
  //setup gravity
  re.force.graY = 30 * re.main().stepSize;
  
  re.load(re.assets)
  .complete(function(){
    
    //move to home
    re.scene('home').enter();
  })
  .error(function(e){
    
  })
  .progress(function(i){
    
  });
  
})
.exit(function(){
  //exit load scene
});