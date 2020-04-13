Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A00D81A6628
	for <lists+samba-technical@lfdr.de>; Mon, 13 Apr 2020 14:05:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=iGTDxJxkBS0IG8iF0t73oiWtPJ/7tSXH6znNF9HnQww=; b=HrwW3qR19U811tWt4zxW4kvpDx
	MOVGyTL5UTBo4zjlQmWaPplcOobZuqelyZjnOKQ3uHx08dhkyLBnuwYL4H+fkcpMGPsBIuLfgvqW/
	hE/k7ebbfzWFVHsZ9ryK6nCLqXo2QHz1NK6jcn9VAvVzpbjz57lX6y+JBOQb0tB28U4uYrn1qT6Zj
	L+Kd0GqOenUujtP7BBSKOEz71/ZLPyzfvAWoFPYDra+Cx9sDkirFaWht61sdmuFQwOkPCz7brVAZE
	fzmLWuhfGcEwiMG9txc8G/ijRwPMMSKU0egr1NbOUErPojGHDFSmXzEiHePxl+v78Enq33mT8MMei
	T667b3HQ==;
Received: from localhost ([::1]:48048 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jNxpv-000bxq-8G; Mon, 13 Apr 2020 12:05:11 +0000
Received: from mout.gmx.net ([212.227.17.20]:33213) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jNxpn-000bxW-ER
 for samba-technical@lists.samba.org; Mon, 13 Apr 2020 12:05:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1586779490;
 bh=uF7AOhhAc++BOSzko8hnRzbAt8AwAk3MxJoOZ1vT2BE=;
 h=X-UI-Sender-Class:From:Subject:Date:In-Reply-To:Cc:To:References;
 b=CI6CPK1Hh2oaX5Spu8EiVGvNi4BMP9bajP6lz8nwnh99087JnGBYofu8ifOji4BFD
 2AKbRbfGoW6Sec9m/y7oNUEL9b7pfMac+FuQw70Vnpb/mDG4QB1t2Wshf3sB+0Yw3I
 cx4Y963k0Do9kgLbdV7zBwY7qv8JKWHHbt4ikhwc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.47.100] ([217.250.86.248]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7QxB-1jCEGt1Thd-017onF; Mon, 13
 Apr 2020 14:04:50 +0200
Message-Id: <7C427784-A9EC-4AAC-8063-3BABF53E1973@gmx.net>
Content-Type: multipart/mixed;
 boundary="Apple-Mail=_462412B9-9945-4A4B-99C8-0DCC6A1BCAC2"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: PANIC: vfs_fruit for time machine backup causes PANIC
Date: Mon, 13 Apr 2020 14:04:49 +0200
In-Reply-To: <2b8eec59f1cc1312f3740c0ca736517a9e6337fd.camel@cryptolab.net>
To: Anoop C S <anoopcs@cryptolab.net>
References: <03B0942F-6362-4FCD-9DC0-F267968A64FC@gmx.net>
 <9644B646-2EDF-448E-BF4A-8770157AAC71@gmx.net>
 <2b8eec59f1cc1312f3740c0ca736517a9e6337fd.camel@cryptolab.net>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Provags-ID: V03:K1:i6VwjAfdQIacGpCW5Si41oiXdEBoMapX7/U9et3DgMWegelVzrI
 ZhJCkJLUr9Z3wdslXPHRpyc6+0Vzq7SUPKuOe+rCdpB1qTOMXZGdndBgi03Qy6Uy54xs6KM
 NiMXeAYItn3Y+DKH7GY5IIlpRzVxF/E/e3u8cDGPDUWSgdcfvxphDMEcCMM2SOsecingtSp
 5EOblpA8tpAF4yUFIJ2/w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:voxj1WS1yPM=:3HJ6ThVJ8zsgf1xgqYNolD
 scfvKOgVsd4XVrsVgeIJB7uGMsgRFY6SOaDE/iMiGB3qix6jUbaHnpa9R11Wqp2yWHFBVb1wY
 cyfJqxtdPbTqTZZ1azRfv6xh9fETNQ6kUyT/KwBWg8XsrI1oT3IQQ63u8JCLvtPhAST7sJZP0
 zSZfiRrBHUbI5fsaXyRpYeYeg7/0MdfdzDayWBdfExM+mUjlXFpYNL79+UwJix+jR5RiFQiZq
 D+ZtYtS7jRXIGteTY4IlTq1DQ4NUinmxggAbXR7xWmxk8ivAPU/Mi5fiGVnN3e5V+fIJVDi9z
 bNNVHMyU+8+1PxNdaaKZZXuEVPs7r2+XuYhI0UeHQ/6SXk+XIS9eocwgsLXerdmG9wyMZJA6e
 it+vvD0bg2LpmtOXoJikpl5PZHjbia2AAC0ofEmwhzh8fsIXiU0PmZP5gW+QOrorhSk4H08S0
 sLYMt+JelPMYbjOdLgfyq4bekwENjG4pwVnZCq1N/LErPC26GtmdJG6RPrDqC8jgQAvoayoOx
 Qz+XoEWdWbCuu8c1wJQgNeToxtZQ09aUrl6htJAJe+2rtnDxIhIPrhG0i4IJu2Q7g/IRifU8N
 NgbGVfCbqGL56gdoEitwh3Fa8d5/qUpz2EC3WZsJNm1VVU1cY1KmrH/0gW6oRhuQO2/zbvLlx
 AOL4zI2czpRJEz/gMKNyismec0Yd1u5F2gfVCaiEI0PNfshcfADC7Sf5Uv69eOguvVCf4DSXz
 ACai90Z688NbyVYqSZ67ftxDHBbp4RF4t2FyRiLAT0k6LebyEw2jKdY7Xjtyg8n4MFhNgP+lI
 zBBAq6qtzSNXQkseDXCG928RoiPVx42E5jog1KEWnbzimroXw+9qRaIn1KvdrP9Kebs4MFi+c
 sTWte9/9E11n2ISW0Y6kWgdVU4TaEM0aJwvEMvRwPO9tTeJuxjuMEJEO43xHsQFzxXfUT+OB5
 0HwhYAA0AsBivaKZ9jEjKThzA+SbSkmnTOR5ImJnjnen555L9Grq99uSBYEftkYEh+TbH13IE
 jmjvsJOalOqUG0MFnZzSXyZ1lZyXhvagVviYrn2xFH2G4QBmrhXnCs1zBlu/z8xFPjSRxf7oX
 NDy3Qra5YOSLmDI02u0ok3rOg9iHRVc85F/8uVX2WFEuSKBOJ5PI6ZfRYZ0ckHrntmwYHS3bY
 sEtV36VutfFdt9W+T6PvWvoPvVJyCsRnbJNwiJKxUSFf9KFdvONs1nkH991jgcErUHkG5w8Rj
 RK2rP50eFfAaBllFb
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Rouven WEILER via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rouven WEILER <Rouven_Weiler@gmx.net>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--Apple-Mail=_462412B9-9945-4A4B-99C8-0DCC6A1BCAC2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


Okay here we go with =E2=80=9Elog level =3D 10=E2=80=9C.=20
log level 10 output is included in the attached file.

--Apple-Mail=_462412B9-9945-4A4B-99C8-0DCC6A1BCAC2
Content-Disposition: attachment;
	filename=smbd.log
Content-Type: application/octet-stream;
	x-unix-mode=0700;
	name="smbd.log"
Content-Transfer-Encoding: quoted-printable

  regdb_open: incrementing refcount (4->5)
[2020/04/13 13:55:57.640235, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_cachehook.c:125(reghook_cache=
_find)
  reghook_cache_find: Searching for keyname [\HKLM\SYSTEM\CurrentControlSe=
t\Services\WINS\Security]
[2020/04/13 13:55:57.640263, 10, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/lib/adt_tree.c:367(pathtree_find)
  pathtree_find: Enter [\HKLM\SYSTEM\CurrentControlSet\Services\WINS\Secur=
ity]
[2020/04/13 13:55:57.640292, 10, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/lib/adt_tree.c:440(pathtree_find)
  pathtree_find: Exit
[2020/04/13 13:55:57.640320, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_cachehook.c:130(reghook_cache=
_find)
  reghook_cache_find: found ops fffffd7fedf9c120 for key [\HKLM\SYSTEM\Cur=
rentControlSet\Services\WINS\Security]
[2020/04/13 13:55:57.640358, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_backend_db.c:907(regdb_close)
  regdb_close: decrementing refcount (5->4)
[2020/04/13 13:55:57.640395,  6, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_srv] ../../source3/rpc_server/rpc_handles.c:304(create_rpc_han=
dle_internal)
  Opened policy hnd[3] [0000] 00 00 00 00 0A 00 00 00   00 00 00 00 94 5E =
4D 53   ........ .....^MS
  [0010] FA 05 00 00                                        ....
[2020/04/13 13:55:57.640445,  1, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_parse] ../../librpc/ndr/ndr.c:482(ndr_print_function_debug)
       winreg_CreateKey: struct winreg_CreateKey
          out: struct winreg_CreateKey
              new_handle               : *
                  new_handle: struct policy_handle
                      handle_type              : 0x00000000 (0)
                      uuid                     : 0000000a-0000-0000-945e-4=
d53fa050000
              action_taken             : *
                  action_taken             : REG_OPENED_EXISTING_KEY (2)
              result                   : WERR_OK
[2020/04/13 13:55:57.640627,  1, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_parse] ../../librpc/ndr/ndr.c:482(ndr_print_function_debug)
       winreg_SetValue: struct winreg_SetValue
          in: struct winreg_SetValue
              handle                   : *
                  handle: struct policy_handle
                      handle_type              : 0x00000000 (0)
                      uuid                     : 0000000a-0000-0000-945e-4=
d53fa050000
              name: struct winreg_String
                  name_len                 : 0x0012 (18)
                  name_size                : 0x0012 (18)
                  name                     : *
                      name                     : 'Security'
              type                     : REG_BINARY (3)
              data                     : *
                  data: ARRAY(120)
                      [0]                      : 0x01 (1)
                      [1]                      : 0x00 (0)
                      [2]                      : 0x04 (4)
                      [3]                      : 0x80 (128)
                      [4]                      : 0x00 (0)
                      [5]                      : 0x00 (0)
                      [6]                      : 0x00 (0)
                      [7]                      : 0x00 (0)
                      [8]                      : 0x00 (0)
                      [9]                      : 0x00 (0)
                      [10]                     : 0x00 (0)
                      [11]                     : 0x00 (0)
                      [12]                     : 0x00 (0)
                      [13]                     : 0x00 (0)
                      [14]                     : 0x00 (0)
                      [15]                     : 0x00 (0)
                      [16]                     : 0x14 (20)
                      [17]                     : 0x00 (0)
                      [18]                     : 0x00 (0)
                      [19]                     : 0x00 (0)
                      [20]                     : 0x02 (2)
                      [21]                     : 0x00 (0)
                      [22]                     : 0x64 (100)
                      [23]                     : 0x00 (0)
                      [24]                     : 0x04 (4)
                      [25]                     : 0x00 (0)
                      [26]                     : 0x00 (0)
                      [27]                     : 0x00 (0)
                      [28]                     : 0x00 (0)
                      [29]                     : 0x00 (0)
                      [30]                     : 0x14 (20)
                      [31]                     : 0x00 (0)
                      [32]                     : 0x8d (141)
                      [33]                     : 0x01 (1)
                      [34]                     : 0x02 (2)
                      [35]                     : 0x00 (0)
                      [36]                     : 0x01 (1)
                      [37]                     : 0x01 (1)
                      [38]                     : 0x00 (0)
                      [39]                     : 0x00 (0)
                      [40]                     : 0x00 (0)
                      [41]                     : 0x00 (0)
                      [42]                     : 0x00 (0)
                      [43]                     : 0x01 (1)
                      [44]                     : 0x00 (0)
                      [45]                     : 0x00 (0)
                      [46]                     : 0x00 (0)
                      [47]                     : 0x00 (0)
                      [48]                     : 0x00 (0)
                      [49]                     : 0x00 (0)
                      [50]                     : 0x18 (24)
                      [51]                     : 0x00 (0)
                      [52]                     : 0xfd (253)
                      [53]                     : 0x01 (1)
                      [54]                     : 0x02 (2)
                      [55]                     : 0x00 (0)
                      [56]                     : 0x01 (1)
                      [57]                     : 0x02 (2)
                      [58]                     : 0x00 (0)
                      [59]                     : 0x00 (0)
                      [60]                     : 0x00 (0)
                      [61]                     : 0x00 (0)
                      [62]                     : 0x00 (0)
                      [63]                     : 0x05 (5)
                      [64]                     : 0x20 (32)
                      [65]                     : 0x00 (0)
                      [66]                     : 0x00 (0)
                      [67]                     : 0x00 (0)
                      [68]                     : 0x23 (35)
                      [69]                     : 0x02 (2)
                      [70]                     : 0x00 (0)
                      [71]                     : 0x00 (0)
                      [72]                     : 0x00 (0)
                      [73]                     : 0x00 (0)
                      [74]                     : 0x18 (24)
                      [75]                     : 0x00 (0)
                      [76]                     : 0xff (255)
                      [77]                     : 0x01 (1)
                      [78]                     : 0x0f (15)
                      [79]                     : 0x00 (0)
                      [80]                     : 0x01 (1)
                      [81]                     : 0x02 (2)
                      [82]                     : 0x00 (0)
                      [83]                     : 0x00 (0)
                      [84]                     : 0x00 (0)
                      [85]                     : 0x00 (0)
                      [86]                     : 0x00 (0)
                      [87]                     : 0x05 (5)
                      [88]                     : 0x20 (32)
                      [89]                     : 0x00 (0)
                      [90]                     : 0x00 (0)
                      [91]                     : 0x00 (0)
                      [92]                     : 0x25 (37)
                      [93]                     : 0x02 (2)
                      [94]                     : 0x00 (0)
                      [95]                     : 0x00 (0)
                      [96]                     : 0x00 (0)
                      [97]                     : 0x00 (0)
                      [98]                     : 0x18 (24)
                      [99]                     : 0x00 (0)
                      [100]                    : 0xff (255)
                      [101]                    : 0x01 (1)
                      [102]                    : 0x0f (15)
                      [103]                    : 0x00 (0)
                      [104]                    : 0x01 (1)
                      [105]                    : 0x02 (2)
                      [106]                    : 0x00 (0)
                      [107]                    : 0x00 (0)
                      [108]                    : 0x00 (0)
                      [109]                    : 0x00 (0)
                      [110]                    : 0x00 (0)
                      [111]                    : 0x05 (5)
                      [112]                    : 0x20 (32)
                      [113]                    : 0x00 (0)
                      [114]                    : 0x00 (0)
                      [115]                    : 0x00 (0)
                      [116]                    : 0x20 (32)
                      [117]                    : 0x02 (2)
                      [118]                    : 0x00 (0)
                      [119]                    : 0x00 (0)
              size                     : 0x00000078 (120)
[2020/04/13 13:55:57.642250,  6, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_srv] ../../source3/rpc_server/rpc_handles.c:339(find_policy_by=
_hnd_internal)
  Found policy hnd[0] [0000] 00 00 00 00 0A 00 00 00   00 00 00 00 94 5E 4=
D 53   ........ .....^MS
  [0010] FA 05 00 00                                        ....
[2020/04/13 13:55:57.642305,  8, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_srv] ../../source3/rpc_server/winreg/srv_winreg_nt.c:735(_winr=
eg_SetValue)
  _winreg_SetValue: Setting value for [HKLM\SYSTEM\CurrentControlSet\Servi=
ces\WINS\Security:Security]
[2020/04/13 13:55:57.642334,  5, pid=3D1530, effective(0, 0), real(0, 0)] =
../../lib/tdb_wrap/tdb_wrap.c:64(tdb_wrap_log)
  tdb(/var/samba/locks/registry.tdb): tdb_transaction_start: nesting 1
[2020/04/13 13:55:57.642360, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_dispatcher.c:151(fetch_reg_va=
lues)
  fetch_reg_values called for key 'HKLM\SYSTEM\CurrentControlSet\Services\=
WINS\Security' (ops fffffd7fedf9c120)
[2020/04/13 13:55:57.642391, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_backend_db.c:1944(regdb_fetch=
_values_internal)
  regdb_fetch_values: Looking for values of key [HKLM\SYSTEM\CurrentContro=
lSet\Services\WINS\Security]
[2020/04/13 13:55:57.642426, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_backend_db.c:1889(regdb_unpac=
k_values)
  regdb_unpack_values: value[0]: name[Security] len[120]
[2020/04/13 13:55:57.642460,  1, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_parse] ../../librpc/ndr/ndr.c:482(ndr_print_function_debug)
       winreg_SetValue: struct winreg_SetValue
          out: struct winreg_SetValue
              result                   : WERR_OK
[2020/04/13 13:55:57.642546,  1, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_parse] ../../librpc/ndr/ndr.c:482(ndr_print_function_debug)
       winreg_CloseKey: struct winreg_CloseKey
          in: struct winreg_CloseKey
              handle                   : *
                  handle: struct policy_handle
                      handle_type              : 0x00000000 (0)
                      uuid                     : 0000000a-0000-0000-945e-4=
d53fa050000
[2020/04/13 13:55:57.642637,  6, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_srv] ../../source3/rpc_server/rpc_handles.c:339(find_policy_by=
_hnd_internal)
  Found policy hnd[0] [0000] 00 00 00 00 0A 00 00 00   00 00 00 00 94 5E 4=
D 53   ........ .....^MS
  [0010] FA 05 00 00                                        ....
[2020/04/13 13:55:57.642691,  6, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_srv] ../../source3/rpc_server/rpc_handles.c:339(find_policy_by=
_hnd_internal)
  Found policy hnd[0] [0000] 00 00 00 00 0A 00 00 00   00 00 00 00 94 5E 4=
D 53   ........ .....^MS
  [0010] FA 05 00 00                                        ....
[2020/04/13 13:55:57.642745,  6, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_srv] ../../source3/rpc_server/rpc_handles.c:388(close_policy_h=
nd)
  Closed policy
[2020/04/13 13:55:57.642771, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_backend_db.c:907(regdb_close)
  regdb_close: decrementing refcount (4->3)
[2020/04/13 13:55:57.642798,  1, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_parse] ../../librpc/ndr/ndr.c:482(ndr_print_function_debug)
       winreg_CloseKey: struct winreg_CloseKey
          out: struct winreg_CloseKey
              handle                   : *
                  handle: struct policy_handle
                      handle_type              : 0x00000000 (0)
                      uuid                     : 00000000-0000-0000-0000-0=
00000000000
              result                   : WERR_OK
[2020/04/13 13:55:57.642931,  1, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_parse] ../../librpc/ndr/ndr.c:482(ndr_print_function_debug)
       winreg_CloseKey: struct winreg_CloseKey
          in: struct winreg_CloseKey
              handle                   : *
                  handle: struct policy_handle
                      handle_type              : 0x00000000 (0)
                      uuid                     : 00000002-0000-0000-945e-4=
d53fa050000
[2020/04/13 13:55:57.643022,  6, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_srv] ../../source3/rpc_server/rpc_handles.c:339(find_policy_by=
_hnd_internal)
  Found policy hnd[0] [0000] 00 00 00 00 02 00 00 00   00 00 00 00 94 5E 4=
D 53   ........ .....^MS
  [0010] FA 05 00 00                                        ....
[2020/04/13 13:55:57.643076,  6, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_srv] ../../source3/rpc_server/rpc_handles.c:339(find_policy_by=
_hnd_internal)
  Found policy hnd[0] [0000] 00 00 00 00 02 00 00 00   00 00 00 00 94 5E 4=
D 53   ........ .....^MS
  [0010] FA 05 00 00                                        ....
[2020/04/13 13:55:57.643124,  6, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_srv] ../../source3/rpc_server/rpc_handles.c:388(close_policy_h=
nd)
  Closed policy
[2020/04/13 13:55:57.643157, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_backend_db.c:907(regdb_close)
  regdb_close: decrementing refcount (3->2)
[2020/04/13 13:55:57.643185,  1, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_parse] ../../librpc/ndr/ndr.c:482(ndr_print_function_debug)
       winreg_CloseKey: struct winreg_CloseKey
          out: struct winreg_CloseKey
              handle                   : *
                  handle: struct policy_handle
                      handle_type              : 0x00000000 (0)
                      uuid                     : 00000000-0000-0000-0000-0=
00000000000
              result                   : WERR_OK
[2020/04/13 13:55:57.643306, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_backend_db.c:907(regdb_close)
  regdb_close: decrementing refcount (2->1)
[2020/04/13 13:55:57.643364, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_backend_db.c:907(regdb_close)
  regdb_close: decrementing refcount (1->0)
[2020/04/13 13:55:57.645328, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_srv] ../../source3/rpc_server/rpc_handles.c:420(close_policy_b=
y_pipe)
  close_policy_by_pipe: Deleted handle list for RPC connection winreg
[2020/04/13 13:55:57.645433,  3, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/rpc_server/eventlog/srv_eventlog_reg.c:59(=
eventlog_init_winreg)
  Initialise the eventlog registry keys if needed.
[2020/04/13 13:55:57.645503,  5, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_srv] ../../source3/rpc_server/rpc_ncacn_np.c:248(make_internal=
_rpc_pipe_p)
  make_internal_rpc_pipe_p: Create pipe requested winreg
[2020/04/13 13:55:57.645535, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_srv] ../../source3/rpc_server/rpc_handles.c:223(init_pipe_hand=
les)
  init_pipe_handle_list: created handle list for pipe winreg
[2020/04/13 13:55:57.645569, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_srv] ../../source3/rpc_server/rpc_handles.c:240(init_pipe_hand=
les)
  init_pipe_handle_list: pipe_handles ref count =3D 1 for pipe winreg
[2020/04/13 13:55:57.645622,  4, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_srv] ../../source3/rpc_server/rpc_ncacn_np.c:288(make_internal=
_rpc_pipe_p)
  Created internal pipe winreg
[2020/04/13 13:55:57.645687,  1, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_parse] ../../librpc/ndr/ndr.c:482(ndr_print_function_debug)
       winreg_OpenHKLM: struct winreg_OpenHKLM
          in: struct winreg_OpenHKLM
              system_name              : NULL
              access_mask              : 0x02000000 (33554432)
                     0: KEY_QUERY_VALUE
                     0: KEY_SET_VALUE
                     0: KEY_CREATE_SUB_KEY
                     0: KEY_ENUMERATE_SUB_KEYS
                     0: KEY_NOTIFY
                     0: KEY_CREATE_LINK
                     0: KEY_WOW64_64KEY
                     0: KEY_WOW64_32KEY
[2020/04/13 13:55:57.645857,  7, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_api.c:143(regkey_open_oneleve=
l)
  regkey_open_onelevel: name =3D [HKLM]
[2020/04/13 13:55:57.645911,  4, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/smbd/sec_ctx.c:216(push_sec_ctx)
  push_sec_ctx(0, 0) : sec_ctx_stack_ndx =3D 1
[2020/04/13 13:55:57.645946,  4, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/smbd/uid.c:566(push_conn_ctx)
  push_conn_ctx(0) : conn_ctx_stack_ndx =3D 0
[2020/04/13 13:55:57.645972,  4, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/smbd/sec_ctx.c:320(set_sec_ctx_internal)
  setting sec ctx (0, 0) - sec_ctx_stack_ndx =3D 1
[2020/04/13 13:55:57.645997,  5, pid=3D1530, effective(0, 0), real(0, 0)] =
../../libcli/security/security_token.c:52(security_token_debug)
  Security token: (NULL)
[2020/04/13 13:55:57.646023,  5, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/auth/token_util.c:874(debug_unix_user_token)
  UNIX token of user 0
  Primary group is 0 and contains 0 supplementary groups
[2020/04/13 13:55:57.646133,  4, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/smbd/sec_ctx.c:438(pop_sec_ctx)
  pop_sec_ctx (0, 0) - sec_ctx_stack_ndx =3D 0
[2020/04/13 13:55:57.646163, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_backend_db.c:887(regdb_open)
  regdb_open: registry db opened. refcount reset (1)
[2020/04/13 13:55:57.646198, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_cachehook.c:125(reghook_cache=
_find)
  reghook_cache_find: Searching for keyname [\HKLM]
[2020/04/13 13:55:57.646224, 10, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/lib/adt_tree.c:367(pathtree_find)
  pathtree_find: Enter [\HKLM]
[2020/04/13 13:55:57.646250, 10, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/lib/adt_tree.c:440(pathtree_find)
  pathtree_find: Exit
[2020/04/13 13:55:57.646281, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_cachehook.c:130(reghook_cache=
_find)
  reghook_cache_find: found ops fffffd7fedf9c120 for key [\HKLM]
[2020/04/13 13:55:57.646339,  6, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_srv] ../../source3/rpc_server/rpc_handles.c:304(create_rpc_han=
dle_internal)
  Opened policy hnd[1] [0000] 00 00 00 00 0B 00 00 00   00 00 00 00 94 5E =
4D 53   ........ .....^MS
  [0010] FA 05 00 00                                        ....
[2020/04/13 13:55:57.646399,  1, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_parse] ../../librpc/ndr/ndr.c:482(ndr_print_function_debug)
       winreg_OpenHKLM: struct winreg_OpenHKLM
          out: struct winreg_OpenHKLM
              handle                   : *
                  handle: struct policy_handle
                      handle_type              : 0x00000000 (0)
                      uuid                     : 0000000b-0000-0000-945e-4=
d53fa050000
              result                   : WERR_OK
[2020/04/13 13:55:57.646551,  1, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_parse] ../../librpc/ndr/ndr.c:482(ndr_print_function_debug)
       winreg_OpenKey: struct winreg_OpenKey
          in: struct winreg_OpenKey
              parent_handle            : *
                  parent_handle: struct policy_handle
                      handle_type              : 0x00000000 (0)
                      uuid                     : 0000000b-0000-0000-945e-4=
d53fa050000
              keyname: struct winreg_String
                  name_len                 : 0x0056 (86)
                  name_size                : 0x0056 (86)
                  name                     : *
                      name                     : 'SYSTEM\CurrentControlSet=
\Services\Eventlog'
              options                  : 0x00000000 (0)
                     0: REG_OPTION_VOLATILE
                     0: REG_OPTION_CREATE_LINK
                     0: REG_OPTION_BACKUP_RESTORE
                     0: REG_OPTION_OPEN_LINK
              access_mask              : 0x02000000 (33554432)
                     0: KEY_QUERY_VALUE
                     0: KEY_SET_VALUE
                     0: KEY_CREATE_SUB_KEY
                     0: KEY_ENUMERATE_SUB_KEYS
                     0: KEY_NOTIFY
                     0: KEY_CREATE_LINK
                     0: KEY_WOW64_64KEY
                     0: KEY_WOW64_32KEY
[2020/04/13 13:55:57.646936,  6, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_srv] ../../source3/rpc_server/rpc_handles.c:339(find_policy_by=
_hnd_internal)
  Found policy hnd[0] [0000] 00 00 00 00 0B 00 00 00   00 00 00 00 94 5E 4=
D 53   ........ .....^MS
  [0010] FA 05 00 00                                        ....
[2020/04/13 13:55:57.646998,  7, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_api.c:143(regkey_open_oneleve=
l)
  regkey_open_onelevel: name =3D [SYSTEM]
[2020/04/13 13:55:57.647037, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_backend_db.c:859(regdb_open)
  regdb_open: incrementing refcount (1->2)
[2020/04/13 13:55:57.647070, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_cachehook.c:125(reghook_cache=
_find)
  reghook_cache_find: Searching for keyname [\HKLM\SYSTEM]
[2020/04/13 13:55:57.647099, 10, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/lib/adt_tree.c:367(pathtree_find)
  pathtree_find: Enter [\HKLM\SYSTEM]
[2020/04/13 13:55:57.647140, 10, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/lib/adt_tree.c:440(pathtree_find)
  pathtree_find: Exit
[2020/04/13 13:55:57.647169, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_cachehook.c:130(reghook_cache=
_find)
  reghook_cache_find: found ops fffffd7fedf9c120 for key [\HKLM\SYSTEM]
[2020/04/13 13:55:57.647223,  7, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_api.c:143(regkey_open_oneleve=
l)
  regkey_open_onelevel: name =3D [CurrentControlSet]
[2020/04/13 13:55:57.647265, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_backend_db.c:859(regdb_open)
  regdb_open: incrementing refcount (2->3)
[2020/04/13 13:55:57.647292, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_cachehook.c:125(reghook_cache=
_find)
  reghook_cache_find: Searching for keyname [\HKLM\SYSTEM\CurrentControlSe=
t]
[2020/04/13 13:55:57.647326, 10, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/lib/adt_tree.c:367(pathtree_find)
  pathtree_find: Enter [\HKLM\SYSTEM\CurrentControlSet]
[2020/04/13 13:55:57.647354, 10, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/lib/adt_tree.c:440(pathtree_find)
  pathtree_find: Exit
[2020/04/13 13:55:57.647378, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_cachehook.c:130(reghook_cache=
_find)
  reghook_cache_find: found ops fffffd7fedf9c120 for key [\HKLM\SYSTEM\Cur=
rentControlSet]
[2020/04/13 13:55:57.647433,  7, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_api.c:143(regkey_open_oneleve=
l)
  regkey_open_onelevel: name =3D [Services]
[2020/04/13 13:55:57.647460, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_backend_db.c:859(regdb_open)
  regdb_open: incrementing refcount (3->4)
[2020/04/13 13:55:57.647487, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_cachehook.c:125(reghook_cache=
_find)
  reghook_cache_find: Searching for keyname [\HKLM\SYSTEM\CurrentControlSe=
t\Services]
[2020/04/13 13:55:57.647520, 10, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/lib/adt_tree.c:367(pathtree_find)
  pathtree_find: Enter [\HKLM\SYSTEM\CurrentControlSet\Services]
[2020/04/13 13:55:57.647548, 10, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/lib/adt_tree.c:440(pathtree_find)
  pathtree_find: Exit
[2020/04/13 13:55:57.647573, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_cachehook.c:130(reghook_cache=
_find)
  reghook_cache_find: found ops fffffd7fedf9c120 for key [\HKLM\SYSTEM\Cur=
rentControlSet\Services]
[2020/04/13 13:55:57.647634,  7, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_api.c:143(regkey_open_oneleve=
l)
  regkey_open_onelevel: name =3D [Eventlog]
[2020/04/13 13:55:57.647662, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_backend_db.c:859(regdb_open)
  regdb_open: incrementing refcount (4->5)
[2020/04/13 13:55:57.647696, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_cachehook.c:125(reghook_cache=
_find)
  reghook_cache_find: Searching for keyname [\HKLM\SYSTEM\CurrentControlSe=
t\Services\Eventlog]
[2020/04/13 13:55:57.647722, 10, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/lib/adt_tree.c:367(pathtree_find)
  pathtree_find: Enter [\HKLM\SYSTEM\CurrentControlSet\Services\Eventlog]
[2020/04/13 13:55:57.647757, 10, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/lib/adt_tree.c:440(pathtree_find)
  pathtree_find: Exit
[2020/04/13 13:55:57.647782, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_cachehook.c:130(reghook_cache=
_find)
  reghook_cache_find: found ops fffffd7fedf9c120 for key [\HKLM\SYSTEM\Cur=
rentControlSet\Services\Eventlog]
[2020/04/13 13:55:57.647826, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_backend_db.c:907(regdb_close)
  regdb_close: decrementing refcount (5->4)
[2020/04/13 13:55:57.647862, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_backend_db.c:907(regdb_close)
  regdb_close: decrementing refcount (4->3)
[2020/04/13 13:55:57.647889, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_backend_db.c:907(regdb_close)
  regdb_close: decrementing refcount (3->2)
[2020/04/13 13:55:57.647922,  6, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_srv] ../../source3/rpc_server/rpc_handles.c:304(create_rpc_han=
dle_internal)
  Opened policy hnd[2] [0000] 00 00 00 00 0C 00 00 00   00 00 00 00 94 5E =
4D 53   ........ .....^MS
  [0010] FA 05 00 00                                        ....
[2020/04/13 13:55:57.647979,  1, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_parse] ../../librpc/ndr/ndr.c:482(ndr_print_function_debug)
       winreg_OpenKey: struct winreg_OpenKey
          out: struct winreg_OpenKey
              handle                   : *
                  handle: struct policy_handle
                      handle_type              : 0x00000000 (0)
                      uuid                     : 0000000c-0000-0000-945e-4=
d53fa050000
              result                   : WERR_OK
[2020/04/13 13:55:57.648130,  1, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_parse] ../../librpc/ndr/ndr.c:482(ndr_print_function_debug)
       winreg_QueryInfoKey: struct winreg_QueryInfoKey
          in: struct winreg_QueryInfoKey
              handle                   : *
                  handle: struct policy_handle
                      handle_type              : 0x00000000 (0)
                      uuid                     : 0000000c-0000-0000-945e-4=
d53fa050000
              classname                : *
                  classname: struct winreg_String
                      name_len                 : 0x0000 (0)
                      name_size                : 0x0000 (0)
                      name                     : NULL
[2020/04/13 13:55:57.648295,  6, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_srv] ../../source3/rpc_server/rpc_handles.c:339(find_policy_by=
_hnd_internal)
  Found policy hnd[0] [0000] 00 00 00 00 0C 00 00 00   00 00 00 00 94 5E 4=
D 53   ........ .....^MS
  [0010] FA 05 00 00                                        ....
[2020/04/13 13:55:57.648349, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_dispatcher.c:151(fetch_reg_va=
lues)
  fetch_reg_values called for key 'HKLM\SYSTEM\CurrentControlSet\Services\=
Eventlog' (ops fffffd7fedf9c120)
[2020/04/13 13:55:57.648383, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_backend_db.c:1944(regdb_fetch=
_values_internal)
  regdb_fetch_values: Looking for values of key [HKLM\SYSTEM\CurrentContro=
lSet\Services\Eventlog]
[2020/04/13 13:55:57.648426, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_backend_db.c:1889(regdb_unpac=
k_values)
  regdb_unpack_values: value[0]: name[DisplayName] len[20]
[2020/04/13 13:55:57.648462, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_backend_db.c:1889(regdb_unpac=
k_values)
  regdb_unpack_values: value[1]: name[ErrorControl] len[4]
[2020/04/13 13:55:57.648494, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_backend_db.c:2131(regdb_get_s=
ecdesc)
  regdb_get_secdesc: Getting secdesc of key [HKLM\SYSTEM\CurrentControlSet=
\Services\Eventlog]
[2020/04/13 13:55:57.648538,  1, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_parse] ../../librpc/ndr/ndr.c:482(ndr_print_function_debug)
       winreg_QueryInfoKey: struct winreg_QueryInfoKey
          out: struct winreg_QueryInfoKey
              classname                : *
                  classname: struct winreg_String
                      name_len                 : 0x0000 (0)
                      name_size                : 0x0000 (0)
                      name                     : NULL
              num_subkeys              : *
                  num_subkeys              : 0x00000000 (0)
              max_subkeylen            : *
                  max_subkeylen            : 0x00000000 (0)
              max_classlen             : *
                  max_classlen             : 0x00000000 (0)
              num_values               : *
                  num_values               : 0x00000002 (2)
              max_valnamelen           : *
                  max_valnamelen           : 0x0000001a (26)
              max_valbufsize           : *
                  max_valbufsize           : 0x00000014 (20)
              secdescsize              : *
                  secdescsize              : 0x00000078 (120)
              last_changed_time        : *
                  last_changed_time        : NTTIME(0)
              result                   : WERR_OK
[2020/04/13 13:55:57.648900,  1, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_parse] ../../librpc/ndr/ndr.c:482(ndr_print_function_debug)
       winreg_CloseKey: struct winreg_CloseKey
          in: struct winreg_CloseKey
              handle                   : *
                  handle: struct policy_handle
                      handle_type              : 0x00000000 (0)
                      uuid                     : 0000000c-0000-0000-945e-4=
d53fa050000
[2020/04/13 13:55:57.649002,  6, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_srv] ../../source3/rpc_server/rpc_handles.c:339(find_policy_by=
_hnd_internal)
  Found policy hnd[0] [0000] 00 00 00 00 0C 00 00 00   00 00 00 00 94 5E 4=
D 53   ........ .....^MS
  [0010] FA 05 00 00                                        ....
[2020/04/13 13:55:57.649063,  6, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_srv] ../../source3/rpc_server/rpc_handles.c:339(find_policy_by=
_hnd_internal)
  Found policy hnd[0] [0000] 00 00 00 00 0C 00 00 00   00 00 00 00 94 5E 4=
D 53   ........ .....^MS
  [0010] FA 05 00 00                                        ....
[2020/04/13 13:55:57.649113,  6, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_srv] ../../source3/rpc_server/rpc_handles.c:388(close_policy_h=
nd)
  Closed policy
[2020/04/13 13:55:57.649147, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_backend_db.c:907(regdb_close)
  regdb_close: decrementing refcount (2->1)
[2020/04/13 13:55:57.649174,  1, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_parse] ../../librpc/ndr/ndr.c:482(ndr_print_function_debug)
       winreg_CloseKey: struct winreg_CloseKey
          out: struct winreg_CloseKey
              handle                   : *
                  handle: struct policy_handle
                      handle_type              : 0x00000000 (0)
                      uuid                     : 00000000-0000-0000-0000-0=
00000000000
              result                   : WERR_OK
[2020/04/13 13:55:57.649290, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Dregistry] ../../source3/registry/reg_backend_db.c:907(regdb_close)
  regdb_close: decrementing refcount (1->0)
[2020/04/13 13:55:57.650346, 10, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_srv] ../../source3/rpc_server/rpc_handles.c:420(close_policy_b=
y_pipe)
  close_policy_by_pipe: Deleted handle list for RPC connection winreg
[2020/04/13 13:55:57.650433,  5, pid=3D1530, effective(0, 0), real(0, 0), =
class=3Drpc_srv] ../../source3/rpc_server/rpc_service_setup.c:624(dcesrv_e=
p_setup)
  dcesrv_ep_setup: Initializing DCE/RPC modules
[2020/04/13 13:55:57.650723,  0, pid=3D1530, effective(0, 0), real(0, 0)] =
../../lib/util/become_daemon.c:136(daemon_ready)
  daemon_ready: daemon 'smbd' finished starting up and ready to serve conn=
ections
[2020/04/13 13:55:57.651635,  7, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/param/loadparm.c:4305(lp_servicenumber)
  lp_servicenumber: couldn't find print$
[2020/04/13 13:55:57.651677,  5, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/printing/nt_printing.c:95(print_driver_directories_init)
  No print$ share has been configured.
[2020/04/13 13:55:57.651766,  5, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/lib/messages.c:725(messaging_register)
  Registering messaging pointer for type 515 - private_data=3D0
[2020/04/13 13:55:57.651818,  3, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/printing/queue_process.c:329(start_background_queue)
  start_background_queue: Starting background LPQ thread
[2020/04/13 13:55:57.653499, 10, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/lib/util_sock.c:410(open_socket_in)
  bind succeeded on port 445
[2020/04/13 13:55:57.653601,  5, pid=3D1530, effective(0, 0), real(0, 0)] =
../../lib/util/util_net.c:1055(print_socket_options)
  Socket options:
  	SO_KEEPALIVE =3D 8
  	SO_REUSEADDR =3D 4
  	SO_BROADCAST =3D 0
  	TCP_NODELAY =3D 0
  	TCP_KEEPCNT =3D 0
  	TCP_KEEPIDLE =3D 7200
  	TCP_KEEPINTVL =3D 0
  	Could not test socket option IPTOS_LOWDELAY.
  	Could not test socket option IPTOS_THROUGHPUT.
  	SO_SNDBUF =3D 49152
  	SO_RCVBUF =3D 128000
  	Could not test socket option SO_SNDLOWAT.
  	Could not test socket option SO_RCVLOWAT.
  	Could not test socket option SO_SNDTIMEO.
  	Could not test socket option SO_RCVTIMEO.
  	TCP_KEEPALIVE_THRESHOLD =3D 7200000
  	TCP_KEEPALIVE_ABORT_THRESHOLD =3D 480000
[2020/04/13 13:55:57.653868,  5, pid=3D1530, effective(0, 0), real(0, 0)] =
../../lib/util/util_net.c:1055(print_socket_options)
  Socket options:
  	SO_KEEPALIVE =3D 8
  	SO_REUSEADDR =3D 4
  	SO_BROADCAST =3D 0
  	TCP_NODELAY =3D 1
  	TCP_KEEPCNT =3D 0
  	TCP_KEEPIDLE =3D 7200
  	TCP_KEEPINTVL =3D 0
  	Could not test socket option IPTOS_LOWDELAY.
  	Could not test socket option IPTOS_THROUGHPUT.
  	SO_SNDBUF =3D 49152
  	SO_RCVBUF =3D 128000
  	Could not test socket option SO_SNDLOWAT.
  	Could not test socket option SO_RCVLOWAT.
  	Could not test socket option SO_SNDTIMEO.
  	Could not test socket option SO_RCVTIMEO.
  	TCP_KEEPALIVE_THRESHOLD =3D 7200000
  	TCP_KEEPALIVE_ABORT_THRESHOLD =3D 480000
[2020/04/13 13:55:57.654229, 10, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/lib/util_sock.c:410(open_socket_in)
  bind succeeded on port 139
[2020/04/13 13:55:57.654266,  5, pid=3D1530, effective(0, 0), real(0, 0)] =
../../lib/util/util_net.c:1055(print_socket_options)
  Socket options:
  	SO_KEEPALIVE =3D 8
  	SO_REUSEADDR =3D 4
  	SO_BROADCAST =3D 0
  	TCP_NODELAY =3D 0
  	TCP_KEEPCNT =3D 0
  	TCP_KEEPIDLE =3D 7200
  	TCP_KEEPINTVL =3D 0
  	Could not test socket option IPTOS_LOWDELAY.
  	Could not test socket option IPTOS_THROUGHPUT.
  	SO_SNDBUF =3D 49152
  	SO_RCVBUF =3D 128000
  	Could not test socket option SO_SNDLOWAT.
  	Could not test socket option SO_RCVLOWAT.
  	Could not test socket option SO_SNDTIMEO.
  	Could not test socket option SO_RCVTIMEO.
  	TCP_KEEPALIVE_THRESHOLD =3D 7200000
  	TCP_KEEPALIVE_ABORT_THRESHOLD =3D 480000
[2020/04/13 13:55:57.654514,  5, pid=3D1530, effective(0, 0), real(0, 0)] =
../../lib/util/util_net.c:1055(print_socket_options)
  Socket options:
  	SO_KEEPALIVE =3D 8
  	SO_REUSEADDR =3D 4
  	SO_BROADCAST =3D 0
  	TCP_NODELAY =3D 1
  	TCP_KEEPCNT =3D 0
  	TCP_KEEPIDLE =3D 7200
  	TCP_KEEPINTVL =3D 0
  	Could not test socket option IPTOS_LOWDELAY.
  	Could not test socket option IPTOS_THROUGHPUT.
  	SO_SNDBUF =3D 49152
  	SO_RCVBUF =3D 128000
  	Could not test socket option SO_SNDLOWAT.
  	Could not test socket option SO_RCVLOWAT.
  	Could not test socket option SO_SNDTIMEO.
  	Could not test socket option SO_RCVTIMEO.
  	TCP_KEEPALIVE_THRESHOLD =3D 7200000
  	TCP_KEEPALIVE_ABORT_THRESHOLD =3D 480000
[2020/04/13 13:55:57.654798, 10, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/lib/util_sock.c:410(open_socket_in)
  bind succeeded on port 445
[2020/04/13 13:55:57.654831,  5, pid=3D1530, effective(0, 0), real(0, 0)] =
../../lib/util/util_net.c:1055(print_socket_options)
  Socket options:
  	SO_KEEPALIVE =3D 8
  	SO_REUSEADDR =3D 4
  	SO_BROADCAST =3D 0
  	TCP_NODELAY =3D 0
  	TCP_KEEPCNT =3D 0
  	TCP_KEEPIDLE =3D 7200
  	TCP_KEEPINTVL =3D 0
  	IPTOS_LOWDELAY =3D 0
  	IPTOS_THROUGHPUT =3D 0
  	SO_SNDBUF =3D 49152
  	SO_RCVBUF =3D 128000
  	Could not test socket option SO_SNDLOWAT.
  	Could not test socket option SO_RCVLOWAT.
  	Could not test socket option SO_SNDTIMEO.
  	Could not test socket option SO_RCVTIMEO.
  	TCP_KEEPALIVE_THRESHOLD =3D 7200000
  	TCP_KEEPALIVE_ABORT_THRESHOLD =3D 480000
[2020/04/13 13:55:57.655077,  5, pid=3D1530, effective(0, 0), real(0, 0)] =
../../lib/util/util_net.c:1055(print_socket_options)
  Socket options:
  	SO_KEEPALIVE =3D 8
  	SO_REUSEADDR =3D 4
  	SO_BROADCAST =3D 0
  	TCP_NODELAY =3D 1
  	TCP_KEEPCNT =3D 0
  	TCP_KEEPIDLE =3D 7200
  	TCP_KEEPINTVL =3D 0
  	IPTOS_LOWDELAY =3D 0
  	IPTOS_THROUGHPUT =3D 0
  	SO_SNDBUF =3D 49152
  	SO_RCVBUF =3D 128000
  	Could not test socket option SO_SNDLOWAT.
  	Could not test socket option SO_RCVLOWAT.
  	Could not test socket option SO_SNDTIMEO.
  	Could not test socket option SO_RCVTIMEO.
  	TCP_KEEPALIVE_THRESHOLD =3D 7200000
  	TCP_KEEPALIVE_ABORT_THRESHOLD =3D 480000
[2020/04/13 13:55:57.655330, 10, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/lib/util_sock.c:410(open_socket_in)
  bind succeeded on port 139
[2020/04/13 13:55:57.655361,  5, pid=3D1530, effective(0, 0), real(0, 0)] =
../../lib/util/util_net.c:1055(print_socket_options)
  Socket options:
  	SO_KEEPALIVE =3D 8
  	SO_REUSEADDR =3D 4
  	SO_BROADCAST =3D 0
  	TCP_NODELAY =3D 0
  	TCP_KEEPCNT =3D 0
  	TCP_KEEPIDLE =3D 7200
  	TCP_KEEPINTVL =3D 0
  	IPTOS_LOWDELAY =3D 0
  	IPTOS_THROUGHPUT =3D 0
  	SO_SNDBUF =3D 49152
  	SO_RCVBUF =3D 128000
  	Could not test socket option SO_SNDLOWAT.
  	Could not test socket option SO_RCVLOWAT.
  	Could not test socket option SO_SNDTIMEO.
  	Could not test socket option SO_RCVTIMEO.
  	TCP_KEEPALIVE_THRESHOLD =3D 7200000
  	TCP_KEEPALIVE_ABORT_THRESHOLD =3D 480000
[2020/04/13 13:55:57.655604,  5, pid=3D1530, effective(0, 0), real(0, 0)] =
../../lib/util/util_net.c:1055(print_socket_options)
  Socket options:
  	SO_KEEPALIVE =3D 8
  	SO_REUSEADDR =3D 4
  	SO_BROADCAST =3D 0
  	TCP_NODELAY =3D 1
  	TCP_KEEPCNT =3D 0
  	TCP_KEEPIDLE =3D 7200
  	TCP_KEEPINTVL =3D 0
  	IPTOS_LOWDELAY =3D 0
  	IPTOS_THROUGHPUT =3D 0
  	SO_SNDBUF =3D 49152
  	SO_RCVBUF =3D 128000
  	Could not test socket option SO_SNDLOWAT.
  	Could not test socket option SO_RCVLOWAT.
  	Could not test socket option SO_SNDTIMEO.
  	Could not test socket option SO_RCVTIMEO.
  	TCP_KEEPALIVE_THRESHOLD =3D 7200000
  	TCP_KEEPALIVE_ABORT_THRESHOLD =3D 480000
[2020/04/13 13:55:57.655872,  5, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/lib/messages.c:725(messaging_register)
  Registering messaging pointer for type 13 - private_data=3D0
[2020/04/13 13:55:57.655909,  5, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/lib/messages.c:725(messaging_register)
  Registering messaging pointer for type 33 - private_data=3D453660
[2020/04/13 13:55:57.655936,  5, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/lib/messages.c:725(messaging_register)
  Registering messaging pointer for type 783 - private_data=3D0
[2020/04/13 13:55:57.655972,  5, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/lib/messages.c:725(messaging_register)
  Registering messaging pointer for type 1 - private_data=3D0
[2020/04/13 13:55:57.655997,  5, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/lib/messages.c:740(messaging_register)
  Overriding messaging pointer for type 1 - private_data=3D0
[2020/04/13 13:55:57.656022,  5, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/lib/messages.c:725(messaging_register)
  Registering messaging pointer for type 770 - private_data=3D0
[2020/04/13 13:55:57.656057,  5, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/lib/messages.c:725(messaging_register)
  Registering messaging pointer for type 801 - private_data=3D0
[2020/04/13 13:55:57.656083,  5, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/lib/messages.c:725(messaging_register)
  Registering messaging pointer for type 790 - private_data=3D0
[2020/04/13 13:55:57.656108,  5, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/lib/messages.c:725(messaging_register)
  Registering messaging pointer for type 791 - private_data=3D0
[2020/04/13 13:55:57.656143,  5, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/lib/messages.c:725(messaging_register)
  Registering messaging pointer for type 15 - private_data=3D0
[2020/04/13 13:55:57.656169,  5, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/lib/messages.c:725(messaging_register)
  Registering messaging pointer for type 16 - private_data=3D0
[2020/04/13 13:55:57.656203,  5, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/lib/messages.c:725(messaging_register)
  Registering messaging pointer for type 799 - private_data=3D0
[2020/04/13 13:55:57.659473, 10, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/smbd/avahi_register.c:119(avahi_client_callback)
  avahi_client_callback: AVAHI_CLIENT_S_RUNNING
[2020/04/13 13:55:57.659497,  5, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/printing/queue_process.c:365(start_background_queue)
  start_background_queue: background LPQ thread started
[2020/04/13 13:55:57.660113, 10, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/smbd/avahi_register.c:92(avahi_entry_group_callback)
  avahi_entry_group_callback: AVAHI_ENTRY_GROUP_UNCOMMITED
[2020/04/13 13:55:57.660471, 10, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/lib/messages_dgm_ref.c:163(msg_dgm_ref_destructor)
  msg_dgm_ref_destructor: refs=3D0
[2020/04/13 13:55:57.661903,  1, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/printing/printer_list.c:234(printer_list_get_last_refresh)
  Failed to fetch record!
[2020/04/13 13:55:57.662000,  2, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/smbd/server.c:1357(smbd_parent_loop)
  waiting for connections
[2020/04/13 13:55:57.662086, 10, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/smbd/avahi_register.c:95(avahi_entry_group_callback)
  avahi_entry_group_callback: AVAHI_ENTRY_GROUP_REGISTERING
[2020/04/13 13:55:57.662335, 10, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/lib/messages_dgm_ref.c:80(messaging_dgm_ref)
  messaging_dgm_ref: messaging_dgm_init returned Error 0
[2020/04/13 13:55:57.662418, 10, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/lib/messages_dgm_ref.c:109(messaging_dgm_ref)
  messaging_dgm_ref: unique =3D 5731959636280158917
[2020/04/13 13:55:57.662464,  2, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/lib/tallocmsg.c:87(register_msg_pool_usage)
  Registered MSG_REQ_POOL_USAGE
[2020/04/13 13:55:57.662478, 10, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/lib/messages.c:428(messaging_recv_cb)
  messaging_recv_cb: Received message 0x31f len 0 (num_fds:0) from 1532
[2020/04/13 13:55:57.662634,  5, pid=3D1534, effective(0, 0), real(0, 0), =
class=3Dpassdb] ../../source3/passdb/pdb_interface.c:155(make_pdb_method_n=
ame)
[2020/04/13 13:55:57.662651, 10, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/lib/messages_dgm.c:1444(messaging_dgm_send)
  messaging_dgm_send: Sending message to 1533
  Attempting to find a passdb backend to match tdbsam (tdbsam)
[2020/04/13 13:55:57.662732,  5, pid=3D1534, effective(0, 0), real(0, 0), =
class=3Dpassdb] ../../source3/passdb/pdb_interface.c:176(make_pdb_method_n=
ame)
  Found pdb backend tdbsam
[2020/04/13 13:55:57.662784,  5, pid=3D1534, effective(0, 0), real(0, 0), =
class=3Dpassdb] ../../source3/passdb/pdb_interface.c:187(make_pdb_method_n=
ame)
  pdb backend tdbsam has a valid init
[2020/04/13 13:55:57.662857,  5, pid=3D1534, effective(0, 0), real(0, 0)] =
../../lib/util/debug.c:808(debug_dump_status)
  INFO: Current debug levels:
    all: 10
    tdb: 10
    printdrivers: 10
    lanman: 10
    smb: 10
[2020/04/13 13:55:57.662958, 10, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/lib/messages_dgm.c:1444(messaging_dgm_send)
    rpc_parse: 10
  messaging_dgm_send: Sending message to 1532
    rpc_srv: 10
    rpc_cli: 10
    passdb: 10
    sam: 10
    auth: 10
    winbind: 10
    vfs: 10
    idmap: 10
    quota: 10
    acls: 10
    locking: 10
    msdfs: 10
    dmapi: 10
    registry: 10
    scavenger: 10
    dns: 10
    ldb: 10
    tevent: 10
    auth_audit: 10
    auth_json_audit: 10
    kerberos: 10
    drs_repl: 10
    smb2: 10
    smb2_credits: 10
    dsdb_audit: 10
    dsdb_json_audit: 10
    dsdb_password_audit: 10
    dsdb_password_json_audit: 10
    dsdb_transaction_audit: 10
    dsdb_transaction_json_audit: 10
    dsdb_group_audit: 10
    dsdb_group_json_audit: 10
[2020/04/13 13:55:57.663562, 10, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/lib/util_event.c:100(event_add_idle)
  event_add_idle: idle_evt(print_queue_housekeeping) 47af90
[2020/04/13 13:55:57.663616,  5, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/lib/messages.c:725(messaging_register)
  Registering messaging pointer for type 33 - private_data=3D462940
[2020/04/13 13:55:57.663649,  5, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/lib/messages.c:725(messaging_register)
  Registering messaging pointer for type 517 - private_data=3D0
[2020/04/13 13:55:57.663675,  5, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/lib/messages.c:772(messaging_deregister)
  Deregistering messaging pointer for type 515 - private_data=3D0
[2020/04/13 13:55:57.663709,  5, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/lib/messages.c:725(messaging_register)
  Registering messaging pointer for type 515 - private_data=3D0
[2020/04/13 13:55:57.663763,  3, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/printing/pcap.c:140(pcap_cache_reload)
  reloading printcap cache
[2020/04/13 13:55:57.663826,  5, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/printing/print_cups.c:469(cups_pcap_load_async)
  cups_pcap_load_async: asynchronously loading cups printers
[2020/04/13 13:55:57.664748, 10, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/printing/print_cups.c:486(cups_pcap_load_async)
  cups_pcap_load_async: child pid =3D 1535
[2020/04/13 13:55:57.664846, 10, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/printing/print_cups.c:607(cups_cache_reload)
  cups_cache_reload: async read on fd 15
[2020/04/13 13:55:57.664900,  3, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/printing/pcap.c:194(pcap_cache_reload)
  reload status: ok
[2020/04/13 13:55:57.664976,  5, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/printing/queue_process.c:419(start_background_queue)
  start_background_queue: background LPQ thread waiting for messages
[2020/04/13 13:55:57.665264, 10, pid=3D1535, effective(0, 0), real(0, 0)] =
../../source3/lib/messages_dgm_ref.c:163(msg_dgm_ref_destructor)
  msg_dgm_ref_destructor: refs=3D0
[2020/04/13 13:55:57.667537, 10, pid=3D1535, effective(0, 0), real(0, 0)] =
../../source3/lib/messages_dgm_ref.c:80(messaging_dgm_ref)
  messaging_dgm_ref: messaging_dgm_init returned Error 0
[2020/04/13 13:55:57.667620, 10, pid=3D1535, effective(0, 0), real(0, 0)] =
../../source3/lib/messages_dgm_ref.c:109(messaging_dgm_ref)
  messaging_dgm_ref: unique =3D 10166344817437468387
[2020/04/13 13:55:57.667664,  2, pid=3D1535, effective(0, 0), real(0, 0)] =
../../source3/lib/tallocmsg.c:87(register_msg_pool_usage)
  Registered MSG_REQ_POOL_USAGE
[2020/04/13 13:55:57.667720,  5, pid=3D1535, effective(0, 0), real(0, 0)] =
../../source3/printing/print_cups.c:338(cups_cache_reload_async)
  reloading cups printcap cache
[2020/04/13 13:55:57.670206, 10, pid=3D1535, effective(0, 0), real(0, 0)] =
../../source3/printing/print_cups.c:139(cups_connect)
  connecting to cups server localhost:631
[2020/04/13 13:55:57.671158,  3, pid=3D1535, effective(0, 0), real(0, 0)] =
../../source3/printing/print_cups.c:171(cups_connect)
  Unable to connect to CUPS server localhost:631 - Error 0
[2020/04/13 13:55:57.671363, 10, pid=3D1535, effective(0, 0), real(0, 0)] =
../../source3/printing/print_cups.c:191(send_pcap_blob)
  successfully sent blob of len 12
[2020/04/13 13:55:57.671397,  5, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/printing/print_cups.c:533(cups_async_callback)
  cups_async_callback: callback received for printer data. fd =3D 15
[2020/04/13 13:55:57.671413, 10, pid=3D1535, effective(0, 0), real(0, 0)] =
../../source3/lib/messages_dgm_ref.c:163(msg_dgm_ref_destructor)
  msg_dgm_ref_destructor: refs=3D0
[2020/04/13 13:55:57.671524, 10, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/printing/print_cups.c:216(recv_pcap_blob)
  successfully recvd blob of len 12
[2020/04/13 13:55:57.671685,  3, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/printing/print_cups.c:549(cups_async_callback)
  failed to retrieve printer list: NT_STATUS_UNSUCCESSFUL
[2020/04/13 13:55:57.673877,  6, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/printing/queue_process.c:266(bq_sig_chld_handler)
  Bq child process 1535 terminated with 0
[2020/04/13 13:55:57.899519, 10, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/smbd/avahi_register.c:80(avahi_entry_group_callback)
  avahi_entry_group_callback: AVAHI_ENTRY_GROUP_ESTABLISHED
[2020/04/13 13:56:08.997643,  4, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/smbd/sec_ctx.c:320(set_sec_ctx_internal)
  setting sec ctx (0, 0) - sec_ctx_stack_ndx =3D 0
[2020/04/13 13:56:08.997726,  5, pid=3D1530, effective(0, 0), real(0, 0)] =
../../libcli/security/security_token.c:52(security_token_debug)
  Security token: (NULL)
[2020/04/13 13:56:08.997786,  5, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/auth/token_util.c:874(debug_unix_user_token)
  UNIX token of user 0
  Primary group is 0 and contains 0 supplementary groups
[2020/04/13 13:56:08.997807,  4, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/smbd/sec_ctx.c:320(set_sec_ctx_internal)
[2020/04/13 13:56:08.997850,  5, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/smbd/uid.c:498(smbd_change_to_root_user)
  setting sec ctx (0, 0) - sec_ctx_stack_ndx =3D 0
  change_to_root_user: now uid=3D(0,0) gid=3D(0,0)
[2020/04/13 13:56:08.997925,  4, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/smbd/sec_ctx.c:320(set_sec_ctx_internal)
  setting sec ctx (0, 0) - sec_ctx_stack_ndx =3D 0
[2020/04/13 13:56:08.997929,  5, pid=3D1534, effective(0, 0), real(0, 0)] =
../../libcli/security/security_token.c:52(security_token_debug)
[2020/04/13 13:56:08.997955,  5, pid=3D1530, effective(0, 0), real(0, 0)] =
../../libcli/security/security_token.c:52(security_token_debug)
  Security token: (NULL)
  Security token: (NULL)
[2020/04/13 13:56:08.998031,  5, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/auth/token_util.c:874(debug_unix_user_token)
  UNIX token of user 0
[2020/04/13 13:56:08.998041,  5, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/auth/token_util.c:874(debug_unix_user_token)
  Primary group is 0 and contains 0 supplementary groups
  UNIX token of user 0
[2020/04/13 13:56:08.998097,  5, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/smbd/uid.c:498(smbd_change_to_root_user)
  Primary group is 0 and contains 0 supplementary groups
  change_to_root_user: now uid=3D(0,0) gid=3D(0,0)
[2020/04/13 13:56:08.998150,  4, pid=3D1530, effective(0, 0), real(0, 0)] =
../../source3/smbd/sec_ctx.c:320(set_sec_ctx_internal)
  setting sec ctx (0, 0) - sec_ctx_stack_ndx =3D 0
[2020/04/13 13:56:08.998178,  5, pid=3D1530, effective(0, 0), real(0, 0)] =
../../libcli/security/security_token.c:52(security_token_debug)
[2020/04/13 13:56:08.998171,  5, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/smbd/uid.c:498(smbd_change_to_root_user)
  change_to_root_user: now uid=3D(0,0) gid=3D(0,0)
[2020/04/13 13:56:08.998281,  4, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/smbd/sec_ctx.c:320(set_sec_ctx_internal)
  setting sec ctx (0, 0) - sec_ctx_stack_ndx =3D 0
[2020/04/13 13:56:08.998311,  5, pid=3D1534, effective(0, 0), real(0, 0)] =
../../libcli/security/security_token.c:52(security_token_debug)
  Security token: (NULL)
[2020/04/13 13:56:08.998343,  5, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/auth/token_util.c:874(debug_unix_user_token)
  UNIX token of user 0
  Primary group is 0 and contains 0 supplementary groups
[2020/04/13 13:56:08.998447,  5, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/smbd/uid.c:498(smbd_change_to_root_user)
  change_to_root_user: now uid=3D(0,0) gid=3D(0,0)
[2020/04/13 13:56:08.998483,  4, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/smbd/sec_ctx.c:320(set_sec_ctx_internal)
  setting sec ctx (0, 0) - sec_ctx_stack_ndx =3D 0
[2020/04/13 13:56:08.998535,  5, pid=3D1534, effective(0, 0), real(0, 0)] =
../../libcli/security/security_token.c:52(security_token_debug)
  Security token: (NULL)
[2020/04/13 13:56:08.998573,  5, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/auth/token_util.c:874(debug_unix_user_token)
  UNIX token of user 0
  Primary group is 0 and contains 0 supplementary groups
[2020/04/13 13:56:08.998624,  5, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/smbd/uid.c:498(smbd_change_to_root_user)
  change_to_root_user: now uid=3D(0,0) gid=3D(0,0)
[2020/04/13 13:56:08.998677,  4, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/smbd/sec_ctx.c:320(set_sec_ctx_internal)
  setting sec ctx (0, 0) - sec_ctx_stack_ndx =3D 0
[2020/04/13 13:56:08.998714,  5, pid=3D1534, effective(0, 0), real(0, 0)] =
../../libcli/security/security_token.c:52(security_token_debug)
  Security token: (NULL)
[2020/04/13 13:56:08.998745,  5, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/auth/token_util.c:874(debug_unix_user_token)
  UNIX token of user 0
  Primary group is 0 and contains 0 supplementary groups
[2020/04/13 13:56:08.998811,  5, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/smbd/uid.c:498(smbd_change_to_root_user)
  change_to_root_user: now uid=3D(0,0) gid=3D(0,0)
[2020/04/13 13:56:08.998852,  4, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/smbd/sec_ctx.c:320(set_sec_ctx_internal)
  setting sec ctx (0, 0) - sec_ctx_stack_ndx =3D 0
[2020/04/13 13:56:08.998886,  5, pid=3D1534, effective(0, 0), real(0, 0)] =
../../libcli/security/security_token.c:52(security_token_debug)
  Security token: (NULL)
[2020/04/13 13:56:08.998937,  5, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/auth/token_util.c:874(debug_unix_user_token)
  UNIX token of user 0
  Primary group is 0 and contains 0 supplementary groups
[2020/04/13 13:56:08.998982,  5, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/smbd/uid.c:498(smbd_change_to_root_user)
  change_to_root_user: now uid=3D(0,0) gid=3D(0,0)
[2020/04/13 13:56:09.000275, 10, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/lib/messages_dgm_ref.c:163(msg_dgm_ref_destructor)
  msg_dgm_ref_destructor: refs=3D0
[2020/04/13 13:56:09.000749,  3, pid=3D1534, effective(0, 0), real(0, 0)] =
../../source3/smbd/server_exit.c:250(exit_server_common)
  Server exit (termination signal)

--Apple-Mail=_462412B9-9945-4A4B-99C8-0DCC6A1BCAC2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



As a proof, there the globals section:
#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
Global Settings =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[global]

    workgroup =3D mano-de.dios
    netbios name =3D wutz
    mdns name =3D mdns
    multicast dns register =3D yes
    server string =3D Filet Server (%v)
    server role =3D standalone server
    log file =3D /var/log/samba/smbd.log
    max log size =3D 50
    wins support =3D yes
    dns proxy =3D no
    guest account =3D nobody
    fruit:aapl =3D yes
    fruit:model =3D RackMac
    log level =3D 10

#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D Share Definitions =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

dmesg error:
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]   PANIC: =
assert failed at ../../lib/dbwrap/dbwrap.c(82): rec->value_valid
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error] [2020/04/13 =
13:55:57.164502,  0, pid=3D1517, effective(500, 500), real(0, 0)] =
../../source3/lib/util.c:830(smb_panic_s3)
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]   PANIC (pid =
1517): assert failed: rec->value_valid
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error] [2020/04/13 =
13:55:57.165311,  0, pid=3D1517, effective(500, 500), real(0, 0)] =
../../lib/util/fault.c:265(log_stack_trace)
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]   BACKTRACE: =
37 stack frames:
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #0 =
/usr/lib/samba/amd64/libsamba-util.so.0.0.1'log_stack_trace+0x26 =
[0xfffffd7fee51de66]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #1 =
/usr/lib/samba/amd64/libsmbconf.so.0'smb_panic_s3+0x26 =
[0xfffffd7fedf5a596]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #2 =
/usr/lib/samba/amd64/libsamba-util.so.0.0.1'smb_panic+0x1f =
[0xfffffd7fee51df3f]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #3 =
/usr/lib/samba/private/amd64/libdbwrap-samba4.so'dbwrap_record_get_value+0=
x2a [0xfffffd7fecf4627a]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #4 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'get_share_mode_lock+0x=
109 [0xfffffd7fee7195c9]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #5 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'smbd_contend_level2_op=
locks_begin+0xa1 [0xfffffd7fee7f7761]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #6 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'brl_lock+0x635 =
[0xfffffd7fee710f45]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #7 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'do_lock_fn+0xa4 =
[0xfffffd7fee70d534]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #8 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'share_mode_do_locked_f=
n+0x86 [0xfffffd7fee7174b6]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #9 =
/usr/lib/samba/amd64/libsmbconf.so.0'dbwrap_watched_do_locked_fn+0xfa =
[0xfffffd7fedf622ca]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #10 =
/usr/lib/samba/private/amd64/libdbwrap-samba4.so'db_tdb_do_locked+0x12f =
[0xfffffd7fecf495cf]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #11 =
/usr/lib/samba/private/amd64/libdbwrap-samba4.so'dbwrap_do_locked+0x48 =
[0xfffffd7fecf469a8]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #12 =
/usr/lib/samba/amd64/libsmbconf.so.0'dbwrap_watched_do_locked+0x6f =
[0xfffffd7fedf60d7f]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #13 =
/usr/lib/samba/private/amd64/libdbwrap-samba4.so'dbwrap_do_locked+0x48 =
[0xfffffd7fecf469a8]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #14 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'share_mode_do_locked+0=
xd2 [0xfffffd7fee719b82]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #15 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'do_lock+0xf0 =
[0xfffffd7fee70dfe0]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #16 =
/usr/lib/samba/amd64/vfs/fruit.so'fruit_create_file+0x7ba =
[0xfffffd7fe88c55aa]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #17 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'smbd_smb2_request_proc=
ess_create+0xa07 [0xfffffd7fee7d3237]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #18 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'smbd_smb2_request_disp=
atch+0xc8f [0xfffffd7fee7c985f]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #19 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'smbd_smb2_connection_h=
andler+0x621 [0xfffffd7fee7ca7e1]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #20 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_invoke_fd_h=
andler+0x80 [0xfffffd7fecfca580]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #21 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'epoll_event_loop_once+0x2=
2c [0xfffffd7fecfd180c]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #22 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_once+0x40 =
[0xfffffd7fecfcf8f0]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #23 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'_tevent_loop_once+0x95 =
[0xfffffd7fecfc9bd5]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #24 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_loop_wait+0=
x23 [0xfffffd7fecfc9e43]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #25 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_wait+0x40 =
[0xfffffd7fecfcf870]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #26 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'smbd_process+0x777 =
[0xfffffd7fee7b8677]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #27 =
/usr/lib/samba/sbin/amd64/smbd'smbd_accept_connection+0x189 [0x40d5b9]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #28 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_invoke_fd_h=
andler+0x80 [0xfffffd7fecfca580]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #29 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'epoll_event_loop_once+0x2=
2c [0xfffffd7fecfd180c]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #30 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_once+0x40 =
[0xfffffd7fecfcf8f0]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #31 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'_tevent_loop_once+0x95 =
[0xfffffd7fecfc9bd5]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #32 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_loop_wait+0=
x23 [0xfffffd7fecfc9e43]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #33 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_wait+0x40 =
[0xfffffd7fecfcf870]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #34 =
/usr/lib/samba/sbin/amd64/smbd'main+0x1a0f [0x40f9ff]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #35 =
/usr/lib/samba/sbin/amd64/smbd'_start_crt+0x83 [0x408e73]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #36 =
/usr/lib/samba/sbin/amd64/smbd'_start+0x18 [0x408dd8]
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error] [2020/04/13 =
13:55:57.167481,  0, pid=3D1517, effective(0, 0), real(0, 0)] =
../../source3/lib/dumpcore.c:315(dump_core)
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]   dumping core =
in /var/samba/log/cores/smbd
Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]=20
Apr 13 13:55:57 wutz smbd[1530]: [ID 702911 daemon.error] [2020/04/13 =
13:55:57.650723,  0, pid=3D1530, effective(0, 0), real(0, 0)] =
../../lib/util/become_daemon.c:136(daemon_ready)



> Am 13.04.2020 um 13:31 schrieb Anoop C S via samba-technical =
<samba-technical@lists.samba.org>:
>=20
> On Sun, 2020-04-12 at 11:24 +0200, Rouven WEILER via samba-technical
> wrote:
>> In a previous email I mentioned that I got issue with samba 4.12.1 on
>> Illumos/OpenIndiana and MacOS 10.15.4.
>> I digged a little bit more and found out that the PANIC is caused
>> when trying to do a time machine backup.
>>=20
>> Plain samba works a as always. There seems to be only issues with
>> time machine backup.
>>=20
>> Everything worked before samba-4.12.0 and MacOS 10.15.4. I cannot
>> tell which change cause the issues...
>>=20
>> Staring from a new time capsule share I got the following:
>> Creating a new time machine backup shows, I get a
>> =E2=80=9E.com.apple.timemachine.supported=E2=80=9C file added in to =
the share.
>>=20
>> MacOS tells in it=E2=80=99s logs: =E2=80=9EFailed to read =
capabilities for
>> 'file:///Volumes/FileVault/', error: Socket is not connected=E2=80=9C.
>>=20
>> The smbd.log with loglevel vfs:10 shows:
>=20
> Is it possible for you to reproduce with log level 10 set in general
> rather than just vfs? It might gives us more context around the
> assertion failure leading to smbd panic.
>=20
>> [2020/04/12 11:15:21.534742,  5, pid=3D1707, effective(500, 500),
>> real(0, 0), class=3Dvfs]
>> ../../source3/smbd/vfs.c:1395(check_reduced_name)
>>  check_reduced_name: .com.apple.timemachine.supported reduced to
>> /export/home/timecapsule/.com.apple.timemachine.supported
>> [2020/04/12 11:15:21.534789, 10, pid=3D1707, effective(500, 500),
>> real(0, 0), class=3Dvfs]
>> ../../source3/modules/vfs_streams_xattr.c:379(streams_xattr_open)
>>  streams_xattr_open called for .com.apple.timemachine.supported with
>> flags 0x20080
>> [2020/04/12 11:15:21.535160,  0]
>> ../../lib/dbwrap/dbwrap.c:82(dbwrap_record_get_value)
>>  PANIC: assert failed at ../../lib/dbwrap/dbwrap.c(82): rec-
>>> value_valid
>=20
> Similar assertion failures were fixed sometime back and I could see
> those present in v4-12-stable branch. May be we missed some other
> place..
>=20
>> [2020/04/12 11:15:21.535322,  0]
>> ../../source3/lib/util.c:830(smb_panic_s3)
>>  PANIC (pid 1707): assert failed: rec->value_valid
>> [2020/04/12 11:15:21.536138,  0]
>> ../../lib/util/fault.c:265(log_stack_trace)
>>  BACKTRACE: 37 stack frames:
>>   #0 /usr/lib/samba/amd64/libsamba-
>> util.so.0.0.1'log_stack_trace+0x26 [0xfffffd7fee51de66]
>>   #1 /usr/lib/samba/amd64/libsmbconf.so.0'smb_panic_s3+0x26
>> [0xfffffd7fedf5a596]
>>   #2 /usr/lib/samba/amd64/libsamba-util.so.0.0.1'smb_panic+0x1f
>> [0xfffffd7fee51df3f]
>>   #3 /usr/lib/samba/private/amd64/libdbwrap-
>> samba4.so'dbwrap_record_get_value+0x2a [0xfffffd7fece2627a]
>>   #4 /usr/lib/samba/private/amd64/libsmbd-base-
>> samba4.so'get_share_mode_lock+0x109 [0xfffffd7fee7195c9]
>>   #5 /usr/lib/samba/private/amd64/libsmbd-base-
>> samba4.so'smbd_contend_level2_oplocks_begin+0xa1 [0xfffffd7fee7f7761]
>>   #6 /usr/lib/samba/private/amd64/libsmbd-base-
>> samba4.so'brl_lock+0x635 [0xfffffd7fee710f45]
>>   #7 /usr/lib/samba/private/amd64/libsmbd-base-
>> samba4.so'do_lock_fn+0xa4 [0xfffffd7fee70d534]
>>   #8 /usr/lib/samba/private/amd64/libsmbd-base-
>> samba4.so'share_mode_do_locked_fn+0x86 [0xfffffd7fee7174b6]
>>   #9
>> /usr/lib/samba/amd64/libsmbconf.so.0'dbwrap_watched_do_locked_fn+0xfa
>> [0xfffffd7fedf622ca]
>>   #10 /usr/lib/samba/private/amd64/libdbwrap-
>> samba4.so'db_tdb_do_locked+0x12f [0xfffffd7fece295cf]
>>   #11 /usr/lib/samba/private/amd64/libdbwrap-
>> samba4.so'dbwrap_do_locked+0x48 [0xfffffd7fece269a8]
>>   #12
>> /usr/lib/samba/amd64/libsmbconf.so.0'dbwrap_watched_do_locked+0x6f
>> [0xfffffd7fedf60d7f]
>>   #13 /usr/lib/samba/private/amd64/libdbwrap-
>> samba4.so'dbwrap_do_locked+0x48 [0xfffffd7fece269a8]
>>   #14 /usr/lib/samba/private/amd64/libsmbd-base-
>> samba4.so'share_mode_do_locked+0xd2 [0xfffffd7fee719b82]
>>   #15 /usr/lib/samba/private/amd64/libsmbd-base-
>> samba4.so'do_lock+0xf0 [0xfffffd7fee70dfe0]
>>   #16 /usr/lib/samba/amd64/vfs/fruit.so'fruit_create_file+0x7ba
>> [0xfffffd7fe88a55aa]
>>   #17 /usr/lib/samba/private/amd64/libsmbd-base-
>> samba4.so'smbd_smb2_request_process_create+0xa07 [0xfffffd7fee7d3237]
>>   #18 /usr/lib/samba/private/amd64/libsmbd-base-
>> samba4.so'smbd_smb2_request_dispatch+0xc8f [0xfffffd7fee7c985f]
>>   #19 /usr/lib/samba/private/amd64/libsmbd-base-
>> samba4.so'smbd_smb2_connection_handler+0x621 [0xfffffd7fee7ca7e1]
>>   #20
>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_invoke
>> _fd_handler+0x80 [0xfffffd7fecfca580]
>>   #21
>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'epoll_event_loop_onc
>> e+0x22c [0xfffffd7fecfd180c]
>>   #22
>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_once+
>> 0x40 [0xfffffd7fecfcf8f0]
>>   #23
>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'_tevent_loop_once+0x
>> 95 [0xfffffd7fecfc9bd5]
>>   #24
>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_loop_w
>> ait+0x23 [0xfffffd7fecfc9e43]
>>   #25
>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_wait+
>> 0x40 [0xfffffd7fecfcf870]
>>   #26 /usr/lib/samba/private/amd64/libsmbd-base-
>> samba4.so'smbd_process+0x777 [0xfffffd7fee7b8677]
>>   #27 /usr/lib/samba/sbin/amd64/smbd'smbd_accept_connection+0x189
>> [0x40d5b9]
>>   #28
>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_invoke
>> _fd_handler+0x80 [0xfffffd7fecfca580]
>>   #29
>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'epoll_event_loop_onc
>> e+0x22c [0xfffffd7fecfd180c]
>>   #30
>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_once+
>> 0x40 [0xfffffd7fecfcf8f0]
>>   #31
>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'_tevent_loop_once+0x
>> 95 [0xfffffd7fecfc9bd5]
>>   #32
>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_loop_w
>> ait+0x23 [0xfffffd7fecfc9e43]
>>   #33
>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_wait+
>> 0x40 [0xfffffd7fecfcf870]
>>   #34 /usr/lib/samba/sbin/amd64/smbd'main+0x1a0f [0x40f9ff]
>>   #35 /usr/lib/samba/sbin/amd64/smbd'_start_crt+0x83 [0x408e73]
>>   #36 /usr/lib/samba/sbin/amd64/smbd'_start+0x18 [0x408dd8]
>> [2020/04/12 11:15:21.538230,  0]
>> ../../source3/lib/dumpcore.c:315(dump_core)
>>  dumping core in /var/samba/log/cores/smbd
>> [2020/04/12 11:15:21.949051,  0]
>> ../../lib/util/become_daemon.c:136(daemon_ready)
>>  daemon_ready: daemon 'smbd' finished starting up and ready to serve
>> connections
>>=20
>>=20
>> My smb.conf is:
>> #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
Global Settings
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [global]
>>=20
>>    workgroup =3D mano-de.dios
>>    netbios name =3D wutz
>>    mdns name =3D mdns
>>    multicast dns register =3D yes
>>    server string =3D Filet Server (%v)
>>    server role =3D standalone server
>>    log file =3D /var/log/samba/smbd.log
>>    max log size =3D 50
>>    wins support =3D yes
>>    dns proxy =3D no
>>    guest account =3D nobody
>>    fruit:aapl =3D yes
>>    fruit:model =3D RackMac
>>    log level =3D vfs:10
>>=20
>> #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D Share Definitions
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>> [homes]
>>    comment =3D Home Share=20
>>    browseable =3D no
>>    writable =3D yes
>>    guest ok =3D no
>>    vfs objects =3D catia fruit zfsacl streams_xattr=20
>>    fruit:resource =3D xattr
>>    fruit:metadata =3D netatalk
>>    fruit:locking =3D netatalk
>>    fruit:encoding =3D native
>>=20
>> [FileVault]
>>    comment =3D Apple Time Capsule
>>    path =3D /export/home/timecapsule
>>    browseable =3D no
>>    writeable =3D no
>>    valid users =3D @admin
>>    write list =3D @admin
>>    guest ok =3D no
>>    vfs objects =3D catia fruit zfsacl streams_xattr=20
>>    fruit:resource =3D xattr
>>    fruit:metadata =3D netatalk
>>    fruit:locking =3D netatalk
>>    fruit:encoding =3D native
>>    fruit:time machine =3D yes
>=20
>=20


--Apple-Mail=_462412B9-9945-4A4B-99C8-0DCC6A1BCAC2--

