<!-- Archive Search Box-->
{call name=archiveSearch}

{assign var=num_cleared value=0}

{foreach from = $myListOfSign_underDeptName key = k item = i}
    {if $myStudent_ClearanceStatus[$k] == 'Cleared'}
        {assign var=num_cleared value=$num_cleared+1}
    {/if}
{/foreach}

<!-- Export Link-->
<div class="row">
    <div class="span12">
        {*if $num_cleared == ($myListOfSign_underDeptName|@count)*}
        
            <a class="pull-right" href="export1.php?sy_sem_id={$sy_sem_id}&status={$status}"> 
                <i class="icon-download"></i> Export to PDF
            </a>
        {*
        {else}
            <a class="pull-right" href="#" onclick="bootbox.alert('<div class=\'alert alert-info alert-block\'><strong>Oops!</strong> Must clear all signatories before can download the clearance form.</div>')"> 
                <i class="icon-download"></i> Export to PDF
            </a>
        {/if}
        *}
    </div>
</div>

<hr>

<!-- Clearance-->
<div class="row">

    {foreach from = $myListOfSign_underDeptName key = k item = i}

        <div class="well well-large span5">

            <div id="hover_link" onclick="window.location.href='index.php?action=viewRequirements&Tsign_ID={$myKey_signID[$k]}&page=1'">
                <h4 class="lead">{$i}</h4>
            </div>

            <div id="hover_link" onclick="window.location.href='index.php?action=viewRequirements&Tsign_ID={$myKey_signID[$k]}&page=1'">
                <i class="icon-zoom-in"></i> Requirements
            </div>

            <div id="hover_link" onclick="window.location.href='index.php?action=viewMessages&Tsign_ID={$myKey_signID[$k]}&page=1'">
                <i class="icon-zoom-in"></i> Announcements
            </div>

            {if $myStudent_ClearanceStatus[$k] eq 'Cleared' or $myStudent_ClearanceStatus[$k] eq 'No Requirements'}
                {assign var=label_type value="label-success"}
            {else}
                {assign var=label_type value="label-important"}
            {/if}

            <div class="pull-right">
                Status: <span class="label {$label_type}">{$myStudent_ClearanceStatus[$k]}</span>
            </div>
        </div>
    {/foreach}
</div>

{*
<div class="row"> 
<div class="span8">
<table class="table-hover">
<tr>
<th>
<div class="pull-left">
<h3>Signatory</h3>
</div>
</th>
<th>
<div class="pull-left">
<h3>Status</h3>
</div>
</th>
</tr>
{foreach from = $myListOfSign_underDeptName key = k item = i}
<tr>
<td>
<h4>
<a style="cursor:pointer;" onclick="window.location.href='index.php?action=viewMessages&Tsign_ID={$myKey_signID[$k]}&page=1'">{$i}</a>
</h4>
</td>
<td>
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
</div>*}