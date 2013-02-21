function loadShowData(showid){
  blockPage('Loading show details...', '<img src="/img/loader.gif" />');
  $.ajax({
    url: '/json/?which=sickbeard&action=getshow&tvdbid=' + showid,
    type: 'get',
    dataType: 'json',
    success: function(data){
      if (data.result != 'success') {
        notifyError('Error', 'The show with id <b>'+showid+'</b> could not be found.');
        return;
      }
      data = data.data;
      $('.sickbeard_showname').html(data.show_name);
      $('.sickbeard_status').html(data.status);
      $('.sickbeard_network').html(data.network);
      $('.sickbeard_location').html(data.location);
      $('.sickbeard_airs').html(data.airs);
      if (data.next_ep_airdate != '') {
        $('.sickbeard_next_air').html('Next: '+sickbeardFormatDate(data.next_ep_airdate));
      }
    },
    error: function(){
      alert('Error while loading show');
    },
    complete: function(){
      unblockPage();
    }
  });
}