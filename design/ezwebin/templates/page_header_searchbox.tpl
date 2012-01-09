<div id="searchbox">
  <form action={"/content/search"|ezurl}>
    <label for="searchtext" class="hide">{'Search text:'|i18n('design/ezwebin/pagelayout')}</label>
    {if $pagedata.is_edit}
    <input id="searchtext" name="SearchText" type="text" value="" size="12" disabled="disabled" />
    <input id="searchbutton" class="button-disabled" type="submit" value="{'Search'|i18n('design/ezwebin/pagelayout')}" alt="{'Search'|i18n('design/ezwebin/pagelayout')}" disabled="disabled" />
    {else}
    <div id="ezautocomplete">
        <input id="searchtext" name="SearchText" type="text" value="" size="12" />
        <input id="searchbutton" class="button" type="submit" value="{'Search'|i18n('design/ezwebin/pagelayout')}" alt="{'Search'|i18n('design/ezwebin/pagelayout')}" />
        <div id="header-autocomplete-rs"></div>
    </div>
    {if eq( $ui_context, 'browse' )}
     <input name="Mode" type="hidden" value="browse" />
    {/if}

    {/if}
  </form>
</div>

{if $pagedata.is_edit|not()}

{ezscript_require( array('ezjsc::jquery', 'ezjsc::yui3', 'ezajax_autocomplete.js') )}
<script type="text/javascript">
jQuery('#header-autocomplete-rs').css('width', jQuery('input#searchtext').width() + 60);
YUI(YUI3_config).use( 'yui2-connection', 'yui2-autocomplete', function( Y ) {ldelim}
    var autocomplete = new eZAJAXAutoComplete({ldelim}
        url: '{'ezjscore/call/ezfind::autocomplete'|ezurl('no')}',
        inputid: 'searchtext',
        containerid: 'header-autocomplete-rs',
        minquerylength: {ezini( 'AutoCompleteSettings', 'MinQueryLength', 'ezfind.ini' )},
        resultlimit: {ezini( 'AutoCompleteSettings', 'Limit', 'ezfind.ini' )}
    {rdelim}, Y);
{rdelim} );
</script>

{/if}
