var hasClass=(function(){var reCache={};return function(element,className){return(reCache[className]?reCache[className]:(reCache[className]=new RegExp("(?:\\s|^)"+className+"(?:\\s|$)"))).test(element.className);};})();var autoCollapse=2;var collapseCaption="hide";var expandCaption="show";function collapseTable(tableIndex){var Button=document.getElementById("collapseButton"+tableIndex);var Table=document.getElementById("collapsibleTable"+tableIndex);if(!Table||!Button){return false;}var Rows=Table.getElementsByTagName("tr");if(Button.firstChild.data==collapseCaption){for(var i=1;i<Rows.length;i++){Rows[i].style.display="none";}Button.firstChild.data=expandCaption;}else{for(var i=1;i<Rows.length;i++){Rows[i].style.display=Rows[0].style.display;}Button.firstChild.data=collapseCaption;}}function createCollapseButtons(){var tableIndex=0;var NavigationBoxes=new Object();var Tables=document.getElementsByTagName("table");for(var i=0;i<Tables.length;i++){if(hasClass(Tables[i],"collapsible")){
NavigationBoxes[tableIndex]=Tables[i];Tables[i].setAttribute("id","collapsibleTable"+tableIndex);var Button=document.createElement("span");var ButtonLink=document.createElement("a");var ButtonText=document.createTextNode(collapseCaption);Button.style.styleFloat="right";Button.style.cssFloat="right";Button.style.fontWeight="normal";Button.style.textAlign="right";Button.style.width="6em";ButtonLink.setAttribute("id","collapseButton"+tableIndex);ButtonLink.setAttribute("href","javascript:collapseTable("+tableIndex+");");ButtonLink.appendChild(ButtonText);Button.appendChild(document.createTextNode("["));Button.appendChild(ButtonLink);Button.appendChild(document.createTextNode("]"));var Header=Tables[i].getElementsByTagName("tr")[0].getElementsByTagName("th")[0];if(Header){Header.insertBefore(Button,Header.childNodes[0]);tableIndex++;}}}for(var i=0;i<tableIndex;i++){if(hasClass(NavigationBoxes[i],"collapsed")||(tableIndex>=autoCollapse&&hasClass(NavigationBoxes[i],"autocollapse"))){
collapseTable(i);}}}addOnloadHook(createCollapseButtons);var NavigationBarHide='['+collapseCaption+']';var NavigationBarShow='['+expandCaption+']';var NavigationBarShowDefault=autoCollapse;function toggleNavigationBar(indexNavigationBar){var NavToggle=document.getElementById("NavToggle"+indexNavigationBar);var NavFrame=document.getElementById("NavFrame"+indexNavigationBar);if(!NavFrame||!NavToggle){return false;}if(NavToggle.firstChild.data==NavigationBarHide){for(var NavChild=NavFrame.firstChild;NavChild!=null;NavChild=NavChild.nextSibling){if(hasClass(NavChild,'NavPic')){NavChild.style.display='none';}if(hasClass(NavChild,'NavContent')){NavChild.style.display='none';}}NavToggle.firstChild.data=NavigationBarShow;}else if(NavToggle.firstChild.data==NavigationBarShow){for(var NavChild=NavFrame.firstChild;NavChild!=null;NavChild=NavChild.nextSibling){if(hasClass(NavChild,'NavPic')){NavChild.style.display='block';}if(hasClass(NavChild,'NavContent')){NavChild.style.display='block';}}
NavToggle.firstChild.data=NavigationBarHide;}}function createNavigationBarToggleButton(){var indexNavigationBar=0;var divs=document.getElementsByTagName("div");for(var i=0;NavFrame=divs[i];i++){if(hasClass(NavFrame,"NavFrame")){indexNavigationBar++;var NavToggle=document.createElement("a");NavToggle.className='NavToggle';NavToggle.setAttribute('id','NavToggle'+indexNavigationBar);NavToggle.setAttribute('href','javascript:toggleNavigationBar('+indexNavigationBar+');');var NavToggleText=document.createTextNode(NavigationBarHide);NavToggle.appendChild(NavToggleText);for(var j=0;j<NavFrame.childNodes.length;j++){if(hasClass(NavFrame.childNodes[j],"NavHead")){NavFrame.childNodes[j].appendChild(NavToggle);}}NavFrame.setAttribute('id','NavFrame'+indexNavigationBar);}}if(NavigationBarShowDefault<indexNavigationBar){for(var i=1;i<=indexNavigationBar;i++){toggleNavigationBar(i);}}}addOnloadHook(createNavigationBarToggleButton);importScriptPage('AjaxRC/code.js','dev');function UserNameReplace(){
if(typeof(disableUsernameReplace)!='undefined'&&disableUsernameReplace||wgUserName==null)return;$('span.insertusername').each(function(){$(this).text(wgUserName);});}addOnloadHook(UserNameReplace);function ts_makeSortable(table){var firstRow;if(table.rows&&table.rows.length>0){if(table.tHead&&table.tHead.rows.length>0){firstRow=table.tHead.rows[table.tHead.rows.length-1];}else{firstRow=table.rows[0];}}if(!firstRow)return;for(var i=0;i<firstRow.cells.length;i++){var cell=firstRow.cells[i];if((" "+cell.className+" ").indexOf(" unsortable ")==-1){cell.innerHTML+=' '+'<a href="#" class="sortheader" '+'onclick="ts_resortTable(this);return false;">'+'<span class="sortarrow">'+'<img src="'+ts_image_path+ts_image_none+'" alt="↓"/></span></a>';}}if(ts_alternate_row_colors){ts_alternate(table);}}function onloadhookcustom(){var replace=document.getElementById("AdolasPayPal");if(null!=replace){replace.innerHTML=
'<form action="https://www.paypal.com/cgi-bin/webscr" method="post"><input type="hidden" name="cmd" value="_s-xclick"><input type="hidden" name="encrypted" value="-----BEGIN PKCS7-----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-----END PKCS7-----"><input type="image" src="https://www.paypal.com/en_US/i/btn/btn_donateCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!"><img alt="" border="0" src="https://www.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1"></form>'
;}}addOnloadHook(onloadhookcustom)
function tabberObj(argsObj){var arg;this.div=null;this.classMain="tabber";this.classMainLive="tabberlive";this.classTab="tabbertab";this.classTabDefault="tabbertabdefault";this.classNav="tabbernav";this.classTabHide="tabbertabhide";this.classNavActive="tabberactive";this.titleElements=['h2','h3','h4','h5','h6'];this.titleElementsStripHTML=false;this.removeTitle=true;this.addLinkId=false;this.linkIdFormat='<tabberid>nav<tabnumberone>';for(arg in argsObj){this[arg]=argsObj[arg];}this.REclassMain=new RegExp('\\b'+this.classMain+'\\b','gi');this.REclassMainLive=new RegExp('\\b'+this.classMainLive+'\\b','gi');this.REclassTab=new RegExp('\\b'+this.classTab+'\\b','gi');this.REclassTabDefault=new RegExp('\\b'+this.classTabDefault+'\\b','gi');this.REclassTabHide=new RegExp('\\b'+this.classTabHide+'\\b','gi');this.tabs=new Array();if(this.div){this.init(this.div);this.div=null;}}tabberObj.prototype.init=function(e){var childNodes,i,i2,t,defaultTab=0,DOM_ul,DOM_li,DOM_a,aId,headingElement;if(!
document.getElementsByTagName){return false;}if(e.id){this.id=e.id;}this.tabs.length=0;childNodes=e.childNodes;for(i=0;i<childNodes.length;i++){if(childNodes[i].className&&childNodes[i].className.match(this.REclassTab)){t=new Object();t.div=childNodes[i];this.tabs[this.tabs.length]=t;if(childNodes[i].className.match(this.REclassTabDefault)){defaultTab=this.tabs.length-1;}}}DOM_ul=document.createElement("ul");DOM_ul.className=this.classNav;for(i=0;i<this.tabs.length;i++){t=this.tabs[i];t.headingText=t.div.title;if(this.removeTitle){t.div.title='';}if(!t.headingText){for(i2=0;i2<this.titleElements.length;i2++){headingElement=t.div.getElementsByTagName(this.titleElements[i2])[0];if(headingElement){t.headingText=headingElement.innerHTML;if(this.titleElementsStripHTML){t.headingText.replace(/<br>/gi," ");t.headingText=t.headingText.replace(/<[^>]+>/g,"");}break;}}}if(!t.headingText){t.headingText=i+1;}DOM_li=document.createElement("li");t.li=DOM_li;DOM_a=document.createElement("a");DOM_a.
appendChild(document.createTextNode(t.headingText));DOM_a.href="javascript:void(null);";DOM_a.title=t.headingText;DOM_a.onclick=this.navClick;DOM_a.tabber=this;DOM_a.tabberIndex=i;if(this.addLinkId&&this.linkIdFormat){aId=this.linkIdFormat;aId=aId.replace(/<tabberid>/gi,this.id);aId=aId.replace(/<tabnumberzero>/gi,i);aId=aId.replace(/<tabnumberone>/gi,i+1);aId=aId.replace(/<tabtitle>/gi,t.headingText.replace(/[^a-zA-Z0-9\-]/gi,''));DOM_a.id=aId;}DOM_li.appendChild(DOM_a);DOM_ul.appendChild(DOM_li);}e.insertBefore(DOM_ul,e.firstChild);e.className=e.className.replace(this.REclassMain,this.classMainLive);this.tabShow(defaultTab);if(typeof this.onLoad=='function'){this.onLoad({tabber:this});}return this;};tabberObj.prototype.navClick=function(event){var rVal,a,self,tabberIndex,onClickArgs;a=this;if(!a.tabber){return false;}self=a.tabber;tabberIndex=a.tabberIndex;a.blur();if(typeof self.onClick=='function'){onClickArgs={'tabber':self,'index':tabberIndex,'event':event};if(!event){onClickArgs
.event=window.event;}rVal=self.onClick(onClickArgs);if(rVal===false){return false;}}self.tabShow(tabberIndex);return false;};tabberObj.prototype.tabHideAll=function(){var i;for(i=0;i<this.tabs.length;i++){this.tabHide(i);}};tabberObj.prototype.tabHide=function(tabberIndex){var div;if(!this.tabs[tabberIndex]){return false;}div=this.tabs[tabberIndex].div;if(!div.className.match(this.REclassTabHide)){div.className+=' '+this.classTabHide;}this.navClearActive(tabberIndex);return this;};tabberObj.prototype.tabShow=function(tabberIndex){var div;if(!this.tabs[tabberIndex]){return false;}this.tabHideAll();div=this.tabs[tabberIndex].div;div.className=div.className.replace(this.REclassTabHide,'');this.navSetActive(tabberIndex);if(typeof this.onTabDisplay=='function'){this.onTabDisplay({'tabber':this,'index':tabberIndex});}return this;};tabberObj.prototype.navSetActive=function(tabberIndex){this.tabs[tabberIndex].li.className=this.classNavActive;return this;};tabberObj.prototype.navClearActive=
function(tabberIndex){this.tabs[tabberIndex].li.className='';return this;};function tabberAutomatic(tabberArgs){var tempObj,divs,i;if(!tabberArgs){tabberArgs={};}tempObj=new tabberObj(tabberArgs);divs=document.getElementsByTagName("div");for(i=0;i<divs.length;i++){if(divs[i].className&&divs[i].className.match(tempObj.REclassMain)){tabberArgs.div=divs[i];divs[i].tabber=new tabberObj(tabberArgs);}}return this;}function tabberAutomaticOnLoad(tabberArgs){if(!tabberArgs){tabberArgs={};}addOnloadHook(function(){tabberAutomatic(tabberArgs);})}if(typeof tabberOptions=='undefined'){tabberAutomaticOnLoad();}else{if(!tabberOptions['manualStartup']){tabberAutomaticOnLoad(tabberOptions);}}importScript('MediaWiki:Functions.js');var firstRun=true;function loadFunc(){if(firstRun)firstRun=false;else return;rewriteSearchFormLink();fixSearch();}function fixSearch(){var button=document.getElementById('searchSubmit');if(button)button.name='go';}addOnloadHook(loadFunc);function updatetimer(i){var now=new
Date();var then=timers[i].eventdate;var diff=count=Math.floor((then.getTime()-now.getTime())/1000);if(isNaN(diff)){timers[i].firstChild.nodeValue='** '+timers[i].eventdate+' **';return;}if(diff<0){diff=-diff;var left='ago since';}else{var left='until';}left=(diff%60)+' seconds '+left;diff=Math.floor(diff/60);if(diff>0)left=(diff%60)+' minutes '+left;diff=Math.floor(diff/60);if(diff>0)left=(diff%24)+' hours '+left;diff=Math.floor(diff/24);if(diff>0)left=diff+' days '+left
timers[i].firstChild.nodeValue=left;tim[i]=setTimeout('updatetimer('+i+')',1000);}function checktimers(){var untimers=getElementsByClassName(document,'span','notimer');for(var i=0;i<untimers.length;i++){untimers[i].style.display='none';}timers=getElementsByClassName(document,'span','countdowntimer');tim=new Array();if(timers.length==0)return;for(var i=0;i<timers.length;i++){timers[i].eventdate=new Date(timers[i].firstChild.nodeValue);timers[i].firstChild.nodeValue='0 days 0 hours 0 minutes 0 seconds';timers[i].style.display='inline';updatetimer(i);}}addOnloadHook(checktimers)
$(".upphotos").click(function linkToUploader(){window.location.href='http://finalfantasy.wikia.com/wiki/Special:Upload';});function replaceSearchIcon(){$("#searchBody").find("form").wrapInner('<div />')
var innerDiv;var searchbox=document.getElementById('searchBody');if(searchbox){innerDiv=searchbox.getElementsByTagName('div')[0];var link=innerDiv.getElementsByTagName('a')[0];if(link){innerDiv.removeChild(link);}}onSearchIconsArrival(innerDiv);}function rand(n){return Math.round(Math.random()*n);}function onSearchIconsArrival(searchDiv){var lines=new Array("http://images2.wikia.nocookie.net/__cb20110517173142/finalfantasy/images/3/3b/BahamutFFSearchbar.png Bahamut","http://images1.wikia.nocookie.net/__cb20110517173141/finalfantasy/images/1/1f/ArtemicionSearchbar.png Artemicion","http://images2.wikia.nocookie.net/__cb20110517173142/finalfantasy/images/3/3b/BahamutFFSearchbar.png Bahamut","http://images1.wikia.nocookie.net/__cb20110517173141/finalfantasy/images/1/1f/ArtemicionSearchbar.png Artemicion","http://images1.wikia.nocookie.net/__cb20110517173142/finalfantasy/images/5/50/CecilDSFMVSearchbar.png Cecil Harvey",
"http://images4.wikia.nocookie.net/__cb20110517173142/finalfantasy/images/e/e8/BeliasSearchbar.png Belias","http://images4.wikia.nocookie.net/__cb20110517173142/finalfantasy/images/f/f9/BartzSearchbar.png Bartz Klauser","http://images2.wikia.nocookie.net/__cb20110517173143/finalfantasy/images/2/28/CelesAmano2Searchbar.png Celes Chere","http://images1.wikia.nocookie.net/__cb20110517173143/finalfantasy/images/4/42/ChibiTerraSearchbar.png Terra Branford","http://images3.wikia.nocookie.net/__cb20110517173143/finalfantasy/images/3/3b/CelesSDSearchbar.png Celes Chere","http://images3.wikia.nocookie.net/__cb20110517173313/finalfantasy/images/d/de/DeathgazeSearchbar.png Deathgaze","http://images2.wikia.nocookie.net/__cb20110517173144/finalfantasy/images/6/6a/CidTAYSearchbar.png Cid Pollendina","http://images3.wikia.nocookie.net/__cb20110517173143/finalfantasy/images/f/f6/CidIVSDSearchbar.png Cid Pollendina",
"http://images1.wikia.nocookie.net/__cb20110517173314/finalfantasy/images/9/95/DogaSearchbar.png Doga","http://images1.wikia.nocookie.net/__cb20110517173314/finalfantasy/images/1/12/DissidiaTerraSearchbar.png Terra Branford/Dissidia","http://images1.wikia.nocookie.net/__cb20110517173313/finalfantasy/images/8/8b/DissidiaTerra3DSearchbar.png Terra Branford/Dissidia","http://images4.wikia.nocookie.net/__cb20110517173315/finalfantasy/images/5/55/IfritSearchbar.png Ifrit","http://images3.wikia.nocookie.net/__cb20110517173314/finalfantasy/images/7/70/HashmalSearchbar.png Hashmal","http://images3.wikia.nocookie.net/__cb20110517173314/finalfantasy/images/b/b8/EOTMoogleSearchbar.png Moogle","http://images2.wikia.nocookie.net/__cb20110517173316/finalfantasy/images/e/ee/MalboroSearchbar.png Malboro","http://images3.wikia.nocookie.net/__cb20110517173316/finalfantasy/images/e/ec/MaenadSearchbar.png Maenad",
"http://images2.wikia.nocookie.net/__cb20110517173315/finalfantasy/images/2/2d/KupoSearchbar.png Moogle","http://images2.wikia.nocookie.net/__cb20120324044230/finalfantasy/images/d/df/QueenSearchbar.png Queen","http://images1.wikia.nocookie.net/__cb20110517173410/finalfantasy/images/d/db/RosaSDSearchbar.png Rosa Joanna Farrell","http://images4.wikia.nocookie.net/__cb20110517173410/finalfantasy/images/a/a7/RamuhSearchbar.png Ramuh","http://images3.wikia.nocookie.net/__cb20110517173410/finalfantasy/images/6/62/OhohohohoSearchbar.png Shantotto","http://images2.wikia.nocookie.net/finalfantasy/images/3/33/StragoSDSearchbar.png Strago Magus","http://images1.wikia.nocookie.net/finalfantasy/images/1/1f/ShivaSearchbar.png Shiva","http://images3.wikia.nocookie.net/finalfantasy/images/5/52/ShantottoDissidiaSearchbar.png Shantotto/Dissidia","http://images1.wikia.nocookie.net/finalfantasy/images/d/db/UneiSearchbar.png Unei",
"http://images1.wikia.nocookie.net/finalfantasy/images/e/ee/TerraSDSearchbar.png Terra Branford","http://images1.wikia.nocookie.net/finalfantasy/images/e/e9/TerraFaceSearchbar.png Terra Branford","http://images2.wikia.nocookie.net/__cb20110506201728/finalfantasy/images/3/30/AmanoKainSearchbar.png Kain Highwind","http://images2.wikia.nocookie.net/__cb20110506201727/finalfantasy/images/5/53/AdultRydiaSDSearchbar.png Rydia","http://images2.wikia.nocookie.net/__cb20110506201730/finalfantasy/images/3/39/CelesChibiSearchbar.png Celes Chere","http://images3.wikia.nocookie.net/__cb20110506201729/finalfantasy/images/c/cf/AngeloSearchbar.png Angelo","http://images1.wikia.nocookie.net/__cb20110506201731/finalfantasy/images/d/d9/RydiaTAYSearchbar.png Rydia","http://images4.wikia.nocookie.net/__cb20110506201731/finalfantasy/images/4/4f/TellahDSSearchbar.png Tellah","http://images4.wikia.nocookie.net/__cb20110506201731/finalfantasy/images/e/ef/TellahSDSearchbar.png Tellah",
"http://images3.wikia.nocookie.net/__cb20110506202046/finalfantasy/images/b/b6/JihlSearchbar.png Jihl Nabaat","http://images1.wikia.nocookie.net/__cb20110506201732/finalfantasy/images/0/07/LockeChibiSearchbar.png Locke Cole","http://images2.wikia.nocookie.net/__cb20110506201731/finalfantasy/images/7/79/ManInBlackSearchbar.png Man in Black","http://images2.wikia.nocookie.net/__cb20110506202046/finalfantasy/images/c/ce/KainDSSearchbar.png Kain Highwind","http://images1.wikia.nocookie.net/__cb20110506202047/finalfantasy/images/c/c3/KainDissidia3DSearchbar.png Kain Highwind","http://images2.wikia.nocookie.net/__cb20110506202047/finalfantasy/images/d/d4/KainSDSearchbar.png Kain Highwind","http://images3.wikia.nocookie.net/__cb20110506202047/finalfantasy/images/8/8f/HarleySearchbar.png Harley","http://images2.wikia.nocookie.net/__cb20110506202047/finalfantasy/images/6/68/GilgyDissidiaSpriteSearchbar.png Gilgamesh",
"http://images2.wikia.nocookie.net/__cb20110506202047/finalfantasy/images/b/bc/GilgyDissidiaCloakSearchbar.png Gilgamesh","http://images4.wikia.nocookie.net/__cb20110506202048/finalfantasy/images/4/4e/AmanoStragoSearchbar.png Strago Magus","http://images3.wikia.nocookie.net/__cb20110506202048/finalfantasy/images/d/dc/FusoyaSDSearchbar.png Fusoya","http://images3.wikia.nocookie.net/__cb20110506202048/finalfantasy/images/7/76/GolbezSDSearchbar.png Golbez","http://images4.wikia.nocookie.net/__cb20100617182946/finalfantasy/images/0/09/BombSearchbar.png Bomb","http://images4.wikia.nocookie.net/__cb20100617182947/finalfantasy/images/7/74/MimicSearchbar.png Mimic","http://images2.wikia.nocookie.net/__cb20100617182945/finalfantasy/images/b/b9/LeviathanSearchbar.png Leviathan","http://images4.wikia.nocookie.net/__cb20100617175027/finalfantasy/images/7/7e/StiltzkinSearchbar.png Stiltzkin",
"http://images2.wikia.nocookie.net/__cb20100617175027/finalfantasy/images/6/6a/ViviSearchbar.png Vivi Orunitia","http://images3.wikia.nocookie.net/__cb20100617165053/finalfantasy/images/e/e7/TidusSearchbar.png Tidus","http://images1.wikia.nocookie.net/__cb20100617165053/finalfantasy/images/7/7e/YunaSearchbar.png Yuna","http://images2.wikia.nocookie.net/__cb20100617165053/finalfantasy/images/e/e4/WhiteMageSearchbar.png White Mage","http://images3.wikia.nocookie.net/__cb20100617165052/finalfantasy/images/f/f7/MinwuSearchbar.png Minwu","http://images4.wikia.nocookie.net/__cb20100617165052/finalfantasy/images/9/93/GilgySearchbar.png Gilgamesh","http://images4.wikia.nocookie.net/__cb20100617165052/finalfantasy/images/0/0b/GilgameshSearchbar.png Gilgamesh","http://images2.wikia.nocookie.net/__cb20100617175027/finalfantasy/images/0/00/GarlandSearchbar.png Garland (Final Fantasy IX)","http://images1.wikia.nocookie.net/__cb20100617165051/finalfantasy/images/2/2c/DeumionSearchbar.png Deumion",
"http://images1.wikia.nocookie.net/__cb20100615165151/finalfantasy/images/2/2f/DissidiaOKSearchbar.png Onion Knight/Dissidia","http://images4.wikia.nocookie.net/__cb20100615165151/finalfantasy/images/e/e2/DOSCrystalSearchbar.png Crystal (Term)","http://images3.wikia.nocookie.net/__cb20100616221520/finalfantasy/images/3/3c/FangSearchbar.png Oerba Yun Fang","http://images3.wikia.nocookie.net/__cb20100615165152/finalfantasy/images/6/6f/SageIngusSearchbar.png Sage (Final Fantasy III)","http://images3.wikia.nocookie.net/__cb20100615165152/finalfantasy/images/9/9d/SageRefiaSearchbar.png Sage (Final Fantasy III)","http://images1.wikia.nocookie.net/__cb20100615165152/finalfantasy/images/6/63/FusoyaSearchbar.png Fusoya","http://images1.wikia.nocookie.net/__cb20100615165152/finalfantasy/images/e/e4/SageLunethSearchbar.png Sage (Final Fantasy III)","http://images.wikia.com/finalfantasy/images/a/a2/SearchbarKaincb.png Kain Highwind",
"http://images.wikia.com/finalfantasy/images/0/07/SearchbarCecil.png Cecil Harvey","http://images.wikia.com/finalfantasy/images/1/1d/Cloudsearch.png Cloud Strife","http://images.wikia.com/finalfantasy/images/a/a5/Mysticladysearch.png Mystic","http://images.wikia.com/finalfantasy/images/a/a3/ArithmaManSearch.png Arithmetician","http://images.wikia.com/finalfantasy/images/8/80/SearchbarLocke.png Locke Cole","http://images.wikia.com/finalfantasy/images/2/2b/SearchbarBalthier.png Balthier","http://images.wikia.com/finalfantasy/images/9/95/Search_Scholar_1.png Quistis Trepe","http://images.wikia.com/finalfantasy/images/4/42/Search_Scholar_2.png Refia","http://images.wikia.com/finalfantasy/images/4/46/Search_Scholar_3.png Arc","http://images.wikia.com/finalfantasy/images/e/ea/Search_Scholar_4.png Ingus","http://images.wikia.com/finalfantasy/images/a/a7/Search_Scholar_5.png Luneth","http://images.wikia.com/finalfantasy/images/a/aa/Search_Scholar_6.png Scholar (Final Fantasy TA2)",
"http://images.wikia.com/finalfantasy/images/9/93/Search_Scholar_7.jpg Scholar (Final Fantasy XI)","http://images.wikia.com/finalfantasy/images/d/d8/Search_Scholar_8.png Book","http://images.wikia.com/finalfantasy/images/e/e2/Scearch-scholar.png Scholar (Final Fantasy III)","http://images.wikia.com/finalfantasy/images/1/11/Search_Libra.png Libra","http://images.wikia.com/finalfantasy/images/9/9d/Pochika_search_bar.png Wyht","http://images.wikia.com/finalfantasy/images/4/43/Bluemagebartzsearch.png Blue Mage","http://images.wikia.com/finalfantasy/images/0/08/Whitemagenumousearch.png White Mage (Final Fantasy Tactics Advance)","http://images.wikia.com/finalfantasy/images/4/4b/Stragosearch.png Strago Magus","http://images.wikia.com/finalfantasy/images/f/f6/Sheepbartzsearch.png Beastmaster","http://images.wikia.com/finalfantasy/images/1/1e/Elidbdissearch.png Elidibus","http://images.wikia.com/finalfantasy/images/9/9d/Amaniconsearch.png Arithmetician",
"http://images.wikia.com/finalfantasy/images/f/f7/Arithmalady.png  Arithmetician","http://images.wikia.com/finalfantasy/images/0/04/Efieldsearch.png Elidibus","http://images.wikia.com/finalfantasy/images/3/30/Search_Weapon_1.jpg Revolver","http://images.wikia.com/finalfantasy/images/f/f9/Search_Weapon_2.jpg List_of_Final_Fantasy_VIII_Weapons#Hyperion","http://images.wikia.com/finalfantasy/images/5/51/Search_Weapon_3.jpg Buster Sword","http://images.wikia.com/finalfantasy/images/b/b7/Search_Weapon_4.jpg Fusion Swords","http://images.wikia.com/finalfantasy/images/d/dd/Searchbar_Bonga!.png Bonga Bugle","http://images2.wikia.nocookie.net/__cb20110525212648/finalfantasy/images/e/e5/FeralChaosSearchbar.png Feral Chaos");var line=lines[rand(lines.length-1)];var pos=line.indexOf(' ');var link=document.createElement('div');link.id='search-icon-wrapper';var img=document.createElement('img');img.alt='Search';img.src=(pos==-1)?line:line.substring(0,pos);link.appendChild(img);searchDiv.insertBefore
(link,searchDiv.firstChild);var div=document.createElement('div');div.id='search-popup';div.style.display='none';var ul=document.createElement('ul');var li;var a;li=document.createElement('li');a=document.createElement('a');a.href=wgScriptPath+'/index.php?title=Special:Search&adv=1';a.appendChild(document.createTextNode('Advanced search'));li.appendChild(a);ul.appendChild(li);li=document.createElement('li');a=document.createElement('a');a.href=(pos==-1)?'javascript:emptySearchDesc()':'/wiki/'+line.substring(pos+1);a.appendChild(document.createTextNode("What's this? ("+((pos==-1)?'NO DESCRIPTION':line.substring(pos+1))+')'));li.appendChild(a);ul.appendChild(li);li=document.createElement('li');a=document.createElement('a');a.href='javascript:closeSearchPopup()';a.appendChild(document.createTextNode('Close'));li.appendChild(a);ul.appendChild(li);var container=document.getElementById('globalWrapper');if(!container){container=document.getElementById('container');}div.appendChild(ul);
container.appendChild(div);link.onclick=openSearchPopup;}function openSearchPopup(event){var div=document.getElementById('search-popup');var e=event||window.event;div.style.display=(div.style.display=='none')?'block':'none';div.style.left=e.clientX+'px';div.style.top=(e.clientY+document.documentElement.scrollTop)+'px';}function closeSearchPopup(){document.getElementById('search-popup').style.display='none';}function emptySearchDesc(){alert('No description exists for this search icon. Please contact the administrators to resolve this problem.');}addOnloadHook(replaceSearchIcon);;mw.loader.state({"site":"ready"});

/* cache key: finalfantasy:resourceloader:filter:minify-js:7:454fc08829b158eef6e01d12c0eb45e5 */