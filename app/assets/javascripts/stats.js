$(function() {
    function count($this){
        var current = parseInt($this.html(), 10);
        $this.html(++current);
        if(current !== $this.data('count')){
            setTimeout(function(){count($this)}, 30);
        }
    }
  $("span.count").each(function() {
      $(this).data('count', parseInt($(this).html(), 10));
      $(this).html('0');
      count($(this));
  });
});
