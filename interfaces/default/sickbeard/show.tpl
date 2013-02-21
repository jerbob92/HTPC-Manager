#if $os.path.isfile($webdir + "./header.tpl"):
#include $webdir + "./header.tpl"#
#else
#include $defaultwebdir + "./header.tpl"#
#end if


<div class="container sickbeard_show">

    <div class="content maincontent">

        <div class="page-header page-title">
            <h1>
                 <span class="sickbeard_showname">Show</span> 
                 <small>
                   Details
                 </small>
            </h1>
        </div>
        <ul class="breadcrumb">
          <li><a href="/">Home</a> <span class="divider">/</span></li>
          <li><a href="/sickbeard">$getVar('sb_name', 'SickBeard')</a> <span class="divider">/</span></li>
          <li class="active sickbeard_showname">Show details</li>
        </ul>

        <div id="notification_area"></div>

        <div class="row-fluid banner" style="background-image:url(/json/?which=sickbeard&action=getbanner&tvdbid=$show_id);">
          <div class="span8" style="min-height: 0px;"></div>
          <div class="show_details span4 pull-right">
              <div id="show_details_top" class="span4"></div>
              <strong>Show details</strong>
                <table class="table table-condensed">
                  <tr>
                   <td>Next episode</td><td class="sickbeard_next_air"/>
                  </tr>
                  <tr>
                    <td>Network</td><td class="sickbeard_network"/>
                  </tr>
                  <tr>
                    <td>Status</td><td class="sickbeard_status"/>
                  </tr>
                  <tr>       
                    <td>Airs</td><td class="sickbeard_airs"/>
                  </tr>
                  <tr>
                   <td>Location</td><td class="sickbeard_location"/>
                  </tr>
                </table>
                <div id="show_details_bottom" class="span4"></div>
          </div>
        </div>

        <div class="page-header">
            <h2>Seasons</h2>
        </div>  
        <ul class="nav nav-pills" id="season-list"></ul>
        
        <table class="table table-striped table-condensed table-sortable">
          <thead>
            <tr>
              <th>Episode</th>
              <th>Name</th>
              <th>Airdate</th>
              <th>status</th>
              <th>Quality</th>
            </tr>
          </thead>
          
          <tbody id="season-content">
          </tbody>
        </table>
        
    </div>
</div>
<script type="text/javascript">
jQuery(document).ready(function () {
  loadShowData($show_id);
});
</script>

#if $os.path.isfile($webdir + "./footer.tpl"):
#include $webdir + "./footer.tpl"#
#else
#include $defaultwebdir + "./footer.tpl"#
#end if
