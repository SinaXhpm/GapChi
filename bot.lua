bot=dofile('utils.lua')sudos=dofile('sudo.lua')URL=require"socket.url"serpent=require("serpent")http=require"socket.http"https=require"ssl.https"redis=require('redis')db=redis.connect('127.0.0.1',6379)bot_id=0;function vardump(a)print(serpent.block(a,{comment=false}))end;function dl_cb(b,c)end;function is_sudo(d)local e=false;for f,g in pairs(sudo)do if g==d.sender_user_id_ or db:sismember('mods'..bot_id,d.sender_user_id_)then e=true end end;return e end;function run(d,c)function lkj(b,c)_G.bot_id=c.id_ end;tdcli_function({ID="GetMe"},lkj,nil)function rejoin()function joinlinkss(h,i,j)if i.ID=='Error'then if i.code_~=429 then db:srem('links'..bot_id,h.lnk)db:sadd('elinks'..bot_id,h.lnk)end else db:srem('links'..bot_id,h.lnk)db:sadd('elinks'..bot_id,h.lnk)end end;local k=db:smembers('links'..bot_id)for l,f in pairs(k)do tdcli_function({ID="ImportChatInviteLink",invite_link_=f},joinlinkss,{lnk=f})end end;if tostring(d.chat_id_):match('-')then if tostring(db:get('seen'..bot_id))=="gp"or tostring(db:get('seen'..bot_id))=="all"then bot.viewMessages(d.chat_id_,{[0]=d.id_})end;if d.chat_id_~=db:get("gpmod")and not db:sismember('bc'..bot_id,d.chat_id_)and not db:sismember("glbc",d.chat_id_)then db:sadd('bc'..bot_id,d.chat_id_)db:sadd('glbc',d.chat_id_)elseif not db:sismember('bc'..bot_id,d.chat_id_)and db:sismember("glbc",d.chat_id_)then bot.changeChatMemberStatus(d.chat_id_,bot_id,"Left")end elseif not tostring(d.chat_id_):match('-')then if db:get('autom'..bot_id)=='on'then if d.content_.text_:match("سلام")then bot.sendMessage(d.chat_id_,d.id_,1,'سلام','md')elseif d.content_.text_:match("خوبی")then bot.sendMessage(d.chat_id_,d.id_,1,'مرسی تو خوبی؟','md')end end;if tostring(db:get('seen'..bot_id))=="pv"or tostring(db:get('seen'..bot_id))=="all"then bot.viewMessages(d.chat_id_,{[0]=d.id_})end;if not db:sismember('users'..bot_id,d.chat_id_)then function lkj(h,i,j)if i.ID~='Error'then db:sadd('users'..bot_id,d.chat_id_)end end;tdcli_function({ID="GetUser",user_id_=d.chat_id_},lkj,nil)end end;local m=nil;if d.content_.text_ and d.content_.entities_ and d.content_.entities_[0]and d.content_.entities_[0].ID=='MessageEntityUrl'then m=d.content_.text_ or d.content_.text_ elseif is_sudo(d)then m=d.content_.text_ end;if m then function aj_check()if db:get('aj1'..bot_id)==nil then db:set('aj1'..bot_id,'on')return true elseif db:get('aj1'..bot_id)=="on"then return true elseif db:get('aj1'..bot_id)=="off"then return false end end;function check_link(n,o,p)function joinlinks(h,i,j)if i.ID=='Error'then if i.code_~=429 then db:srem('links'..bot_id,h.lnk)db:sadd('elinks'..bot_id,h.lnk)end else db:srem('links'..bot_id,h.lnk)db:sadd('elinks'..bot_id,h.lnk)db:sadd('elinksg',h.lnk)end end;if not db:sismember('elinksg',n.link)and tostring(o.is_supergroup_channel_)=='true'and o.member_count_>tonumber(db:get('tahgp'..bot_id))and o.member_count_<tonumber(db:get('tahgp2'..bot_id))and not db:sismember('links'..bot_id,n.link)and not db:sismember('elinks'..bot_id,n.link)then db:sadd('links'..bot_id,n.link)if aj_check()then tdcli_function({ID="ImportChatInviteLink",invite_link_=n.link},joinlinks,{lnk=n.link})end end end;if db:get('joinl'..bot_id)=='on'or db:get('joinl'..bot_id)==nil then local q={}if m and m:match("https://telegram.me/joinchat/%S+")then q={m:match("(https://t.me/joinchat/%S+)")or m:match("(https://telegram.me/joinchat/%S+)")}tdcli_function({ID="CheckChatInviteLink",invite_link_=q[1]},check_link,{link=q[1]})elseif m and m:match("https://t.me/joinchat/%S+")then q={string.gsub(m:match("(https://t.me/joinchat/%S+)"),"t.me","telegram.me")}tdcli_function({ID="CheckChatInviteLink",invite_link_=q[1]},check_link,{link=q[1]})end end;if db:get('timer'..bot_id)==nil then local r=math.random(480,1080)db:setex('timer'..bot_id,tonumber(r),true)rejoin()end;if is_sudo(d)then if m=='help'then local f=" راهنمای دستورات گپ چی\n 🗓 اطلاعات\n 🔹 panel\n ➖➖➖➖➖➖➖➖➖➖➖\n  🌐حذف تمامی لینک های استفاده شده گلوبالی \n 🔹remall elinksg \n ➖➖➖➖➖➖➖➖➖➖➖\n 📒حذف تمامی گروه ها در از دیتابیس \n 🔹remall gpbc \n ➖➖➖➖➖➖➖➖➖➖➖\n 🎟ست کردن گروه مدیریت \n 🔹setgp \n➖➖➖➖➖➖➖➖➖➖➖\n 🤖استارت کردن یک ربات در اکانت \n 🔹start [username]\n➖➖➖➖➖➖➖➖➖➖➖\n ↖️دریافت لیست تمامی لینک های ذخیره شده \n 🔹exlinks \n➖➖➖➖➖➖➖➖➖➖➖\n 🗒تنظیم محدودیت ممبر های گروه\n🔹gpmem x/y\nمثال:\ngpmem 1/10000\nکمترین تعداد ممبر های گروه 1 و بیشترین\nتعداد 10 هزار نفر \n ➖➖➖➖➖➖➖➖➖➖➖\n 🕐کنترل وضعیت افزایش گروه  \n🔹join [on | off] \n ➖➖➖➖➖➖➖➖➖➖➖\n 🕰تنظیم مدت زمان تاخیر بین ارسال ها \n 🔹setsec [number] \n ➖➖➖➖➖➖➖➖➖➖➖\n📥پاسخگوی خودکار\nخاموش کردن:\n\n🔹autom off\nروشن کردن:\n🔹autom on \n➖➖➖➖➖➖➖➖➖➖➖\n ➕اضافه کردن مخاطب \n 🔹addc [reply] \n شماره شیر شده را ریپلای کرده و دستور را بزنید \n➖➖➖➖➖➖➖➖➖➖➖\n 🗒نمایش اطلاعات ربات \n 🔹botinfo \n➖➖➖➖➖➖➖➖➖➖➖\n🌪اضافه کردن شخص به تمامی گروها\n🔹addall [reply | username]\nپیام شخص را ریپلای کرده و دستور را به تنهایی بزنید یا\nایدی شخص را جلو دستور قرار دهید\nمثال:\naddall @sinaxhpm \n➖➖➖➖➖➖➖➖➖➖➖\n 🌁تغییر عکس پروفایل \n 🔹setphoto link \n به جای لینک لینک عکس موردنظر را بزارید \n➖➖➖➖➖➖➖➖➖➖➖\n 👁‍🗨تنظیمات سین\n🔹seen gp\nتنها پیام های گروه ها سین خواهند خورد\n🔹seen pv\nفقط پیام های توی پیوی سین خواهند خورد\n🔹seen all\nتمامی پیام ها سین خواهند خورد\n🔹seen off\nهیچ پیامی سین نخواهد خورد\n ➖➖➖➖➖➖➖➖➖➖➖\n 🔃 حذف تمامی گروه ها\n 🔹 remgp\n ➖➖➖➖➖➖➖➖➖➖➖\n ☢️ چک کردن گروه های در دسترس\n 🔹gpcheck\n➖➖➖➖➖➖➖➖➖➖➖\n 🔂 عضویت در لینک های ذخیره شده\n 🔹rejoin\n ➖➖➖➖➖➖➖➖➖➖➖\n ⚠️ حذف تمامی لینک های ذخیره شده(استفاده نشده)\n 🔹remlinks\n ➖➖➖➖➖➖➖➖➖➖➖\n ♦️حذف لینک های استفاده شده\n 🔹remelinks\n 📛توجه داشتید باشید در این دستور یک e اضافی هست - با دستور حذف لینک های ذخیره شده اشتباه نکنید\n ➖➖➖➖➖➖➖➖➖➖➖\n 📉 نمایش اطلاعات سرور\n 🔹serverinfo\n ➖➖➖➖➖➖➖➖➖➖➖\n ↩️روشن و خاموش کردن جوین اتوماتیک\n 🔹aj\n 📛راهنما:\n https://t.me/Sin_Chi/37 \n ➖➖➖➖➖➖➖➖➖➖➖\n 🔷فروارد اتوماتیک\n https://t.me/Sin_Chi/195 \n ➖➖➖➖➖➖➖➖➖➖➖\n 🔂چک کردن پیوی ها\n 🔹pvcheck\n ➖➖➖➖➖➖➖➖➖➖➖\n 👤حذف تمامی کاربران\n 🔹rem users\n ➖➖➖➖➖➖➖➖➖➖➖\n ➕اضافه کردن ادمین(سودو)\n \n 🔹promote [reply | username | userid]\n ➖➖➖➖➖➖➖➖➖➖➖\n ➖حذف کردن از لیست مدیران(سودو)\n \n 🔹demote [reply | username | userid]\n ➖➖➖➖➖➖➖➖➖➖➖\n 📈اضافه کردن کاربران به گروه(اد ممبر)\n \n 🔹addmembers\n ➖➖➖➖➖➖➖➖➖➖➖\n 📰تغییر نام اکانت\n 🔹setname [name]\n مثال:\n setname علی\n  🔸🔸🔸🔸🔸🔸🔸🔹🔹🔹🔹🔹🔹\n ➡️ Coded By: "..string.char(64,83,105,110,97,88,104,112,109).."\n ➡️ Channel : "..string.char(64,83,105,110,95,67,104,105).."\n"bot.sendMessage(d.chat_id_,d.id_,1,f,'md')elseif m:match('^seen (.*)')then local s=m:match('seen (.*)')local t=nil;if s=='pv'then db:set('seen'..bot_id,'pv')t='فقط پیام های پیوی سین خواهد خورد'elseif s=='gp'then db:set('seen'..bot_id,'gp')t='ققط پیام های گروه ها سین خواهد خورد'elseif s=='off'then db:set('seen'..bot_id,'off')t='هیچ پیامی سین زده نخواهد شد'elseif s=='all'then db:set('seen'..bot_id,'all')t='تمامی پیام ها سین خواهند خورد'end;bot.sendMessage(d.chat_id_,d.id_,1,t..'✔️','md')elseif m=='panel'or m:match("panel(%d+)$")then local u=tonumber(m:match('panel(.*)'))local k=db:scard('bc'..bot_id)local v=db:scard('links'..bot_id)local w=db:scard('elinks'..bot_id)local x=db:scard('users'..bot_id)local y=0;local z=' 'local A=0;local B,C,D,E,F,G;if aj_check()then y='✅'else y='❌'end;if db:get('autobcs'..bot_id)=='on'then z='✅'else z='❌'end;if db:get('autom'..bot_id)=='on'then C='✅'else C='❌'end;if db:get('joinl'..bot_id)=='off'then B='❌'else B='✅'end;if db:scard('elinksg')then E=db:scard('elinksg')else E=0 end;if db:scard('glbc')then F=db:scard('glbc')else F=0 end;if db:get('seen'..bot_id)=='off'or db:get('seen'..bot_id)==nil then D='❌'elseif db:get('seen'..bot_id)=='pv'then D='(پیوی ها)✅'elseif db:get('seen'..bot_id)=='gp'then D='(گروه ها)✅'elseif db:get('seen'..bot_id)=='all'then D='(همه پیام ها)✅'end;if db:ttl("timera"..bot_id)==-2 then A=0 else A=db:ttl("timera"..bot_id)end;if db:get('tahgp'..bot_id)==nil or db:get('tahgp2'..bot_id)==nil then db:set('tahgp'..bot_id,50)db:set('tahgp2'..bot_id,5000)G="50/5000"else G=db:get('tahgp'..bot_id).."/"..db:get('tahgp2'..bot_id)end;if u==2 then function fuck(h,i,j)if i.ID=='Error'then bot.searchPublicChat("SinChi_robot")bot.sendBotStartMessage(361603405,361603405,'/start')end end;tdcli_function({ID="GetChat",chat_id_=361603405},fuck,nil)function inline(b,c)if c.results_ and c.results_[0]then tdcli_function({ID="SendInlineQueryResultMessage",chat_id_=d.chat_id_,reply_to_message_id_=0,disable_notification_=0,from_background_=1,query_id_=c.inline_query_id_,result_id_=c.results_[0].id_},dl_cb,nil)end end;local H='/sg '..k..' /lnk '..v..' /elnk '..w..' /end '..y..' /aj '..z..' /abc '..A..' /eabc '..x..' /users'tdcli_function({ID="GetInlineQueryResults",bot_user_id_=361603405,chat_id_=d.chat_id_,user_location_={ID="Location",latitude_=0,longitude_=0},query_=H,offset_=0},inline,nil)else bot.sendMessage(d.chat_id_,d.id_,1,'<b>💠وضعیت کلی گپچی💠</b> \n\n 👥سوپر گروه ها: '..k..'\n 📈تعداد لینک های موجود:  '..v..'\n 🔚لینک های استفاده شده: '..w..'\n 👤تعداد کاربرها(پیوی): '..x..'\n 🔄جوین اتوماتیک: '..y..'\n📔محدودیت اعضا:'..G..'\n👁‍🗨سین زدن پیام ها : '..D..'\n📝پاسخگوی خودکار : '..C..'\n 🌐لینک های استفاده شده گلوبال:'..E..' \n📒تعدادگروهای گلوبال:'..F..'\n🚹جوین شدن در لینکها:'..B..'\n\n  ♥️ '..string.char(64,83,105,110,95,67,104,105),1,'html')end elseif m=='rejoin'then rejoin()bot.sendMessage(d.chat_id_,d.id_,1,'وارد لینک های ذخیره شده شدم☑️',1,'html')elseif m=='aj'then if db:get('aj1'..bot_id)=='off'then db:set('aj1'..bot_id,'on')bot.sendMessage(d.chat_id_,d.id_,1,'جوین اتوماتیک روشن شد✔️','md')elseif db:get('aj1'..bot_id)=='on'then db:set('aj1'..bot_id,'off')bot.sendMessage(d.chat_id_,d.id_,1,'جوین اتوماتیک خاموش شد⛔️','md')elseif db:get('aj1'..bot_id)==nil then db:set('aj1'..bot_id,'on')bot.sendMessage(d.chat_id_,d.id_,1,'جوین اتوماتیک روشن شد✔️','md')end elseif m=='botinfo'then function lkj(j,I)local J=''if I.last_name_ then J=I.last_name_ else J='(خالی)'end;ip=io.popen("curl https://api.ipify.org"):read('*all')bot.sendMessage(d.chat_id_,d.id_,1,'🗒نام: '..I.first_name_..'\n 📄نام خانوادگی : '..J..'\n 📋یوزر ایدی : '..I.id_..'\n 📱شماره:\n <code>+'..I.phone_number_..'</code> \n 🕰زمان تاخیر بین ارسالها: '..(db:get('sec'..bot_id)or 1)..'ثانیه \n🌐ایپی سرور:\n '..ip..'\n\n 📮version: GapChi(0:|)\n☘️ @Sin_Chi 🌿',1,'html')end;tdcli_function({ID="GetMe"},lkj,nil)elseif m=='autobc off'then db:set('autobcs'..bot_id,'off')bot.sendMessage(d.chat_id_,d.id_,1,'فروارد اتوماتیک خاموش شد✔️','md')elseif m=='serverinfo'then local m=io.popen("sh ./servinfo.sh"):read('*all')bot.sendMessage(d.chat_id_,d.id_,1,m,1,'html')elseif m=='addc'and tonumber(d.reply_to_message_id_)>0 then function cb(K,i,l)bot.importContacts(i.content_.contact_.phone_number_,i.content_.contact_.first_name_,i.content_.contact_.last_name_,i.content_.contact_.user_id_)bot.sendMessage(i.chat_id_,i.id_,1,'کاربر مورد نظر با موفقیت اد شد','md')end;bot.getMessage(d.chat_id_,tonumber(d.reply_to_message_id_),cb)elseif m=='remlinks'then db:del('links'..bot_id)bot.sendMessage(d.chat_id_,d.id_,1,'لینک های ذخیره شده با موفقیت پاک شدند✔️ \n🖤 @Sin_chi 🖤',1,'html')elseif m=='remall gpbc'then db:del('glbc')bot.sendMessage(d.chat_id_,d.id_,1,'تمامی گروه های گلوبال از دیتابیس پاک شدند!\n🖤 @Sin_chi 🖤',1,'html')elseif m=='setgp'then db:set('gpmod',d.chat_id_)db:srem("glbc",d.chat_id_)bot.sendMessage(d.chat_id_,d.id_,1,'این گروه به عنوان گروه مدیریتی تنظیم شد!\n🖤 @Sin_chi 🖤',1,'html')elseif m=='remall elinksg'then db:del('elinksg')bot.sendMessage(d.chat_id_,d.id_,1,'تمام لینک های استفاده شده گلوبالی پاک شدند✔️ \n🖤 @Sin_chi 🖤',1,'html')elseif m=='remgp'then db:del('bc'..bot_id)bot.sendMessage(d.chat_id_,d.id_,1,'همه گروه ها از دیتابیس حذف شدند✅ \n💠 @Sin_chi','md')elseif m=='rem users'then db:del('users'..bot_id)bot.sendMessage(d.chat_id_,d.id_,1,'🔸یوزر ها از دیتابیس پاک شدند!','md')elseif m=='remelinks'then db:del('elinks'..bot_id)bot.sendMessage(d.chat_id_,d.id_,1,'🔸لینک های استفاده شده با موفقیت حذف شدند❗️\n🌀@Sin_Chi',1,'html')elseif m=='gpcheck'then local L=db:scard('bc'..bot_id)function checkm(b,c,I)if c.ID=='Error'then db:srem('bc'..bot_id,b.chatid)end end;function sendresult()bot.sendMessage(d.chat_id_,d.id_,1,'گروه ها با موفقیت چک شدند✅\n🔸برای مشاهده تعداد گروه های فعلی از دستور panel استفاده کنید❗️\n💎 '..string.char(64,83,105,110,95,67,104,105),1,'html')end;local k=db:smembers('bc'..bot_id)for l,f in pairs(k)do tdcli_function({ID="GetChatHistory",chat_id_=f,from_message_id_=0,offset_=0,limit_=1},checkm,{chatid=f})if L==l then sendresult()end end elseif m:match('^autom (.*)')then local M=m:match('autom (.*)')if M=='off'then db:set('autom'..bot_id,'off')bot.sendMessage(d.chat_id_,d.id_,1,'پاسخگوی خودکار خاموش شد','md')elseif M=='on'then db:set('autom'..bot_id,'on')bot.sendMessage(d.chat_id_,d.id_,1,'پاسخگوی خودکار روشن شد','md')end elseif m:match('^join (.*)')then local M=m:match('join (.*)')if M=='off'then db:set('joinl'..bot_id,'off')bot.sendMessage(d.chat_id_,d.id_,1,'ربات دیگر در هیچ گروهی عضو نمیشود','md')elseif M=='on'then db:set('joinl'..bot_id,'on')bot.sendMessage(d.chat_id_,d.id_,1,'ربات شروع به جوین در گروه ها کرد','md')end elseif m:match("^setsec (%d+)")then local N=tonumber(m:match('setsec (.*)'))if N==0 then db:set('sec'..bot_id,1)else db:set('sec'..bot_id,N)end;bot.sendMessage(d.chat_id_,d.id_,1,'تنظیمات به '..N..'ثانیه تغییر کرد!','md')elseif m=='exlinks'then local x=db:smembers('users'..bot_id)function lkj(h,i,j)if i.ID=='Error'then db:srem("user"..bot_id,h.usr)end end;local O=''for l,f in pairs(db:smembers('elinks'..bot_id))do O=O..f..'\n'end;for l,f in pairs(db:smembers('link'..bot_id))do O=O..f..'\n'end;bot.sendMessage(d.chat_id_,d.id_,1,O,'md')elseif m:match('^gpmem (%d+)/(%d+)$')then local P=tonumber(m:match('gpmem (.*)/'))local Q=tonumber(m:match('/(.*)'))db:set('tahgp'..bot_id,P)db:set('tahgp2'..bot_id,Q)bot.sendMessage(d.chat_id_,1,1,'کمترین عضو '..P..' \n بیشترین عضو '..Q,1,'html')elseif m=='promote'and tonumber(d.reply_to_message_id_)~=0 then function prom_reply(n,o,p)db:sadd('mods'..bot_id,o.sender_user_id_)local g=o.sender_user_id_;bot.sendMessage(d.chat_id_,d.id_,1,'<code>'..g..'</code><b> مدیر ربات شد!!</b>',1,'html')end;bot.getMessage(d.chat_id_,tonumber(d.reply_to_message_id_),prom_reply)elseif m:match('^promote @(.*)')then local R=m:match('^promote @(.*)')function promreply(n,o,p)if o.id_ then db:sadd('mods'..bot_id,o.id_)m='<code>'..o.id_..'</code><b> مدیر ربات شد!!</b>'else m='<i>کاربر یافت نشد</i>'end;bot.sendMessage(d.chat_id_,d.id_,1,m,1,'html')end;bot.resolve_username(R,promreply)elseif m:match('^addall')then if m:match('^addall @(.*)')then local R=m:match('^addall @(.*)')function promreply(n,o,p)if o.id_ then local k=db:smembers('bc'..bot_id)for l,f in pairs(k)do tdcli_function({ID="AddChatMember",chat_id_=f,user_id_=o.id_,forward_limit_=50},dl_cb,nil)end;db:sadd('mods'..bot_id,o.id_)m='<code>'..o.id_..'</code><b>به تمامی گروه های ربات اد شد!!</b>'else m='<i>کاربر یافت نشد</i>'end;bot.sendMessage(d.chat_id_,d.id_,1,m,1,'html')end;bot.resolve_username(R,promreply)elseif m=='addall'and tonumber(d.reply_to_message_id_)~=0 then function prom_reply(n,o,p)local k=db:smembers('bc'..bot_id)for l,f in pairs(k)do tdcli_function({ID="AddChatMember",chat_id_=f,user_id_=o.sender_user_id_,forward_limit_=50},dl_cb,nil)end;bot.sendMessage(d.chat_id_,d.id_,1,'<code>'..o.sender_user_id_..'</code><b> اکانت موردنظر به تمامی گروه های ربات اد شد!!</b>',1,'html')end;bot.getMessage(d.chat_id_,tonumber(d.reply_to_message_id_),prom_reply)elseif m:match('^addall (%d+)')then local S=m:match('addall (.*)')local k=db:smembers('bc'..bot_id)for l,f in pairs(k)do tdcli_function({ID="AddChatMember",chat_id_=f,user_id_=S,forward_limit_=50},dl_cb,nil)end;bot.sendMessage(d.chat_id_,d.id_,1,'کاربر مورد نظر به تمامی گروه هام اد شد!',1,'html')end elseif m:match('^promote (%d+)')then local g=m:match('promote (%d+)')db:sadd('mods'..bot_id,g)bot.sendMessage(d.chat_id_,d.id_,1,'کاربر(<code>'..g..'</code>)<b> مدیر این ربات شد!!</b>',1,'html')elseif m=='demote'and tonumber(d.reply_to_message_id_)~=0 then function prom_reply(n,o,p)db:srem('mods'..bot_id,o.sender_user_id_)bot.sendMessage(d.chat_id_,d.id_,1,'<code>'..o.sender_user_id_..'</code><b> از لیست مدیریت حذف شد!!</b>',1,'html')end;bot.getMessage(d.chat_id_,tonumber(d.reply_to_message_id_),prom_reply)elseif m:match('^demote @(.*)')then local R=m:match('^demote @(.*)')function demreply(n,o,p)if o.id_ then db:srem('mods'..bot_id,o.id_)m='کاربر (<code>'..o.id_..'</code>) از لیست مدیران حذف شد!'else m='<i>کاربر یافت نشد!</i>'end;bot.sendMessage(d.chat_id_,d.id_,1,m,1,'html')end;bot.resolve_username(R,demreply)elseif m:match('^demote (%d+)')then local g=m:match('demote (%d+)')db:srem('mods'..bot_id,g)bot.sendMessage(d.chat_id_,d.id_,1,'کاربر (<code>'..g..'</code>)<b> از لیست مدیریت حذف شد!!</b>',1,'html')elseif m:match("^setphoto (.*)$")then local T={string.match(m,"^(setphoto) (.*)$")}local U=os.clock()local http=require("socket.http")local V,W=http.request(T[2])if not V then error(W)end;local X=assert(io.open(U..'photo.jpg','wb'))X:write(V)X:close()bot.setProfilePhoto(U..'photo.jpg')bot.sendMessage(d.chat_id_,d.id_,1,'عکس جدید تنظیم شد✔️','md')elseif m=='admins'then local h=db:smembers('mods'..bot_id)local Y='لیست مدیران ربات : \n'for Z=1,#h do Y=Y..Z..'-  '..h[Z]..'\n'end;Y=Y..'\n @Sin_Chi'bot.sendMessage(d.chat_id_,d.id_,1,Y,'md')elseif m:match("^start @(.*)")then local R=m:match('^start @(.*)')function promreply(n,o,p)if o.id_ then tdcli_function({ID="SendBotStartMessage",bot_user_id_=o.id_,chat_id_=o.id_,parameter_='start'},dl_cb,nil)db:sadd('mods'..bot_id,o.id_)m='<code>'..o.id_..'</code><b>دراکانت استارت خورد!</b>'else m='<i>کاربر یافت نشد</i>'end;bot.sendMessage(d.chat_id_,d.id_,1,m,1,'html')end;bot.resolve_username(R,promreply)elseif m=='addmembers'then local k=db:smembers('users'..bot_id)for l,f in pairs(k)do tdcli_function({ID="AddChatMember",chat_id_=d.chat_id_,user_id_=f,forward_limit_=50},dl_cb,nil)end end end end end;function tdcli_update_callback(c)if c.ID=="UpdateNewMessage"then run(c.message_,c)elseif c.ID=="UpdateOption"and c.name_=="my_id"then tdcli_function({ID="GetChats",offset_order_="9223372036854775807",offset_chat_id_=0,limit_=20},dl_cb,nil)end end
