
local RAM = {}
for i, v in pairs(_G) do RAM[i] = v end
RAM.io = {}
RAM.gg = {}
RAM.string = {}
for i, v in pairs(io) do RAM.io[i] = v end
for i, v in pairs(string) do RAM.string[i] = v end
for i, v in pairs(gg) do RAM.gg[i] = v end
 
function Memory_Ram(Search, Write, Type)
    ramClearResults()
    RAM.gg.setVisible(false)
    RAM.gg.searchNumber(Search[1][1], Type)
    local count = RAM.gg.getResultCount()
    local result = RAM.gg.getResults(count)
    ramClearResults()
    local data = {}
    local base = Search[1][2]
    if (count > 0) then
        for i, v in ipairs(result) do
            v.isUseful = true
        end
        for k=2, #Search do
            local tmp = {}
            local offset = Search[k][2] - base
            local num = Search[k][1]      
            for i, v in ipairs(result) do
                tmp[#tmp+1] = {}
                tmp[#tmp].address = v.address + offset  
                tmp[#tmp].flags = v.flags  
            end      
            tmp = gg.getValues(tmp)  
            for i, v in ipairs(tmp) do
                if ( tostring(v.value) ~= tostring(num) ) then
                    result[i].isUseful = false
                end
            end
        end
        for i, v in ipairs(result) do
            if (v.isUseful) then
                data[#data+1] = v.address
            end
        end
        if (#data > 0) then    
           RAM.gg.toast(#data.." value found")
           local t = {}
           local base = Search[1][2]
           for i=1, #data do
               for k, w in ipairs(Write) do
                   offset = w[2] - base
                   t[#t+1] = {}
                   t[#t].address = data[i] + offset
                   t[#t].flags = Type
                   t[#t].value = w[1]          
                   if (w[3] == true) then
                       local item = {}
                       item[#item+1] = t[#t]
                       item[#item].freeze = true
                       RAM.gg.addListItems(item)
                   end        
               end
           end
           RAM.gg.setValues(t)    
        else
            RAM.gg.toast("Failed to search value.", false)
            return false
        end
    else
        RAM.gg.toast("Failed to search value.")
        return false
    end
end
function ramToast(msg)
    RAM.gg.toast(tostring(msg))
end
function ramClearResults()
RAM.gg.clearResults()
end
on = "🔵ON🔵 "
off = "🔴OFF🔴 "
sits = off
highj = off
mcs = off
sph = off
gg.setVisible(true)
 
function split(szFullString, szSeparator) local nFindStartIndex = 1 local nSplitIndex = 1 local nSplitArray = {} while true do local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex) if not nFindLastIndex then nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString)) break end nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1) nFindStartIndex = nFindLastIndex + string.len(szSeparator) nSplitIndex = nSplitIndex + 1 end return nSplitArray end function xgxc(szpy, qmxg) for x = 1, #(qmxg) do xgpy = szpy + qmxg[x]["offset"] xglx = qmxg[x]["type"] xgsz = qmxg[x]["value"] gg.setValues({[1] = {address = xgpy, flags = xglx, value = xgsz}}) xgsl = xgsl + 1 end end function xqmnb(qmnb) gg.clearResults() gg.setRanges(qmnb[1]["memory"]) gg.searchNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "开启失败") else gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "开启失败") else sl = gg.getResults(999999) sz = gg.getResultCount() xgsl = 0 if sz > 999999 then sz = 999999 end for i = 1, sz do pdsz = true for v = 4, #(qmnb) do if pdsz == true then pysz = {} pysz[1] = {} pysz[1].address = sl[i].address + qmnb[v]["offset"] pysz[1].flags = qmnb[v]["type"] szpy = gg.getValues(pysz) pdpd = qmnb[v]["lv"] .. ";" .. szpy[1].value szpd = split(pdpd, ";") tzszpd = szpd[1] pyszpd = szpd[2] if tzszpd == pyszpd then pdjg = true pdsz = true else pdjg = false pdsz = false end end end if pdjg == true then szpy = sl[i].address xgxc(szpy, qmxg) xgjg = true end end if xgjg == true then gg.toast(qmnb[2]["name"] .. "开启成功,共修改" .. xgsl .. "条数据") else gg.toast(qmnb[2]["name"] .. "开启失败") end end end end
function SearchWrite(Search, Write, Type)
    gg.clearResults()
    gg.setVisible(false)
    gg.searchNumber(Search[1][1], Type)
    local count = gg.getResultCount()
    local result = gg.getResults(count)
    gg.clearResults()
    local data = {}
    local base = Search[1][2]
   
   if (count > 0) then
        for i, v in ipairs(result) do
            v.isUseful = true
        end
       
        for k=2, #Search do
            local tmp = {}
            local offset = Search[k][2] - base
            local num = Search[k][1]
           
            for i, v in ipairs(result) do
                tmp[#tmp+1] = {}
                tmp[#tmp].address = v.address + offset  
                tmp[#tmp].flags = v.flags  
            end
           
            tmp = gg.getValues(tmp)
           
            for i, v in ipairs(tmp) do
                if ( tostring(v.value) ~= tostring(num) ) then
                    result[i].isUseful = false
                end
            end
        end
 
        for i, v in ipairs(result) do
            if (v.isUseful) then
                data[#data+1] = v.address
            end
        end
       
        if (#data > 0) then
           gg.toast("found"..#data.."Article data")
           local t = {}
           local base = Search[1][2]
           for i=1, #data do
               for k, w in ipairs(Write) do
                   offset = w[2] - base
                   t[#t+1] = {}
                   t[#t].address = data[i] + offset
                   t[#t].flags = Type
                   t[#t].value = w[1]
                 
                   if (w[3] == true) then
                       local item = {}
                       item[#item+1] = t[#t]
                       item[#item].freeze = true
                       gg.addListItems(item)
                   end
                   
               end
           end
           gg.setValues(t)
       
        else
            gg.toast("not found", false)
            return false
        end
    else
        gg.toast("No data found")
        return false
    end
end



function split(szFullString, szSeparator)
  local nFindStartIndex = 1
  local nSplitIndex = 1
  local nSplitArray = {}
  while true do
    local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)
    if not nFindLastIndex then
      nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))
      break
    end
    nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)
    nFindStartIndex = nFindLastIndex + string.len(szSeparator)
    nSplitIndex = nSplitIndex + 1
  end
  return nSplitArray
end

function xgxc(szpy, qmxg)
  do
    do
      for i = 1, #qmxg do
        xgpy = szpy + qmxg[i].offset
        xglx = qmxg[i].type
        xgsz = qmxg[i].value
        xgdj = qmxg[i].freeze
        if xgdj == nil or xgdj == "" then
          gg.setValues({
            [1] = {
              address = xgpy,
              flags = xglx,
              value = xgsz
            }
          })
        else
          gg.addListItems({
            [1] = {
              address = xgpy,
              flags = xglx,
              freeze = xgdj,
              value = xgsz
            }
          })
        end
        xgsl = xgsl + 1
        xgjg = true
      end
    end
  end
end

function xqmnb(qmnb)
  gg.clearResults()
  gg.setRanges(qmnb[1].memory)
  gg.searchNumber(qmnb[3].value, qmnb[3].type)
  if gg.getResultCount() == 0 then
    gg.toast(qmnb[2].name .. "开启失败")
  else
    gg.refineNumber(qmnb[3].value, qmnb[3].type)
    gg.refineNumber(qmnb[3].value, qmnb[3].type)
    gg.refineNumber(qmnb[3].value, qmnb[3].type)
    if gg.getResultCount() == 0 then
      gg.toast(qmnb[2].name .. "开启失败")
    else
      sl = gg.getResults(999999)
      sz = gg.getResultCount()
      xgsl = 0
      if 999999 < sz then
        sz = 999999
      end
      do
        do
          for i = 1, sz do
            pdsz = true
            do
              do
                for i = 4, #qmnb do
                  if pdsz == true then
                    pysz = {}
                    pysz[1] = {}
                    pysz[1].address = sl[i].address + qmnb[i].offset
                    pysz[1].flags = qmnb[i].type
                    szpy = gg.getValues(pysz)
                    pdpd = qmnb[i].lv .. ";" .. szpy[1].value
                    szpd = split(pdpd, ";")
                    tzszpd = szpd[1]
                    pyszpd = szpd[2]
                    if tzszpd == pyszpd then
                      pdjg = true
                      pdsz = true
                    else
                      pdjg = false
                      pdsz = false
                    end
                  end
                end
              end
            end
            if pdjg == true then
              szpy = sl[i].address
              xgxc(szpy, qmxg)
            end
          end
        end
      end
      if xgjg == true then
        gg.toast(qmnb[2].name .. "开启成功，一共修改" .. xgsl .. "条数据")
      else
        gg.toast(qmnb[2].name .. "未搜索到数据，开启失败")
      end
    end
  end
end

function SearchWrite(Search, Write, Type)
  gg.clearResults()
  gg.setVisible(false)
  gg.searchNumber(Search[1][1], Type)
  local count = gg.getResultCount()
  local result = gg.getResults(count)
  gg.clearResults()
  local data = {}
  local base = Search[1][2]
  if count > 0 then
    do
      do
        for i, i in ipairs(result) do
          i.isUseful = true
        end
      end
    end
    do
      do
        for i = 2, #Search do
          local tmp = {}
          local offset = Search[i][2] - base
          local num = Search[i][1]
          do
            do
              for i, i in ipairs(result) do
                tmp[#tmp + 1] = {}
                tmp[#tmp].address = i.address + offset
                tmp[#tmp].flags = i.flags
              end
            end
          end
          tmp = gg.getValues(tmp)
          do
            for i, i in ipairs(tmp) do
              if tostring(i.value) ~= tostring(num) then
                result[i].isUseful = false
              end
            end
          end
        end
      end
    end
    do
      do
        for i, i in ipairs(result) do
          if i.isUseful then
            data[#data + 1] = i.address
          end
        end
      end
    end
    if #data > 0 then
      local t = {}
      local base = Search[1][2]
      do
        do
          for i = 1, #data do
            do
              for i, i in ipairs(Write) do
                offset = i[2] - base
                t[#t + 1] = {}
                t[#t].address = data[i] + offset
                t[#t].flags = Type
                t[#t].value = i[1]
                if i[3] == true then
                  local item = {}
                  item[#item + 1] = t[#t]
                  item[#item].freeze = true
                  gg.addListItems(item)
                end
              end
            end
          end
        end
      end
      gg.setValues(t)
      gg.toast("开启成功，一共修改" .. #t .. "条数据")
      gg.addListItems(t)
    else
      gg.toast("未搜索到数据，开启失败", false)
      return false
    end
  else
    gg.toast("Not Found")
    return false
  end
end

if gg.isPackageInstalled("com.antiban.f5mplus") or
  gg.isPackageInstalled("com.f5m")  then

gg.alert("👑مرحبا بك في هاك فخم للتواصل @F5MVIP👑", "التالي ")
gg.alert("🐎فخم يدرع بالسيرفر ولا يحسب حسابه🐎")
function HOME()
SN = gg.choice({
	 "l⁦⁦☄️ (( 🌠ترسيت سريع في القيم🌠 ))☄️ ⁦⁦🌠",
	"l⁦⁦☄️ (( 🌠الـحـمـايه 🌠  ))☄️ ⁦⁦🌠",
	"l⁦⁦☄️ (( 🌠أنتينا 🌠  ))☄️ ⁦⁦🌠",
	"l⁦⁦☄️ (( 🌠ولهاك والالوان 🌠  ))☄️ ⁦⁦🌠",
    "l⁦⁦☄️ (( 🌠خصائص لوبي 🌠 ))☄️ ⁦⁦🌠",
    "l⁦⁦☄️ (( 🌠خصائص قيم 🌠 ))☄️ ⁦⁦🌠",
    "l⁦⁦☄️ (( 🌠خصائص سرعه🌠 ))☄️ ⁦⁦🌠",
    "l⁦⁦☄️ (( 🌠خصائص ست سكوب 🌠 ))☄️ ⁦⁦🌠",
    "l⁦⁦☄️ (( 🌠خصائص خطره🌠 ))☄️ ⁦⁦🌠",
    "l⁦⁦☄️ (( 🌠الخلطات 🌠 ))☄️ ⁦⁦🌠",
    "l⁦⁦☄️ (( 🌠خصائص فلاش🌠 ))☄️ ⁦⁦🌠",
    " ◀↺EX▶ ",
 }, nil, "╔─━━━━━░░ 🔥قائمة تفعيلات فخم🔥 ░░━━━━━─╗")
if SN == nil then else
if SN ==1 then W7() end
if SN==2 then vvpn() end
if SN==3 then W10() end
if SN==4then FF1() end
if SN==5 then W2() end
if SN==6then W3() end
if SN==7then W4() end
if SN==8then W5() end
if SN==9then W6() end
if SN==10then W8() end
if SN==11then W9()  end
if SN==12then EXIT0() end
end 
  PUBGMH = -1
end

function W10()
gg.clearResults()
gg.setRanges(32)
gg.searchNumber("88.50576019287F;87.27782440186F;-100.91194152832F;1F::13", 16, false, 536870912, 0, -1)
gg.searchNumber("88.50576019287F;87.27782440186F;1F", 16, false, 536870912, 0, -1)
gg.getResults(gg.getResultsCount())
gg.editAll("1.96875;1.96875;999;1.96875;1.96875;999", 16)
gg.clearResults()
gg.toast("Antenna activated...")
end



function vvpn()
st=gg.choice({
"☠ • حماية 1  〔Lobby〕",
"☠ • حماية 2  〔Lobby〕",
"☠️ • حماية 3  〔Lobby〕",
"◄⎋ رجوع ►",
}, nil, "╔─━━━━━━━━░░ 🌠F5M🌠 ░░━━━━━━━━─╗")
if st==1 then st1()end
if st==2 then st2()end
if st==3 then st3()end
if st==4 then HOME()end
PUBGMH =-1
end

function st1()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("67109377", gg.TYPE_DWORD)
gg.searchNumber("67109377", gg.TYPE_DWORD)
revert = gg.getResults(gg.getResultsCount())
local t = gg.getResults(gg.getResultsCount())
for i, v in ipairs(t) do
 if v.flags == gg.TYPE_DWORD then
  v.value = '"0"'
  v.freeze = true
 end
end
gg.addListItems(t)
t = nil
end

function st3()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("67109633", gg.TYPE_DWORD)
gg.getResults(50000)
gg.editAll("0", gg.TYPE_DWORD)
gg.clearResults()
gg.alert("🌠F5M🌠")
gg.clearResults()
gg.setRanges(gg.REGION_C_DATA)
gg.searchNumber("-309056968;-298841599;-309061065", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("-298841599", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(10)
gg.editAll("10", gg.TYPE_DWORD)
gg.clearResults()
gg.alert("2/3 RELOG GAME & PLAY SAFE")
gg.clearResults()
gg.setRanges(gg.REGION_C_DATA)
gg.searchNumber("2015175168", 16, false, 536870912, 0, -1)
gg.getResults(10)
gg.editAll("0", 16)
gg.clearResults()
gg.alert("🌠 Bypass Has Been Activated 🌠")
end

function st2()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("67109633", gg.TYPE_DWORD)
gg.getResults(50000)
gg.editAll("0", gg.TYPE_DWORD)
gg.toast("50%")
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("16384;16384;16384;16384;16384;4480", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.refineNumber("4480", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(100)
  for SRD1_3_, SRD1_4_ in ipairs((gg.getResults(100))) do
    if SRD1_4_.flags == gg.TYPE_DWORD then
      SRD1_4_.value = "1"
      SRD1_4_.freeze = true
    end
  end
  gg.addListItems((gg.getResults(100)))
  gg.clearResults()
  gg.sleep(1700)
  gg.toast("Done ")
end

function FF1()
NO = gg.alert("اختار نوع 🖤","⟬ ولـ هاك سناب دراقون⟭", "⟬ ولـ هاك معالجات أخرى⟭")
if NO == nil then
  else
    if NO == 1 then
      SNAPDRAGON()
    end
    if NO == 2 then
      GG()
    end
    end
  iBug = -1
end

function CHIPSET()
  WALL22 = gg.multiChoice({
    "🐸 ᴀʟʟ ᴅᴇᴠɪᴄᴇ",
    "🐸 ғɪx ʙʟɪɴᴋ",
    "🐸 ғɪx sᴄᴏᴘᴇ",
    "🐸 ᴇxʏɴᴏs 7420",
    "🐸 ᴇxʏɴᴏs 7570",
    "🐸 ᴇxʏɴᴏs 7870",
    "🐸 ᴇxʏɴᴏs 7880",
    "🐸 ᴇxʏɴᴏs 7885",
    "🐸 ᴇxʏɴᴏs 8890",
    "🐸 ᴇxʏɴᴏs 8895",
    "🐸 ᴇxʏɴᴏs 9610",
    "🐸 ᴇxʏɴᴏs 9810",
    "🐸 ʜᴜᴀᴡᴇɪ",
    "🐸 ᴋɪʀɪɴ 650",
    "🐸 ᴋɪʀɪɴ 655",
    "🐸 ᴋɪʀɪɴ 658",
    "🐸 ᴋɪʀɪɴ 659",
    "🐸 ᴋɪʀɪɴ 710",
    "🐸 ᴋɪʀɪɴ 955",
    "🐸 ᴋɪʀɪɴ 970",
    "🐸 ᴋɪʀɪɴ 980",
    "🐸 ᴍᴇᴅɪᴀᴛᴇᴋ 6750",
    "🐸 ᴍᴇᴅɪᴀᴛᴇᴋ 6765",
    "🐸 ᴍᴇᴅɪᴀᴛᴇᴋ ɢ90ᴛ",
"◄⎋ رجوع ►",
  }, nil, "╔─━━━━━━━━░░ 🌠F5M🌠 ░░━━━━━━━━─╗")
  if WALL22 == nil then
  else
    if WALL22[1] == true then
      wc1()
    end
    if WALL22[2] == true then
      wc2()
    end
    if WALL22[3] == true then
      wc3()
    end
    if WALL22[4] == true then
      wc4()
    end
    if WALL22[5] == true then
      wc5()
    end
    if WALL22[6] == true then
      wc6()
    end
    if WALL22[7] == true then
      wc7()
    end
    if WALL22[8] == true then
      wc8()
    end
    if WALL22[9] == true then
      wc9()
    end
    if WALL22[10] == true then
      wc10()
    end
    if WALL22[11] == true then
      wc11()
    end
    if WALL22[12] == true then
      wc12()
    end
    if WALL22[13] == true then
      wc13()
    end
    if WALL22[14] == true then
      wc14()
    end
    if WALL22[15] == true then
      wc15()
    end
    if WALL22[16] == true then
      wc16()
    end
    if WALL22[17] == true then
      wc17()
    end
    if WALL22[18] == true then
      wc18()
    end
    if WALL22[19] == true then
      wc19()
    end
    if WALL22[20] == true then
      wc20()
    end
    if WALL22[21] == true then
      wc21()
    end
    if WALL22[22] == true then
      wc22()
    end
    if WALL22[23] == true then
      wc23()
    end
    if WALL22[24] == true then
      wc24()
    end
    if WALL22[25] == true then
      HOME()end
  end
  PUBGMH = -1
end

function wc4()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("40;32;16;2::37", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("40", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(9)
  gg.editAll("38", gg.TYPE_DWORD)
  gg.searchNumber("0.5;1.098618e-42;2.24207754e-44;2.69049305e-43;1.68155816e-44:645", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(25, nil, nil, nil, nil, nil, nil, nil, nil)
  local t = gg.getResults(25, nil, nil, nil, nil, nil, nil, nil, nil)
  do
    do
      for _FORV_4_, _FORV_5_ in ipairs(t) do
        if _FORV_5_.flags == gg.TYPE_FLOAT then
          _FORV_5_.value = "0"
          _FORV_5_.freeze = true
        end
      end
    end
  end
  gg.addListItems(t)
  t = nil
  gg.processResume()
end
  function wc1()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("2;1.8947657e-40;5.8013756e-42", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("2.718519e-43;3.7615819e-37;2;-1;1;-127", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
end
function wc2()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD | gg.REGION_VIDEO)
  gg.searchNumber("5.2806111e-40;6.50000333786;3.7615819e-37;2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(20)
  gg.editAll("9999", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD | gg.REGION_VIDEO)
  gg.searchNumber("1.1202011e-19;1.1202015e-19;3.7615819e-37;255.0;2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(20)
  gg.editAll("9999", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD | gg.REGION_VIDEO)
  gg.searchNumber("4140D;1.1202011e-19~1.1202013e-19;1.1202015e-19~1.1202017e-19;2::", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(2)
  gg.editAll("99999", gg.TYPE_FLOAT)
  gg.clearResults()
end
function wc3()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD | gg.REGION_VIDEO)
  gg.searchNumber("2.718519e-43F;3.7615819e-37F;2.0F;-1.0F;1.0F;-127.0F;0.00999999978F::200", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber(2, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(3)
  gg.editAll("2.001", gg.TYPE_FLOAT)
  gg.searchNumber(2, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD | gg.REGION_VIDEO)
  gg.searchNumber("5.8013756e-42F;-5.5695588e-40F;2.0F::100", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(3)
  gg.editAll("2.001", gg.TYPE_FLOAT)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
end
function wc5()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("360;0;0;0;-640;1;1;1;0;0;0;0;1;360;640;0.5;0;0;0;0.5;1;1;0;0;0;0;0;1;1;1;1;1,098618e-48:373", gg.TYPE_FLOAT)
  gg.searchNumber("0.5", gg.TYPE_FLOAT)
  t = gg.getResults(10)
  gg.editAll("50", gg.TYPE_FLOAT)
  t[1].value = "50"
  t[2].value = "50"
  t[3].value = "50"
  t[4].value = "50"
  t[5].value = "50"
  t[6].value = "50"
  t[1].freeze = true
  t[2].freeze = true
  t[3].freeze = true
  t[4].freeze = true
  t[5].freeze = true
  t[6].freeze = true
print("addListItems: ", gg.addListItems(t))
end
function wc6()
gg.clearResults()
gg.searchNumber("1.4012985e-45;1.793662e-43;1.4012985e-45;2.8025969e-45;3.5873241e-43;1.1210388e-44;0.5;0.5;2.8025969e-45;1.4012985e-45:253", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.processResume()
gg.refineNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)

revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
local t = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_FLOAT then
		v.value = "1"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
end
function wc7()
  if w == 1 then
    WHFIX7880()
  else
    gg.clearList()
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
    gg.searchNumber("0.5;2.8025969e-45;4D;2D;14D;5D;-1D", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(100)
    gg.editAll("0", gg.TYPE_FLOAT)
    gg.clearResults()
    gg.searchNumber("0.5;2.8025969e-45;4D;2D;14D;5D;-1D", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    if gg.getResultCount() == 0 then
      gg.alert("鉂嶸value Not Found")
    else
      gg.searchNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
      _Count = gg.getResultCount()
      _A = gg.getResults(_Count)
      last_Count = _Count + 1
      w = 1
      _T = "7880 "
      WHFIX7880()
    end
  end
end
function WHFIX7880()
  if w == 0 then
    gg.alert("Value Not Found")
  else
    gg.setVisible(false)
    _CL = {}
    for _FORV_3_ = 1, _Count do
      _CL[_FORV_3_] = "Edit" .. _FORV_3_ .. L0_14("�������������������������������������������")
    end
    _CL[last_Count] = "Return"
    _C_ = gg.choice(_CL, nil, "7880 ")
    for _FORV_3_ = 1, _Count do
      if _C_ == _FORV_3_ then
        for _FORV_7_, _FORV_8_ in ipairs(_A) do
          _A[_FORV_7_].freeze = false
          gg.addListItems(_A)
        end
        _A[_FORV_3_].value = 1
        _A[_FORV_3_].freeze = true
        gg.addListItems(_A)
        _FORV_3_ = _Count
      elseif K_2 == _Count + 1 then
        DDVGaming()
      end
    end
  end
  gg.setVisible(true)
end
function wc8()
  gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber('"1.1210388e-44;360.0;0.5:41"', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.refineNumber('"0.5"', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)

revert = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil)
local t = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_FLOAT then
		v.value = '"0"'
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
gg.clearResults()
gg.searchNumber("40D;32D;16D;2D::53", 4, false, 536870912, 0, -1)
gg.refineNumber("40", 4, false, 536870912, 0, -1)

revert = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil)
local t = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = '"38"'
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
end
function wc10()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("40;32;16;2::37", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("40", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(9)
  gg.editAll("38", gg.TYPE_DWORD)
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("4,09179152e-43;2,24207754e-44;3,58732407e-43;1,12103877e-44;3,30706438e-43;2,24207754e-44;3,69942795e-43;4,09179152e-43;2,24207754e-44;3,58732407e-43;1,12103877e-44;1,79366203e-43;1,12103877e-44;0,5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  t[1].value = "2"
  t[2].value = "2"
  t[3].value = "2"
  t[4].value = "2"
  t[5].value = "2"
  t[6].value = "2"
  t[1].freeze = true
  t[2].freeze = true
  t[3].freeze = true
  t[4].freeze = true
  t[5].freeze = true
  t[6].freeze = true
print("addListItems: ", gg.addListItems(t))
  gg.clearResults()
  gg.searchNumber("573.70306396484;0.05499718333.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("1.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(1200)
  gg.editAll("-999", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("56; 64; 48: 35", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("56", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("58", gg.TYPE_DWORD)
end
function wc11()
gg.clearList()
  gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("5.73831721e-42;1.83673795e-40;4.59177481e-40;3.85303814e-34;2.03203972e-39;2.80259693e-45;4.20389539e-45;1.40129846e-45;1.79366203e-43;2.80259693e-45;3.58732407e-43;1.12103877e-44;776.0;360.0;0.5;776.0;360.0;0.5;0.27913400531;0.56855899096;0.765625;0.99998998642;12,000.0;0.00003;-0.00161743164;1.098618e-42;1.40129846e-45;1.40129846e-45;8.40779079e-45;1.40129846e-45;4.48415509e-44;7.00649232e-45:509", gg.TYPE_FLOAT)
gg.refineNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  z = gg.getResults(4)
  x = gg.getResultCount()
  for _FORV_3_ = 1, x do
    y = z[_FORV_3_].address
    gg.addListItems({
      [1] = {
        address = y,
        flags = 16,
        freeze = true,
        value = 2
      }
    })
    end
end
function wc12()
  gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber('"0.5;2.8025969e-45;4D;2D;14D;5D;-1D"', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.refineNumber('"0.5"', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)

revert = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil)
local t = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_FLOAT then
		v.value = '"0"'
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil

gg.processResume()

gg.clearResults()
gg.searchNumber("40D;32D;16D;2D::53", 4, false, 536870912, 0, -1)
gg.refineNumber("40", 4, false, 536870912, 0, -1)

revert = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil)
local t = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = '"38"'
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
end
function wc13()
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD | gg.REGION_VIDEO)
  gg.searchNumber("2;1.1204989e-19;1.6815582e-44;1.5414283e-44", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("2;4.7408166e21;5.6896623e-29;4.7961574e21", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(1)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD | gg.REGION_VIDEO)
  gg.searchNumber("2;4.8699472e21;2.718519e-43;1.3912525e-19", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("2;3.2363458e-17;7.3900417e-40;5.3249342e-44", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(40)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("2;4.9252829e21;2.718519e-43;1.3912552e-19", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(20)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("1;4.8699472e21;2.718519e-43;1.3912525e-19", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(50)
  gg.editAll("120", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("1;4.9252829e21;2.718519e-43;1.3912552e-19", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(50)
  gg.editAll("120", gg.TYPE_FLOAT)
end
function wc14()
  gg.clearResults()
  gg.searchNumber("8.4077908e-45;4.2038954e-45;1.5694543e-43;1.4012985e-45;2.8025969e-45;268.0;480.0;0.5:149", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
  for _FORV_3_, _FORV_4_ in ipairs((gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil))) do
    if _FORV_4_.flags == gg.TYPE_FLOAT then
      _FORV_4_.value = "1"
      _FORV_4_.freeze = true
    end
  end
  gg.addListItems((gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)))
end
function wc15()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("8.5077908e-45;4.2038954e-45;2.8025969e-45;0.5;0.5;2.8025969e-45;1.4012985e-45;7.0064923e-45:337", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(999, nil, nil, nil, nil, nil, nil, nil, nil)
  for _FORV_3_, _FORV_4_ in ipairs((gg.getResults(999, nil, nil, nil, nil, nil, nil, nil, nil))) do
    if _FORV_4_.flags == gg.TYPE_FLOAT then
      _FORV_4_.value = "6"
      _FORV_4_.freeze = true
    end
  end
  gg.addListItems((gg.getResults(999, nil, nil, nil, nil, nil, nil, nil, nil)))
  gg.searchNumber("56;64;80;16;80:93", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("56", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(999, nil, nil, nil, nil, nil, nil, nil, nil)
  for _FORV_3_, _FORV_4_ in ipairs((gg.getResults(999, nil, nil, nil, nil, nil, nil, nil, nil))) do
    if _FORV_4_.flags == gg.TYPE_FLOAT then
      _FORV_4_.value = "7"
      _FORV_4_.freeze = true
    end
  end
  gg.addListItems((gg.getResults(999, nil, nil, nil, nil, nil, nil, nil, nil)))
end
function wc16()
  gg.setRanges(gg.REGION_C_ALLOC)

gg.clearResults()
gg.searchNumber("-4327959240846082048Q;4865576448477364224Q;4575657222541279232Q:21", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.processResume()
gg.refineNumber("-4327959240846082048", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)

revert = gg.getResults(25, nil, nil, nil, nil, nil, nil, nil, nil)
local t = gg.getResults(25, nil, nil, nil, nil, nil, nil, nil, nil)
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_QWORD then
		v.value = "-4327959240837693440"
		v.freeze = true
	end
end
gg.addListItems(t)
t = nil
end
function wc17()
  gg.searchNumber("0.5;1.4012985e-45;4.7083628e-43;2.8025969e-45;2.2958874e-41::109", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
end
function wc18()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("1.8367379e-40;4.5917748e-40;4.2038954e-45;1.4012985e-45;1.793662e-43;1.4012985e-45;2.8025969e-45;1.1210388e-44;0.5:281", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
revert = gg.getResults(1, nil, nil, nil, nil, nil, nil, nil, nil)
local t = gg.getResults(1, nil, nil, nil, nil, nil, nil, nil, nil)
for i, v in ipairs(t) do
 if v.flags == gg.TYPE_FLOAT then
  v.value = "0"
  v.freeze = true
 end
end
gg.addListItems(t)
t = nil
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("16;32;40;48;40:41", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("40", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("25", gg.TYPE_DWORD)
end
function wc19()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("4.2038954e-45;1.4012985e-45;1.5694543e-43;1.4012985e-45;2.8025969e-45;0.5:109", gg.TYPE_FLOAT, false, gg.SIGN_FUZZY_EQUAL, 0, -1)
  gg.searchNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_FUZZY_EQUAL, 0, -1)
  var = gg.getResults(4)
  gg.editAll("1", gg.TYPE_FLOAT)
  var = gg.getResults(22)
  var[1].value = 1
  var[1].Freeze = false
  var[2].value = 1
  var[2].freeze = true
  var[3].value = 1
  var[3].Freeze = false
  var[4].value = 1
  var[4].freeze = true
  gg.addListItems(var)
  gg.clearResults()
end
function wc20()
  gg.clearList()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("3.8530377e-34;1.4810267e-39;1.4012985e-45;4.2038954e-45;4.2038954e-45;7.0064923e-45;4.2038954e-45;1.4012985e-45;1.793662e-43;1.4012985e-45;2.8025969e-45;3.5873241e-43;1.1210388e-44;776.0;360.0;0.5:273", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(20)
  gg.getResults(20)
end
function wc21()
  if w == 1 then
    WHFIX980()
  else
    gg.clearList()
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
    gg.searchNumber("0.5;360.0;360.0;752.0;752.0;1.0;1.0;1.0;1.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    if gg.getResultCount() == 0 then
      gg.alert("Value Not Found")
    else
      gg.searchNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
      _Count = gg.getResultCount()
      _A = gg.getResults(_Count)
      last_Count = _Count + 1
      w = 1
      _T = "Edit Wallhack Value"
      WHFIX980()
    end
  end
end
function WHFIX980()
  if w == 0 then
    gg.alert("Value Not Found")
  else
    gg.setVisible(false)
    _CL = {}
    for _FORV_3_ = 1, _Count do
      _CL[_FORV_3_] = " Value   " .. _FORV_3_ .. L0_14("�����������������������������")
    end
    _CL[last_Count] = "BACK"
    _C_ = gg.choice(_CL, nil, "Wallhack Kirin 980")
    for _FORV_3_ = 1, _Count do
      if _C_ == _FORV_3_ then
        for _FORV_7_, _FORV_8_ in ipairs(_A) do
          _A[_FORV_7_].freeze = false
          gg.addListItems(_A)
        end
        _A[_FORV_3_].value = 0
        _A[_FORV_3_].freeze = true
        gg.addListItems(_A)
        _FORV_3_ = _Count
      elseif K_2 == _Count + 1 then
        WHK4()
      end
    end
  end
  gg.setVisible(true)
end
function wc22()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("56D;1407374883684354Q;0.5F:573", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineNumber("56", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(13, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("54", gg.TYPE_DWORD)
  gg.processResume()
  gg.processResume()
  gg.searchNumber("54D;1407374883684354Q;0.5F:573", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(13, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("0", gg.TYPE_FLOAT)
  gg.searchNumber("54D;1407374883684354Q;0.5F:573", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(13, nil, nil, nil, nil, nil, nil, nil, nil)
  for _FORV_3_, _FORV_4_ in ipairs((gg.getResults(13, nil, nil, nil, nil, nil, nil, nil, nil))) do
    if _FORV_4_.flags == gg.TYPE_FLOAT then
      _FORV_4_.value = "1"
      _FORV_4_.freeze = true
    end
  end
  gg.addListItems((gg.getResults(13, nil, nil, nil, nil, nil, nil, nil, nil)))
end
function wc23()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("131,074;1;1,131,413,504;1,137,967,104;1,056,964,608:225", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.refineNumber("1,056,964,608", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  revert = gg.getResults(4, nil, nil, nil, nil, nil, nil, nil, nil)
  for _FORV_3_, _FORV_4_ in ipairs((gg.getResults(4, nil, nil, nil, nil, nil, nil, nil, nil))) do
    if _FORV_4_.flags == gg.TYPE_DWORD then
      _FORV_4_.value = "1,066,364,609"
      _FORV_4_.freeze = true
      gg["1learResults"]()
    end
  end
end
function wc24()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("40;32;16;2::37", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("40", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(9)
  gg.editAll("38", gg.TYPE_DWORD)
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("1.067767e-39;0.5::257", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(9)
  gg.getResultsCount()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("1.251438e-39;0.5::273", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("0.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(9)
  gg.getResultsCount()
  gg.clearResults()
  gg.searchNumber("573.70306396484;0.05499718333.1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("1.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(1200)
  gg.editAll("-999", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("56; 64; 48: 35", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("56", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("58", gg.TYPE_DWORD)
end


function GG()
NO = gg.alert("اختار نوع 🖤","⟬ولـ هـاك⟭", "⟬الألــوان⟭")
if NO == nil then
  else
    if NO == 1 then
      CHIPSET()()
    end
    if NO == 2 then
      CLCHIPSET()
    end
    end
  iBug = -1
end

function CLCHIPSET()
  CHACK44 = gg.multiChoice({
    "🎨 ᴇxʏɴᴏs ʙʟᴀᴄᴋ",
    "🎨 ᴇxʏɴᴏs ʀᴇᴅ",
    "🎨 ᴇxʏɴᴏs ᴡʜɪᴛᴇ",
    "🎨 ᴋɪʀɪɴ ʙʟᴀᴄᴋ",
    "🎨 ᴋɪʀɪɴ ɢʀᴇᴇɴ",
    "🎨 ᴋɪʀɪɴ ʀᴇᴅ",
    "🎨 ᴋɪʀɪɴ ᴡʜɪᴛᴇ",
    "🎨 ᴋɪʀɪɴ ʏᴇʟʟᴏᴡ",
    "🎨 ᴍᴇᴅɪᴀᴛᴇᴋ ɢʀᴇᴇɴ",
    "🎨 ᴍᴇᴅɪᴀᴛᴇᴋ ʀᴇᴅ",
    "🎨 ᴍᴇᴅɪᴀᴛᴇᴋ ʏᴇʟʟᴏᴡ",
    "🎨 ᴍᴇᴅɪᴀᴛᴇᴋ ᴡʜɪᴛᴇ",
    "🎨 ᴍᴇᴅɪᴀᴛᴇᴋ ᴘ22 ɢʀᴇᴇɴ",
    "🎨 ᴍᴇᴅɪᴀᴛᴇᴋ ᴘ22 ʏᴇʟʟᴏᴡ",
    "🎨 ᴍᴇᴅɪᴀᴛᴇᴋ ᴘ60 ʙʟᴜᴇ",
    "🎨 ᴍᴇᴅɪᴀᴛᴇᴋ ᴘ60 ʀᴇᴅ",
    "🎨 ᴍᴇᴅɪᴀᴛᴇᴋ ᴘ60 ʏᴇʟʟᴏᴡ",
"◄⎋ رجوع ►",
  }, nil, "╔─━━━━━━━━░░ 🌠F5M🌠 ░░━━━━━━━━─╗")
  if CHACK44 == nil then
  else
    if CHACK44[1] == true then
      cree1()
    end
    if CHACK44[2] == true then
      cree2()
    end
    if CHACK44[3] == true then
      cree3()
    end
    if CHACK44[4] == true then
      creee1()
    end
    if CHACK44[5] == true then
      creee2()
    end
    if CHACK44[6] == true then
      creee3()
    end
    if CHACK44[7] == true then
      creee4()
    end
    if CHACK44[8] == true then
      creee5()
    end
    if CHACK44[9] == true then
      creeee1()
    end
    if CHACK44[10] == true then
      creeee2()
    end
    if CHACK44[11] == true then
      creeee3()
    end
    if CHACK44[12] == true then
      creeee4()
    end
    if CHACK44[13] == true then
      creeee5()
    end
    if CHACK44[14] == true then
      creeee6()
    end
    if CHACK44[15] == true then
      creeee7()
    end
    if CHACK44[16] == true then
      creeee8()
    end
    if CHACK44[17] == true then
      creeee9()
    end
    if CHACK44[18] == true then
HOME()end
  end
  PUBGMH = -1
end

function cree1()
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("573.70306396484;0.05499718338;1::50", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(1)
  gg.editAll("-999", gg.TYPE_FLOAT)
  gg.clearResults()
 end
 
function cree2()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("56;64;3:21", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("56", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("54", gg.TYPE_DWORD)
end

function cree3()
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("573.70306396484;0.05499718338;1::50", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(1)
  gg.editAll("999", gg.TYPE_FLOAT)
  gg.clearResults()
end

function creee1()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("40D;32D;16D;2D::37", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("40", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("39", gg.TYPE_DWORD)
end

function creee2()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("2;2;8;6;40:45", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.processResume()
  gg.refineNumber("40", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10, nil, nil, nil, nil, nil, nil, nil, nil)
  gg.editAll("32", gg.TYPE_DWORD)
  gg.processResume()
  end

function creee3()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("16;32;40;48;40:41", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("40", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("25", gg.TYPE_DWORD)
end

function creee4()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("40D;32D;16D;2D::37", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("40", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("42", gg.TYPE_DWORD)
end

function creee5()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("16;32;40;48;40:41", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("40", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("36", gg.TYPE_DWORD)
end

function creeee1()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("56;64;48::40", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("56", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("52", gg.TYPE_DWORD)
end

function creeee2()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("8;16;32;48;40::169", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("40", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("38", gg.TYPE_DWORD)
  gg.clearResults()
end

function creeee3()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("16;32;40;48;40:41", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("40", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("36", gg.TYPE_DWORD)
end

function creeee4()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("8;16;32;48;40::169", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("40", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("30", gg.TYPE_DWORD)
  gg.clearResults()
end

function creeee5()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("40D; 58D; 17D; 47D; 19D; 55D; 98; 100D; 42D; 9D; 46D; 55D; :789", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("46", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(20)
  gg.editAll("41", gg.TYPE_DWORD)
  gg.clearResults()
end

function creeee6()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("40D;58D;17D;47D;19D;55D;98D;100D;42D;9D;46D;55D:789 ", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("55", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(12)
  gg.editAll("36", gg.TYPE_DWORD)
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("49;19;56;38;18;47;19;20;25", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("56", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("20", gg.TYPE_DWORD)
  gg.clearResults()
end

function creeee7()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("802,824,192;48;937,041,920;40;736,370,688;32;802,824,192;48;802,824,192;16;802,824,192;2;2::", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("40", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("28", gg.TYPE_DWORD)
  gg.clearResults()
end

function creeee8()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("802,824,192;48;937,041,920;40;736,370,688;32;802,824,192;48;802,824,192;16;802,824,192;2;2::", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("40", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("38", gg.TYPE_DWORD)
  gg.clearResults()
  end

function creeee9()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("802,824,192;48;937,041,920;40;736,370,688;32;802,824,192;48;802,824,192;16;802,824,192;2;2::", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("40", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("36", gg.TYPE_DWORD)
  gg.clearResults()
end

function SNAPDRAGON()
  MASBAN = gg.multiChoice({
    "⁦♂️⁩ولهاك652♂️",
    " ⁦♂️⁩ولهاك636♂️",
    " ⁦♂️⁩ولهاك606♂️",
    " ⁦♂️⁩ولهاك665♂️",
    " ⁦♂️⁩ولهاك710♂️",
    " ⁦♂️⁩ولهاك835♂️",
    " ⁦♂️⁩ولهاك845♂️",
    " ⁦♂️⁩ولهاك855 v1♂️",
    " ⁦♂️⁩ولهلك855 v2♂️",
    "⁦❤️لون احمر855❤️",
    " ⁦💛لون اصفر855💛",
    " ⁦💛لون اصفر845 v1💛",
    " ⁦💛لون اصفر 845v2💛",
    " ⁦💚لون اخضر 845💚",
    "⁦💛لون اصفر 710💛",
    " ⁦🧡لون 665🧡",
    " ⁦💛لون اصفر660",
    " ⁦💛لون جميع المعالجات💛",
    " ⁦⁦❤️⁩لون احمر جميع المعالجات",
    "💛لون اصفر 625💛",
    " ◀↺BACK▶"
}, nil, "╔─━━━━━━━━░░ 🌠F5M🌠 ░░━━━━━━━━─╗")
if MASBAN == nil then else
if MASBAN[1] == true then wh625() end
if MASBAN[2] == true then wh636() end
if MASBAN[3] == true then wh660() end
if MASBAN[4] == true then wh675() end
if MASBAN[5] == true then wh710() end
if MASBAN[6] == true then wh835() end
if MASBAN[7] == true then wh845() end
if MASBAN[8] == true then wh855() end
if MASBAN[9] == true then wh855v2() end
if MASBAN[10] == true then bc855() end
if MASBAN[11] == true then kuning855() end
if MASBAN[12] == true then kuning845() end
if MASBAN[13] == true then kuning845v2() end
if MASBAN[14] == true then hijau845() end
if MASBAN[15] == true then kuning710() end
if MASBAN[16] == true then warna675() end
if MASBAN[17] == true then kuning660() end
if MASBAN[18] == true then kuning() end
if MASBAN[19] == true then merah() end
if MASBAN[20] == true then whwas() end
if MASBAN[21] == true then HOME() end
end
Masbandi = -1
end
function kuning710()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("1.3912525e-19F;8200;96", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("6", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("Color Yellow 710")
end

function bc855()
gg.clearResults()
gg.setRanges(gg.REGION_BAD or gg.REGION_VIDEO)
gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.refineAddress("2A0")
local MM2512 = gg.getResults(1)
if MM2512[1] ~= nil then
MM2512[1].address = MM2512[1].address
MM2512[1].flags = 4
MM2512[1].value = 7
gg.setValues(MM2512)
end
gg.clearResults()
gg.setRanges(gg.REGION_BAD or gg.REGION_VIDEO)
gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.refineAddress("270")
local MM2512 = gg.getResults(1)
if MM2512[1] ~= nil then
MM2512[1].address = MM2512[1].address
MM2512[1].flags = 4
MM2512[1].value = 7
gg.setValues(MM2512)
gg.toast("Color HD 855 Red")
end
end

function wh855v2()
gg.clearResults()
gg.setRanges(gg.REGION_BAD or gg.REGION_VIDEO)
gg.searchNumber("1.33123354e-43;2;1.66231134e-19;9.21942286e-41:21", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(100)
gg.editAll("120", gg.TYPE_FLOAT)
gg.clearResults()
gg.searchNumber("2;-1;0;1;-127;0.24022650719;0.69314718246;0.00999999978::30", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(100)
gg.editAll("120", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("WH 855 V2")
end

function wh625()
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("135,215D;4,140D;3.7615819e-37;2::", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("194D;3.7615819e-37;2;-1;1;-127::", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("ok ")
end

function wh675()
gg.clearResults()
gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
gg.searchNumber("95D;2;9.2194229e-41::100", 16, false, 536870912, 0, -1)
gg.refineNumber("2", 16, false, 536870912, 0, -1)
gg.getResults(999)
gg.editAll("120", 16)
gg.clearResults()
gg.searchNumber("2;-1;0;1;-127;0.24022650719;0.69314718246;0.00999999978::30", 16, false, 536870912, 0, -1)
gg.refineNumber("2", 16, false, 536870912, 0, -1)
gg.getResults(999)
gg.editAll("120", 16)
gg.clearResults()
gg.toast("Wallhack 665")
end

function warna675()
gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
gg.searchNumber("8201",gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0,-1)
gg.searchNumber("8201",gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(15)
gg.editAll("7",gg.TYPE_DWORD)
gg.clearResults()
gg.toast("Colour Green SD665 activated!")
end

function wh710()
gg.clearResults()
gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
gg.searchNumber("1.4912565e-19;2.0;1.6623113e-19:9", 16, false, 536870912, 0, -1)
gg.searchNumber("2", 16, false, 536870912, 0, -1)
gg.getResults(20)
gg.editAll("138", 16)
gg.clearResults()
gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
gg.searchNumber("2;-1;0;1;-127;0.24022650719;0.69314718246;0.00999999978::29", 16, false, 536870912, 0, -1)
gg.searchNumber("2", 16, false, 536870912, 0, -1)
gg.getResults(20)
gg.editAll("138", 16)
gg.clearResults()
gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
gg.searchNumber("1,081,081,865;8,200;1,446,128;348,401:21", 4, false, 536870912, 0, -1)
gg.searchNumber("8200", 4, false, 536870912, 0, -1)
gg.getResults(2)
gg.editAll("7", 4)
gg.clearResults()
gg.toast("Wallhack 710 Activated")
end

function wh845()
gg.clearResults()
gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
gg.searchNumber("2.0;-1.0;0.0;1.0;-127.0;0.24022650719;0.69314718246;0.00999999978::29",gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.searchNumber("2",gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(30)
gg.editAll("120",gg.TYPE_FLOAT)
gg.clearResults()
gg.searchNumber("2.4382593e-43;1.3312335e-43;2::",gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.searchNumber("2",gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(30)
gg.editAll("120",gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("ok")
end

function wh855()
gg.clearResults()
gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
gg.searchNumber("95D;2;9.2194229e-41::100", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(100)
gg.editAll("120", gg.TYPE_FLOAT)
gg.clearResults()
gg.searchNumber("2;-1;0;1;-127;0.24022650719;0.69314718246;0.00999999978::30", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(100)
gg.editAll("120", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("Wallhack 855 V1")
end


function kuning855()
gg.clearResults()
gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.refineAddress("0A8", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)
gg.getResults(1000)
gg.editAll("8198", gg.TYPE_DWORD)
gg.clearResults()
gg.searchNumber("8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.refineAddress("0B0", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)
gg.getResults(1000)
gg.editAll("8199", gg.TYPE_DWORD)
gg.clearResults()
gg.toast("Yellow 855 Activated")
end

function wh835()
gg.clearResults()
gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
gg.searchNumber("2;1.8947657e-40;5.8013756e-42", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(10)
gg.editAll("120", gg.TYPE_FLOAT)
gg.clearResults()
gg.searchNumber("2.718519e-43;3.7615819e-37;2;-1;1;-127", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(10)
gg.editAll("120", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("ok ")
end

function wh660()
gg.clearResults()
gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
gg.searchNumber("2;1.8947657e-40;5.8013756e-42", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(10)
gg.editAll("120", gg.TYPE_FLOAT)
gg.clearResults()
gg.searchNumber("2.718519e-43;3.7615819e-37;2;-1;1;-127", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(10)
gg.editAll("120", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("Wallhack 660 Activated")
end

function kuning660()
gg.clearResults()
gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
gg.searchNumber('1,080,033,292D;786,441D;8,200D:21::', gg.TYPE_DWORD,false, gg.SIGN_EQUAL,0,-1)
gg.searchNumber('8200', gg.TYPE_DWORD,false, gg.SIGN_EQUAL,0,-1)
gg.getResults(10)
gg.editAll('8198', gg.TYPE_DWORD)
gg.clearResults()
gg.toast("Yellow Body 660 Activated")
end

function hijau845()
gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
gg.searchNumber("8201",gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0,-1)
gg.searchNumber("8201",gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(15)
gg.editAll("7",gg.TYPE_DWORD)
gg.clearResults()
gg.toast("Green 845 V1")
end
 

function kuning845v2()
  gg.searchNumber("8,196D;8,192D;8,200D::", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("6", gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("Yellow 845 V2")
  end
  
function kuning845()
gg.clearResults()
gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.refineAddress("0A8", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)
gg.getResults(1000)
gg.editAll("8198", gg.TYPE_DWORD)
gg.clearResults()
gg.searchNumber("8201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.refineAddress("0B0", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)
gg.getResults(1000)
gg.editAll("8199", gg.TYPE_DWORD)
gg.clearResults()
gg.toast("ok ")
end

function kuning()
gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("256;8200;13::150", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("6", gg.TYPE_DWORD)
  gg.clearResults()
gg.toast("ok ")
end


function merah()
gg.clearResults()
gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("8,196D;8,192D;8,200D::", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("7", gg.TYPE_DWORD)
  gg.clearResults()
gg.toast("ok ")
end


function wh636()
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("135,215D;4,140D;3.7615819e-37;2::", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
  gg.searchNumber("194D;3.7615819e-37;2;-1;1;-127::", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("130", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("ok ")
end


function whwas()
gg.clearResults()
gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
gg.searchNumber("8200", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.refineAddress("0B0", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)
gg.getResults(20)
gg.editAll("8198", gg.TYPE_DWORD)
gg.clearResults()
gg.toast("شد")
gg.toast("【☠️ ☠️】")
end






function W2()
SN = gg.multiChoice({
    "🌠彡ثبات 50",
    "🌠彡ثبات100",
    "🌠彡ايم لوك",
    "🌠彡ايم بوت",
    "◀↺BACK▶"
}, nil, "╔─━━━━━━━━░░ 🌠F5M🌠 ░░━━━━━━━━─╗")


if SN == nil then else
if SN[1]  == true then MS1() end
if SN[2]  ==  true then MS2() end
if SN[3]  ==  true then MS3() end
if SN[4]  ==  true then MS4() end
if SN[5]  ==  true then HOME() end
end
  PUBGMH = -1
end

function MS1()
gg.clearResults()
gg.setRanges(gg.REGION_C_DATA)
gg.searchNumber("-309056968;-298841599;-309061065",gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0,-1)
gg.searchNumber("-298841599",gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0,-1)
revert = gg.getResults(5, nil, nil, nil, nil, nil, nil, nil, nil)
local t = gg.getResults(5, nil, nil, nil, nil, nil, nil, nil, nil)
for i, v in ipairs(t) do
 if v.flags == gg.TYPE_DWORD then
  v.value = "0.1"
  v.freeze = true
 end
end
gg.addListItems(t)
t = nil
gg.editAll("0.1",gg.TYPE_DWORD)
gg.clearResults()
gg.toast("Less Recoil Has Been Activated.")
end

 
function MS2()
gg.sleep(250)
gg.clearResults()
gg.setRanges(8) -- Value Ranges
local dataType = 4 -- Value type
local tb1 = {{-442564392, 20}, {-301987312, 0}, {-420536206, -28}, {-511634430, -24}, {-534568960, -20}, {-534380544, -16}, {-420536206, -12}, {-511633406, -8}, {-511636480, -4}, {-369098715, 4}, {-309065166, 8}, {-494641331, 12}, {-309061027, 16}, {-298776064, 24}, {-409010176, 28}, } -- Value signature
local tb2 = {{0, 0}, } -- Value modify
Memory_Ram(tb1, tb2, dataType) -- Start looking to be modified
gg.clearResults()
gg.sleep(250)
gg.clearResults()
gg.setRanges(8) -- Value Ranges
local dataType = 4 -- Value type
local tb1 = {{-827323830, -8}, {-300938736, 0}, {-286131696, -20}, {-290452920, -16}, {-290084160, -12}, {-286131696, -4}, {1124073472, 4}, {-444137248, 8}, {-471859199, 12}, {-444137444, 16}, {-444137436, 20}, } -- Value signature
local tb2 = {{0, 0}, } -- Value modify
Memory_Ram(tb1, tb2, dataType) -- Start looking to be modified
gg.toast("No Recoil Loby Activated")
gg.clearResults()
gg.setRanges(gg.REGION_C_DATA)
gg.searchNumber("-6.1549454e27;1.8638966e-20;-1.1144502e28;0::", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.refineNumber("-1.1144502e28", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(1)
gg.editAll("0", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_C_DATA)
gg.searchNumber("-2.8111605e28;-3.7444097e28;-1.1144502e28;128.0::", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.refineNumber("-1.1144502e28", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(1)
gg.editAll("0", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("Anti Shake")
gg.clearResults()
gg.sleep(250)
gg.clearResults()
gg.setRanges(gg.REGION_C_DATA)
gg.searchNumber('-1,387,800,265,460,020,720', gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(2)
gg.editAll('-1,387,800,268,334,956,544', gg.TYPE_QWORD)
gg.clearResults()
end

function MS3()
gg.alert("☢️AIMLOOK ON☣️")
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("3.5;1;0.5;200;20::", gg.TYPE_FLOAT)
gg.getResults(200)
gg.editAll("999999999", gg.TYPE_FLOAT)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("6.0;2.0;1.0::99", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(100)
gg.editAll("101", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("-88.82363891602F;15.0F;1", gg.TYPE_FLOAT)
gg.searchNumber("1", gg.TYPE_FLOAT)
gg.getResults(1000)
gg.editAll("20000000000000", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast(os.date("😍🚩تم التفعيل☺️🚩"))
end


function MS4()
gg.alert("☢️AIMBOT ON☣️")
gg.clearResults()
gg.setRanges(gg.REGION_C_DATA)
gg.setRanges(gg.REGION_C_DATA)
gg.searchNumber("360;0.0001;1478828288", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("0.0001", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(100)
gg.editAll("9999", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast(os.date("😍🚩تم التفعيل☺️🚩"))
end



function W3()
SN = gg.multiChoice({
        "🌟هيد شوت30🌟",
    "🌟هيد شوت50🌟",
    "🌟هيدشوت70🌟",
    "🌟هيدشوت80🌟",
    "🌟هيد شوت90🌟",
	"🌟هيد شوت95 🌟",
    "🌟هيد شوت 100🌟",
    "◀↺BACK▶"
}, nil, "╔─━━━━━━━━░░ 🌠F5M🌠 ░░━━━━━━━━─╗")


if SN == nil then else
if SN[1]  == true then AM1() end
if SN[2]  ==  true then JAB() end
if SN[3]  ==  true then DAS() end
if SN[4]  ==  true then he80() end
if SN[5]  ==  true then he90() end
if SN[5]  ==  true then he95() end
if SN[6]  ==  true then RAS() end
if SN[7]  ==  true then HOME() end
end
  PUBGMH = -1
end

function AM1()
gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("23;25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("150", gg.TYPE_FLOAT)
  gg.clearResults()
end



function JAB()
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("23;25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("175", gg.TYPE_FLOAT)
  gg.clearResults()
end


function DAS()
gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("23;25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("200", gg.TYPE_FLOAT)
  gg.clearResults()
end



function he80()
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("23;25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("215", gg.TYPE_FLOAT)
  gg.clearResults()
end



function he90()
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("23;25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("225", gg.TYPE_FLOAT)
  gg.clearResults()
end



function he95()
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("23;25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("665", gg.TYPE_FLOAT)
  gg.clearResults()
end

function RAS()
 gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("25;23;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(3)
  gg.editAll("180", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("تم")
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("23;25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("200", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("سوبر")
end




function W4()
SN = gg.multiChoice({
   "⁦⁦⁦🔘彡سرعة جيب",
   "⁦⁦⁦🔘彡سرعة دايساا",
   "⁦⁦⁦🔘彡سرعة جميع السيارات",
   "⁦⁦⁦🔘彡طيران جيب",
   "⁦⁦⁦🔘彡سرعة لاعب متوسطة",
   "⁦⁦⁦🔘彡ايقاف سرعة متوسطة",
   "⁦⁦⁦??彡سبيد نوك",
    "◀↺BACK▶",
 }, nil, "⁦⁦⁦⁦╔─━━━━━━━━░░ 🌠F5M🌠 ░░━━━━━━━━─╗ ")


if SN == nil then else
if SN[1]  == true then F1() end
if SN[2]  == true then F2() end
if SN[3]  == true then F3() end
if SN[4]  == true then F4() end
if SN[5]  == true then F5() end
if SN[6]  ==  true then F6() end
if SN[7]  ==  true then F7() end
if SN[8]  ==  true then HOME() end
end
  PUBGMH = -1
end








function F1()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber('0.647058857;0.30000001192;0.94117647409::9', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('0.647058857;0.30000001192::5', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('0.647058857;0.30000001192::5', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('0.647058857;0.30000001192::5', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(50)
    gg.editAll('150.241295', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast('سرعة جيب!')
  end



function F2()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber('0.72727274895;0.34377467632;1::9', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('0.72727274895;0.34377467632::5', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('0.72727274895;0.34377467632::5', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('0.72727274895;0.34377467632::5', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(50)
    gg.editAll('75.241295', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast('سرعة دايسا')
  end


function F3()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("0.76000005007;0.96078431606;1;0.74509805441::",gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
    gg.searchNumber("0.74509805441",gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
    gg.getResults(9999)
    gg.editAll("100",gg.TYPE_FLOAT)
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("50;5;0.01",gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
    gg.searchNumber("0.01",gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
    gg.getResults(280)
    gg.editAll("-0.23",gg.TYPE_FLOAT)
    gg.toast("سرعة جميع السيارات")
  end



function F4()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("0.76000005007;0.96078431606;1;0.74509805441::",gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
    gg.searchNumber("0.74509805441",gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
    gg.getResults(9999)
    gg.editAll("99999",gg.TYPE_FLOAT)
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("45F;15F;20F;2500F",gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
    gg.searchNumber("45",gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
    gg.getResults(999)
    gg.editAll("500",gg.TYPE_FLOAT)
    gg.toast("طيران الجيب")
  end
  
  
  function F5()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("1;1;1;0.0001;20;0.0005;0.4::50", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(300)
gg.editAll("1.06", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast('Medium Speed activated!')
end
 
 
function F6()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("1.06;1.06;1.06;0.0001;20;0.0005;0.4::50", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("1.06", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(300)
gg.editAll("1", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast('Medium Speed deactivated!')
end
  
  
function F7()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("0;7.0064923e-45;1;100;1;2,500,000,000.0;0.10000000149;88", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(100)
gg.editAll("9999", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("Knock Speed Activated")
end




function W5()
  MNSITSTAND = gg.choice({
    "❰  ⁦📂     ⛔  ايقاف التفعيلات  ⛔      📂  ❱",
    "❰  ⁦⬆️              ست+ستاند                ⬆️  ❱",
    "❰  ⁦⁦➡️⁩          سيت سكوب لليمين          ⁦➡️⁩  ❱",
    "❰  ⁦⁦⬅️⁩          سيت سكوب لليسار          ⁦⬅️⁩  ❱",
    "❰  ⁦⬆️         ستاند سكوب للأمام           ⬆️  ❱",
    "❰  ⁦⁦➡️⁩         ستاند سكوب لليمين          ⁦➡️⁩  ❱",
    "❰  ⁦⁦⬅️⁩         ستاند سكوب لليسار          ⁦⬅️⁩  ❱",
    "❰                 ⁦⁦↩️⁩   رجوع   ⁦↩️⁩                   ❱"
   }, nil, "⁦⁦⁦⁦╔─━━━━━━━━░░ 🌠F5M🌠 ░░━━━━━━━━─╗ ")
  if MNSITSTAND == nil then
  else
    if MNSITSTAND == 1 then
      SITSTANDOFF()
    end
    if MNSITSTAND == 2 then
      SITSCOPEON()
    end
    if MNSITSTAND == 3 then
      SITSCOPER()
    end
    if MNSITSTAND == 4 then
      SITSCOPEL()
    end
    if MNSITSTAND == 5 then
      STANDSCOPEON()
    end
    if MNSITSTAND == 6 then
      STANDSCOPER()
    end
    if MNSITSTAND == 7 then
      STANDSCOPEL()
    end
    if MNSITSTAND == 8 then
      HOME()
    end
  end
  PUBGMH = -1
end

function SITSTAND2()
  MNSITSTAND2 = gg.choice({
    "❰  ⁦📂  ⛔  sᴛᴏᴘ ғᴜɴᴄᴛɪᴏɴs  ⛔   📂  ❱",
    "❰  ⁦⬆️              sɪᴛ sᴄᴏᴘᴇ                ⬆️  ❱",
    "❰  ⁦⁦➡️⁩         sɪᴛ sᴄᴏᴘᴇ ʀɪɢʜᴛ          ⁦➡️⁩  ❱",
    "❰  ⁦⁦⬅️⁩          sɪᴛ sᴄᴏᴘᴇ ʟᴇғᴛ            ⁦⬅️⁩  ❱",
    "❰  ⁦⬆️       sᴛᴀɴᴅ sᴄᴏᴘᴇ ғʀᴏɴᴛ      ⬆️  ❱",
    "❰  ⁦⁦➡️⁩       sᴛᴀɴᴅ sᴄᴏᴘᴇ ʀɪɢʜᴛ      ⁦➡️⁩  ❱",
    "❰  ⁦⁦⬅️⁩        sᴛᴀɴᴅ sᴄᴏᴘᴇ ʟᴇғᴛ        ⁦⬅️⁩  ❱",
    "❰                 ⁦⁦↩️⁩   ʙ ᴀ ᴄ ᴋ   ⁦↩️⁩                ❱"
   }, nil, "⁦⁦⁦⁦╔─━━━━━━━━░░ 🌠F5M🌠 ░░━━━━━━━━─╗ ")
  if MNSITSTAND2 == nil then
  else
    if MNSITSTAND2 == 1 then
      SITSTANDOFF2()
    end
    if MNSITSTAND2 == 2 then
      SITSCOPEON()
    end
    if MNSITSTAND2 == 3 then
      SITSCOPER()
    end
    if MNSITSTAND2 == 4 then
      SITSCOPEL()
    end
    if MNSITSTAND2 == 5 then
      STANDSCOPEON()
    end
    if MNSITSTAND2 == 6 then
      STANDSCOPER()
    end
    if MNSITSTAND2 == 7 then
      STANDSCOPEL()
    end
    if MNSITSTAND2 == 8 then
      HOME()
    end
  end
  PUBGMH = -1
end

function SITSCOPEON()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("-4767057191653227520", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.refineNumber("-4767057191653227520", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.refineNumber("-4767057191653227520", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(1401)
gg.editAll("-4767057191527907328", gg.TYPE_QWORD)
gg.clearResults()
gg.toast("ست سكوب")
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("4138667321167981973", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.sleep(140)
gg.refineNumber("4138667321167981973", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.sleep(140)
gg.refineNumber("4138667321167981973", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(1401)
gg.editAll("4848124999984742400", gg.TYPE_QWORD)
gg.clearResults()
gg.toast("Sit Scope Front activated!")
end








function SITSCOPER()
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("4548109841269983040", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.sleep(140)
  gg.refineNumber("4548109841269983040", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.sleep(140)
  gg.refineNumber("4548109841269983040", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(1401)
  gg.editAll("4548109841324179456", gg.TYPE_QWORD)
  gg.clearResults()
  gg.toast("Sit Scope Right activated!")
end

function SITSCOPEL()
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("4548109841269983040", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.sleep(140)
  gg.refineNumber("4548109841269983040", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.sleep(140)
  gg.refineNumber("4548109841269983040", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(1401)
  gg.editAll("4548109839176695808", gg.TYPE_QWORD)
  gg.clearResults()
  gg.toast("Sit Scope Left activated!")
end

function STANDSCOPEON()
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("4138667321167981973", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.sleep(140)
  gg.refineNumber("4138667321167981973", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.sleep(140)
  gg.refineNumber("4138667321167981973", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(1401)
  gg.editAll("4848124999984742400", gg.TYPE_QWORD)
  gg.clearResults()
  gg.toast("Sit Scope Front activated!")
end

function STANDSCOPER()
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("4548109952939150800", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.sleep(140)
  gg.refineNumber("4548109952939150800", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.sleep(140)
  gg.refineNumber("4548109952939150800", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(1401)
  gg.editAll("4548109952993329152", gg.TYPE_QWORD)
  gg.clearResults()
  gg.toast("Sit Scope Right activated!")
end

function STANDSCOPEL()
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("4548109952939150800", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.sleep(140)
  gg.refineNumber("4548109952939150800", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.sleep(140)
  gg.refineNumber("4548109952939150800", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(1401)
  gg.editAll("4548109950845845504", gg.TYPE_QWORD)
  gg.clearResults()
  gg.toast("Stand Scope Left activated!")
end

function SITSTANDOFF()
  MNSITSTANDOFF = gg.choice({
    "❰  ⁦⛔         إيقاف السيت سكوب          ⛔  ❱",
    "❰  ⁦⁦⛔    إيقاف السيت سكوب لليمين     ⛔  ❱",
    "❰  ⁦⁦⛔    إيقاف السيت سكوب لليسار     ⛔  ❱",
    "❰  ⁦⁦⛔    إيقاف الستاند سكوب للأمام     ⛔  ❱",
    "❰  ⁦⁦⛔    إيقاف الستاند سكوب لليمين    ⛔  ❱",
    "❰  ⁦⁦⛔    إيقاف الستاند سكوب لليسار    ⛔  ❱",
    "❰                 ⁦⁦↩️⁩   رجوع   ⁦↩️⁩                   ❱"
   }, nil, "⁦⁦⁦⁦╔─━━━━━━━━░░ 🌠F5M🌠 ░░━━━━━━━━─╗ ")
  if MNSITSTANDOFF == nil then
  else
    if MNSITSTANDOFF == 1 then
      SITSCOPEOFF()
    end
    if MNSITSTANDOFF == 2 then
      SITSCOPEROFF()
    end
    if MNSITSTANDOFF == 3 then
      SITSCOPELOFF()
    end
    if MNSITSTANDOFF == 4 then
      STANDSCOPEOFF()
    end
    if MNSITSTANDOFF == 5 then
      STANDSCOPEROFF()
    end
    if MNSITSTANDOFF == 6 then
      STANDSCOPELOFF()
    end
    if MNSITSTANDOFF == 7 then
      HOME()
    end
  end
  PUBGMH = -1
end

function SITSTANDOFF2()
  MNSITSTANDOFF2 = gg.choice({
    "❰  ⁦⛔         sɪᴛ sᴄᴏᴘᴇ ( ᴏғғ )          ⛔  ❱",
    "❰  ⁦⁦⛔    sɪᴛ sᴄᴏᴘᴇ ʀɪɢʜᴛ ( ᴏғғ )    ⛔  ❱",
    "❰  ⁦⁦⛔      sɪᴛ sᴄᴏᴘᴇ ʟᴇғᴛ ( ᴏғғ )     ⛔  ❱",
    "❰  ⁦⁦⛔  sᴛᴀɴᴅ sᴄᴏᴘᴇ ғʀᴏɴᴛ ( ᴏғғ ) ⛔  ❱",
    "❰  ⛔  sᴛᴀɴᴅ sᴄᴏᴘᴇ ʀɪɢʜᴛ ( ᴏғғ ) ⛔  ❱",
    "❰  ⁦⁦⛔   sᴛᴀɴᴅ sᴄᴏᴘᴇ ʟᴇғᴛ ( ᴏғғ )   ⛔  ❱",
    "❰                ⁦⁦↩️⁩   ʙ ᴀ ᴄ ᴋ   ⁦↩️⁩                  ❱"
   }, nil, "⁦⁦⁦⁦╔─━━━━━━━━░░ 🌠F5M🌠 ░░━━━━━━━━─╗ ")
  if MNSITSTANDOFF2 == nil then
  else
    if MNSITSTANDOFF2 == 1 then
      SITSCOPEOFF()
    end
    if MNSITSTANDOFF2 == 2 then
      SITSCOPEROFF()
    end
    if MNSITSTANDOFF2 == 3 then
      SITSCOPELOFF()
    end
    if MNSITSTANDOFF2 == 4 then
      STANDSCOPEOFF()
    end
    if MNSITSTANDOFF2 == 5 then
      STANDSCOPEROFF()
    end
    if MNSITSTANDOFF2 == 6 then
      STANDSCOPELOFF()
    end
    if MNSITSTANDOFF2 == 7 then
      HOME()
    end
  end
  PUBGMH = -1
end

function SITSCOPEOFF()
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("-4767057191527907328", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.sleep(140)
  gg.refineNumber("-4767057191527907328", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.sleep(140)
  gg.refineNumber("-4767057191527907328", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(1401)
  gg.editAll("-4767057191653227520", gg.TYPE_QWORD)
  gg.clearResults()
  gg.toast("Sit Scope Deactivated!")
end

function SITSCOPEROFF()
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("4548109841324179456", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.sleep(140)
  gg.refineNumber("4548109841324179456", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.sleep(140)
  gg.refineNumber("4548109841324179456", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(1401)
  gg.editAll("4548109841269983040", gg.TYPE_QWORD)
  gg.clearResults()
  gg.toast("Sit Scope Right Deactivated!")
end

function SITSCOPELOFF()
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("4548109839176695808", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.sleep(140)
  gg.refineNumber("4548109839176695808", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.sleep(140)
  gg.refineNumber("4548109839176695808", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(1401)
  gg.editAll("4548109841269983040", gg.TYPE_QWORD)
  gg.clearResults()
  gg.toast("Sit Scope Left Deactivated!")
end

function STANDSCOPEOFF()
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("4848124999984742400", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.sleep(140)
  gg.refineNumber("4848124999984742400", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.sleep(140)
  gg.refineNumber("4848124999984742400", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(1401)
  gg.editAll("4138667321167981973", gg.TYPE_QWORD)
  gg.clearResults()
  gg.toast("Stand Scope Deactivated!")
end

function STANDSCOPEROFF()
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("4548109952993329152", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.sleep(140)
  gg.refineNumber("4548109952993329152", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.sleep(140)
  gg.refineNumber("4548109952993329152", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(1401)
  gg.editAll("4548109952939150800", gg.TYPE_QWORD)
  gg.clearResults()
  gg.toast("Stand Scope Right Deactivated!")
end

function STANDSCOPELOFF()
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("4548109950845845504", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.sleep(140)
  gg.refineNumber("4548109950845845504", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.sleep(140)
  gg.refineNumber("4548109950845845504", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(1401)
  gg.editAll("4548109952939150800", gg.TYPE_QWORD)
  gg.clearResults()
  gg.toast("Stand Scope Left Deactivated!")
end




function W6()
SN = gg.multiChoice({
   "⁦⁦⁦🍇彡 قفزة بدون دمج",
   "⁦⁦⁦🍇彡انستاند هيد",
   "⁦⁦⁦🍇彡سوبر هيد شوت",
   "⁦⁦⁦🍇彡نزول سريع",
   "⁦⁦⁦🍇彡سرعة برشوت",
    "◀↺BACK▶",
 }, nil, "⁦⁦⁦⁦╔─━━━━━━━━░░ 🌠F5M🌠 ░░━━━━━━━━─╗ ")


if SN == nil then else
if SN[1]  == true then VV1() end
if SN[2]  == true then VV2() end
if SN[3]  == true then VV3() end
if SN[4]  == true then wwwb() end
if SN[5]  == true then DCD() end
if SN[6]  ==  true then HOME() end
end
  PUBGMH = -1
end



function VV1()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("1;35;443;55;0.57357645035",gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
    gg.searchNumber("1",gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
    gg.getResults(500)
    gg.editAll("3",gg.TYPE_FLOAT)
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("3;35;443;55;0.57357645035",gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
    gg.searchNumber("443",gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
    gg.getResults(500)
    gg.editAll("2500",gg.TYPE_FLOAT)
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("0;7.0064923e-45;1;100;1;2,500,000,000.0;0.10000000149;88",gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
    gg.searchNumber("1",gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
    gg.getResults(100)
    gg.editAll("1.7",gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast("☬ Jump High No Damage ☬")
  end

function VV2()
gg.clearResults()
 gg.setRanges(gg.REGION_C_DATA)
 gg.searchNumber("-298284466;-1.304566e23F", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
 gg.searchNumber("-298284466", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
 gg.getResults(99)
 gg.editAll("0", gg.TYPE_DWORD)
 gg.clearResults()
end



function VV3()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("23;25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(100)
gg.editAll("225", gg.TYPE_FLOAT)
gg.clearResults()
end






function wwwb()
 gg.clearResults()
gg.setRanges(32)
gg.searchNumber("1024",16)
resultCounts=gg.getResultsCount()
results=gg.getResults(resultCounts)
for i=1,resultCounts do
values={}
values[1]={}
values[1].address=results[i].address-4
values[1].flags=16
values=gg.getValues(values)
if values[1].value==5000.0 then
values={}
values[1]={}
values[1].address=results[i].address-8
values[1].flags=16
values=gg.getValues(values)
if values[1].value==3000.0 then
values={}
values[1]={}
values[1].address=results[i].address-12
values[1].flags=16
values=gg.getValues(values)
if values[1].value==0.5 then
setvalues={}
setvalues[1]={}
setvalues[1].address=results[i].address
setvalues[1].flags=16
setvalues[1].value=200000
setvalues[2]={}
setvalues[2].address=results[i].address-4
setvalues[2].flags=16
setvalues[2].value=200000
setvalues[3]={}
setvalues[3].address=results[i].address-8
setvalues[3].flags=16
setvalues[3].value=200000
setvalues[4]={}
setvalues[4].address=results[i].address-12
setvalues[4].flags=16
setvalues[4].value=200000
gg.setValues(setvalues)
gg.toast("تم")
end
end
end
end
end


function DCD()
gg.clearResults()
gg.setRanges(32)
gg.searchNumber("0.75;150;1", 16, false, 536870912, 0, -1)
gg.searchNumber("1", 16, false, 536870912, 0, -1)
gg.getResults(100)
gg.editAll("30", 16)
gg.clearResults()
gg.setRanges(32)
gg.searchNumber("0.75;150;30", 16, false, 536870912, 0, -1)
gg.searchNumber("0.75", 16, false, 536870912, 0, -1)
gg.getResults(100)
gg.editAll("0", 16)
gg.clearResults()
gg.toast("Fast Parachute activated!")
end





function W7()
gg.alert("Starting Timezone")
gg.sleep(150)
gg.clearResults()
  gg.setRanges(gg.REGION_C_DATA)
gg.searchNumber("1.17549446e-37", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.refineAddress("9CC", -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(gg.getResultsCount())
  gg.editAll("0", gg.TYPE_FLOAT)
gg.sleep(5000)
gg.getResults(100000)
gg.editAll('1.1754945e-37', gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("Timezone")
end





function W8()
SN = gg.multiChoice({
    "♌彡 احذر خلطة خطيرة",
    "♌彡احذر خلطة خطيرة v2",
    "♌彡احذر خلطة خطيرةv3ة",
    "♌彡انستا هيد",
    "◀↺BACK▶"
 }, nil, "⁦⁦⁦⁦╔─━━━━━━━━░░ 🌠F5M🌠 ░░━━━━━━━━─╗ ")


if SN == nil then else
if SN[1]  == true then MSGSA1() end
if SN[2]  == true then GN1() end
if SN[3]  == true then S1Z() end
if SN[4]  == true then CVCX() end
if SN[5]  ==  true then HOME() end
end
  PUBGMH = -1
end


function MSGSA1()
 gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("25;23;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(3)
  gg.editAll("180", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("جاري التفعيل 💀🧘")
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("23;25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("200", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("خلطة")
end




function GN1()
gg.clearResults()
 gg.setRanges(gg.REGION_C_DATA)
 gg.searchNumber("-298284466;-1.304566e23F", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
 gg.searchNumber("-298284466", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
 gg.getResults(99)
 gg.editAll("0", gg.TYPE_DWORD)
 gg.clearResults()
 gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("90.775703430176;0;8;15;16;18;28", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("28", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("1000", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Damage")
  gg.toast("تم")
  gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("30.5;25", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(100)
gg.editAll("250", gg.TYPE_FLOAT)
gg.clearResults()
  gg.clearResults()
  gg.setRanges(gg.REGION_C_DATA)
  gg.setRanges(gg.REGION_C_DATA)
  gg.searchNumber("360;0.0001;1478828288", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("0.0001", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("9999", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("☬ Aimbot Super 100M ☬")
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("3.5;1.0;0.5;0.10000000149;200.0::512", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("3.5;1.0;0.5;0.10000000149;200.0::512", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("999999", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("3.5;1;0.5;200;20::", gg.TYPE_FLOAT)
  gg.getResults(200)
  gg.editAll("999999999", gg.TYPE_FLOAT)
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("6.0;2.0;1.0::99", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("101", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("3.5;1;0.5;200;20::", gg.TYPE_FLOAT)
  gg.getResults(200)
  gg.editAll("999999999", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("☬ Aimbot Ultra ☬")
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("1F;-8.6457681e12F;15F;28F;16F;26F;8F;18F:512", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("15.0F;28.0F;16.0F;26.0F;8.0F;18.0F:512", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(500)
  gg.editAll("95", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("1;20.51941871643;2.04908943176;-86.45767974854;-92.2311706543;16.0", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("16", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(100)
  gg.editAll("100", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("9.20161819458;23;25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(10)
  gg.editAll("240", gg.TYPE_FLOAT)
  gg.toast("☬ Magic Bullet 99% ☬")
  end





function S1Z()
gg.clearResults()
gg.setRanges(131072)
gg.searchNumber("-88.66608428955;26:512", 16, false, 536870912, 0, -1)
gg.searchNumber("26", 16, false, 536870912, 0, -1)
gg.getResults(2)
gg.editAll("-460", 16)
gg.clearResults()
gg.searchNumber("-88.73961639404;28:512", 16, false, 536870912, 0, -1)
gg.searchNumber("28", 16, false, 536870912, 0, -1)
gg.getResults(2)
gg.editAll("-560", 16)
gg.clearResults()
gg.setRanges(32)
gg.searchNumber("9.201618;30.5;25", 16, false, 536870912, 0, -1)
gg.searchNumber("30.5;25", 16, false, 536870912, 0, -1)
gg.getResults(10)
gg.editAll("253", 16)
gg.clearResults()
gg.setRanges(16)
gg.searchNumber("2048D;1F", 16, false, 536870912, 0, -1)
gg.searchNumber("1", 16, false, 536870912, 0, -1)
gg.getResults(100)
gg.editAll("0.07", 16)
gg.clearResults()
gg.setRanges(16384)
gg.searchNumber("9.1022205e-38;0.0001;9.1025635e-38::", 16, false, 536870912, 0, -1)
gg.searchNumber("0.0001", 16, false, 536870912, 0, -1)
gg.getResults(100)
gg.editAll("125", 16)
gg.clearResults()
gg.setRanges(131072)
gg.searchNumber("-7.1611644e24;0.0001;1.1297201e-37::", 16, false, 536870912, 0, -1)
gg.searchNumber("0.0001", 16, false, 536870912, 0, -1)
gg.getResults(500)
gg.editAll("-125", 16)
gg.clearResults()
gg.toast("Headshot")
qmnb = {
{["memory"] = gg.REGION_C_DATA},
{["name"] = "Instant Hits "},
{["value"] = tonumber("-298284466"),["type"] = gg.TYPE_DWORD},
{["lv"]= tonumber("-1.304566e23"),["offset"]=tonumber("4"),["type"]= gg.TYPE_FLOAT} ,
}
qmxg = {
{["value"] = 0, ["offset"] = 0, ["type"] = gg.TYPE_DWORD},
}
xqmnb(qmnb)
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("25;23;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(3)
  gg.editAll("180", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("Magic Bullet activated!")
  gg.clearResults()
  gg.setRanges(gg.REGION_BAD)
  gg.searchNumber("-88.66608428955;26:512", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("26", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(92)
  gg.editAll("-89999960", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.searchNumber("-88.73961639404;28:512", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("28", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(92)
  gg.editAll("-99999960", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("1;20.51941871643;2.04908943176;-86.45767974854;-92.2311706543;16.0", 16, false, 536870912, 0, -1)
  gg.searchNumber("16", 16, false, 536870912, 0, -1)
  gg.getResults(100)
  gg.editAll("100", 16)
  gg.clearResults()
  gg.setRanges(32)
  gg.searchNumber("9.20161819458;23;25;30.5", 16, false, 536870912, 0, -1)
  gg.searchNumber("25;30.5", 16, false, 536870912, 0, -1)
  gg.getResults(100)
  gg.editAll("245", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("150;85;45;-129;-85", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.searchNumber("45", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(30)
  gg.editAll("999999", gg.TYPE_FLOAT)
  gg.toast("Magic Bullet Activated")
end


function CVCX()
gg.clearResults()
gg.searchNumber('10000~100000;0.1;1.4012985e-45::', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber('10000~100000', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(200)
gg.editAll('900000', gg.TYPE_FLOAT)
end





function W9()
SN = gg.multiChoice({
 "Flash speed on √",
  "Flash speed off×",
   "Fix AR ",
   "speed++",
    "Exit"
}, nil, "⁦⁦⁦⁦╔─━━━━━━━━░░ 🌠F5M🌠 ░░━━━━━━━━─╗ ")


if SN == nil then else
if SN[1]  == true then FO() end
if SN[2]  == true then FF() end
if SN[3]  == true then FX () end
if SN[4]  ==  true then SE () end 
if SN[5]  ==  true then HOME() end
end
  PUBGMH = -1
end


function FO()
gg.clearResults()
gg.clearResults()
gg.setRanges(gg.REGION_C_DATA)
gg.searchNumber("-1296744149883614555", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(99)
gg.editAll("-1296744153870237696", gg.TYPE_QWORD)
gg.clearResults()
gg.searchNumber("-1904987454010553855", gg.TYPE_QWORD,false, gg.SIGN_EQUAL,0,-1)
gg.getResults(99)
gg.editAll("-1904987454002165247", gg.TYPE_QWORD)
gg.clearResults()
gg.clearResults() 
end

function FF()
 gg.clearResults()
gg.setRanges(gg.REGION_C_DATA)
gg.searchNumber(" -1,296,744,153,870,237,696", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(99)
gg.editAll(" -1,296,744,149,883,614,555", gg.TYPE_QWORD)
gg.clearResults()
gg.setRanges(gg.REGION_C_DATA)
gg.searchNumber(' -1,904,987,454,002,165,247', gg.TYPE_QWORD,false, gg.SIGN_EQUAL,0,-1)
gg.getResults(99)
gg.editAll(' -1,904,987,454,010,553,855', gg.TYPE_QWORD)
gg.clearResults()
end

function FX ()
    gg.clearResults()
gg.setRanges(32) gg.searchNumber("50000~100000;0;1;5D~100D::13", 16, false, 536870912, 0, -1)
    if gg.getResultCount() == 0 then
    else
      gg.searchNumber("50000~100000", 16, false, 536870912, 0, -1)
      RFSSMG1 = gg.getResults(210)
      gg.editAll("32465", 16)
      gg.clearResults()
      gg.toast("Fix AR V.SMG Enabled")
      end 
      gg.clearResults()
      end
      
 function SE ()
 gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("1D;4D;0D;1065353216D;1065353216D;1065353216D;1065353216D;1065353216D;1065353216D;1;1065353216D;1065353216D;1065353216D;1065353216D::53", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
--[[found: 0 ]]
gg.getResults(300)
--[[ count: 0 ]]
gg.searchNumber("1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
--[[ found: 113 ]]
gg.getResults(300)
--[[ count: 113 ]]
gg.editAll("1.27699995041", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_C_DATA)
gg.searchNumber("-1,296,744,149,883,614,555", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
--[[ found: 0 ]]
gg.getResults(99)
--[[ count: 0 ]]
gg.editAll(" -1,296,744,153,870,237,696", gg.TYPE_QWORD)
 end












function EXIT0()
  print("💠الوداع الى القاء في لكيم التالي 💠")
gg.skipRestoreState()
  os.exit()
  gg.setVisible(true)
end 

while true do
  if gg.isVisible(true) then
    PUBGMH = 1
    gg.setVisible(false)
  end
  gg.clearResults()
  if PUBGMH == 1 then
    HOME()
  end
end 

else
gg.alert("🚫يجب الأشتراك اولا في حماية فخم لشتغيل السكربت🚫","")
os.exit()
end
