#if $os.path.isfile($webdir + "./header.tpl"):
#include $webdir + "./header.tpl"#
#else
#include $defaultwebdir + "./header.tpl"#
#end if


<div class="container">

    <div class="content maincontent">

        <div class="page-header page-title">
            <h1>
                 <span class="sickbeard_showname">Show details</span>
                 <small>
                   $getVar('sb_name', 'SickBeard')
                   show details
                 </small>
                 <span class="pull-right sickbeard_next_air"></span>
            </h1>
        </div>

        <div id="notification_area"></div>
        
        
        <div>
          <div>
          </div>
          <img src="/json/?which=sickbeard&action=getbanner&tvdbid=$show_id" class="img-rounded" />
        </div>
        

        <div class="" style="
        background:url('/json/?which=sickbeard&action=getbanner&tvdbid=$show_id') 100% 100% no-repeat;
              -webkit-background-size: cover; /*for webKit*/
        -moz-background-size: cover; /*Mozilla*/
        -o-background-size: cover; /*opera*/
        background-size: cover; /*generic*/
        ">
          <div class="" style="background:rgba(255, 255, 255, 0.8);">
          <h3>Show details</h3>
            <table class="table ">
              <tr>
                <td>Language</td><td class="sickbeard_language"/>
                <td>Status</td><td class="sickbeard_status"/>
              </tr>
              <tr>       
                <td>Airs</td><td class="sickbeard_airs"/>
                <td>Network</td><td class="sickbeard_network"/>
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
