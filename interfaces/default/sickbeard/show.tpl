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
          <div class="span8"></div>
          <div class="show_details span4">
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
          </div>
        </div>

        <ul class="nav nav-tabs">
            <li class="active"><a href="#tvshows" data-toggle="tab">TV Shows</a></li>
            <li><a href="#nextaired" data-toggle="tab">Next aired</a></li>
            <li><a href="#history" data-toggle="tab">History</a></li>
            <li><a href="#log" data-toggle="tab">Log</a></li>
        </ul>

        <div class="tab-content">

            <div id="tvshows" class="tab-pane active">

                <table class="table table-striped table-sortable">
                    <thead>
                    <tr>
                        <th>Showname</th>
                        <th>Status</th>
                        <th>Next ep</th>
                        <th>Network</th>
                        <th>Quality</th>
                        <th class="{sorter: false}">&nbsp;</th>
                    </tr>
                    </thead>
                    <tbody id="tvshows_table_body">

                    </tbody>
                </table>

            </div>

            <div id="nextaired" class="tab-pane">

                <table class="table table-striped table-sortable">
                    <thead>
                    <tr>
                        <th>Showname</th>
                        <th>Episode</th>
                        <th>Airdate</th>
                        <th class="{sorter: false}">&nbsp;</th>
                    </tr>
                    </thead>
                    <tbody id="nextaired_table_body">

                    </tbody>
                </table>

            </div>

            <div id="history" class="tab-pane">

                <table class="table table-striped table-sortable">
                    <thead>
                    <tr>
                        <th>Date</th>
                        <th>Showname</th>
                        <th>Episode</th>
                        <th>Status</th>
                        <th>Quality</th>
                    </tr>
                    </thead>
                    <tbody id="history_table_body">

                    </tbody>
                </table>
            </div>

            <div id="log" class="tab-pane">

                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>Logitem</th>
                    </tr>
                    </thead>
                    <tbody id="log_table_body">

                    </tbody>
                </table>
            </div>

        </div>
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
