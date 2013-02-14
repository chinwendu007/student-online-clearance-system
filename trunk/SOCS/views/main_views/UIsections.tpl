<!-- Search Bar-->
{function name=search}
{if isset($filter)}

    <form class="form-inline">
        <input type="hidden" value="filter" name="action">
        <input id="search" class="span3" type="search" placeholder="Search..." value="{$filter}" name="filterName">
        {if isset($user_type)}
            <input type="hidden" value="{$user_type}" name="type">
        {/if}

        {*<input type="hidden" value="{$clearedStatus}" name="status">*}

        <button class="btn btn-success" type="submit">
            <i class="icon-search icon-white"></i>
        </button>
    </form>

{/if}
{/function}

<!-- Archive Search Bar-->
{function name=archiveSearch}
<form class="form-inline" method="post">
    <label>School Year:  </label>

    <select id="school_year" name="school_year" class="span3">
        {foreach from = $mySchool_Year key = k item = i}
            {if $currentSchool_Year eq $i}
                <option selected>{$i}</option>
            {else}
                <option>{$i}</option>
            {/if}
        {/foreach}
    </select>

    {*
    <input value="{$currentSchool_Year}" class="span2" type="text" maxlength="9" 
    {literal}       
    pattern="[0-9\-]{9}" id="school_year" name="school_year" autocomplete="off" class="input-small" data-provide="typeahead" data-source='[
    {/literal}
    {foreach from=$mySchool_Year key=k item=year}
    {if $mySchool_Year|@count - 1 eq $k}
    "{$year}"
    {else}
    "{$year}",
    {/if}
    {/foreach}

    ]'>
    *}

    <label>Semester: </label>
    <select id="semester" name="semester" class="span3">
        {if $currentSemester eq 'First'}
            <option selected>First</option>
            <option>Second</option>
            <option>Summer</option>
        {elseif $currentSemester eq 'Second'}
            <option>First</option>
            <option selected>Second</option>
            <option>Summer</option>
        {else}
            <option>First</option>
            <option>Second</option>
            <option selected>Summer</option>
        {/if}           
    </select>

    <button class="btn btn-primary" type="submit" name="GO">
        <i class="icon-search icon-white"></i>
    </button>
</form>
{/function}

<!-- Navigation Admin-->
{function name=nav_admin index=0}

<ul class="nav nav-list well">
    <li class="nav-header"><h5>Admin Menu</h5></li>

    <li {if $index == 0}class="active"{/if}>
        <a href='../administrator/index.php?user_type=Student'>
            <i class="icon-user"></i> User Accounts
        </a>
    </li>

    <li {if $index == 3}class="active"{/if}>
        <a href='../administrator/signatory_list_manager.php'>
            <i class="icon-coffee"></i> Signatories
        </a>
    </li>
    <li {if $index == 4}class="active"{/if}>
        <a href='../administrator/department_list_manager.php'>
            <i class="icon-building"></i> Departments
        </a>
    </li>
</ul>
{/function}

<!-- Navigation Signatory-->
{function name=nav_signatory index=0}

<ul class="nav nav-list well">
    <li class="nav-header"><h5>Admin Menu</h5></li>

    <li {if $index == 0}class="active"{/if}>
        <a href='../signatory/index.php'>
            <i class="icon-user"></i> Student
        </a>
    </li>
    <li {if $index == 1}class="active"{/if}>
        <a href='../signatory/bulletin.php'>
            <i class="icon-align-justify"></i> Bulletin
        </a>
    </li>
    <li {if $index == 2}class="active"{/if}>
        <a href='../signatory/requirements.php'>
            <i class="icon-check"></i> Requirements
        </a>
    </li>
</ul>
{/function}

<!-- Navigation Tabs User Accounts-->
{function name="nav_user_accounts" index=0}

<ul class="nav nav-tabs">
    <li {if $index == 0}class="active"{/if}>
        <a href='../administrator/index.php?user_type=Student'>Students</a>
    </li>
    <li {if $index == 1}class="active"{/if}>
        <a href='../administrator/index.php?user_type=Signatory'>Signatories-in-Charge</a>
    </li>
    <li {if $index == 2}class="active"{/if}>
        <a href='../administrator/unconfirmed_signatory.php'>Unconfirmed Signatories-in-charge</a>
    </li>
</ul>

{/function}