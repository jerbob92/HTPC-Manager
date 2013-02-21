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
      $('.sickbeard_status').html(sickbeardStatusLabel(data.status));
      $('.sickbeard_network').html(data.network);
      $('.sickbeard_location').html(data.location);
      $('.sickbeard_airs').html(data.airs);
      if (data.next_ep_airdate != '') {
        $('.sickbeard_next_air').html('Next: '+sickbeardFormatDate(data.next_ep_airdate));
      }
      
      renderSeasonTabs(showid, data.season_list);
    },
    error: function(){
      alert('Error while loading show');
    },
    complete: function(){
      unblockPage();
    }
  });
}

function renderSeasonTabs(showid, seasons){
  list = $('#season-list');
  list.html('');
  
  $.each(seasons, function(index, seasonNr){
    var label = seasonNr;
    
    // Specials are marked as season 0
    if (label == 0) {
      label = 'Specials';
    }
    var pill = $('<li>').append(
      $('<a>')
        .text(label)
        .attr('href', '#'+seasonNr)
        .attr('data-season', seasonNr)
        .attr('data-showid', showid)
    );

    list.append(pill);
  });
  list.find('a').on('click', renderSeason);
  
  // Trigger latest season
 list.find('li:first-child a').trigger('click');
}

function renderSeason(){
  $('#season-list li').removeClass('active');
  $(this).parent().addClass("active");
  
  showid = $(this).attr('data-showid');
  season = $(this).attr('data-season');  
  
  $.ajax({
    url: '/json/?which=sickbeard&action=getseason&tvdbid=' + showid + '&season=' + season,
    type: 'get',
    dataType: 'json',
    success: function(data){
      var seasonContent = $('#season-content');
      seasonContent.html(''); // Clear table contents before inserting new rows
      
      // If result is not 'succes' it must be a failure
      if (data.result != 'success') {
        notifyError('Error', 'This is not a vaid season for this show');
        return;
      }
      
      // Loop through data
      $.each(data.data, function(index, value){
        var row = $('<tr>');
        row.append(
          $('<td>').text(index),
          $('<td>').text(value.name),
          $('<td>').text(sickbeardFormatDate(value.airdate)),
          $('<td>').html(sickbeardStatusLabel(value.status)),
          $('<td>').text(value.quality)
        );
        seasonContent.append(row);
      }); // end loop
      
      // Trigger tableSort update
      seasonContent.parent().trigger("update"); 
      seasonContent.parent().trigger("sorton",[[[0,1]]]); 
    },
    error: function(){
      alert('Error while loading season');
    },
    complete: function(){

    }
  });


}