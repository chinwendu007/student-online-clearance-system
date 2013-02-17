<div class="row">
    <div class="span3">

        <!-- Navigations-->
        <div class="row">
            <div class="span3">
                {call name=nav_admin index=3}
            </div>
        </div>

    </div>
    <div class="span9">
        <!-- Header -->
        <h2 class="well center-text">Edit Signatory</h2>
        
        <ul class="nav nav-tabs">
            <li {if $index_tabs == 0}class="active" {/if}>
                <a href='../administrator/signatory_list_manager.php'>Under Graduate</a>
            </li>
            <li {if $index_tabs == 1}class="active" {/if}>
                <a href='../administrator/grad_signatory_list_manager.php'>Graduate</a>
            </li> 
        </ul>

        <!-- Edit Signatory-->
        <form action="" method='post' class="form-horizontal">
            <legend>Signatory Information:</legend>
            <div class="control-group">
                <label class="control-label"><b>Signatory Name: </b></label>
                <div class="controls">
                    <input class="span5" type ='text' name='sign_name' value='{$editSignatory_Name}' required>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label"><b>Description: </b></label>
                <div class="controls">
                    <textarea class="span5" name='sign_description' rows="5" cols="50" required>{$editSignatory_Desc}</textarea>
                </div>
            </div>
            <div class="control-group form-actions">
                <div class="pull-right">
                    <input class="btn btn-primary" type='Submit' value='Save' name ='editSave'>
                    <button class="btn" type="button" {if $index_tabs == 0} onclick="window.location.href='signatory_list_manager.php'" {/if} {if $index_tabs == 1} onclick="window.location.href='grad_signatory_list_manager.php'" {/if}>Back</button>
                </div>
            </div>
        </form>
    </div>
</div>
{*
<!-- Navigation Tabs-->
<ul class="nav nav-tabs">
<li class="dropdown">
<a class="dropdown-toggle"
data-toggle="dropdown"
href="#">
User Accounts
<b class="caret"></b>
</a>
<ul class="dropdown-menu">
<li><a href='../administrator/index.php?user_type=Student'>Student</a></li>
<li><a href='../administrator/index.php?user_type=Signatory'>confirmed signatory</a></li>
<li><a href='../administrator/unconfirmed_signatory.php'>unconfirmed signatory</a></li>
</ul>
</li>
<li  class="active"><a href='../administrator/signatory_list_manager.php'>Signatories</a></li>
<li><a href='../administrator/department_list_manager.php'>Departments</a></li>
</ul>

<!-- Back Button-->
<button class="pull-right btn" onclick="window.location.href='signatory_list_manager.php'">Back</button>

<form action="" method='post' class="form-horizontal">
<legend>Edit Signatory:</legend>
<div class="control-group">
<label class="control-label">Signatory Name: </label>
<div class="controls">
<input class="span5" type ='text' name='sign_name' value='{$editSignatory_Name}' required>
</div>
</div>
<div class="control-group">
<label class="control-label">Description: </label>
<div class="controls">
<textarea class="span5" name='sign_description' rows="5" cols="50" required>{$editSignatory_Desc}</textarea>
</div>
</div>
<div class="control-group">
<div class="controls">
<input class="btn btn-primary" type='Submit' value='Save' name ='editSave'>
</div>
</div>
</form>
*}