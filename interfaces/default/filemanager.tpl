#if $os.path.isfile($webdir):
#include $webdir + "./header.tpl"#
#else
#include $defaultwebdir + "./header.tpl"#
#end if


<div class="container">

    <div class="content maincontent">

        <div class="page-header page-title">
            <h1>
                $getVar('filemanager', 'Filemanager') <small id="path-info"></small>
            </h1>
        </div>

        <table class="table table-striped table-sortable">
            <thead>
            <tr>
                <th class="span1 {sorter: false}">&nbsp;</th>
                <th>Path</th>
                <th class="span1 {sorter: false}">&nbsp;</th>
            </tr>
            </thead>
            <tbody id="filemanager_table_body">

            </tbody>
        </table>

    </div>

</div>

#if $os.path.isfile($webdir):
#include $webdir + "./footer.tpl"#
#else
#include $defaultwebdir + "./footer.tpl"#
#end if
