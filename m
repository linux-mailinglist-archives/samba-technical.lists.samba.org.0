Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A48108F83
	for <lists+samba-technical@lfdr.de>; Mon, 25 Nov 2019 15:03:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=Z+X0fiqyx7sqZcKM2nMtSFc7BHtTDfV45DP4cerOKUc=; b=AxUzY6i3Vc+P5HUzmcd94LkTDk
	FV4fAblkzZPJoxfcYJiwwn9n00rhf04xj09eoI8jlls5EeBhdsCL3kEiONthIqb0E/rkFH/1VZUs6
	ukAy51BGnfJrRODkdRwfJrGaANkynKOA8I9TFaafDNUfuuFGkA8iKlrKNKtwUfTy/4KOWr8xku65K
	JKfAp3QrmFhIwKshWbqF27Wl3GMViR3GrXtgWtHlYzRGTzAkGQj4QxR0tg54amop4FBIXDrMjiD2Z
	os+zQMsPBvrSQtl6F5PiKp/UJ46HwyWhqA7Eh6nbqlN6KmxYYk6et47+jFLOGKflszgqt9CP4Ek/r
	N0HD0zeg==;
Received: from localhost ([::1]:62846 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iZEx3-002LnA-GI; Mon, 25 Nov 2019 14:02:53 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:42502) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iZEwy-002Ln1-2T; Mon, 25 Nov 2019 14:02:50 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1575295362.20854@zFJSwU/f6WyswTKDtcms/g
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: A12EB121B1F.AB3C1
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id A12EB121B1F;
 Mon, 25 Nov 2019 15:02:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1574690560;
 bh=lBH/QLhKB9Gj6faWW+eTqqv4tpzLO+SwgDwBMNIJ4K8=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=Nogi5ZFh8twDXB1yRK2sBjh3uhWRz54NWZRCoOnmAb2q8hep9FgcEKvlAPRlbYz8I
 hg4QBeI/UnN1Bk4EwHpicvCXr7pU+JD/p1XlGSlJuBczV1Iz3gNS4Am/XtjUFhcJ1p
 G+sIFufLLBxMr54zJN4Qt+GMZS8UCh8XFmQw5RI1GUngqlyzGAnxN41mAbubM3AmRc
 C8oayKhmbtO0mJC5h/Ik3NwE4NfH2MmixxBw5Lmzrd04ok/94ueC/6TAyQjgvTUMCx
 uLugW4r5ISSJFOVAp/LCp6Key/VLQQev27gg6VSP39nYcK5oMFhTnC50M5Lb7B0RPl
 ltZDqjH37m4tg==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id EAABB3AF8C;
 Mon, 25 Nov 2019 15:02:37 +0100 (CET)
Subject: RE: [Samba] Samba4 - Printer Drivers install fails
To: =?windows-1252?Q?samba-technical=40lists.samba.org?=
 <samba-technical@lists.samba.org>
Date: Mon, 25 Nov 2019 15:02:37 +0100
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e82d27b1-ec6f-2249-7e1b-10c88ad7b64c@samba.org>
References: <vmime.5ddba6f9.28bf.50f5facf45252c09@ms249-lin-003.rotterdam.bazuin.nl>
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: AdWjmP48+z+MkBQ7TVSDVKGVYRbwbg==
Message-Id: <vmime.5ddbdefd.313f.72286aeb3b836a4d@ms249-lin-003.rotterdam.bazuin.nl>
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
From: "L.P.H. van Belle via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "=?windows-1252?Q?L.P.H._van_Belle?=" <belle@bazuin.nl>
Cc: "=?windows-1252?Q?samba=40lists.samba.org?=" <samba@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hai Rowland,=20

Hmm, hard one to see. Ive added a debuglevel 6 below.=20
This messages where only shown in : daemon.log and log.spoolssd and only there.=20

I see files being copied in windows, but if i tail the folder on the debian server, the drivers dont end up in the x64/3 folder.

I can do a D10, but for that i have to wait after 17:00..
But to me this looks fine.  This driver was used :=20
https://www.support.xerox.com/support/versalink-c405/file-download/enus.html=3FoperatingSystem=3Dwin10x64&fileLanguage=3Den&contentId=3D144414&from=3Ddownloads&viewArchived=3Dfalse
And this keyword : Install_NBOMX_XL_NoRedist=20
Can be found in the .inf=20

And only here :=20
;=20
; Model sections.=20
;=20
; Each section here corresponds with an entry listed in the
; [Manufacturer] section, above. The models will be displayed in the order
; that they appear in the INF file.
;

[Models.NTamd64]

"Xerox VersaLink C400 PCL6"     =3D Install_NBOMX_XL_NoRedist,WSDPRINT\XeroxVersaLink_C4004304,USBPRINT\XeroxVersaLink_C4004304,XeroxVersaLink_C4004304

"Xerox VersaLink C405 PCL6"     =3D Install_NBOMX_XL_NoRedist,WSDPRINT\XeroxVersaLink_C40540C4,USBPRINT\XeroxVersaLink_C40540C4,XeroxVersaLink_C40540C4

[Models.NTamd64.6.0]

"Xerox VersaLink C400 PCL6"     =3D Install_NBOMX_XL_NT60,WSDPRINT\XeroxVersaLink_C4004304,USBPRINT\XeroxVersaLink_C4004304,XeroxVersaLink_C4004304

"Xerox VersaLink C405 PCL6"     =3D Install_NBOMX_XL_NT60,WSDPRINT\XeroxVersaLink_C40540C4,USBPRINT\XeroxVersaLink_C40540C4,XeroxVersaLink_C40540C4

;
; Install Sections
;

[Install_NBOMX_XL_NoRedist]

PrintProcessor=3D"XeroxV5Print,x5print.dll"

CopyFiles=3DCOPY_DATA_FILES,V5PRINTPROC_PKG_FILES,LANFAX_PKG_FILES,COPY_NON_PKG_OEM_FILES,V5LRS_PKG_FILES

DataFile=3DxNBOMX3X.gpd
DataSection=3DUNIDRV_DATA

Include=3DNTPRINT.INF
Needs=3DUNIDRV.OEM, UNIDRV_DATA, TTFSUB.OEM, LOCALE.OEM, PCLXL.OEM

[Install_NBOMX_XL_NT60]

....=20



A snap from the logs, debug level 6. =20

[2019/11/25 13:38:29.461570,  5] ../../lib/dbwrap/dbwrap.c:130(dbwrap_lock_order_lock)
  dbwrap_lock_order_lock: check lock order 1 for /run/samba/locking.tdb
[2019/11/25 13:38:29.461591,  5] ../../lib/dbwrap/dbwrap.c:130(dbwrap_lock_order_lock)
  dbwrap_lock_order_lock: check lock order 2 for /run/samba/leases.tdb
[2019/11/25 13:38:29.461611,  5] ../../lib/dbwrap/dbwrap.c:159(dbwrap_lock_order_unlock)
  dbwrap_lock_order_unlock: release lock order 2 for /run/samba/leases.tdb
[2019/11/25 13:38:29.461622,  5] ../../source3/smbd/close.c:375(close_remove_share_mode)
  close_remove_share_mode: file x64/{5212AF71-836E-4D03-B3B9-A649E40F50FF}/x3rpcl3X.dll. Delete on close was set - deleting file.
[2019/11/25 13:38:29.461942,  5] ../../lib/dbwrap/dbwrap.c:159(dbwrap_lock_order_unlock)
  dbwrap_lock_order_unlock: release lock order 1 for /run/samba/locking.tdb
[2019/11/25 13:38:29.461998,  2] ../../source3/smbd/close.c:813(close_normal_file)
  root closed file x64/{5212AF71-836E-4D03-B3B9-A649E40F50FF}/x3rpcl3X.dll (numopen=3D1) NT_STATUS_OK
[2019/11/25 13:38:29.462020,  5] ../../lib/dbwrap/dbwrap.c:130(dbwrap_lock_order_lock)
  dbwrap_lock_order_lock: check lock order 1 for /run/samba/smbXsrv_open_global.tdb
[2019/11/25 13:38:29.462042,  5] ../../lib/dbwrap/dbwrap.c:159(dbwrap_lock_order_unlock)
  dbwrap_lock_order_unlock: release lock order 1 for /run/samba/smbXsrv_open_global.tdb
[2019/11/25 13:38:29.462057,  5] ../../source3/smbd/files.c:556(file_free)
  freed files structure 3248837063 (3 used)
[2019/11/25 13:38:29.463720,  5] ../../source3/smbd/uid.c:326(change_to_user_impersonate)
  change_to_user_impersonate: Skipping user change - already user
[2019/11/25 13:38:29.463750,  5] ../../source3/smbd/uid.c:300(print_impersonation_info)
  print_impersonation_info: Impersonated user: uid=3D(0,0), gid=3D(0,0), cwd=3D[/home/samba/printing/drivers]
[2019/11/25 13:38:29.463773,  5] ../../source3/smbd/filename.c:481(unix_convert)
  unix_convert called on file "x64/{5212AF71-836E-4D03-B3B9-A649E40F50FF}/x5lrs.dll"
[2019/11/25 13:38:29.463789,  5] ../../source3/smbd/filename.c:682(unix_convert)
  unix_convert begin: name =3D x64/{5212AF71-836E-4D03-B3B9-A649E40F50FF}/x5lrs.dll, dirpath =3D x64, start =3D {5212AF71-836E-4D03-B3B9-A649E40F50FF}/x5lrs.dll
[2019/11/25 13:38:29.463804,  5] ../../source3/smbd/filename.c:705(unix_convert)
  conversion of base_name finished x64/{5212AF71-836E-4D03-B3B9-A649E40F50FF}/x5lrs.dll -> x64/{5212AF71-836E-4D03-B3B9-A649E40F50FF}/x5lrs.dll
[2019/11/25 13:38:29.463824,  5] ../../source3/smbd/vfs.c:1368(check_reduced_name)
  check_reduced_name: x64/{5212AF71-836E-4D03-B3B9-A649E40F50FF}/x5lrs.dll reduced to /home/samba/printing/drivers/x64/{5212AF71-836E-4D03-B3B9-A649E40F50FF}/x5lrs.dll
[2019/11/25 13:38:29.463849,  5] ../../lib/dbwrap/dbwrap.c:130(dbwrap_lock_order_lock)
  dbwrap_lock_order_lock: check lock order 1 for /run/samba/smbXsrv_open_global.tdb
[2019/11/25 13:38:29.463878,  5] ../../lib/dbwrap/dbwrap.c:159(dbwrap_lock_order_unlock)
  dbwrap_lock_order_unlock: release lock order 1 for /run/samba/smbXsrv_open_global.tdb
[2019/11/25 13:38:29.463891,  5] ../../source3/smbd/files.c:137(file_new)
  allocated file structure fnum 142458987 (4 used)
[2019/11/25 13:38:29.463905,  5] ../../source3/smbd/dosmode.c:208(unix_mode)
  unix_mode: unix_mode(x64/{5212AF71-836E-4D03-B3B9-A649E40F50FF}/x5lrs.dll) returning 0744
[2019/11/25 13:38:29.463928,  5] ../../source3/smbd/dosmode.c:72(dos_mode_debug_print)
  dos_mode_debug_print: parse_dos_attribute_blob returning (0x20): "a"
[2019/11/25 13:38:29.463948,  4] ../../source3/smbd/open.c:3286(open_file_ntcreate)
  calling open_file with flags=3D0x0 flags2=3D0x0 mode=3D0744, access_mask =3D 0x10080, open_access_mask =3D 0x10080
[2019/11/25 13:38:29.463960,  2] ../../source3/smbd/open.c:1456(open_file)
  root opened file x64/{5212AF71-836E-4D03-B3B9-A649E40F50FF}/x5lrs.dll read=3DNo write=3DNo (numopen=3D2)
[2019/11/25 13:38:29.463972,  5] ../../lib/dbwrap/dbwrap.c:130(dbwrap_lock_order_lock)
  dbwrap_lock_order_lock: check lock order 1 for /run/samba/locking.tdb
[2019/11/25 13:38:29.463991,  5] ../../lib/dbwrap/dbwrap.c:130(dbwrap_lock_order_lock)
  dbwrap_lock_order_lock: check lock order 2 for /run/samba/leases.tdb
[2019/11/25 13:38:29.464007,  5] ../../lib/dbwrap/dbwrap.c:159(dbwrap_lock_order_unlock)
  dbwrap_lock_order_unlock: release lock order 2 for /run/samba/leases.tdb
[2019/11/25 13:38:29.464028,  5] ../../lib/dbwrap/dbwrap.c:159(dbwrap_lock_order_unlock)
  dbwrap_lock_order_unlock: release lock order 1 for /run/samba/locking.tdb
[2019/11/25 13:38:29.464046,  5] ../../source3/smbd/dosmode.c:72(dos_mode_debug_print)
  dos_mode_debug_print: parse_dos_attribute_blob returning (0x20): "a"
[2019/11/25 13:38:29.464057,  5] ../../source3/smbd/dosmode.c:72(dos_mode_debug_print)
  dos_mode_debug_print: dos_mode returning (0x20): "a"
[2019/11/25 13:38:29.465369,  5] ../../source3/smbd/uid.c:326(change_to_user_impersonate)
  change_to_user_impersonate: Skipping user change - already user
[2019/11/25 13:38:29.465401,  5] ../../source3/smbd/uid.c:300(print_impersonation_info)

And=20

[2019/11/25 13:38:29.472724,  5] ../../lib/dbwrap/dbwrap.c:159(dbwrap_lock_order_unlock)
  dbwrap_lock_order_unlock: release lock order 1 for /run/samba/locking.tdb
[2019/11/25 13:38:29.472760,  2] ../../source3/smbd/close.c:813(close_normal_file)
  root closed file x64/{5212AF71-836E-4D03-B3B9-A649E40F50FF}/x2fpd02.dll (numopen=3D1) NT_STATUS_OK
[2019/11/25 13:38:29.472773,  5] ../../lib/dbwrap/dbwrap.c:130(dbwrap_lock_order_lock)
  dbwrap_lock_order_lock: check lock order 1 for /run/samba/smbXsrv_open_global.tdb
[2019/11/25 13:38:29.472810,  5] ../../lib/dbwrap/dbwrap.c:159(dbwrap_lock_order_unlock)
  dbwrap_lock_order_unlock: release lock order 1 for /run/samba/smbXsrv_open_global.tdb
[2019/11/25 13:38:29.472828,  5] ../../source3/smbd/files.c:556(file_free)
  freed files structure 3390760984 (3 used)
[2019/11/25 13:38:29.474257,  5] ../../source3/smbd/uid.c:326(change_to_user_impersonate)
  change_to_user_impersonate: Skipping user change - already user
[2019/11/25 13:38:29.474280,  5] ../../source3/smbd/uid.c:300(print_impersonation_info)
  print_impersonation_info: Impersonated user: uid=3D(0,0), gid=3D(0,0), cwd=3D[/home/samba/printing/drivers]
[2019/11/25 13:38:29.474302,  5] ../../source3/smbd/filename.c:481(unix_convert)
  unix_convert called on file "x64/{5212AF71-836E-4D03-B3B9-A649E40F50FF}/api-ms-win-crt-utility-l1-1-0.dll"
[2019/11/25 13:38:29.474319,  5] ../../source3/smbd/filename.c:682(unix_convert)
  unix_convert begin: name =3D x64/{5212AF71-836E-4D03-B3B9-A649E40F50FF}/api-ms-win-crt-utility-l1-1-0.dll, dirpath =3D x64, start =3D {5212AF71-836E-4D03-B3B9-A649E40F50FF}/api-ms-win-crt-utility-l1-1-0.dll
[2019/11/25 13:38:29.474334,  5] ../../source3/smbd/filename.c:705(unix_convert)
  conversion of base_name finished x64/{5212AF71-836E-4D03-B3B9-A649E40F50FF}/api-ms-win-crt-utility-l1-1-0.dll -> x64/{5212AF71-836E-4D03-B3B9-A649E40F50FF}/api-ms-win-crt-utility-l1-1-0.dll
[2019/11/25 13:38:29.474355,  5] ../../source3/smbd/vfs.c:1368(check_reduced_name)
  check_reduced_name: x64/{5212AF71-836E-4D03-B3B9-A649E40F50FF}/api-ms-win-crt-utility-l1-1-0.dll reduced to /home/samba/printing/drivers/x64/{5212AF71-836E-4D03-B3B9-A649E40F50FF}/api-ms-win-crt-utility-l1-1-0.dll
[2019/11/25 13:38:29.474386,  5] ../../lib/dbwrap/dbwrap.c:130(dbwrap_lock_order_lock)
  dbwrap_lock_order_lock: check lock order 1 for /run/samba/smbXsrv_open_global.tdb
[2019/11/25 13:38:29.474410,  5] ../../lib/dbwrap/dbwrap.c:159(dbwrap_lock_order_unlock)
  dbwrap_lock_order_unlock: release lock order 1 for /run/samba/smbXsrv_open_global.tdb
[2019/11/25 13:38:29.474422,  5] ../../source3/smbd/files.c:137(file_new)
  allocated file structure fnum 4271223513 (4 used)
[2019/11/25 13:38:29.474436,  5] ../../source3/smbd/dosmode.c:208(unix_mode)
  unix_mode: unix_mode(x64/{5212AF71-836E-4D03-B3B9-A649E40F50FF}/api-ms-win-crt-utility-l1-1-0.dll) returning 0744
[2019/11/25 13:38:29.474460,  5] ../../source3/smbd/dosmode.c:72(dos_mode_debug_print)
  dos_mode_debug_print: parse_dos_attribute_blob returning (0x20): "a"
[2019/11/25 13:38:29.474473,  4] ../../source3/smbd/open.c:3286(open_file_ntcreate)
  calling open_file with flags=3D0x0 flags2=3D0x0 mode=3D0744, access_mask =3D 0x10080, open_access_mask =3D 0x10080
[2019/11/25 13:38:29.474484,  2] ../../source3/smbd/open.c:1456(open_file)
  root opened file x64/{5212AF71-836E-4D03-B3B9-A649E40F50FF}/api-ms-win-crt-utility-l1-1-0.dll read=3DNo write=3DNo (numopen=3D2)
[2019/11/25 13:38:29.474496,  5] ../../lib/dbwrap/dbwrap.c:130(dbwrap_lock_order_lock)
  dbwrap_lock_order_lock: check lock order 1 for /run/samba/locking.tdb
[2019/11/25 13:38:29.474514,  5] ../../lib/dbwrap/dbwrap.c:130(dbwrap_lock_order_lock)
  dbwrap_lock_order_lock: check lock order 2 for /run/samba/leases.tdb
[2019/11/25 13:38:29.474531,  5] ../../lib/dbwrap/dbwrap.c:159(dbwrap_lock_order_unlock)
  dbwrap_lock_order_unlock: release lock order 2 for /run/samba/leases.tdb
[2019/11/25 13:38:29.474552,  5] ../../lib/dbwrap/dbwrap.c:159(dbwrap_lock_order_unlock)
  dbwrap_lock_order_unlock: release lock order 1 for /run/samba/locking.tdb
[2019/11/25 13:38:29.474570,  5] ../../source3/smbd/dosmode.c:72(dos_mode_debug_print)
  dos_mode_debug_print: parse_dos_attribute_blob returning (0x20): "a"
[2019/11/25 13:38:29.474581,  5] ../../source3/smbd/dosmode.c:72(dos_mode_debug_print)
  dos_mode_debug_print: dos_mode returning (0x20): "a"
[2019/11/25 13:38:29.475695,  5] ../../source3/smbd/uid.c:326(change_to_user_impersonate)
  change_to_user_impersonate: Skipping user change - already user
[2019/11/25 13:38:29.475728,  5] ../../source3/smbd/uid.c:300(print_impersonation_info)
  print_impersonation_info: Impersonated user: uid=3D(0,0), gid=3D(0,0), cwd=3D[/home/samba/printing/drivers]
[2019/11/25 13:38:29.475751,  3] ../../source3/smbd/trans2.c:8789(smbd_do_setfilepathinfo)
  smbd_do_setfilepathinfo: x64/{5212AF71-836E-4D03-B3B9-A649E40F50FF}/api-ms-win-crt-utility-l1-1-0.dll (fnum 4271223513) info_level=3D1013 totdata=3D1
[2019/11/25 13:38:29.475776,  5] ../../source3/smbd/dosmode.c:72(dos_mode_debug_print)
  dos_mode_debug_print: parse_dos_attribute_blob returning (0x20): "a"
[2019/11/25 13:38:29.475793,  5] ../../source3/smbd/dosmode.c:72(dos_mode_debug_print)
  dos_mode_debug_print: dos_mode returning (0x20): "a"
[2019/11/25 13:38:29.475805,  5] ../../lib/dbwrap/dbwrap.c:130(dbwrap_lock_order_lock)
  dbwrap_lock_order_lock: check lock order 1 for /run/samba/locking.tdb
[2019/11/25 13:38:29.475843,  5] ../../lib/dbwrap/dbwrap.c:159(dbwrap_lock_order_unlock)
  dbwrap_lock_order_unlock: release lock order 1 for /run/samba/locking.tdb
[2019/11/25 13:38:29.477628,  5] ../../source3/smbd/uid.c:326(change_to_user_impersonate)
  change_to_user_impersonate: Skipping user change - already user
[2019/11/25 13:38:29.477656,  5] ../../source3/smbd/uid.c:300(print_impersonation_info)
  print_impersonation_info: Impersonated user: uid=3D(0,0), gid=3D(0,0), cwd=3D[/home/samba/printing/drivers]
[2019/11/25 13:38:29.477673,  5] ../../lib/dbwrap/dbwrap.c:130(dbwrap_lock_order_lock)
  dbwrap_lock_order_lock: check lock order 1 for /run/samba/locking.tdb
[2019/11/25 13:38:29.477692,  5] ../../lib/dbwrap/dbwrap.c:130(dbwrap_lock_order_lock)
  dbwrap_lock_order_lock: check lock order 2 for /run/samba/leases.tdb
[2019/11/25 13:38:29.477711,  5] ../../lib/dbwrap/dbwrap.c:159(dbwrap_lock_order_unlock)
  dbwrap_lock_order_unlock: release lock order 2 for /run/samba/leases.tdb
[2019/11/25 13:38:29.477731,  5] ../../source3/smbd/close.c:375(close_remove_share_mode)
  close_remove_share_mode: file x64/{5212AF71-836E-4D03-B3B9-A649E40F50FF}/api-ms-win-crt-utility-l1-1-0.dll. Delete on close was set - deleting file.
[2019/11/25 13:38:29.477782,  5] ../../lib/dbwrap/dbwrap.c:159(dbwrap_lock_order_unlock)
  dbwrap_lock_order_unlock: release lock order 1 for /run/samba/locking.tdb
[2019/11/25 13:38:29.477814,  2] ../../source3/smbd/close.c:813(close_normal_file)
  root closed file x64/{5212AF71-836E-4D03-B3B9-A649E40F50FF}/api-ms-win-crt-utility-l1-1-0.dll (numopen=3D1) NT_STATUS_OK
[2019/11/25 13:38:29.477828,  5] ../../lib/dbwrap/dbwrap.c:130(dbwrap_lock_order_lock)
  dbwrap_lock_order_lock: check lock order 1 for /run/samba/smbXsrv_open_global.tdb
[2019/11/25 13:38:29.477843,  5] ../../lib/dbwrap/dbwrap.c:159(dbwrap_lock_order_unlock)
  dbwrap_lock_order_unlock: release lock order 1 for /run/samba/smbXsrv_open_global.tdb
[2019/11/25 13:38:29.477856,  5] ../../source3/smbd/files.c:556(file_free)
  freed files structure 4271223513 (3 used)
[2019/11/25 13:38:29.479650,  5] ../../source3/smbd/uid.c:326(change_to_user_impersonate)
  change_to_user_impersonate: Skipping user change - already user
[2019/11/25 13:38:29.479733,  5] ../../source3/smbd/uid.c:300(print_impersonation_info)
  print_impersonation_info: Impersonated user: uid=3D(0,0), gid=3D(0,0), cwd=3D[/home/samba/printing/drivers]
[2019/11/25 13:38:29.479764,  5] ../../source3/smbd/filename.c:481(unix_convert)
  unix_convert called on file "x64/{5212AF71-836E-4D03-B3B9-A649E40F50FF}/api-ms-win-crt-stdio-l1-1-0.dll"
[2019/11/25 13:38:29.479813,  5] ../../source3/smbd/filename.c:682(unix_convert)
  unix_convert begin: name =3D x64/{5212AF71-836E-4D03-B3B9-A649E40F50FF}/api-ms-win-crt-stdio-l1-1-0.dll, dirpath =3D x64, start =3D {5212AF71-836E-4D03-B3B9-A649E40F50FF}/api-ms-win-crt-stdio-l1-1-0.dll
[2019/11/25 13:38:29.479858,  5] ../../source3/smbd/filename.c:705(unix_convert)
  conversion of base_name finished x64/{5212AF71-836E-4D03-B3B9-A649E40F50FF}/api-ms-win-crt-stdio-l1-1-0.dll -> x64/{5212AF71-836E-4D03-B3B9-A649E40F50FF}/api-ms-win-crt-stdio-l1-1-0.dll
[2019/11/25 13:38:29.479907,  5] ../../source3/smbd/vfs.c:1368(check_reduced_name)
  check_reduced_name: x64/{5212AF71-836E-4D03-B3B9-A649E40F50FF}/api-ms-win-crt-stdio-l1-1-0.dll reduced to /home/samba/printing/drivers/x64/{5212AF71-836E-4D03-B3B9-A649E40F50FF}/api-ms-win-crt-stdio-l1-1-0.dll
[2019/11/25 13:38:29.479965,  5] ../../lib/dbwrap/dbwrap.c:130(dbwrap_lock_order_lock)
  dbwrap_lock_order_lock: check lock order 1 for /run/samba/smbXsrv_open_global.tdb
[2019/11/25 13:38:29.480023,  5] ../../lib/dbwrap/dbwrap.c:159(dbwrap_lock_order_unlock)
  dbwrap_lock_order_unlock: release lock order 1 for /run/samba/smbXsrv_open_global.tdb
[2019/11/25 13:38:29.480067,  5] ../../source3/smbd/files.c:137(file_new)
  allocated file structure fnum 59676162 (4 used)
[2019/11/25 13:38:29.480088,  5] ../../source3/smbd/dosmode.c:208(unix_mode)
  unix_mode: unix_mode(x64/{5212AF71-836E-4D03-B3B9-A649E40F50FF}/api-ms-win-crt-stdio-l1-1-0.dll) returning 0744
[2019/11/25 13:38:29.480165,  5] ../../source3/smbd/dosmode.c:72(dos_mode_debug_print)
  dos_mode_debug_print: parse_dos_attribute_blob returning (0x20): "a"
[2019/11/25 13:38:29.480186,  4] ../../source3/smbd/open.c:3286(open_file_ntcreate)
  calling open_file with flags=3D0x0 flags2=3D0x0 mode=3D0744, access_mask =3D 0x10080, open_access_mask =3D 0x10080
[2019/11/25 13:38:29.480223,  2] ../../source3/smbd/open.c:1456(open_file)
  root opened file x64/{5212AF71-836E-4D03-B3B9-A649E40F50FF}/api-ms-win-crt-stdio-l1-1-0.dll read=3DNo write=3DNo (numopen=3D2)
[2019/11/25 13:38:29.480244,  5] ../../lib/dbwrap/dbwrap.c:130(dbwrap_lock_order_lock)
  dbwrap_lock_order_lock: check lock order 1 for /run/samba/locking.tdb
[2019/11/25 13:38:29.480266,  5] ../../lib/dbwrap/dbwrap.c:130(dbwrap_lock_order_lock)
  dbwrap_lock_order_lock: check lock order 2 for /run/samba/leases.tdb
[2019/11/25 13:38:29.480292,  5] ../../lib/dbwrap/dbwrap.c:159(dbwrap_lock_order_unlock)
  dbwrap_lock_order_unlock: release lock order 2 for /run/samba/leases.tdb
[2019/11/25 13:38:29.480314,  5] ../../lib/dbwrap/dbwrap.c:159(dbwrap_lock_order_unlock)
  dbwrap_lock_order_unlock: release lock order 1 for /run/samba/locking.tdb
[2019/11/25 13:38:29.480335,  5] ../../source3/smbd/dosmode.c:72(dos_mode_debug_print)
  dos_mode_debug_print: parse_dos_attribute_blob returning (0x20): "a"
[2019/11/25 13:38:29.480346,  5] ../../source3/smbd/dosmode.c:72(dos_mode_debug_print)
  dos_mode_debug_print: dos_mode returning (0x20): "a"
[2019/11/25 13:38:29.481466,  5] ../../source3/smbd/uid.c:326(change_to_user_impersonate)
  change_to_user_impersonate: Skipping user change - already user
[2019/11/25 13:38:29.481503,  5] ../../source3/smbd/uid.c:300(print_impersonation_info)
  print_impersonation_info: Impersonated user: uid=3D(0,0), gid=3D(0,0), cwd=3D[/home/samba/printing/drivers]
[2019/11/25 13:38:29.481526,  3] ../../source3/smbd/trans2.c:8789(smbd_do_setfilepathinfo)
  smbd_do_setfilepathinfo: x64/{5212AF71-836E-4D03-B3B9-A649E40F50FF}/api-ms-win-crt-stdio-l1-1-0.dll (fnum 59676162) info_level=3D1013 totdata=3D1
[2019/11/25 13:38:29.481552,  5] ../../source3/smbd/dosmode.c:72(dos_mode_debug_print)
  dos_mode_debug_print: parse_dos_attribute_blob returning (0x20): "a"
[2019/11/25 13:38:29.481567,  5] ../../source3/smbd/dosmode.c:72(dos_mode_debug_print)
  dos_mode_debug_print: dos_mode returning (0x20): "a"
[2019/11/25 13:38:29.481581,  5] ../../lib/dbwrap/dbwrap.c:130(dbwrap_lock_order_lock)
  dbwrap_lock_order_lock: check lock order 1 for /run/samba/locking.tdb
[2019/11/25 13:38:29.481619,  5] ../../lib/dbwrap/dbwrap.c:159(dbwrap_lock_order_unlock)
  dbwrap_lock_order_unlock: release lock order 1 for /run/samba/locking.tdb



Greetz,=20

Louis





> -----Oorspronkelijk bericht-----
> Van: samba [mailto:samba-bounces@lists.samba.org] Namens=20
> Rowland penny via samba
> Verzonden: maandag 25 november 2019 11:46
> Aan: samba@lists.samba.org
> Onderwerp: Re: [Samba] Samba4 - Printer Drivers install fails
>=20
> On 25/11/2019 10:03, L.P.H. van Belle via samba wrote:
> > Hai,
> >
> > Im looking into this printer driver problem, and yes, its a bug..
> > Now this part of the logs.
> >
> > move_driver_file_to_download_area: Unable to rename=20
> [x64/{7B0F67E9-8A50-45EF-A926-F9EF3D271299}/install_nbomx_xl_n
> oredist] to [x64/3/Install_NBOMX_XL_NoRedist]:=20
> NT_STATUS_OBJECT_NAME_NOT_FOUND
> > Nov 25 10:35:16 print1 smbd[732]: [2019/11/25=20
> 10:35:16.901490,  0]=20
> ../../source3/rpc_server/spoolss/srv_spoolss_nt.c:8621(_spools
> s_AddPrinterDriverEx)
> > Nov 25 10:35:16 print1 smbd[732]:  =20
> _spoolss_AddPrinterDriverEx: move_driver_to_download_area=20
> failed - WERR_APP_INIT_FAILURE
> >
> >
> > Unable to rename=20
> [x64/{7B0F67E9-8A50-45EF-A926-F9EF3D271299}/install_nbomx_xl_noredist
> >
> > This line,  the GUID folder exist, but=20
> "install_nbomx_xl_noredist" is not be be found.
> >
> > Im wondering, why a "Section" : [Install_NBOMX_XL_NoRedist]=20
>  from the .inf file seen as file/folder.
> > That is why the rename errors out.
> > ..
> >
> > ; Install Sections
> > ;
> >
> > [Install_NBOMX_XL_NoRedist]
> >
> > PrintProcessor=3D"XeroxV5Print,x5print.dll"
> >
> > Which is the only thing i found with :=20
> install_nbomx_xl_noredist in it.
> >
> > I'll see if there is an bugreport, if not i'll make one.
>=20
> Have a look at this (supposedly fixed) bug report:
>=20
> https://bugzilla.samba.org/show_bug.cgi=3Fid=3D13395
>=20
> Is there anything in the logs above what you have posted =3F
>=20
> Rowland
>=20
>=20
>=20
> --=20
> To unsubscribe from this list go to the following URL and read the
> instructions:  https://lists.samba.org/mailman/options/samba
>=20
>=20


