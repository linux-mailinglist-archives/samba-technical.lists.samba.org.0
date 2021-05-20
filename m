Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D30AD38B90B
	for <lists+samba-technical@lfdr.de>; Thu, 20 May 2021 23:38:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=L2UjI7XoZFyHhSV+k/WpKyCPO6sdJ1lkpS/dakVrbG4=; b=ANBlucVqSMDT3AkutdYq1H0M1f
	eKLiKOc9dgoLiLc7kFwUmzknMHRqPdXE/fwUQ+H7qkuuAOjWhJW2FVUHKi/RBIEdaoqbbHWhqm4ZB
	t+ZrDqu/iR48SFsSeo70rPHFTb/glUGSxS2ItZ83wpC00O2QhCnC/Lwl62jx+dy8b74VkTZiHdzQR
	fUKLUSrLvJc3n9cY5jdTbqufpKbBx9M3UoJvkt1BHyWDNwZPsw35f6+TNBR1nMC5GmHOCwml5kM2m
	appthW2dQCn4t9yuoGjpZBs5rS+wwsw2C/afqIXGCfx8wpOa4tUPxVmOC8w2gmwS8AHaQsgWxCo09
	TWwZlByg==;
Received: from ip6-localhost ([::1]:58200 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ljqMw-002OoS-0g; Thu, 20 May 2021 21:38:14 +0000
Received: from plasma3.jpberlin.de ([80.241.56.76]:10719) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ljqMq-002OoJ-PS
 for samba-technical@lists.samba.org; Thu, 20 May 2021 21:38:11 +0000
Received: from spamfilter01.heinlein-hosting.de
 (spamfilter01.heinlein-hosting.de [80.241.56.115])
 by plasma.jpberlin.de (Postfix) with ESMTP id 132E410304A;
 Thu, 20 May 2021 23:18:43 +0200 (CEST)
Received: from plasma.jpberlin.de ([80.241.56.76])
 by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
 [80.241.56.115]) (amavisd-new, port 10030)
 with ESMTP id vpGH4fpCxAgk; Thu, 20 May 2021 23:18:41 +0200 (CEST)
Received: from [192.168.123.204] (p5dfccc5b.dip0.t-ipconnect.de
 [93.252.204.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id DC7B5103033;
 Thu, 20 May 2021 23:18:40 +0200 (CEST)
Subject: Re: [Samba] share creates core-dump
To: "L.P.H. van Belle" <belle@bazuin.nl>,
 "samba@lists.samba.org" <samba@lists.samba.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
References: <e5417f20-f6ae-cde7-72d1-6c501589aace@kania-online.de>
 <vmime.60a65138.2f3d.11f2e888628038b8@ms249-lin-003.rotterdam.bazuin.nl>
Message-ID: <fbea5c20-eabc-c882-3016-20ad13ce025e@kania-online.de>
Date: Thu, 20 May 2021 23:18:40 +0200
MIME-Version: 1.0
In-Reply-To: <vmime.60a65138.2f3d.11f2e888628038b8@ms249-lin-003.rotterdam.bazuin.nl>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="------------ms060505010203050805090504"
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -7.20 / 15.00 / 15.00
X-Rspamd-Queue-Id: 132E410304A
X-Rspamd-UID: f967b6
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
From: Stefan Kania via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Kania <stefan@kania-online.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a cryptographically signed message in MIME format.

--------------ms060505010203050805090504
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Louis,

no RAM-disk is used. It's the first time I see this behavier, maybe I go
to 4.14 and try it again.

Stefan

Am 20.05.21 um 14:08 schrieb L.P.H. van Belle:
> Hai Stefan,=20
>=20
> Any ramdisk use? There is and old bug on that. #8935 but i dont think t=
hats related.=20
>=20
> And can you try to reproduce with my packages?=20
> I dont know which talloc version is used on ubuntu by sernet with samba=
=2E=20
> But i do have latest talloc running in my packages.=20
>=20
> A quick google on : samba panic "unable to get back to old directory"
> Only shows 2 hits, reffering to : https://ftp.samba.org/pub/unpacked/sa=
mba_master/source3/smbd/open.c=20
>=20
> This part.=20
> out:
>=20
> 	TALLOC_FREE(resolved_fname);
> 	TALLOC_FREE(link_target);
> 	if (oldwd_fname !=3D NULL) {
> 		int ret =3D vfs_ChDir(conn, oldwd_fname);
> 		if (ret =3D=3D -1) {
> 			smb_panic("unable to get back to old directory\n");
> 		}
> 		TALLOC_FREE(oldwd_fname);
> 	}
>=20
> 	return status;
>=20
> And this part.
>=20
> out:
> 	fsp->fsp_name =3D orig_fsp_name;
> 	if (fsp->base_fsp !=3D NULL) {
> 		fsp->base_fsp->fsp_name =3D orig_base_fsp_name;
> 	}
> 	TALLOC_FREE(parent_dir_fname);
>=20
> 	if (oldwd_fname !=3D NULL) {
> 		ret =3D vfs_ChDir(conn, oldwd_fname);
> 		if (ret =3D=3D -1) {
> 			smb_panic("unable to get back to old directory\n");
> 		}
> 		TALLOC_FREE(oldwd_fname);
> 	}
> 	return status;
>=20
> But this is more for one of the developers/coders to look at.=20
>=20
> So far,=20
>=20
> Greetz,=20
>=20
> Louis
>=20
>=20
>=20
>> -----Oorspronkelijk bericht-----
>> Van: samba [mailto:samba-bounces@lists.samba.org] Namens=20
>> Stefan Kania via samba
>> Verzonden: donderdag 20 mei 2021 13:48
>> Aan: samba@lists.samba.org
>> Onderwerp: [Samba] share creates core-dump
>>
>> Hi to all,
>> I have a Proplem with a CTDB-Cluster with GlusterFS. Several=20
>> times users
>> cant access there profile. When I take a look at the=20
>> directory, there is
>> a core-file. As soon as I delete the core-files with:
>>
>>  find /glusterfs -name core -type f -exec rm -rv {} \;
>>
>> everything is working again.
>> I see the following messages in the log:
>> ---------------------
>>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [2021/05/20 05:48:47.308898,  0]=20
>> ../../lib/util/fault.c:170(smb_panic_log)
>>   PANIC (pid 3133648): unable to get back to old directory
>>    in 4.13.7-SerNet-Ubuntu-11.focal
>> [2021/05/20 05:48:47.385760,  0]=20
>> ../../lib/util/fault.c:274(log_stack_trace)
>>   BACKTRACE: 33 stack frames:
>>    #0
>> /usr/lib/x86_64-linux-gnu/samba/libsamba-util.so.0(log_stack_t
>> race+0x34)
>> [0x7f6059d71c59]
>>    #1
>> /usr/lib/x86_64-linux-gnu/samba/libsamba-util.so.0(smb_panic_log+0x5f)=

>> [0x7f6059d71d8f]
>>    #2=20
>> /usr/lib/x86_64-linux-gnu/samba/libsamba-util.so.0(smb_panic+0x27)
>> [0x7f6059d71ef5]
>>    #3=20
>> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(+0x1ab6aa)
>> [0x7f6059ba16aa]
>>    #4
>> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(fd_open+0x67)
>> [0x7f6059ba2a6d]
>>    #5
>> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(fd_openat+0x88)=

>> [0x7f6059ba2cc8]
>>    #6=20
>> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(+0x1ad62a)
>> [0x7f6059ba362a]
>>    #7=20
>> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(+0x1b2531)
>> [0x7f6059ba8531]
>>    #8
>> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(create_
>> file_default+0x32f)
>> [0x7f6059baa7c6]
>>    #9=20
>> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(+0x144e27)
>> [0x7f6059b3ae27]
>>    #10
>> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(smb_vfs
>> _call_create_file+0x74)
>> [0x7f6059bb150d]
>>    #11
>> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(smbd_sm
>> b2_request_process_create+0x1156)
>> [0x7f6059be4d3a]
>>    #12
>> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(smbd_sm
>> b2_request_dispatch+0x14fd)
>> [0x7f6059bd9d61]
>>    #13=20
>> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(+0x1e5b80)
>> [0x7f6059bdbb80]
>>    #14
>> /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(tevent_common_i
>> nvoke_fd_handler+0x85)
>> [0x7f60599d850d]
>>    #15 /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(+0xdcd4)
>> [0x7f60599decd4]
>>    #16 /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(+0xb8af)
>> [0x7f60599dc8af]
>>    #17
>> /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(_tevent_loop_once+0xa6)=

>> [0x7f60599d7cd0]
>>    #18
>> /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(tevent_common_l
>> oop_wait+0x25)
>> [0x7f60599d7ed7]
>>    #19 /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(+0xb859)
>> [0x7f60599dc859]
>>    #20
>> /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(_tevent_loop_wait+0xe)
>> [0x7f60599d7f37]
>>    #21
>> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(smbd_pr
>> ocess+0x9af)
>> [0x7f6059bc809c]
>>    #22 /usr/sbin/smbd(+0xdf97) [0x559603ddef97]
>>    #23
>> /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(tevent_common_i
>> nvoke_fd_handler+0x85)
>> [0x7f60599d850d]
>>    #24 /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(+0xdcd4)
>> [0x7f60599decd4]
>>    #25 /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(+0xb8af)
>> [0x7f60599dc8af]
>>    #26
>> /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(_tevent_loop_once+0xa6)=

>> [0x7f60599d7cd0]
>>    #27
>> /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(tevent_common_l
>> oop_wait+0x25)
>> [0x7f60599d7ed7]
>>    #28 /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(+0xb859)
>> [0x7f60599dc859]
>>    #29
>> /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(_tevent_loop_wait+0xe)
>> [0x7f60599d7f37]
>>    #30 /usr/sbin/smbd(main+0x1973) [0x559603de0a8c]
>>    #31 /lib/x86_64-linux-gnu/libc.so.6(__libc_start_main+0xf3)
>> [0x7f60593180b3]
>>    #32 /usr/sbin/smbd(_start+0x2e) [0x559603dd90ce]
>> [2021/05/20 05:48:47.386307,  0]=20
>> ../../source3/lib/util.c:838(smb_panic_s3)
>>   smb_panic(): calling panic action
>> [/usr/share/samba/scripts/panic-action 3133648]
>> mail: cannot stat `/glusterfs/home/w008_/.mail': Permission denied
>> mail: Cannot open `/glusterfs/home/w008_/.mailrc': Permission denied
>> [2021/05/20 05:48:47.609018,  0]=20
>> ../../source3/lib/util.c:845(smb_panic_s3)
>>   smb_panic(): action returned status 0
>> [2021/05/20 05:48:47.609126,  0]=20
>> ../../source3/lib/dumpcore.c:317(dump_core)
>>   coredump is handled by helper binary specified at
>> /proc/sys/kernel/core_pattern
>> [2021/05/20 05:48:48.609979,  0]
>> ../../source3/smbd/service.c:166(chdir_current_service)
>>   chdir_current_service: vfs_ChDir(/glusterfs/profiles) failed:
>> Permission denied. Current token: uid=3D202296, gid=3D100515, 5 groups=
:
>> 202296 100515 10003 10004 10006
>> [2021/05/20 05:49:21.701302,  0]
>> ../../source3/smbd/service.c:166(chdir_current_service)
>>   chdir_current_service: vfs_ChDir(/glusterfs/profiles) failed:
>> Permission denied. Current token: uid=3D203773, gid=3D100515, 5 groups=
:
>> 203773 100515 10003 10004 10006
>> [2021/05/20 05:50:26.390966,  0]
>> ../../source3/smbd/service.c:166(chdir_current_service)
>>   chdir_current_service:=20
>> vfs_ChDir(/glusterfs/admin-share/allg_verkauf)
>> failed: Permission denied. Current token: uid=3D103036, gid=3D100513, =
7
>> groups: 103036 100513 107007 10003 10004 10006 10001
>> [2021/05/20 05:50:26.391469,  0]
>> ../../source3/smbd/service.c:166(chdir_current_service)
>>   chdir_current_service: vfs_ChDir(/glusterfs/admin-share/cad) failed:=

>> Permission denied. Current token: uid=3D103036, gid=3D100513, 7 groups=
:
>> 103036 100513 107007 10003 10004 10006 10001
>> [2021/05/20 05:50:26.391711,  0]
>> ../../source3/smbd/service.c:166(chdir_current_service)
>>   chdir_current_service: vfs_ChDir(/glusterfs/admin-share/e_technik)
>> failed: Permission denied. Current token: uid=3D103036, gid=3D100513, =
7
>> groups: 103036 100513 107007 10003 10004 10006 10001
>> [2021/05/20 05:50:26.392287,  0]
>> ../../source3/smbd/service.c:166(chdir_current_service)
>>   chdir_current_service: vfs_ChDir(/glusterfs/admin-share/entwicklung)=

>> failed: Permission denied. Current token: uid=3D103036, gid=3D100513, =
7
>> groups: 103036 100513 107007 10003 10004 10006 10001
>> [2021/05/20 05:50:26.392680,  0]
>> ../../source3/smbd/service.c:166(chdir_current_service)
>>   chdir_current_service: vfs_ChDir(/glusterfs/admin-share/qm) failed:
>> Permission denied. Current token: uid=3D103036, gid=3D100513, 7 groups=
:
>> 103036 100513 107007 10003 10004 10006 10001
>> [2021/05/20 05:50:26.392941,  0]
>> ../../source3/smbd/service.c:166(chdir_current_service)
>>   chdir_current_service: vfs_ChDir(/glusterfs/admin-share/install)
>> failed: Permission denied. Current token: uid=3D103036, gid=3D100513, =
7
>> groups: 103036 100513 107007 10003 10004 10006 10001
>> [2021/05/20 05:54:24.841494,  0]
>> ../../source3/smbd/service.c:166(chdir_current_service)
>>   chdir_current_service: vfs_ChDir(/glusterfs/profiles) failed:
>> Permission denied. Current token: uid=3D203293, gid=3D100515, 5 groups=
:
>> 203293 100515 10003 10004 10006
>> [2021/05/20 05:54:24.843205,  0]
>> ../../source3/smbd/service.c:166(chdir_current_service)
>>   chdir_current_service: vfs_ChDir(/glusterfs/profiles) failed:
>> Permission denied. Current token: uid=3D203293, gid=3D100515, 5 groups=
:
>> 203293 100515 10003 10004 10006
>> [2021/05/20 06:15:22.372151,  0]
>> ../../source3/smbd/service.c:166(chdir_current_service)
>>   chdir_current_service: vfs_ChDir(/glusterfs/home) failed: Permission=

>> denied. Current token: uid=3D203290, gid=3D100515, 5 groups: 203290 10=
0515
>> 10003 10004 10006
>> [2021/05/20 06:15:22.372634,  0]
>> ../../source3/smbd/service.c:166(chdir_current_service)
>>   chdir_current_service: vfs_ChDir(/glusterfs/home) failed: Permission=

>> denied. Current token: uid=3D203290, gid=3D100515, 5 groups: 203290 10=
0515
>> 10003 10004 10006
>> [2021/05/20 06:15:22.410049,  0]=20
>> ../../lib/util/fault.c:159(smb_panic_log)
>>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [2021/05/20 06:15:22.410132,  0]=20
>> ../../lib/util/fault.c:160(smb_panic_log)
>>   INTERNAL ERROR: unable to get back to old directory
>>    in pid 3144131 (4.13.7-SerNet-Ubuntu-11.focal)
>> [2021/05/20 06:15:22.410189,  0]=20
>> ../../lib/util/fault.c:164(smb_panic_log)
>>   If you are running a recent Samba version, and if you think this
>> problem is not yet fixed in the latest versions, please consider
>> reporting this bug, see https://wiki.samba.org/index.php/Bug_Reporting=

>> [2021/05/20 06:15:22.410225,  0]=20
>> ../../lib/util/fault.c:169(smb_panic_log)
>>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [2021/05/20 06:35:46.178550,  0]=20
>> ../../lib/util/fault.c:170(smb_panic_log)
>>   PANIC (pid 3152237): unable to get back to old directory
>>    in 4.13.7-SerNet-Ubuntu-11.focal
>> [2021/05/20 06:35:46.179395,  0]=20
>> ../../lib/util/fault.c:274(log_stack_trace)
>>   BACKTRACE: 33 stack frames:
>>    #0
>> /usr/lib/x86_64-linux-gnu/samba/libsamba-util.so.0(log_stack_t
>> race+0x34)
>> [0x7f6059d71c59]
>>    #1
>> /usr/lib/x86_64-linux-gnu/samba/libsamba-util.so.0(smb_panic_log+0x5f)=

>> [0x7f6059d71d8f]
>>    #2=20
>> /usr/lib/x86_64-linux-gnu/samba/libsamba-util.so.0(smb_panic+0x27)
>> [0x7f6059d71ef5]
>>    #3=20
>> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(+0x1ab6aa)
>> [0x7f6059ba16aa]
>>    #4
>> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(fd_open+0x67)
>> [0x7f6059ba2a6d]
>>    #5
>> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(fd_openat+0x88)=

>> [0x7f6059ba2cc8]
>>    #6=20
>> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(+0x1ad62a)
>> [0x7f6059ba362a]
>>    #7=20
>> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(+0x1b2531)
>> [0x7f6059ba8531]
>>    #8
>> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(create_
>> file_default+0x32f)
>> [0x7f6059baa7c6]
>>    #9=20
>> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(+0x144e27)
>> [0x7f6059b3ae27]
>>    #10
>> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(smb_vfs
>> _call_create_file+0x74)
>> [0x7f6059bb150d]
>>    #11
>> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(smbd_sm
>> b2_request_process_create+0x1156)
>> [0x7f6059be4d3a]
>>    #12
>> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(smbd_sm
>> b2_request_dispatch+0x14fd)
>> [0x7f6059bd9d61]
>>    #13=20
>> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(+0x1e5b80)
>> [0x7f6059bdbb80]
>>    #14
>> /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(tevent_common_i
>> nvoke_fd_handler+0x85)
>> [0x7f60599d850d]
>>    #15 /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(+0xdcd4)
>> [0x7f60599decd4]
>>    #16 /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(+0xb8af)
>> [0x7f60599dc8af]
>>    #17
>> /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(_tevent_loop_once+0xa6)=

>> [0x7f60599d7cd0]
>>    #18
>> /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(tevent_common_l
>> oop_wait+0x25)
>> [0x7f60599d7ed7]
>>    #19 /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(+0xb859)
>> [0x7f60599dc859]
>>    #20
>> /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(_tevent_loop_wait+0xe)
>> [0x7f60599d7f37]
>>    #21
>> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(smbd_pr
>> ocess+0x9af)
>> [0x7f6059bc809c]
>>    #22 /usr/sbin/smbd(+0xdf97) [0x559603ddef97]
>>    #23
>> /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(tevent_common_i
>> nvoke_fd_handler+0x85)
>> [0x7f60599d850d]
>>    #24 /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(+0xdcd4)
>> [0x7f60599decd4]
>>    #25 /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(+0xb8af)
>> [0x7f60599dc8af]
>>    #26
>> /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(_tevent_loop_once+0xa6)=

>> [0x7f60599d7cd0]
>>    #27
>> /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(tevent_common_l
>> oop_wait+0x25)
>> [0x7f60599d7ed7]
>>    #28 /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(+0xb859)
>> [0x7f60599dc859]
>>    #29
>> /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(_tevent_loop_wait+0xe)
>> [0x7f60599d7f37]
>>    #30 /usr/sbin/smbd(main+0x1973) [0x559603de0a8c]
>>    #31 /lib/x86_64-linux-gnu/libc.so.6(__libc_start_main+0xf3)
>> [0x7f60593180b3]
>>    #32 /usr/sbin/smbd(_start+0x2e) [0x559603dd90ce]
>> [2021/05/20 06:35:46.179923,  0]=20
>> ../../source3/lib/util.c:838(smb_panic_s3)
>>   smb_panic(): calling panic action
>> [/usr/share/samba/scripts/panic-action 3152237]
>> mail: cannot stat `/glusterfs/home/w141_/.mail': Permission denied
>> mail: Cannot open `/glusterfs/home/w141_/.mailrc': Permission denied
>> [2021/05/20 06:35:46.301704,  0]=20
>> ../../source3/lib/util.c:845(smb_panic_s3)
>>   smb_panic(): action returned status 0
>> [2021/05/20 06:35:46.301833,  0]=20
>> ../../source3/lib/dumpcore.c:317(dump_core)
>>   coredump is handled by helper binary specified at
>> /proc/sys/kernel/core_pattern
>> [2021/05/20 06:35:47.104243,  0]
>> ../../source3/smbd/service.c:166(chdir_current_service)
>>   chdir_current_service: vfs_ChDir(/glusterfs/profiles) failed:
>> Permission denied. Current token: uid=3D203302, gid=3D100515, 5 groups=
:
>> 203302 100515 10003 10004 10006
>> [2021/05/20 06:40:41.021829,  0]
>> ../../source3/smbd/service.c:166(chdir_current_service)
>>   chdir_current_service: vfs_ChDir(/glusterfs/home) failed: Permission=

>> denied. Current token: uid=3D203285, gid=3D100515, 5 groups: 203285 10=
0515
>> 10003 10004 10006
>> [2021/05/20 06:53:13.351134,  0]
>> ../../source3/smbd/service.c:166(chdir_current_service)
>>   chdir_current_service: vfs_ChDir(/glusterfs/profiles) failed:
>> Permission denied. Current token: uid=3D203778, gid=3D100515, 5 groups=
:
>> 203778 100515 10003 10004 10006
>> [2021/05/20 06:54:06.087034,  0]=20
>> ../../lib/util/fault.c:159(smb_panic_log)
>> ---------------------
>> As you can see in thr look it's a 4.13.7 from Sernet. Here is=20
>> the smb.conf.
>> --------------
>> global]
>> 	workgroup =3D NTD
>> 	realm =3D NTD.TEST
>> 	netbios name =3D fs1
>> 	security =3D ads
>> 	winbind use default domain =3D yes
>> 	winbind refresh tickets =3D yes
>> 	idmap config * : range =3D 10000-19999
>> 	idmap config NTD : backend =3D rid
>> 	idmap config NTD : range =3D 100000-199999999999999
>> 	inherit acls =3D yes
>> 	vfs objects =3D acl_xattr
>> 	template homedir =3D /glusterfs/home/%U
>>
>> [profiles]
>> 	comment =3D Benutzerprofile
>> 	read only =3D no
>> 	browseable =3D no
>> 	path =3D /glusterfs/profiles
>> 	vfs objects =3D acl_xattr glusterfs_fuse
>>
>> [users]
>> 	comment =3D Basisverzeichnisse
>> 	path =3D /glusterfs/home
>> 	vfs objects =3D acl_xattr shadow_copy2 glusterfs_fuse
>> 	browseable =3D no
>> 	read only =3D no
>> 	shadow:snapdir =3D /glusterfs/home/.snaps
>> 	shadow:basedir =3D /glusterfs/home
>> 	shadow:sort =3D desc
>> 	shadow:snapprefix =3D ^s[A-Za-z0-9]*p1$
>> 	shadow:format =3D _GMT-%Y.%m.%d-%H.%M.%S
>>
>> [admin-share]
>> 	comment =3D Nur fuer admins
>> 	guest ok =3D no
>> 	read only =3D no
>> 	vfs objects =3D acl_xattr shadow_copy2 glusterfs_fuse
>> 	path =3D /glusterfs/admin-share
>> 	shadow:snapdir =3D /glusterfs/admin-share/.snaps
>> 	shadow:basedir =3D /glusterfs/admin-share
>> 	shadow:sort =3D desc
>> 	shadow:snapprefix =3D ^s[A-Za-z0-9]*p1$
>> 	shadow:format =3D _GMT-%Y.%m.%d-%H.%M.%S
>>
>> [allg_werk]
>> 	comment =3D Qualitaetsmanegement
>> 	guest ok =3D no
>> 	read only =3D no
>> 	vfs objects =3D acl_xattr shadow_copy2 glusterfs_fuse
>> 	path =3D /glusterfs/admin-share/allg_werk
>> 	shadow:snapdir =3D /glusterfs/admin-share/allg_werk/.snaps
>> 	shadow:basedir =3D /glusterfs/admin-share/allg_werk
>> 	shadow:sort =3D desc
>> 	shadow:snapprefix =3D ^s[A-Za-z0-9]*p1$
>> 	shadow:format =3D _GMT-%Y.%m.%d-%H.%M.%S
>>
>> [allg_verkauf]
>> 	comment =3D Qualitaetsmanegement
>> 	guest ok =3D no
>> 	read only =3D no
>> 	vfs objects =3D acl_xattr shadow_copy2 glusterfs_fuse
>> 	path =3D /glusterfs/admin-share/allg_verkauf
>> 	shadow:snapdir =3D /glusterfs/admin-share/allg_verkauf/.snaps
>> 	shadow:basedir =3D /glusterfs/admin-share/allg_verkauf
>> 	shadow:sort =3D desc
>> 	shadow:snapprefix =3D ^s[A-Za-z0-9]*p1$
>> 	shadow:format =3D _GMT-%Y.%m.%d-%H.%M.%S
>>
>> [install]
>> 	comment =3D Installationsfreigabe
>> 	guest ok =3D no
>> 	read only =3D no
>> 	vfs objects =3D acl_xattr shadow_copy2 glusterfs_fuse
>> 	path =3D /glusterfs/admin-share/install
>> 	shadow:snapdir =3D /glusterfs/admin-share/install/.snaps
>> 	shadow:basedir =3D /glusterfs/admin-share/install
>> 	shadow:sort =3D desc
>> 	shadow:snapprefix =3D ^s[A-Za-z0-9]*p1$
>> 	shadow:format =3D _GMT-%Y.%m.%d-%H.%M.%S
>>
>> [e_technik]
>> 	comment =3D E-Technik
>> 	guest ok =3D no
>> 	read only =3D no
>> 	vfs objects =3D acl_xattr shadow_copy2 glusterfs_fuse
>> 	path =3D /glusterfs/admin-share/e_technik
>> 	shadow:snapdir =3D /glusterfs/admin-share/e_technik/.snaps
>> 	shadow:basedir =3D /glusterfs/admin-share/e_technik
>> 	shadow:sort =3D desc
>> 	shadow:snapprefix =3D ^s[A-Za-z0-9]*p1$
>> 	shadow:format =3D _GMT-%Y.%m.%d-%H.%M.%S
>>
>> [entwicklung]
>> 	comment =3D Entwicklung
>> 	guest ok =3D no
>> 	read only =3D no
>> 	vfs objects =3D acl_xattr shadow_copy2 glusterfs_fuse
>> 	path =3D /glusterfs/admin-share/entwicklung
>> 	shadow:snapdir =3D /glusterfs/admin-share/entwicklung/.snaps
>> 	shadow:basedir =3D /glusterfs/admin-share/entwicklung
>> 	shadow:sort =3D desc
>> 	shadow:snapprefix =3D ^s[A-Za-z0-9]*p1$
>> 	shadow:format =3D _GMT-%Y.%m.%d-%H.%M.%S
>>
>> [vorlagen]
>> 	comment =3D Vorlagen
>> 	guest ok =3D no
>> 	read only =3D no
>> 	vfs objects =3D acl_xattr shadow_copy2 glusterfs_fuse
>> 	path =3D /glusterfs/admin-share/vorlagen
>> 	shadow:snapdir =3D /glusterfs/admin-share/vorlagen/.snaps
>> 	shadow:basedir =3D /glusterfs/admin-share/vorlagen
>> 	shadow:sort =3D desc
>> 	shadow:snapprefix =3D ^s[A-Za-z0-9]*p1$
>> 	shadow:format =3D _GMT-%Y.%m.%d-%H.%M.%S
>>
>> [qm]
>> 	comment =3D Qualitaetsmanegement
>> 	guest ok =3D no
>> 	read only =3D no
>> 	vfs objects =3D acl_xattr shadow_copy2 glusterfs_fuse
>> 	path =3D /glusterfs/admin-share/qm
>> 	shadow:snapdir =3D /glusterfs/admin-share/qm/.snaps
>> 	shadow:basedir =3D /glusterfs/admin-share/qm
>> 	shadow:sort =3D desc
>> 	shadow:snapprefix =3D ^s[A-Za-z0-9]*p1$
>> 	shadow:format =3D _GMT-%Y.%m.%d-%H.%M.%S
>>
>> [bilder_werk]
>> 	comment =3D Bilder Werk
>> 	guest ok =3D no
>> 	read only =3D no
>> 	vfs objects =3D acl_xattr shadow_copy2 glusterfs_fuse
>> 	path =3D /glusterfs/admin-share/bilder_werk
>> 	shadow:snapdir =3D /glusterfs/admin-share/bilder_werk/.snaps
>> 	shadow:basedir =3D /glusterfs/admin-share/bilder_werk
>> 	shadow:sort =3D desc
>> 	shadow:snapprefix =3D ^s[A-Za-z0-9]*p1$
>> 	shadow:format =3D _GMT-%Y.%m.%d-%H.%M.%S
>>
>> [bilder_verkauf]
>> 	comment =3D Bilder Verkauf
>> 	guest ok =3D no
>> 	read only =3D no
>> 	vfs objects =3D acl_xattr shadow_copy2 glusterfs_fuse
>> 	path =3D /glusterfs/admin-share/bilder_verkauf
>> 	shadow:snapdir =3D /glusterfs/admin-share/bilder_verkauf/.snaps
>> 	shadow:basedir =3D /glusterfs/admin-share/bilder_verkauf
>> 	shadow:sort =3D desc
>> 	shadow:snapprefix =3D ^s[A-Za-z0-9]*p1$
>> 	shadow:format =3D _GMT-%Y.%m.%d-%H.%M.%S
>>
>> [daten_access]
>> 	comment =3D Daten Access
>> 	guest ok =3D no
>> 	read only =3D no
>> 	vfs objects =3D acl_xattr shadow_copy2 glusterfs_fuse
>> 	path =3D /glusterfs/admin-share/daten_access
>> 	shadow:snapdir =3D /glusterfs/admin-share/daten_access/.snaps
>> 	shadow:basedir =3D /glusterfs/admin-share/daten_access
>> 	shadow:sort =3D desc
>> 	shadow:snapprefix =3D ^s[A-Za-z0-9]*p1$
>> 	shadow:format =3D _GMT-%Y.%m.%d-%H.%M.%S
>>
>> [cad]
>> 	comment =3D Daten CAD
>> 	guest ok =3D no
>> 	read only =3D no
>> 	vfs objects =3D acl_xattr shadow_copy2 glusterfs_fuse
>> 	path =3D /glusterfs/admin-share/cad
>> 	shadow:snapdir =3D /glusterfs/admin-share/cad/.snaps
>> 	shadow:basedir =3D /glusterfs/admin-share/cad
>> 	shadow:sort =3D desc
>> 	shadow:snapprefix =3D ^s[A-Za-z0-9]*p1$
>> 	shadow:format =3D _GMT-%Y.%m.%d-%H.%M.%S
>> --------------
>> Any idea?
>>
>>
>> --=20
>> To unsubscribe from this list go to the following URL and read the
>> instructions:  https://lists.samba.org/mailman/options/samba
>>
>=20

--=20
Stefan Kania
Landweg 13
25693 St. Michaelisdonn


Signieren jeder E-Mail hilft Spam zu reduzieren und sch=FCtzt Ihre
Privatsph=E4re. Ein kostenfreies Zertifikat erhalten Sie unter
https://www.dgn.de/dgncert/index.html





--------------ms060505010203050805090504
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
CdEwggSUMIIDfKADAgECAggL+8ksx5aHiTANBgkqhkiG9w0BAQsFADBmMQswCQYDVQQGEwJE
RTEzMDEGA1UECgwqREdOIERldXRzY2hlcyBHZXN1bmRoZWl0c25ldHogU2VydmljZSBHbWJI
MSIwIAYDVQQDDBlkZ25zZXJ2aWNlIENBIDIgVHlwZSBFOlBOMB4XDTIwMTAxNTE2MDkzM1oX
DTIxMTAxNTE2MDkzM1owbjELMAkGA1UEBhMCREUxITAfBgNVBAUTGDQwMDAwMDAwNWY4ODc2
OWIwYTNhZjcxNDEVMBMGA1UEAwwMU3RlZmFuIEthbmlhMSUwIwYJKoZIhvcNAQkBFhZzdGVm
YW5Aa2FuaWEtb25saW5lLmRlMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA42PN
0u00/wwTf/+ER8qPo5xxrXXGf8cFzqPfgtyC037p3qW9EBI3NtoX4uehmKxwZczuad5N9liZ
oG1JwRkgoxSLJ0OSRhnWtbZete1UAASxb1JxkBo7mgvmdTLBpSGv+szqxwmpehBj3jz4Ffyc
lL6JL099HxdhQRU3/fhHR0yfaLhyddmLtApqs2GKaq7tn4ijLyuUdXCojFrd5hD+AQZQSSUt
sZRNel9u8YyY4s6FN8vJpjpVpIBJJPSKpRSo8t9ZFuR4W2BxNEEhi3f8XVw297fP1eM3gSve
99HXz6BNhEN1FMaYb02yEFfktm2TJU0QB2zSdB5PhzXhp9RfPwIDAQABo4IBPDCCATgwHQYD
VR0OBBYEFPVK3SYo2pbp3ETML1E4uO+cyxDHMAwGA1UdEwEB/wQCMAAwHwYDVR0jBBgwFoAU
6caT0dUPBmRy6mqWProQ8lRUsnkwVgYDVR0gBE8wTTBLBgwrBgEEAfsrAgEDAggwOzA5Bggr
BgEFBQcCARYtaHR0cDovL3NlYzUuZGduc2VydmljZS5kZS9wb2xpY2llcy9pbmRleC5odG1s
MD4GA1UdHwQ3MDUwM6AxoC+GLWh0dHA6Ly9zZWM1LmRnbnNlcnZpY2UuZGUvY3JsL2NybDIt
dHlwZS1lLmNybDAOBgNVHQ8BAf8EBAMCBLAwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUF
BwMEMCEGA1UdEQQaMBiBFnN0ZWZhbkBrYW5pYS1vbmxpbmUuZGUwDQYJKoZIhvcNAQELBQAD
ggEBALA4QXXB+Cg9ekdIqZ+/dyvg72AwpZNjWg0eILKUIkOLq5eYdlAr29rV9KD2OmCHtmR9
VXslKshzBcl59ZW23tifmgxAYlr7SQ5/TMWEwTPRAVidDL+KsWiCNsS1oGVbB598YhKQjNo2
zMata6Xmhy3T67L9K+jpxK7TcBxHf7vRcLgoZIPH7E0EZ0eR8KIhTHid2HeNV8syDm7E35nS
YtdtlXSFli8fU410lIRtgBsAD54fqIf9jN9c62mXURNkLRSgcNG1mYzqh0Oeqxy1hIFUiZOB
RXcKSvGvAV5cNAjZtaVxmtAFxwC3oW1T91ZfzviTZHqRn/wdBydpghnnCZowggU1MIIEHaAD
AgECAghVHErXZq0l9jANBgkqhkiG9w0BAQsFADBhMQswCQYDVQQGEwJERTEzMDEGA1UECgwq
REdOIERldXRzY2hlcyBHZXN1bmRoZWl0c25ldHogU2VydmljZSBHbWJIMR0wGwYDVQQDDBRk
Z25zZXJ2aWNlIFJvb3QgNzpQTjAeFw0xNjEwMjYwOTIyNDFaFw0yNDEwMjYwOTIyNDFaMGYx
CzAJBgNVBAYTAkRFMTMwMQYDVQQKDCpER04gRGV1dHNjaGVzIEdlc3VuZGhlaXRzbmV0eiBT
ZXJ2aWNlIEdtYkgxIjAgBgNVBAMMGWRnbnNlcnZpY2UgQ0EgMiBUeXBlIEU6UE4wggEiMA0G
CSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDcpfKUP3THo0fSl2bOa6PNbRcDYZaE4ZV3vLGr
e/U445OsRahORPeP/9L4nycTK6fUawpDTqOaDxtXYxjoJNC9LnKRxVB/UkBf0h25vN0L1iV4
KhCaY8TimV0z2yUSlb2NuZ4gdBU69qJkasqYj+AP8OcQOo0idj9Nr1eloHD32i0JDPkhBj8V
f6c6b7mNyn8yfZYvZlzzV2iQ/cvo6iFLx2wgG7mCkOZ8BAHGDFw6T0UIA0Bk60YhRMRxI7GX
jMxBQA2Y/XXoP4dvQDDtMNmK0r5DUXof87w2brXctuQ2b4xNwFIErVoAQu8ftnXTm9iOtaOs
WyLMZX6v5szaQBqBAgMBAAGjggHqMIIB5jASBgNVHRMBAf8ECDAGAQH/AgEAMB8GA1UdIwQY
MBaAFAEMFht0ctM8FO4md7dJFFPY+4sbMFsGCCsGAQUFBwEBBE8wTTBLBggrBgEFBQcwAYY/
aHR0cDovL3JvY3NwLWRnbi5kZ25zZXJ2aWNlLmRlOjgwODAvZWpiY2EvcHVibGljd2ViL3N0
YXR1cy9vY3NwMGoGA1UdIARjMGEwXwYMKwYBBAH7KwIBBAIBME8wTQYIKwYBBQUHAgEWQWh0
dHA6Ly93d3cuZGduc2VydmljZS5kZS90cnVzdGNlbnRlci9wdWJsaWMvZGduc2VydmljZS9p
bmRleC5odG1sMIGZBgNVHR8EgZEwgY4wgYuggYiggYWGgYJsZGFwOi8vbGRhcC5kZ25zZXJ2
aWNlLmRlOjM4OS9DTj1DUkwtMSxPPURHTiUyMFNlcnZpY2UlMjBHbWJILEM9REU/Y2VydGlm
aWNhdGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENsYXNzPWNSTERpc3RyaWJ1dGlvblBv
aW50MB0GA1UdDgQWBBTpxpPR1Q8GZHLqapY+uhDyVFSyeTAOBgNVHQ8BAf8EBAMCAQYwGwYJ
KwYBBAHAbQMFBA4wDAYKKwYBBAHAbQMFATANBgkqhkiG9w0BAQsFAAOCAQEAq7w5+kXJ+/xT
at0jiTX4GDX5HUeQohqAuLGfotHcqQqqjF8G6UUI0q4i0tnhHtldhZrNBOErgThGsToNZ1Y2
Gn0FRrcrUU9LnhSMwd1XJ0Je6ERSdEh4vXf8YxJQGZJPCPJcrblhue0mmwO9nbhKewGglht5
VWSHTS8vq5Da3zbxFG6lIdE62V4KqcMAiyY2BfL8guCPscTWl5txJrjb4ENo9nRqdzsXNEG3
yyzgmyv6znQ4pGgTe5E6qXx5bO6XCDoUK4Kz1S82PzR6hvcxKZo7kKK2ut2B3buwU8xqfw73
EMH8imv4LW/Sx59wKElKjijjHdNrFG/wMRobDYzMyTGCA4IwggN+AgEBMHIwZjELMAkGA1UE
BhMCREUxMzAxBgNVBAoMKkRHTiBEZXV0c2NoZXMgR2VzdW5kaGVpdHNuZXR6IFNlcnZpY2Ug
R21iSDEiMCAGA1UEAwwZZGduc2VydmljZSBDQSAyIFR5cGUgRTpQTgIIC/vJLMeWh4kwDQYJ
YIZIAWUDBAIBBQCgggHhMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkF
MQ8XDTIxMDUyMDIxMTg0MFowLwYJKoZIhvcNAQkEMSIEIFuf+OfBsRHRtRWslpo8NIVbqxoX
r49GdcraFzuAYbpPMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQB
AjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcw
DQYIKoZIhvcNAwICASgwgYEGCSsGAQQBgjcQBDF0MHIwZjELMAkGA1UEBhMCREUxMzAxBgNV
BAoMKkRHTiBEZXV0c2NoZXMgR2VzdW5kaGVpdHNuZXR6IFNlcnZpY2UgR21iSDEiMCAGA1UE
AwwZZGduc2VydmljZSBDQSAyIFR5cGUgRTpQTgIIC/vJLMeWh4kwgYMGCyqGSIb3DQEJEAIL
MXSgcjBmMQswCQYDVQQGEwJERTEzMDEGA1UECgwqREdOIERldXRzY2hlcyBHZXN1bmRoZWl0
c25ldHogU2VydmljZSBHbWJIMSIwIAYDVQQDDBlkZ25zZXJ2aWNlIENBIDIgVHlwZSBFOlBO
AggL+8ksx5aHiTANBgkqhkiG9w0BAQEFAASCAQCwSH7uFDopzvrJWdveuNEPFuNeYCyFKCTz
vlULyoSQBdm5gu5jPdebMeDqc+fLLKzy875LnDhbI2GnFw7QxYNqyHUAAtPVfuycyuHsL3s2
XenWCEQsZ2EqIzY86hm4B/dJ7g/f8Velg5TuFh5ghuMhaUL6nIoO2RP9qyAiMxMQVVnK2wj/
BZ4aLTzu7Ir2BiOg4Df3xq+NydtwtafMlLvehTo8a/yokYBaVB4OthHP7QLESDmSFo1s75Gv
RhysHQhpTwT7iORWX7zH7ppaTbxjciwTHvnZ3CTb3G3Ki/CGTdS17PLHQ0V2QBoZSAzuaS0y
agAdo9ts+ATqh300A3QXAAAAAAAA
--------------ms060505010203050805090504--

