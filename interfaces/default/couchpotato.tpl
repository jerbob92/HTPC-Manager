#if $os.path.isfile($webdir + "./header.tpl"):
#include $webdir + "./header.tpl"#
#else
#include $defaultwebdir + "./header.tpl"#
#end if

<div class="container">

    <div class="content maincontent">

        <div class="page-header page-title">
            <h1>
                $getVar('cp_name', 'CouchPotato')
            </h1>
        </div>

        <div id="notification_area"></div>

        <div class="well form-inline">
            <input class="span6" id="search_movie_name" name="search_movie_name" type="text" />
            <button class="btn btn-success" type="button" id="search_movie_button"><i class="icon-search icon-white"></i> Search movie</button>
        </div>

        <ul class="nav nav-tabs">
            <li class="active"><a href="#wanted" data-toggle="tab">Wanted</a></li>

        </ul>

        <div class="tab-content">

            <div id="wanted" class="tab-pane active">

                <table class="table table-striped">
                    <tbody id="movies_table_body">

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
