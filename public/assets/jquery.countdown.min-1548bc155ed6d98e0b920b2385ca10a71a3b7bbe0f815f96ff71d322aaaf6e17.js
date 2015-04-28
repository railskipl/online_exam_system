!function(t){function e(){function e(t){var n=1e12>t?n=performance.now?performance.now()+performance.timing.navigationStart:Date.now():t||(new Date).getTime();n-s>=1e3&&(h._updateTargets(),s=n),i(e)}this.regional=[],this.regional[""]={labels:["Years","Months","Weeks","Days","Hours","Minutes","Seconds"],labels1:["Year","Month","Week","Day","Hour","Minute","Second"],compactLabels:["y","m","w","d"],whichLabels:null,digits:["0","1","2","3","4","5","6","7","8","9"],timeSeparator:":",isRTL:!1},this._defaults={until:null,since:null,timezone:null,serverSync:null,format:"dHMS",layout:"",compact:!1,significant:0,description:"",expiryUrl:"",expiryText:"",alwaysExpire:!1,onExpiry:null,onTick:null,tickInterval:1},t.extend(this._defaults,this.regional[""]),this._serverSyncs=[];var i=window.requestAnimationFrame||window.webkitRequestAnimationFrame||window.mozRequestAnimationFrame||window.oRequestAnimationFrame||window.msRequestAnimationFrame||null,s=0;!i||t.noRequestAnimationFrame?(t.noRequestAnimationFrame=null,setInterval(function(){h._updateTargets()},980)):(s=window.animationStartTime||window.webkitAnimationStartTime||window.mozAnimationStartTime||window.oAnimationStartTime||window.msAnimationStartTime||(new Date).getTime(),i(e))}function i(e,i){return"option"==e&&(0==i.length||1==i.length&&"string"==typeof i[0])?!0:t.inArray(e,p)>-1}var s=0,n=1,o=2,a=3,r=4,l=5,_=6;t.extend(e.prototype,{markerClassName:"hasCountdown",propertyName:"countdown",_rtlClass:"countdown_rtl",_sectionClass:"countdown_section",_amountClass:"countdown_amount",_rowClass:"countdown_row",_holdingClass:"countdown_holding",_showClass:"countdown_show",_descrClass:"countdown_descr",_timerTargets:[],setDefaults:function(e){this._resetExtraLabels(this._defaults,e),t.extend(this._defaults,e||{})},UTCDate:function(t,e,i,s,n,o,a,r){"object"==typeof e&&e.constructor==Date&&(r=e.getMilliseconds(),a=e.getSeconds(),o=e.getMinutes(),n=e.getHours(),s=e.getDate(),i=e.getMonth(),e=e.getFullYear());var l=new Date;return l.setUTCFullYear(e),l.setUTCDate(1),l.setUTCMonth(i||0),l.setUTCDate(s||1),l.setUTCHours(n||0),l.setUTCMinutes((o||0)-(Math.abs(t)<30?60*t:t)),l.setUTCSeconds(a||0),l.setUTCMilliseconds(r||0),l},periodsToSeconds:function(t){return 31557600*t[0]+2629800*t[1]+604800*t[2]+86400*t[3]+3600*t[4]+60*t[5]+t[6]},_attachPlugin:function(e,i){if(e=t(e),!e.hasClass(this.markerClassName)){var s={options:t.extend({},this._defaults),_periods:[0,0,0,0,0,0,0]};e.addClass(this.markerClassName).data(this.propertyName,s),this._optionPlugin(e,i)}},_addTarget:function(t){this._hasTarget(t)||this._timerTargets.push(t)},_hasTarget:function(e){return t.inArray(e,this._timerTargets)>-1},_removeTarget:function(e){this._timerTargets=t.map(this._timerTargets,function(t){return t==e?null:t})},_updateTargets:function(){for(var t=this._timerTargets.length-1;t>=0;t--)this._updateCountdown(this._timerTargets[t])},_optionPlugin:function(e,i,s){e=t(e);var n=e.data(this.propertyName);if(!i||"string"==typeof i&&null==s){var o=i;return i=(n||{}).options,i&&o?i[o]:i}if(e.hasClass(this.markerClassName)){if(i=i||{},"string"==typeof i){var o=i;i={},i[o]=s}this._resetExtraLabels(n.options,i),t.extend(n.options,i),this._adjustSettings(e,n);var a=new Date;(n._since&&n._since<a||n._until&&n._until>a)&&this._addTarget(e[0]),this._updateCountdown(e,n)}},_updateCountdown:function(e,i){var s=t(e);if(i=i||s.data(this.propertyName)){if(s.html(this._generateHTML(i)).toggleClass(this._rtlClass,i.options.isRTL),t.isFunction(i.options.onTick)){var n="lap"!=i._hold?i._periods:this._calculatePeriods(i,i._show,i.options.significant,new Date);(1==i.options.tickInterval||this.periodsToSeconds(n)%i.options.tickInterval==0)&&i.options.onTick.apply(e,[n])}var o="pause"!=i._hold&&(i._since?i._now.getTime()<i._since.getTime():i._now.getTime()>=i._until.getTime());if(o&&!i._expiring){if(i._expiring=!0,this._hasTarget(e)||i.options.alwaysExpire){if(this._removeTarget(e),t.isFunction(i.options.onExpiry)&&i.options.onExpiry.apply(e,[]),i.options.expiryText){var a=i.options.layout;i.options.layout=i.options.expiryText,this._updateCountdown(e,i),i.options.layout=a}i.options.expiryUrl&&(window.location=i.options.expiryUrl)}i._expiring=!1}else"pause"==i._hold&&this._removeTarget(e);s.data(this.propertyName,i)}},_resetExtraLabels:function(t,e){var i=!1;for(var s in e)if("whichLabels"!=s&&s.match(/[Ll]abels/)){i=!0;break}if(i)for(var s in t)s.match(/[Ll]abels[02-9]/)&&(t[s]=null)},_adjustSettings:function(e,i){for(var s,n=0,o=null,a=0;a<this._serverSyncs.length;a++)if(this._serverSyncs[a][0]==i.options.serverSync){o=this._serverSyncs[a][1];break}if(null!=o)n=i.options.serverSync?o:0,s=new Date;else{var r=t.isFunction(i.options.serverSync)?i.options.serverSync.apply(e,[]):null;s=new Date,n=r?s.getTime()-r.getTime():0,this._serverSyncs.push([i.options.serverSync,n])}var l=i.options.timezone;l=null==l?-s.getTimezoneOffset():l,i._since=i.options.since,null!=i._since&&(i._since=this.UTCDate(l,this._determineTime(i._since,null)),i._since&&n&&i._since.setMilliseconds(i._since.getMilliseconds()+n)),i._until=this.UTCDate(l,this._determineTime(i.options.until,s)),n&&i._until.setMilliseconds(i._until.getMilliseconds()+n),i._show=this._determineShow(i)},_destroyPlugin:function(e){e=t(e),e.hasClass(this.markerClassName)&&(this._removeTarget(e[0]),e.removeClass(this.markerClassName).empty().removeData(this.propertyName))},_pausePlugin:function(t){this._hold(t,"pause")},_lapPlugin:function(t){this._hold(t,"lap")},_resumePlugin:function(t){this._hold(t,null)},_hold:function(e,i){var s=t.data(e,this.propertyName);if(s){if("pause"==s._hold&&!i){s._periods=s._savePeriods;var n=s._since?"-":"+";s[s._since?"_since":"_until"]=this._determineTime(n+s._periods[0]+"y"+n+s._periods[1]+"o"+n+s._periods[2]+"w"+n+s._periods[3]+"d"+n+s._periods[4]+"h"+n+s._periods[5]+"m"+n+s._periods[6]+"s"),this._addTarget(e)}s._hold=i,s._savePeriods="pause"==i?s._periods:null,t.data(e,this.propertyName,s),this._updateCountdown(e,s)}},_getTimesPlugin:function(e){var i=t.data(e,this.propertyName);return i?i._hold?this._calculatePeriods(i,i._show,i.options.significant,new Date):i._periods:null},_determineTime:function(t,e){var i=function(t){var e=new Date;return e.setTime(e.getTime()+1e3*t),e},s=function(t){t=t.toLowerCase();for(var e=new Date,i=e.getFullYear(),s=e.getMonth(),n=e.getDate(),o=e.getHours(),a=e.getMinutes(),r=e.getSeconds(),l=/([+-]?[0-9]+)\s*(s|m|h|d|w|o|y)?/g,_=l.exec(t);_;){switch(_[2]||"s"){case"s":r+=parseInt(_[1],10);break;case"m":a+=parseInt(_[1],10);break;case"h":o+=parseInt(_[1],10);break;case"d":n+=parseInt(_[1],10);break;case"w":n+=7*parseInt(_[1],10);break;case"o":s+=parseInt(_[1],10),n=Math.min(n,h._getDaysInMonth(i,s));break;case"y":i+=parseInt(_[1],10),n=Math.min(n,h._getDaysInMonth(i,s))}_=l.exec(t)}return new Date(i,s,n,o,a,r,0)},n=null==t?e:"string"==typeof t?s(t):"number"==typeof t?i(t):t;return n&&n.setMilliseconds(0),n},_getDaysInMonth:function(t,e){return 32-new Date(t,e,32).getDate()},_normalLabels:function(t){return t},_generateHTML:function(e){var i=this;e._periods=e._hold?e._periods:this._calculatePeriods(e,e._show,e.options.significant,new Date);for(var p=!1,u=0,c=e.options.significant,d=t.extend({},e._show),m=s;_>=m;m++)p|="?"==e._show[m]&&e._periods[m]>0,d[m]="?"!=e._show[m]||p?e._show[m]:null,u+=d[m]?1:0,c-=e._periods[m]>0?1:0;for(var g=[!1,!1,!1,!1,!1,!1,!1],m=_;m>=s;m--)e._show[m]&&(e._periods[m]?g[m]=!0:(g[m]=c>0,c--));var w=e.options.compact?e.options.compactLabels:e.options.labels,f=e.options.whichLabels||this._normalLabels,y=function(t){var s=e.options["compactLabels"+f(e._periods[t])];return d[t]?i._translateDigits(e,e._periods[t])+(s?s[t]:w[t])+" ":""},D=function(t){var s=e.options["labels"+f(e._periods[t])];return!e.options.significant&&d[t]||e.options.significant&&g[t]?'<span class="'+h._sectionClass+'"><span class="'+h._amountClass+'">'+i._translateDigits(e,e._periods[t])+"</span><br/>"+(s?s[t]:w[t])+"</span>":""};return e.options.layout?this._buildLayout(e,d,e.options.layout,e.options.compact,e.options.significant,g):(e.options.compact?'<span class="'+this._rowClass+" "+this._amountClass+(e._hold?" "+this._holdingClass:"")+'">'+y(s)+y(n)+y(o)+y(a)+(d[r]?this._minDigits(e,e._periods[r],2):"")+(d[l]?(d[r]?e.options.timeSeparator:"")+this._minDigits(e,e._periods[l],2):"")+(d[_]?(d[r]||d[l]?e.options.timeSeparator:"")+this._minDigits(e,e._periods[_],2):""):'<span class="'+this._rowClass+" "+this._showClass+(e.options.significant||u)+(e._hold?" "+this._holdingClass:"")+'">'+D(s)+D(n)+D(o)+D(a)+D(r)+D(l)+D(_))+"</span>"+(e.options.description?'<span class="'+this._rowClass+" "+this._descrClass+'">'+e.options.description+"</span>":"")},_buildLayout:function(e,i,p,h,u,c){for(var d=e.options[h?"compactLabels":"labels"],m=e.options.whichLabels||this._normalLabels,g=function(t){return(e.options[(h?"compactLabels":"labels")+m(e._periods[t])]||d)[t]},w=function(t,i){return e.options.digits[Math.floor(t/i)%10]},f={desc:e.options.description,sep:e.options.timeSeparator,yl:g(s),yn:this._minDigits(e,e._periods[s],1),ynn:this._minDigits(e,e._periods[s],2),ynnn:this._minDigits(e,e._periods[s],3),y1:w(e._periods[s],1),y10:w(e._periods[s],10),y100:w(e._periods[s],100),y1000:w(e._periods[s],1e3),ol:g(n),on:this._minDigits(e,e._periods[n],1),onn:this._minDigits(e,e._periods[n],2),onnn:this._minDigits(e,e._periods[n],3),o1:w(e._periods[n],1),o10:w(e._periods[n],10),o100:w(e._periods[n],100),o1000:w(e._periods[n],1e3),wl:g(o),wn:this._minDigits(e,e._periods[o],1),wnn:this._minDigits(e,e._periods[o],2),wnnn:this._minDigits(e,e._periods[o],3),w1:w(e._periods[o],1),w10:w(e._periods[o],10),w100:w(e._periods[o],100),w1000:w(e._periods[o],1e3),dl:g(a),dn:this._minDigits(e,e._periods[a],1),dnn:this._minDigits(e,e._periods[a],2),dnnn:this._minDigits(e,e._periods[a],3),d1:w(e._periods[a],1),d10:w(e._periods[a],10),d100:w(e._periods[a],100),d1000:w(e._periods[a],1e3),hl:g(r),hn:this._minDigits(e,e._periods[r],1),hnn:this._minDigits(e,e._periods[r],2),hnnn:this._minDigits(e,e._periods[r],3),h1:w(e._periods[r],1),h10:w(e._periods[r],10),h100:w(e._periods[r],100),h1000:w(e._periods[r],1e3),ml:g(l),mn:this._minDigits(e,e._periods[l],1),mnn:this._minDigits(e,e._periods[l],2),mnnn:this._minDigits(e,e._periods[l],3),m1:w(e._periods[l],1),m10:w(e._periods[l],10),m100:w(e._periods[l],100),m1000:w(e._periods[l],1e3),sl:g(_),sn:this._minDigits(e,e._periods[_],1),snn:this._minDigits(e,e._periods[_],2),snnn:this._minDigits(e,e._periods[_],3),s1:w(e._periods[_],1),s10:w(e._periods[_],10),s100:w(e._periods[_],100),s1000:w(e._periods[_],1e3)},y=p,D=s;_>=D;D++){var T="yowdhms".charAt(D),v=new RegExp("\\{"+T+"<\\}(.*)\\{"+T+">\\}","g");y=y.replace(v,!u&&i[D]||u&&c[D]?"$1":"")}return t.each(f,function(t,e){var i=new RegExp("\\{"+t+"\\}","g");y=y.replace(i,e)}),y},_minDigits:function(t,e,i){return e=""+e,e.length>=i?this._translateDigits(t,e):(e="0000000000"+e,this._translateDigits(t,e.substr(e.length-i)))},_translateDigits:function(t,e){return(""+e).replace(/[0-9]/g,function(e){return t.options.digits[e]})},_determineShow:function(t){var e=t.options.format,i=[];return i[s]=e.match("y")?"?":e.match("Y")?"!":null,i[n]=e.match("o")?"?":e.match("O")?"!":null,i[o]=e.match("w")?"?":e.match("W")?"!":null,i[a]=e.match("d")?"?":e.match("D")?"!":null,i[r]=e.match("h")?"?":e.match("H")?"!":null,i[l]=e.match("m")?"?":e.match("M")?"!":null,i[_]=e.match("s")?"?":e.match("S")?"!":null,i},_calculatePeriods:function(t,e,i,p){t._now=p,t._now.setMilliseconds(0);var u=new Date(t._now.getTime());t._since?p.getTime()<t._since.getTime()?t._now=p=u:p=t._since:(u.setTime(t._until.getTime()),p.getTime()>t._until.getTime()&&(t._now=p=u));var c=[0,0,0,0,0,0,0];if(e[s]||e[n]){var d=h._getDaysInMonth(p.getFullYear(),p.getMonth()),m=h._getDaysInMonth(u.getFullYear(),u.getMonth()),g=u.getDate()==p.getDate()||u.getDate()>=Math.min(d,m)&&p.getDate()>=Math.min(d,m),w=function(t){return 60*(60*t.getHours()+t.getMinutes())+t.getSeconds()},f=Math.max(0,12*(u.getFullYear()-p.getFullYear())+u.getMonth()-p.getMonth()+(u.getDate()<p.getDate()&&!g||g&&w(u)<w(p)?-1:0));c[s]=e[s]?Math.floor(f/12):0,c[n]=e[n]?f-12*c[s]:0,p=new Date(p.getTime());var y=p.getDate()==d,D=h._getDaysInMonth(p.getFullYear()+c[s],p.getMonth()+c[n]);p.getDate()>D&&p.setDate(D),p.setFullYear(p.getFullYear()+c[s]),p.setMonth(p.getMonth()+c[n]),y&&p.setDate(D)}var T=Math.floor((u.getTime()-p.getTime())/1e3),v=function(t,i){c[t]=e[t]?Math.floor(T/i):0,T-=c[t]*i};if(v(o,604800),v(a,86400),v(r,3600),v(l,60),v(_,1),T>0&&!t._since)for(var C=[1,12,4.3482,7,24,60,60],M=_,b=1,S=_;S>=s;S--)e[S]&&(c[M]>=b&&(c[M]=0,T=1),T>0&&(c[S]++,T=0,M=S,b=1)),b*=C[S];if(i)for(var S=s;_>=S;S++)i&&c[S]?i--:i||(c[S]=0);return c}});var p=["getTimes"];t.fn.countdown=function(t){var e=Array.prototype.slice.call(arguments,1);return i(t,e)?h["_"+t+"Plugin"].apply(h,[this[0]].concat(e)):this.each(function(){if("string"==typeof t){if(!h["_"+t+"Plugin"])throw"Unknown command: "+t;h["_"+t+"Plugin"].apply(h,[this].concat(e))}else h._attachPlugin(this,t||{})})};var h=t.countdown=new e}(jQuery);