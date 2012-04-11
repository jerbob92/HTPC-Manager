#include $webdir + "/header.tpl"#

<div class="container">

    <div class="content maincontent">

        <div class="page-header page-title">
            <h1>Settings</h1>
        </div>

        #if $getVar('noresizer_found', 0) == 1
        <div class="alert alert-block"><strong>Warning: </strong>Failed to resize thumbnails. This can be slow on some browsers. For more information and a solution on how to fix this visit <a href="http://htpcmanager.org/#faq" target="_blank">http://htpcmanager.org/#faq</a></div>
        #end if

        <ul class="nav nav-tabs">
            <li class="active"><a href="#data" data-toggle="tab">General setting</a></li>
            <li><a href="#miscellaneous" data-toggle="tab">Miscellaneous</a></li>
            <li><a href="#search" data-toggle="tab">NZB Search</a></li>
            <li><a href="#filemanager" data-toggle="tab">Filemanager</a></li>
        </ul>

        <form action="" id="base-settings-form" name="base-settings-form" method="post" class="form-horizontal">
            <input type="hidden" name="save_settings" value="1" />

            <div class="tab-content">
                <div id="data" class="tab-pane active" >
                        <fieldset>
                            <legend>HTPC-Manager</legend>
                            <div class="control-group">
                                <label class="control-label" for="my_port">Port</label>
                                <div class="controls">
                                    <input class="span1" id="my_port" name="my_port" type="text" value="$getVar('my_port', '8084')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="my_username">Username</label>
                                <div class="controls">
                                    <input class="span3" id="my_username" name="my_username" type="text" value="$getVar('my_username', '')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="my_password">Password</label>
                                <div class="controls">
                                    <input class="span3" autocomplete="off" id="my_password" name="my_password" type="password" value="$getVar('my_password', '')" />
                                </div>
                            </div>
                        </fieldset>

                        <fieldset>
                            <legend>SABnzbd</legend>
                            <div class="control-group">
                                <label class="control-label">Enable</label>
                                <div class="controls">
                                    <label class="checkbox enable-module">
                                        #if $getVar('use_nzb', 'no') == "yes"
                                        <input type="checkbox" checked="checked" value="yes" name="use_nzb" />
                                        #else
                                        <input type="checkbox" value="yes" name="use_nzb" />
                                        #end if
                                    </label>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="nzb_name">Menu Name</label>
                                <div class="controls">
                                    <input class="span3" id="nzb_name" name="nzb_name" type="text" value="$getVar('nzb_name', 'SABnzbd')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="nzb_ip">IP / Host</label>
                                <div class="controls">
                                    <input class="span3" id="nzb_ip" name="nzb_ip" type="text" value="$getVar('nzb_ip', '')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="nzb_username">Username</label>
                                <div class="controls">
                                    <input class="span3" id="nzb_username" name="nzb_username" type="text" value="$getVar('nzb_username', '')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="nzb_password">Password</label>
                                <div class="controls">
                                    <input class="span3" id="nzb_password" name="nzb_password" type="password" value="$getVar('nzb_password', '')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="nzb_port">Port</label>
                                <div class="controls">
                                    <input class="span1" id="nzb_port" name="nzb_port" type="text" value="$getVar('nzb_port', '')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="nzb_apikey">API Key</label>
                                <div class="controls">
                                    <input class="span6" id="nzb_apikey" name="nzb_apikey" type="text" value="$getVar('nzb_apikey', '')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">SSL</label>
                                <div class="controls">
                                    <label class="radio">
                                        #if $getVar('nzb_ssl', 'no') == "no"
                                        <input type="radio" checked="checked" value="no" name="nzb_ssl" /> No
                                        #else
                                        <input type="radio" checked="" value="no" name="nzb_ssl" /> No
                                        #end if
                                    </label>
                                    <label class="radio">
                                        #if $getVar('nzb_ssl', 'no') == "yes"
                                        <input type="radio" checked="checked" value="yes" name="nzb_ssl" /> Yes
                                        #else
                                        <input type="radio" value="yes" name="nzb_ssl" /> Yes
                                        #end if
                                    </label>
                                </div>
                            </div>
                        </fieldset>

                        <fieldset>
                            <legend>SickBeard</legend>
                            <div class="control-group">
                                <label class="control-label">Enable</label>
                                <div class="controls">
                                    <label class="checkbox enable-module">
                                        #if $getVar('use_sb', 'no') == "yes"
                                        <input type="checkbox" checked="checked" value="yes" name="use_sb" />
                                        #else
                                        <input type="checkbox" value="yes" name="use_sb" />
                                        #end if
                                    </label>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="sb_name">Menu Name</label>
                                <div class="controls">
                                    <input class="span3" id="sb_name" name="sb_name" type="text" value="$getVar('sb_name', 'SickBeard')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="sb_ip">IP / Host</label>
                                <div class="controls">
                                    <input class="span3" id="sb_ip" name="sb_ip" type="text" value="$getVar('sb_ip', '')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="sb_username">Username</label>
                                <div class="controls">
                                    <input class="span3" id="sb_username" name="sb_username" type="text" value="$getVar('sb_username', '')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="sb_password">Password</label>
                                <div class="controls">
                                    <input class="span3" id="sb_password" name="sb_password" type="password" value="$getVar('sb_password', '')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="sb_port">Port</label>
                                <div class="controls">
                                    <input class="span1" id="sb_port" name="sb_port" type="text" value="$getVar('sb_port', '')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="sb_apikey">API Key</label>
                                <div class="controls">
                                    <input class="span6" id="sb_apikey" name="sb_apikey" type="text" value="$getVar('sb_apikey', '')" />
                                </div>
                            </div>
                        </fieldset>

                        <fieldset>
                            <legend>CouchPotato V2</legend>
                            <div class="control-group">
                                <label class="control-label">Enable</label>
                                <div class="controls">
                                    <label class="checkbox enable-module">
                                        #if $getVar('use_cp', 'no') == "yes"
                                        <input type="checkbox" checked="checked" value="yes" name="use_cp" />
                                        #else
                                        <input type="checkbox" value="yes" name="use_cp" />
                                        #end if
                                    </label>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="cp_name">Menu Name</label>
                                <div class="controls">
                                    <input class="span3" id="cp_name" name="cp_name" type="text" value="$getVar('cp_name', 'CouchPotato')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="cp_ip">IP / Host</label>
                                <div class="controls">
                                    <input class="span3" id="cp_ip" name="cp_ip" type="text" value="$getVar('cp_ip', '')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="cp_username">Username</label>
                                <div class="controls">
                                    <input class="span3" id="cp_username" name="cp_username" type="text" value="$getVar('cp_username', '')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="cp_password">Password</label>
                                <div class="controls">
                                    <input class="span3" id="cp_password" name="cp_password" type="password" value="$getVar('cp_password', '')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="cp_port">Port</label>
                                <div class="controls">
                                    <input class="span1" id="cp_port" name="cp_port" type="text" value="$getVar('cp_port', '')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="sb_apikey">API Key</label>
                                <div class="controls">
                                    <input class="span6" id="cp_apikey" name="cp_apikey" type="text" value="$getVar('cp_apikey', '')" />
                                </div>
                            </div>
                        </fieldset>

                        <fieldset>
                            <legend>XBMC</legend>
                            <div class="control-group">
                                <label class="control-label">Enable</label>
                                <div class="controls">
                                    <label class="checkbox enable-module">
                                        #if $getVar('use_xbmc', 'no') == "yes"
                                        <input type="checkbox" checked="checked" value="yes" name="use_xbmc" />
                                        #else
                                        <input type="checkbox" value="yes" name="use_xbmc" />
                                        #end if
                                    </label>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="xbmc_name">Menu Name</label>
                                <div class="controls">
                                    <input class="span3" id="xbmc_name" name="xbmc_name" type="text" value="$getVar('xbmc_name', 'XBMC')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="xbmc_ip">IP / Host</label>
                                <div class="controls">
                                    <input class="span3" id="xbmc_ip" name="xbmc_ip" type="text" value="$getVar('xbmc_ip', '')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="xbmc_username">Username</label>
                                <div class="controls">
                                    <input class="span3" id="xbmc_username" name="xbmc_username" type="text" value="$getVar('xbmc_username', '')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="xbmc_password">Password</label>
                                <div class="controls">
                                    <input class="span3" id="xbmc_password" name="xbmc_password" type="password" value="$getVar('xbmc_password', '')" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="xbmc_port">Port</label>
                                <div class="controls">
                                    <input class="span1" id="xbmc_port" name="xbmc_port" type="text" value="$getVar('xbmc_port', '')" />
                                </div>
                            </div>
                        </fieldset>

                        <div class="form-actions">
                            <input class="btn btn-primary" type="submit" value="Save changes" />
                            <input class="btn" type="reset" value="Clear" />
                        </div>

                </div>

                <div id="miscellaneous" class="tab-pane" >
                        <fieldset>
                            <legend>Thumbnails</legend>
                            <div class="control-group">
                                <label class="control-label" for="regenerate_thumbs">Regenerate thumbnails</label>
                                <div class="controls">
                                    <input type="checkbox" value="yes" name="regenerate_thumbs" id="regenerate_thumbs" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Banners for TV Shows</label>
                                <div class="controls">
                                    <label class="checkbox">
                                        #if $getVar('xbmc_show_banners', 'no') == "yes"
                                        <input type="checkbox" checked="checked" value="yes" name="xbmc_show_banners" />
                                        #else
                                        <input type="checkbox" value="yes" name="xbmc_show_banners" />
                                        #end if
                                    </label>
                                </div>
                            </div>
                        </fieldset>

                        <fieldset>
                            <legend>Options</legend>
                            <div class="control-group">
                                <label class="control-label">Sorting ignore articles (When possible)</label>
                                <div class="controls">
                                    <label class="checkbox">
                                        #if $getVar('sort_ignore_articles', 'no') == "yes"
                                        <input type="checkbox" checked="checked" value="yes" name="sort_ignore_articles" />
                                        #else
                                        <input type="checkbox" value="yes" name="sort_ignore_articles" />
                                        #end if
                                    </label>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="xbmc_scroll_limit">XBMC scroll limit</label>
                                <div class="controls">
                                    <input class="span1" id="xbmc_scroll_limit" name="xbmc_scroll_limit" type="text" value="$getVar('xbmc_scroll_limit', '0')" />
                                    <span class="help-inline">To show all enter '0'</span>
                                </div>
                            </div>
                        </fieldset>

                        <div class="form-actions">
                            <input class="btn btn-primary" type="submit" value="Save changes" />
                            <input class="btn" type="reset" value="Clear" />
                        </div>
                </div>

                <div id="search" class="tab-pane" >
                    <fieldset>
                        <legend>NZB Matrix</legend>
                        <div class="control-group">
                            <label class="control-label">Enable</label>
                            <div class="controls">
                                <label class="checkbox enable-module">
                                    #if $getVar('use_nzbmatrix', 'no') == "yes"
                                    <input type="checkbox" checked="checked" value="yes" name="use_nzbmatrix" />
                                    #else
                                    <input type="checkbox" value="yes" name="use_nzbmatrix" />
                                    #end if
                                </label>
                            </div>
                        </div>
                        <div class="control-group">
                                <label class="control-label" for="nzbmatrix_name">Menu Name</label>
                                <div class="controls">
                                    <input class="span3" id="nzbmatrix_name" name="nzbmatrix_name" type="text" value="$getVar('nzbmatrix_name', 'NZB Search')" />
                                </div>
                            </div>
                        <div class="control-group">
                            <label class="control-label" for="nzbmatrix_apikey">API Key</label>
                            <div class="controls">
                                <input class="span6" id="nzbmatrix_apikey" name="nzbmatrix_apikey" type="text" value="$getVar('nzbmatrix_apikey', '')" />
                            </div>
                        </div>
                    </fieldset>

                    <div class="form-actions">
                        <input class="btn btn-primary" type="submit" value="Save changes" />
                        <input class="btn" type="reset" value="Clear" />
                    </div>

                </div>
                <div id="filemanager" class="tab-pane" >
                    <fieldset>
                        <legend>Enabled paths</legend>
                        <div class="control-group">
                            <label class="control-label">Enable</label>
                                <div class="controls">
                                    <label class="checkbox enable-module">
                                        #if $getVar('use_filemanger', 'no') == "yes"
                                        <input type="checkbox" checked="checked" value="yes" name="use_filemanger" />
                                        #else
                                        <input type="checkbox" value="yes" name="use_filemanger" />
                                        #end if
                                    </label>
                                </div>
                            </div>
                        <div class="control-group">
                            <label class="control-label" for="filemanager">Menu Name</label>
                            <div class="controls">
                                <input class="span3" id="filemanager" name="filemanager" type="text" value="$getVar('filemanager', 'File Manager')" />
                            </div>
                        </div>
                        #for $path in $availpaths
                        <div class="control-group">
                            <label class="control-label">$path</label>
                            <div class="controls">
                                <label class="checkbox">
                                    #if $getVar('paths__' + $path.lower(), 'no') == "yes"
                                    <input type="checkbox" checked="checked" value="yes" name="paths__$path" />
                                    #else
                                    <input type="checkbox" value="yes" name="paths__$path" />
                                    #end if
                                </label>
                            </div>
                        </div>
                        #end for
                    </fieldset>

                    <div class="form-actions">
                        <input class="btn btn-primary" type="submit" value="Save changes" />
                        <input class="btn" type="reset" value="Clear" />
                    </div>

                </div>

            </div>

        </form>
    </div>

</div>


#include $webdir + "/footer.tpl"#
