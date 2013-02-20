#if $os.path.isfile($webdir + "./header.tpl"):
#include $webdir + "./header.tpl"#
#else
#include $defaultwebdir + "./header.tpl"#
#end if


<div class="container">

    <div class="content maincontent">

        <div class="page-header page-title">
            <h1>
                 $show_id
                 <small>
                   $getVar('sb_name', 'SickBeard')
                   show details
                 </small>
            </h1>
        </div>

        <div id="notification_area"></div>

        <div class="well form-inline">
show info
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

#if $os.path.isfile($webdir + "./footer.tpl"):
#include $webdir + "./footer.tpl"#
#else
#include $defaultwebdir + "./footer.tpl"#
#end if
