<div class="row">   
    <div class="pull-right">
        {include file=$School_year_content}
    </div> 
</div>

<hr/>
<!--Body content-->
<div class="pull-right">
    <i class="icon-download"></i><a href="export.php" class="btn btn-link">Export to PDF </a>
</div>


<div class="row"> 
    <div class="span8 offset3">
        <table class="table-hover">
            <tr>
                <th style="height: 80px;"><div class="pull-left"><h3>Signatory</h3></div></th>
            <th style="height: 80px;"><div class="pull-left"><h3>Status</h3></div></th>
            </tr>
            {foreach from = $myListOfSign_underDeptName key = k item = i}
                <tr>
                    <td style="width: 300px;"><h4><a style="cursor:pointer;" onclick="window.location.href='index.php?action=viewMessages&Tsign_ID={$myKey_signID[$k]}&page=1'">{$i}</a></h4></td>
                    <td style="width: 300px;">
                        <div class="btn-group">
                            
                            {if $myStudent_ClearanceStatus[$k] eq 'Cleared'}
                                <img src="{$host}/photos/cleared.png" class="img-polaroid" />
                            {else}
                                <img src="{$host}/photos/not cleared.png" class="img-polaroid" />
                            {/if}
                            <button style="height: 50px;"class="btn dropdown-toggle" data-toggle="dropdown">
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li>
                                    <a style="cursor:pointer;" onclick="window.location.href=''"><i class="icon-zoom-in"></i> Requirements</a>
                                </li>
                                <li>
                                    <a style="cursor:pointer;" onclick="window.location.href='index.php?action=viewMessages&Tsign_ID={$myKey_signID[$k]}&page=1'"><i class="icon-zoom-in"></i> Messages</a>
                                </li>
                            </ul>    
                        </div>                  
                    </td>
                </tr>
            {/foreach}
        </table>
    </div>    
</div>