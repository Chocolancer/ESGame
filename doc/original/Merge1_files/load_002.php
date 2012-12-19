mw.loader.implement("jquery.checkboxShiftClick",function($){(function($){$.fn.checkboxShiftClick=function(text){var prevCheckbox=null;var $box=this;$box.click(function(e){if(prevCheckbox!==null&&e.shiftKey){$box.slice(Math.min($box.index(prevCheckbox),$box.index(e.target)),Math.max($box.index(prevCheckbox),$box.index(e.target))+1).prop('checked',e.target.checked?true:false);}prevCheckbox=e.target;});return $box;};})(jQuery);;},{},{});mw.loader.implement("jquery.makeCollapsible",function($){(function($,mw){$.fn.makeCollapsible=function(){return this.each(function(){var _fn='jquery.makeCollapsible> ';var $that=$(this).addClass('mw-collapsible'),that=this,collapsetext=$(this).attr('data-collapsetext'),expandtext=$(this).attr('data-expandtext'),toggleElement=function($collapsible,action,$defaultToggle,instantHide){if(!$collapsible.jquery){return;}if(action!='expand'&&action!='collapse'){return;}if(typeof $defaultToggle=='undefined'){$defaultToggle=null;}if($defaultToggle!==null&&!(
$defaultToggle instanceof $)){return;}var $containers=null;if(action=='collapse'){if($collapsible.is('table')){$containers=$collapsible.find('>tbody>tr');if($defaultToggle){$containers.not($defaultToggle.closest('tr')).stop(true,true).fadeOut();}else{if(instantHide){$containers.hide();}else{$containers.stop(true,true).fadeOut();}}}else if($collapsible.is('ul')||$collapsible.is('ol')){$containers=$collapsible.find('> li');if($defaultToggle){$containers.not($defaultToggle.parent()).stop(true,true).slideUp();}else{if(instantHide){$containers.hide();}else{$containers.stop(true,true).slideUp();}}}else{var $collapsibleContent=$collapsible.find('> .mw-collapsible-content');if($collapsibleContent.length){if(instantHide){$collapsibleContent.hide();}else{$collapsibleContent.slideUp();}}else{if($collapsible.is('tr')||$collapsible.is('td')||$collapsible.is('th')){$collapsible.fadeOut();}else{$collapsible.slideUp();}}}}else{if($collapsible.is('table')){$containers=$collapsible.find('>tbody>tr');if(
$defaultToggle){$containers.not($defaultToggle.parent().parent()).stop(true,true).fadeIn();}else{$containers.stop(true,true).fadeIn();}}else if($collapsible.is('ul')||$collapsible.is('ol')){$containers=$collapsible.find('> li');if($defaultToggle){$containers.not($defaultToggle.parent()).stop(true,true).slideDown();}else{$containers.stop(true,true).slideDown();}}else{var $collapsibleContent=$collapsible.find('> .mw-collapsible-content');if($collapsibleContent.length){$collapsibleContent.slideDown();}else{if($collapsible.is('tr')||$collapsible.is('td')||$collapsible.is('th')){$collapsible.fadeIn();}else{$collapsible.slideDown();}}}}},toggleLinkDefault=function(that,e){var $that=$(that),$collapsible=$that.closest('.mw-collapsible.mw-made-collapsible').toggleClass('mw-collapsed');e.preventDefault();e.stopPropagation();if(!$that.hasClass('mw-collapsible-toggle-collapsed')){$that.removeClass('mw-collapsible-toggle-expanded').addClass('mw-collapsible-toggle-collapsed');if($that.find('> a').
length){$that.find('> a').text(expandtext);}else{$that.text(expandtext);}toggleElement($collapsible,'collapse',$that);}else{$that.removeClass('mw-collapsible-toggle-collapsed').addClass('mw-collapsible-toggle-expanded');if($that.find('> a').length){$that.find('> a').text(collapsetext);}else{$that.text(collapsetext);}toggleElement($collapsible,'expand',$that);}return;},toggleLinkPremade=function($that,e){var $collapsible=$that.eq(0).closest('.mw-collapsible.mw-made-collapsible').toggleClass('mw-collapsed');if($(e.target).is('a')){return true;}e.preventDefault();e.stopPropagation();if(!$that.hasClass('mw-collapsible-toggle-collapsed')){$that.removeClass('mw-collapsible-toggle-expanded').addClass('mw-collapsible-toggle-collapsed');toggleElement($collapsible,'collapse',$that);}else{$that.removeClass('mw-collapsible-toggle-collapsed').addClass('mw-collapsible-toggle-expanded');toggleElement($collapsible,'expand',$that);}return;},toggleLinkCustom=function($that,e,$collapsible){if(e){e.
preventDefault();e.stopPropagation();}var action=$collapsible.hasClass('mw-collapsed')?'expand':'collapse';$collapsible.toggleClass('mw-collapsed');toggleElement($collapsible,action,$that);};if(!collapsetext){collapsetext=mw.msg('collapsible-collapse');}if(!expandtext){expandtext=mw.msg('collapsible-expand');}var $toggleLink=$('<a href="#"></a>').text(collapsetext).wrap('<span class="mw-collapsible-toggle"></span>').parent().prepend('&nbsp;[').append(']&nbsp;').bind('click.mw-collapse',function(e){toggleLinkDefault(this,e);});if($that.hasClass('mw-made-collapsible')){return;}else{$that.addClass('mw-made-collapsible');}if(($that.attr('id')||'').indexOf('mw-customcollapsible-')===0){var thatId=$that.attr('id'),$customTogglers=$('.'+thatId.replace('mw-customcollapsible','mw-customtoggle'));mw.log(_fn+'Found custom collapsible: #'+thatId);if($customTogglers.length){$customTogglers.bind('click.mw-collapse',function(e){toggleLinkCustom($(this),e,$that);});}else{mw.log(_fn+'#'+thatId+
': Missing toggler!');}if($that.hasClass('mw-collapsed')){$that.removeClass('mw-collapsed');toggleLinkCustom($customTogglers,null,$that);}}else{if($that.is('table')){var $firstRowCells=$('tr:first th, tr:first td',that),$toggle=$firstRowCells.find('> .mw-collapsible-toggle');if(!$toggle.length){$firstRowCells.eq(-1).prepend($toggleLink);}else{$toggleLink=$toggle.unbind('click.mw-collapse').bind('click.mw-collapse',function(e){toggleLinkPremade($toggle,e);});}}else if($that.is('ul')||$that.is('ol')){var $firstItem=$('li:first',$that),$toggle=$firstItem.find('> .mw-collapsible-toggle');if(!$toggle.length){var firstval=$firstItem.attr('value');if(firstval===undefined||!firstval||firstval=='-1'){$firstItem.attr('value','1');}$that.prepend($toggleLink.wrap('<li class="mw-collapsible-toggle-li"></li>').parent());}else{$toggleLink=$toggle.unbind('click.mw-collapse').bind('click.mw-collapse',function(e){toggleLinkPremade($toggle,e);});}}else{var $toggle=$that.find('> .mw-collapsible-toggle');
if(!$that.find('> .mw-collapsible-content').length){$that.wrapInner('<div class="mw-collapsible-content"></div>');}if(!$toggle.length){$that.prepend($toggleLink);}else{$toggleLink=$toggle.unbind('click.mw-collapse').bind('click.mw-collapse',function(e){toggleLinkPremade($toggle,e);});}}}if($that.hasClass('mw-collapsed')&&($that.attr('id')||'').indexOf('mw-customcollapsible-')!==0){$that.removeClass('mw-collapsed');toggleElement($that,'collapse',$toggleLink.eq(0),true);$toggleLink.eq(0).click();}});};})(jQuery,mediaWiki);;},{"all":".mw-collapsible-toggle{float:right} li .mw-collapsible-toggle{float:none} .mw-collapsible-toggle-li{list-style:none}\n\n/* cache key: slot2:resourceloader:filter:minify-css:7:4250852ed2349a0d4d0fc6509a3e7d4c */"},{"collapsible-expand":"Expand","collapsible-collapse":"Collapse"});mw.loader.implement("jquery.mw-jump",function($){jQuery(function($){$('.mw-jump').delegate('a','focus blur',function(e){if(e.type==="blur"||e.type==="focusout"){$(this).closest(
'.mw-jump').css({height:'0'});}else{$(this).closest('.mw-jump').css({height:'auto'});}});});;},{},{});mw.loader.implement("jquery.placeholder",function($){(function($){$.fn.placeholder=function(){return this.each(function(){if(this.placeholder&&'placeholder'in document.createElement(this.tagName)){return;}var placeholder=this.getAttribute('placeholder');var $input=$(this);if(this.value===''||this.value===placeholder){$input.addClass('placeholder').val(placeholder);}$input.blur(function(){if(this.value===''){this.value=placeholder;$input.addClass('placeholder');}}).bind('focus drop keydown paste',function(e){if($input.hasClass('placeholder')){if(e.type=='drop'&&e.originalEvent.dataTransfer){try{this.value=e.originalEvent.dataTransfer.getData('text/plain');}catch(exception){this.value=e.originalEvent.dataTransfer.getData('text');}e.preventDefault();}else{this.value='';}$input.removeClass('placeholder');}});if(this.form){$(this.form).submit(function(){if($input.hasClass('placeholder')){
$input.val('').removeClass('placeholder');}});}});};})(jQuery);;},{},{});mw.loader.implement("mediawiki.action.watch.ajax",function($){(function($,mw,undefined){var title=mw.config.get('wgRelevantPageName',mw.config.get('wgPageName'));function updateWatchLink($link,action,state){var msgKey=state==='loading'?action+'ing':action,accesskeyTip=($link.attr('title')||'').match(mw.util.tooltipAccessKeyRegexp),$li=$link.closest('li');$link.text(mw.msg(msgKey)).attr('title',mw.msg('tooltip-ca-'+action)+(accesskeyTip?' '+accesskeyTip[0]:'')).attr('href',mw.util.wikiScript()+'?'+$.param({title:title,action:action}));if($li.hasClass('icon')){if(state==='loading'){$link.addClass('loading');}else{$link.removeClass('loading');}}}function mwUriGetAction(url){var actionPaths=mw.config.get('wgActionPaths'),key,parts,m,action;action=mw.util.getParamValue('action',url);if(action!==null){return action;}for(key in actionPaths){if(actionPaths.hasOwnProperty(key)){parts=actionPaths[key].split('$1');for(i=0;i<
parts.length;i+=1){parts[i]=$.escapeRE(parts[i]);}m=new RegExp(parts.join('(.+)')).exec(url);if(m&&m[1]){return key;}}}return'view';}$(document).ready(function(){var $links=$('.mw-watchlink a, a.mw-watchlink, '+'#ca-watch a, #ca-unwatch a, #mw-unwatch-link1, '+'a#ca-watch, a#ca-unwatch, '+'#mw-unwatch-link2, #mw-watch-link2, #mw-watch-link1');$links=$links.filter(':not( #bodyContent *, #content * )');$links.click(function(e){var $link,api,action=mwUriGetAction(this.href);if(action!=='watch'&&action!=='unwatch'){return true;}e.preventDefault();e.stopPropagation();$link=$(this);updateWatchLink($link,action,'loading');api=new mw.Api();api[action](title,function(watchResponse){var otherAction=action==='watch'?'unwatch':'watch',$li=$link.closest('li');GlobalNotification.show(watchResponse.message,'confirm');updateWatchLink($link,otherAction);if($li.prop('id')==='ca-'+otherAction||$li.prop('id')==='ca-'+action){$li.prop('id','ca-'+otherAction);}if(watchResponse.watched!==undefined){$(
'#wpWatchthis').prop('checked',true);}else{$('#wpWatchthis').removeProp('checked');}},function(){updateWatchLink($link,action);var cleanTitle=title.replace(/_/g,' ');var link=mw.html.element('a',{'href':mw.util.wikiGetlink(title),'title':cleanTitle},cleanTitle);var html=mw.msg('watcherrortext',link);GlobalNotification.show(html,'error');return true;});});});})(jQuery,mediaWiki);;},{},{"watch":"Follow","unwatch":"Following","watching":"Following\u2026","unwatching":"Unfollowing\u2026","tooltip-ca-watch":"Follow this page","tooltip-ca-unwatch":"Unfollow this page","watcherrortext":"An error occurred while changing your watchlist settings for \"$1\"."});mw.loader.implement("mediawiki.api",function($){(function($,mw,undefined){var defaultOptions={parameters:{action:'query',format:'json'},ajax:{url:mw.util.wikiScript('api'),ok:function(){},err:function(code,result){mw.log('mw.Api error: '+code,'debug');},timeout:30000,dataType:'json'}};mw.Api=function(options){if(options===undefined){
options={};}if(options.ajax&&options.ajax.url!==undefined){options.ajax.url=String(options.ajax.url);}options.parameters=$.extend({},defaultOptions.parameters,options.parameters);options.ajax=$.extend({},defaultOptions.ajax,options.ajax);this.defaults=options;};mw.Api.prototype={normalizeAjaxOptions:function(arg){var opt=arg;if(typeof arg==='function'){opt={'ok':arg};}if(!opt.ok){throw new Error('ajax options must include ok callback');}return opt;},get:function(parameters,ajaxOptions){ajaxOptions=this.normalizeAjaxOptions(ajaxOptions);ajaxOptions.type='GET';return this.ajax(parameters,ajaxOptions);},post:function(parameters,ajaxOptions){ajaxOptions=this.normalizeAjaxOptions(ajaxOptions);ajaxOptions.type='POST';return this.ajax(parameters,ajaxOptions);},ajax:function(parameters,ajaxOptions){parameters=$.extend({},this.defaults.parameters,parameters);ajaxOptions=$.extend({},this.defaults.ajax,ajaxOptions);ajaxOptions.data=$.param(parameters).replace(/\./g,'%2E');ajaxOptions.error=
function(xhr,textStatus,exception){ajaxOptions.err('http',{xhr:xhr,textStatus:textStatus,exception:exception});};ajaxOptions.success=function(result){if(result===undefined||result===null||result===''){ajaxOptions.err('ok-but-empty','OK response but empty result (check HTTP headers?)');}else if(result.error){var code=result.error.code===undefined?'unknown':result.error.code;ajaxOptions.err(code,result);}else{ajaxOptions.ok(result);}};return $.ajax(ajaxOptions);}};mw.Api.errors=['ok-but-empty','timeout','duplicate','duplicate-archive','noimageinfo','uploaddisabled','nomodule','mustbeposted','badaccess-groups','stashfailed','missingresult','missingparam','invalid-file-key','copyuploaddisabled','mustbeloggedin','empty-file','file-too-large','filetype-missing','filetype-banned','filename-tooshort','illegal-filename','verification-error','hookaborted','unknown-error','internal-error','overwrite','badtoken','fetchfileerror','fileexists-shared-forbidden','invalidtitle','notloggedin'];mw.Api.
warnings=['duplicate','exists'];})(jQuery,mediaWiki);;},{},{});mw.loader.implement("mediawiki.user",function($){(function($){function User(options,tokens){var that=this;this.options=options||new mw.Map();this.tokens=tokens||new mw.Map();function generateId(){var id='';var seed='0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';for(var i=0,r;i<32;i++){r=Math.floor(Math.random()*seed.length);id+=seed.substring(r,r+1);}return id;}this.name=function(){return mw.config.get('wgUserName');};this.anonymous=function(){return that.name()?false:true;};this.sessionId=function(){var sessionId=$.cookie('mediaWiki.user.sessionId');if(typeof sessionId=='undefined'||sessionId===null){sessionId=generateId();$.cookie('mediaWiki.user.sessionId',sessionId,{'expires':null,'path':'/'});}return sessionId;};this.id=function(){var name=that.name();if(name){return name;}var id=$.cookie('mediaWiki.user.id');if(typeof id=='undefined'||id===null){id=generateId();}$.cookie('mediaWiki.user.id',id,{
'expires':365,'path':'/'});return id;};this.bucket=function(key,options){options=$.extend({'buckets':{},'version':0,'tracked':false,'expires':30},options||{});var cookie=$.cookie('mediaWiki.user.bucket:'+key);var bucket=null;var version=0;if(typeof cookie==='string'&&cookie.length>2&&cookie.indexOf(':')>0){var parts=cookie.split(':');if(parts.length>1&&parts[0]==options.version){version=Number(parts[0]);bucket=String(parts[1]);}}if(bucket===null){if(!$.isPlainObject(options.buckets)){throw'Invalid buckets error. Object expected for options.buckets.';}version=Number(options.version);var range=0,k;for(k in options.buckets){range+=options.buckets[k];}var rand=Math.random()*range;var total=0;for(k in options.buckets){bucket=k;total+=options.buckets[k];if(total>=rand){break;}}if(options.tracked){mw.loader.using('jquery.clickTracking',function(){$.trackAction('mediaWiki.user.bucket:'+key+'@'+version+':'+bucket);});}$.cookie('mediaWiki.user.bucket:'+key,version+':'+bucket,{'path':'/',
'expires':Number(options.expires)});}return bucket;};}mw.user=new User(mw.user.options,mw.user.tokens);})(jQuery);;},{},{});mw.loader.implement("mediawiki.api.watch",function($){(function($,mw){$.extend(mw.Api.prototype,{watch:function(page,success,err){var params,ok;params={action:'watch',title:String(page),token:mw.user.tokens.get('watchToken'),uselang:mw.config.get('wgUserLanguage')};ok=function(data){success(data.watch);};return this.post(params,{ok:ok,err:err});},unwatch:function(page,success,err){var params,ok;params={action:'watch',unwatch:1,title:String(page),token:mw.user.tokens.get('watchToken'),uselang:mw.config.get('wgUserLanguage')};ok=function(data){success(data.watch);};return this.post(params,{ok:ok,err:err});}});})(jQuery,mediaWiki);;},{},{});mw.loader.implement("mediawiki.legacy.mwsuggest",function($){var os_map={};var os_cache={};var os_cur_keypressed=0;var os_keypressed_count=0;var os_timer=null;var os_mouse_pressed=false;var os_mouse_num=-1;var os_mouse_moved=false
;var os_search_timeout=250;var os_autoload_inputs=['searchInput','searchInput2','powerSearchText','searchText'];var os_autoload_forms=['searchform','searchform2','powersearch','search'];var os_is_stopped=false;var os_max_lines_per_suggest=7;var os_animation_steps=6;var os_animation_min_step=2;var os_animation_delay=30;var os_container_max_width=2;var os_animation_timer=null;var os_use_datalist=false;function os_Timer(id,r,query){this.id=id;this.r=r;this.query=query;}function os_Results(name,formname){this.searchform=formname;this.searchbox=name;this.container=name+'Suggest';this.resultTable=name+'Result';this.resultText=name+'ResultText';this.toggle=name+'Toggle';this.query=null;this.results=null;this.resultCount=0;this.original=null;this.selected=-1;this.containerCount=0;this.containerRow=0;this.containerTotal=0;this.visible=false;this.stayHidden=false;}function os_AnimationTimer(r,target){this.r=r;var current=document.getElementById(r.container).offsetWidth;this.inc=Math.round((
target-current)/os_animation_steps);if(this.inc<os_animation_min_step&&this.inc>=0){this.inc=os_animation_min_step;}if(this.inc>-os_animation_min_step&&this.inc<0){this.inc=-os_animation_min_step;}this.target=target;}function os_MWSuggestInit(){for(var i=0;i<os_autoload_inputs.length;i++){var id=os_autoload_inputs[i];var form=os_autoload_forms[i];var element=document.getElementById(id);if(element!=null){os_initHandlers(id,form,element);}}}function os_initHandlers(name,formname,element){var r=new os_Results(name,formname);os_hookEvent(element,'keyup',function(event){os_eventKeyup(event);});os_hookEvent(element,'keydown',function(event){os_eventKeydown(event);});os_hookEvent(element,'keypress',function(event){os_eventKeypress(event);});if(!os_use_datalist){os_hookEvent(element,'blur',function(event){os_eventBlur(event);});os_hookEvent(element,'focus',function(event){os_eventFocus(event);});element.setAttribute('autocomplete','off');}os_hookEvent(document.getElementById(formname),'submit'
,function(event){return os_eventOnsubmit(event);});os_map[name]=r;if(document.getElementById(r.toggle)==null){}}function os_hookEvent(element,hookName,hookFunct){if(element.addEventListener){element.addEventListener(hookName,hookFunct,false);}else if(window.attachEvent){element.attachEvent('on'+hookName,hookFunct);}}function os_eventKeyup(e){var targ=os_getTarget(e);var r=os_map[targ.id];if(r==null){return;}if(os_keypressed_count==0){os_processKey(r,os_cur_keypressed,targ);}var query=targ.value;os_fetchResults(r,query,os_search_timeout);}function os_processKey(r,keypressed,targ){if(keypressed==40&&!r.visible&&os_timer==null){r.query='';os_fetchResults(r,targ.value,0);}if(os_use_datalist){return;}if(keypressed==40){if(r.visible){os_changeHighlight(r,r.selected,r.selected+1,true);}}else if(keypressed==38){if(r.visible){os_changeHighlight(r,r.selected,r.selected-1,true);}}else if(keypressed==27){document.getElementById(r.searchbox).value=r.original;r.query=r.original;os_hideResults(r);}
else if(r.query!=document.getElementById(r.searchbox).value){}}function os_eventKeypress(e){var targ=os_getTarget(e);var r=os_map[targ.id];if(r==null){return;}var keypressed=os_cur_keypressed;os_keypressed_count++;os_processKey(r,keypressed,targ);}function os_eventKeydown(e){if(!e){e=window.event;}var targ=os_getTarget(e);var r=os_map[targ.id];if(r==null){return;}os_mouse_moved=false;os_cur_keypressed=(e.keyCode==undefined)?e.which:e.keyCode;os_keypressed_count=0;}function os_eventOnsubmit(e){var targ=os_getTarget(e);os_is_stopped=true;if(os_timer!=null&&os_timer.id!=null){clearTimeout(os_timer.id);os_timer=null;}for(var i=0;i<os_autoload_inputs.length;i++){var r=os_map[os_autoload_inputs[i]];if(r!=null){var b=document.getElementById(r.searchform);if(b!=null&&b==targ){r.query=document.getElementById(r.searchbox).value;}os_hideResults(r);}}return true;}function os_hideResults(r){if(os_use_datalist){document.getElementById(r.searchbox).setAttribute('list','');}else{var c=document.
getElementById(r.container);if(c!=null){c.style.visibility='hidden';}}r.visible=false;r.selected=-1;}function os_decodeValue(value){if(decodeURIComponent){return decodeURIComponent(value);}if(unescape){return unescape(value);}return null;}function os_encodeQuery(value){if(encodeURIComponent){return encodeURIComponent(value);}if(escape){return escape(value);}return null;}function os_updateResults(r,query,text,cacheKey){os_cache[cacheKey]=text;r.query=query;r.original=query;if(text==''){r.results=null;r.resultCount=0;os_hideResults(r);}else{try{var p=JSON.parse(text);if(p.length<2||p[1].length==0){r.results=null;r.resultCount=0;os_hideResults(r);return;}if(os_use_datalist){os_setupDatalist(r,p[1]);}else{os_setupDiv(r,p[1]);}}catch(e){os_hideResults(r);os_cache[cacheKey]=null;}}}function os_setupDatalist(r,results){var s=document.getElementById(r.searchbox);var c=document.getElementById(r.container);if(c==null){c=document.createElement('datalist');c.setAttribute('id',r.container);document
.body.appendChild(c);}else{c.innerHTML='';}s.setAttribute('list',r.container);r.results=new Array();r.resultCount=results.length;r.visible=true;for(var i=0;i<results.length;i++){var title=os_decodeValue(results[i]);var opt=document.createElement('option');opt.value=title;r.results[i]=title;c.appendChild(opt);}}function os_getNamespaces(r){var namespaces='';var elements=document.forms[r.searchform].elements;for(var i=0;i<elements.length;i++){var name=elements[i].name;if(typeof name!='undefined'&&name.length>2&&name[0]=='n'&&name[1]=='s'&&((elements[i].type=='checkbox'&&elements[i].checked)||(elements[i].type=='hidden'&&elements[i].value=='1'))){if(namespaces!=''){namespaces+='|';}namespaces+=name.substring(2);}}if(namespaces==''){namespaces=wgSearchNamespaces.join('|');}return namespaces;}function os_updateIfRelevant(r,query,text,cacheKey){var t=document.getElementById(r.searchbox);if(t!=null&&t.value==query){os_updateResults(r,query,text,cacheKey);}r.query=query;}function
os_delayedFetch(){if(os_timer==null){return;}var r=os_timer.r;var query=os_timer.query;os_timer=null;var path=wgMWSuggestTemplate.replace("{namespaces}",os_getNamespaces(r)).replace("{dbname}",wgDBname).replace("{searchTerms}",os_encodeQuery(query));var cached=os_cache[path];if(cached!=null&&cached!=undefined){os_updateIfRelevant(r,query,cached,path);}else{var xmlhttp=sajax_init_object();if(xmlhttp){try{xmlhttp.open('GET',path,true);xmlhttp.onreadystatechange=function(){if(xmlhttp.readyState==4&&typeof os_updateIfRelevant=='function'){os_updateIfRelevant(r,query,xmlhttp.responseText,path);}};xmlhttp.send(null);}catch(e){if(window.location.hostname=='localhost'){alert("Your browser blocks XMLHttpRequest to 'localhost', try using a real hostname for development/testing.");}throw e;}}}}function os_fetchResults(r,query,timeout){if(query==''){r.query='';os_hideResults(r);return;}else if(query==r.query){return;}os_is_stopped=false;if(os_timer!=null&&os_timer.id!=null){clearTimeout(os_timer.
id);}if(timeout!=0){os_timer=new os_Timer(setTimeout(os_delayedFetch,timeout),r,query);}else{os_timer=new os_Timer(null,r,query);os_delayedFetch();}}function os_getTarget(e){if(!e){e=window.event;}if(e.target){return e.target;}else if(e.srcElement){return e.srcElement;}else{return null;}}function os_isNumber(x){if(x==''||isNaN(x)){return false;}for(var i=0;i<x.length;i++){var c=x.charAt(i);if(!(c>='0'&&c<='9')){return false;}}return true;}function os_enableSuggestionsOn(inputId,formName){os_initHandlers(inputId,formName,document.getElementById(inputId));}function os_disableSuggestionsOn(inputId){r=os_map[inputId];if(r!=null){os_timer=null;os_hideResults(r);document.getElementById(inputId).setAttribute('autocomplete','on');os_map[inputId]=null;}var index=os_autoload_inputs.indexOf(inputId);if(index>=0){os_autoload_inputs[index]=os_autoload_forms[index]='';}}function os_eventBlur(e){var targ=os_getTarget(e);var r=os_map[targ.id];if(r==null){return;}if(!os_mouse_pressed){os_hideResults(r)
;r.stayHidden=true;if(os_timer!=null&&os_timer.id!=null){clearTimeout(os_timer.id);}os_timer=null;}}function os_eventFocus(e){var targ=os_getTarget(e);var r=os_map[targ.id];if(r==null){return;}r.stayHidden=false;}function os_setupDiv(r,results){var c=document.getElementById(r.container);if(c==null){c=os_createContainer(r);}c.innerHTML=os_createResultTable(r,results);var t=document.getElementById(r.resultTable);r.containerTotal=t.offsetHeight;r.containerRow=t.offsetHeight/r.resultCount;os_fitContainer(r);os_trimResultText(r);os_showResults(r);}function os_createResultTable(r,results){var c=document.getElementById(r.container);var width=c.offsetWidth-os_operaWidthFix(c.offsetWidth);var html='<table class="os-suggest-results" id="'+r.resultTable+'" style="width: '+width+'px;">';r.results=new Array();r.resultCount=results.length;for(i=0;i<results.length;i++){var title=os_decodeValue(results[i]);r.results[i]=title;html+='<tr><td class="os-suggest-result" id="'+r.resultTable+i+'"><span id="'
+r.resultText+i+'">'+title+'</span></td></tr>';}html+='</table>';return html;}function os_showResults(r){if(os_is_stopped){return;}if(r.stayHidden){return;}os_fitContainer(r);var c=document.getElementById(r.container);r.selected=-1;if(c!=null){c.scrollTop=0;c.style.visibility='visible';r.visible=true;}}function os_operaWidthFix(x){if(typeof document.body.style.overflowX!='string'){return 30;}return 0;}function f_clientWidth(){return f_filterResults(window.innerWidth?window.innerWidth:0,document.documentElement?document.documentElement.clientWidth:0,document.body?document.body.clientWidth:0);}function f_clientHeight(){return f_filterResults(window.innerHeight?window.innerHeight:0,document.documentElement?document.documentElement.clientHeight:0,document.body?document.body.clientHeight:0);}function f_scrollLeft(){return f_filterResults(window.pageXOffset?window.pageXOffset:0,document.documentElement?document.documentElement.scrollLeft:0,document.body?document.body.scrollLeft:0);}function
f_scrollTop(){return f_filterResults(window.pageYOffset?window.pageYOffset:0,document.documentElement?document.documentElement.scrollTop:0,document.body?document.body.scrollTop:0);}function f_filterResults(n_win,n_docel,n_body){var n_result=n_win?n_win:0;if(n_docel&&(!n_result||(n_result>n_docel))){n_result=n_docel;}return n_body&&(!n_result||(n_result>n_body))?n_body:n_result;}function os_availableHeight(r){var absTop=document.getElementById(r.container).style.top;var px=absTop.lastIndexOf('px');if(px>0){absTop=absTop.substring(0,px);}return f_clientHeight()-(absTop-f_scrollTop());}function os_getElementPosition(elemID){var offsetTrail=document.getElementById(elemID);var offsetLeft=0;var offsetTop=0;while(offsetTrail){offsetLeft+=offsetTrail.offsetLeft;offsetTop+=offsetTrail.offsetTop;offsetTrail=offsetTrail.offsetParent;}if(navigator.userAgent.indexOf('Mac')!=-1&&typeof document.body.leftMargin!='undefined'){offsetLeft+=document.body.leftMargin;offsetTop+=document.body.topMargin;}
return{left:offsetLeft,top:offsetTop};}function os_createContainer(r){var c=document.createElement('div');var s=document.getElementById(r.searchbox);var pos=os_getElementPosition(r.searchbox);var left=pos.left;var top=pos.top+s.offsetHeight;c.className='os-suggest';c.setAttribute('id',r.container);document.body.appendChild(c);c=document.getElementById(r.container);c.style.top=top+'px';c.style.left=left+'px';c.style.width=s.offsetWidth+'px';c.onmouseover=function(event){os_eventMouseover(r.searchbox,event);};c.onmousemove=function(event){os_eventMousemove(r.searchbox,event);};c.onmousedown=function(event){return os_eventMousedown(r.searchbox,event);};c.onmouseup=function(event){os_eventMouseup(r.searchbox,event);};return c;}function os_fitContainer(r){var c=document.getElementById(r.container);var h=os_availableHeight(r)-20;var inc=r.containerRow;h=parseInt(h/inc)*inc;if(h<(2*inc)&&r.resultCount>1){h=2*inc;}if((h/inc)>os_max_lines_per_suggest){h=inc*os_max_lines_per_suggest;}if(h<r.
containerTotal){c.style.height=h+'px';r.containerCount=parseInt(Math.round(h/inc));}else{c.style.height=r.containerTotal+'px';r.containerCount=r.resultCount;}}function os_trimResultText(r){var maxW=0;for(var i=0;i<r.resultCount;i++){var e=document.getElementById(r.resultText+i);if(e.offsetWidth>maxW){maxW=e.offsetWidth;}}var w=document.getElementById(r.container).offsetWidth;var fix=0;if(r.containerCount<r.resultCount){fix=20;}else{fix=os_operaWidthFix(w);}if(fix<4){fix=4;}maxW+=fix;var normW=document.getElementById(r.searchbox).offsetWidth;var prop=maxW/normW;if(prop>os_container_max_width){prop=os_container_max_width;}else if(prop<1){prop=1;}var newW=Math.round(normW*prop);if(w!=newW){w=newW;if(os_animation_timer!=null){clearInterval(os_animation_timer.id);}os_animation_timer=new os_AnimationTimer(r,w);os_animation_timer.id=setInterval("os_animateChangeWidth()",os_animation_delay);w-=fix;}if(w<10){return;}for(var i=0;i<r.resultCount;i++){var e=document.getElementById(r.resultText+i);
var replace=1;var lastW=e.offsetWidth+1;var iteration=0;var changedText=false;while(e.offsetWidth>w&&(e.offsetWidth<lastW||iteration<2)){changedText=true;lastW=e.offsetWidth;var l=e.innerHTML;e.innerHTML=l.substring(0,l.length-replace)+'...';iteration++;replace=4;}if(changedText){document.getElementById(r.resultTable+i).setAttribute('title',r.results[i]);}}}function os_animateChangeWidth(){var r=os_animation_timer.r;var c=document.getElementById(r.container);var w=c.offsetWidth;var normW=document.getElementById(r.searchbox).offsetWidth;var normL=os_getElementPosition(r.searchbox).left;var inc=os_animation_timer.inc;var target=os_animation_timer.target;var nw=w+inc;if((inc>0&&nw>=target)||(inc<=0&&nw<=target)){c.style.width=target+'px';clearInterval(os_animation_timer.id);os_animation_timer=null;}else{c.style.width=nw+'px';if(document.documentElement.dir=='rtl'){c.style.left=(normL+normW+(target-nw)-os_animation_timer.target-1)+'px';}}}function os_changeHighlight(r,cur,next,
updateSearchBox){if(next>=r.resultCount){next=r.resultCount-1;}if(next<-1){next=-1;}r.selected=next;if(cur==next){return;}if(cur>=0){var curRow=document.getElementById(r.resultTable+cur);if(curRow!=null){curRow.className='os-suggest-result';}}var newText;if(next>=0){var nextRow=document.getElementById(r.resultTable+next);if(nextRow!=null){nextRow.className=os_HighlightClass();}newText=r.results[next];}else{newText=r.original;}if(r.containerCount<r.resultCount){var c=document.getElementById(r.container);var vStart=c.scrollTop/r.containerRow;var vEnd=vStart+r.containerCount;if(next<vStart){c.scrollTop=next*r.containerRow;}else if(next>=vEnd){c.scrollTop=(next-r.containerCount+1)*r.containerRow;}}if(updateSearchBox){os_updateSearchQuery(r,newText);}}function os_HighlightClass(){var match=navigator.userAgent.match(/AppleWebKit\/(\d+)/);if(match){var webKitVersion=parseInt(match[1]);if(webKitVersion<523){return'os-suggest-result-hl-webkit';}}return'os-suggest-result-hl';}function
os_updateSearchQuery(r,newText){document.getElementById(r.searchbox).value=newText;r.query=newText;}function os_eventMouseover(srcId,e){var targ=os_getTarget(e);var r=os_map[srcId];if(r==null||!os_mouse_moved){return;}var num=os_getNumberSuffix(targ.id);if(num>=0){os_changeHighlight(r,r.selected,num,false);}}function os_getNumberSuffix(id){var num=id.substring(id.length-2);if(!(num.charAt(0)>='0'&&num.charAt(0)<='9')){num=num.substring(1);}if(os_isNumber(num)){return parseInt(num);}else{return-1;}}function os_eventMousemove(srcId,e){os_mouse_moved=true;}function os_eventMousedown(srcId,e){var targ=os_getTarget(e);var r=os_map[srcId];if(r==null){return;}var num=os_getNumberSuffix(targ.id);os_mouse_pressed=true;if(num>=0){os_mouse_num=num;}document.getElementById(r.searchbox).focus();return false;}function os_eventMouseup(srcId,e){var targ=os_getTarget(e);var r=os_map[srcId];if(r==null){return;}var num=os_getNumberSuffix(targ.id);if(num>=0&&os_mouse_num==num){os_updateSearchQuery(r,r.
results[num]);os_hideResults(r);document.getElementById(r.searchform).submit();}os_mouse_pressed=false;document.getElementById(r.searchbox).focus();}function os_createToggle(r,className){var t=document.createElement('span');t.className=className;t.setAttribute('id',r.toggle);var link=document.createElement('a');link.setAttribute('href','javascript:void(0);');link.onclick=function(){os_toggle(r.searchbox,r.searchform);};var msg=document.createTextNode(wgMWSuggestMessages[0]);link.appendChild(msg);t.appendChild(link);return t;}function os_toggle(inputId,formName){r=os_map[inputId];var msg='';if(r==null){os_enableSuggestionsOn(inputId,formName);r=os_map[inputId];msg=wgMWSuggestMessages[0];}else{os_disableSuggestionsOn(inputId,formName);msg=wgMWSuggestMessages[1];}var link=document.getElementById(r.toggle).firstChild;link.replaceChild(document.createTextNode(msg),link.firstChild);}hookEvent('load',os_MWSuggestInit);;},{},{"search-mwsuggest-enabled":"with suggestions",
"search-mwsuggest-disabled":"no suggestions"});mw.loader.implement("mediawiki.page.ready",function($){jQuery(document).ready(function($){if(!('placeholder'in document.createElement('input'))){$('input[placeholder]').placeholder();}$('.mw-collapsible').makeCollapsible();if($('table.sortable').length){mw.loader.using('jquery.tablesorter',function(){$('table.sortable').tablesorter();});}$('input[type=checkbox]:not(.noshiftselect)').checkboxShiftClick();mw.util.updateTooltipAccessKeys();});;},{},{});

/* cache key: slot2:resourceloader:filter:minify-js:7:a09e38bc6ad1cd670fe95c15eec1e9f2 */