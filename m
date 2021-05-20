Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D3B38ADA4
	for <lists+samba-technical@lfdr.de>; Thu, 20 May 2021 14:08:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=H0S68IFtgScZF+aRL9Ik/+dGkQaDPE6K/mEfxWOiWJY=; b=3d36uVQs3RJs5StXkb6/2HgnZs
	zWmNgN2/Y+7IQe6h54Fr0HPtHKIFd0ZmSMwTON6NwC4PhOJ5WF+szaAS9yDM04JOpDq/L8IYcOKCe
	GMm1otHonr9JBYyrxH8boUMwSCgpPmFAp2BL96GIZOr5rZWAqQ9Gy5rOE1bVReoU7GdpKSOIKvExX
	H+CVR6Lpk0LSfNzO9OltbyFxI6AUWxizy2zCrOf8icGikZthnNwXWk2q2clk5mLuiYN6XcBQtQHsH
	GvcWltxfuLaXwucH9EpnBz4I5SUUSUMHv0UASOVQn+Fg40k7kgV6c2+vOj5FByHud/O9oTDn9ACxB
	qW4D2Mow==;
Received: from ip6-localhost ([::1]:22038 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ljhTk-002734-Jm; Thu, 20 May 2021 12:08:40 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:60170) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ljhTe-00272r-9K; Thu, 20 May 2021 12:08:37 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1622117299.00434@BAxhYfB//+0eVAo/MPqEZA
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: 7975811F11A.A8C0C
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id 7975811F11A;
 Thu, 20 May 2021 14:08:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1621512498;
 bh=Oy6yzRW+oQSgR5vVxu6pfFfQ3JY5Zc0Dx1FaWm+qu/A=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=EiruBAkf89xOEjMtD2XrLcQkr0iBchY3KNx4qb5368eiDChxRfnewrfMc6+bRibLg
 ybhc+7aigZR3YyQhSpEV/UyLG+25X+tHt4Q8Keeg5ueS8LBHZnZ634TqlhbF93FAER
 mv8mmFJvmuqK1sEjkU82TnnaVY4vcfGROwsPWYmW4Pv5VD04XgB1ImXxkmPsCrpP+e
 K3iduUaahOlcXu8kTx3q8rIwcmImJIjqa+4BQK/hmN/SSUazX73GwtjCv2wfBwiqPz
 cH8hZnViYPdZ3QROJoKcSVfIGA51IpY3fba86rKvQt/ey9qvgwvmCaXZcbFyx2KeTs
 N9k8qMvak8SBg==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id E420518C22F5;
 Thu, 20 May 2021 14:08:24 +0200 (CEST)
Subject: RE: [Samba] share creates core-dump
To: =?windows-1252?Q?samba=40lists.samba.org?= <samba@lists.samba.org>, 
 =?windows-1252?Q?samba-technical=40lists.samba.org?=
 <samba-technical@lists.samba.org>
Date: Thu, 20 May 2021 14:08:24 +0200
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e5417f20-f6ae-cde7-72d1-6c501589aace@kania-online.de>
References: <e5417f20-f6ae-cde7-72d1-6c501589aace@kania-online.de>
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: AddNcNVA08pHBwPFSN6kppmeUYetAQ==
Message-Id: <vmime.60a65138.2f3d.11f2e888628038b8@ms249-lin-003.rotterdam.bazuin.nl>
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
Cc: =?windows-1252?Q?Stefan_Kania?= <stefan@kania-online.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hai Stefan,=20

Any ramdisk use=3F There is and old bug on that. #8935 but i dont think thats related.=20

And can you try to reproduce with my packages=3F=20
I dont know which talloc version is used on ubuntu by sernet with samba.=20
But i do have latest talloc running in my packages.=20

A quick google on : samba panic "unable to get back to old directory"
Only shows 2 hits, reffering to : https://ftp.samba.org/pub/unpacked/samba_master/source3/smbd/open.c=20

This part.=20
out:

=09TALLOC_FREE(resolved_fname);
=09TALLOC_FREE(link_target);
=09if (oldwd_fname !=3D NULL) {
=09=09int ret =3D vfs_ChDir(conn, oldwd_fname);
=09=09if (ret =3D=3D -1) {
=09=09=09smb_panic("unable to get back to old directory\n");
=09=09}
=09=09TALLOC_FREE(oldwd_fname);
=09}

=09return status;

And this part.

out:
=09fsp->fsp_name =3D orig_fsp_name;
=09if (fsp->base_fsp !=3D NULL) {
=09=09fsp->base_fsp->fsp_name =3D orig_base_fsp_name;
=09}
=09TALLOC_FREE(parent_dir_fname);

=09if (oldwd_fname !=3D NULL) {
=09=09ret =3D vfs_ChDir(conn, oldwd_fname);
=09=09if (ret =3D=3D -1) {
=09=09=09smb_panic("unable to get back to old directory\n");
=09=09}
=09=09TALLOC_FREE(oldwd_fname);
=09}
=09return status;

But this is more for one of the developers/coders to look at.=20

So far,=20

Greetz,=20

Louis



> -----Oorspronkelijk bericht-----
> Van: samba [mailto:samba-bounces@lists.samba.org] Namens=20
> Stefan Kania via samba
> Verzonden: donderdag 20 mei 2021 13:48
> Aan: samba@lists.samba.org
> Onderwerp: [Samba] share creates core-dump
>=20
> Hi to all,
> I have a Proplem with a CTDB-Cluster with GlusterFS. Several=20
> times users
> cant access there profile. When I take a look at the=20
> directory, there is
> a core-file. As soon as I delete the core-files with:
>=20
>  find /glusterfs -name core -type f -exec rm -rv {} \;
>=20
> everything is working again.
> I see the following messages in the log:
> ---------------------
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [2021/05/20 05:48:47.308898,  0]=20
> ../../lib/util/fault.c:170(smb_panic_log)
>   PANIC (pid 3133648): unable to get back to old directory
>    in 4.13.7-SerNet-Ubuntu-11.focal
> [2021/05/20 05:48:47.385760,  0]=20
> ../../lib/util/fault.c:274(log_stack_trace)
>   BACKTRACE: 33 stack frames:
>    #0
> /usr/lib/x86_64-linux-gnu/samba/libsamba-util.so.0(log_stack_t
> race+0x34)
> [0x7f6059d71c59]
>    #1
> /usr/lib/x86_64-linux-gnu/samba/libsamba-util.so.0(smb_panic_log+0x5f)
> [0x7f6059d71d8f]
>    #2=20
> /usr/lib/x86_64-linux-gnu/samba/libsamba-util.so.0(smb_panic+0x27)
> [0x7f6059d71ef5]
>    #3=20
> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(+0x1ab6aa)
> [0x7f6059ba16aa]
>    #4
> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(fd_open+0x67)
> [0x7f6059ba2a6d]
>    #5
> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(fd_openat+0x88)
> [0x7f6059ba2cc8]
>    #6=20
> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(+0x1ad62a)
> [0x7f6059ba362a]
>    #7=20
> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(+0x1b2531)
> [0x7f6059ba8531]
>    #8
> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(create_
> file_default+0x32f)
> [0x7f6059baa7c6]
>    #9=20
> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(+0x144e27)
> [0x7f6059b3ae27]
>    #10
> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(smb_vfs
> _call_create_file+0x74)
> [0x7f6059bb150d]
>    #11
> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(smbd_sm
> b2_request_process_create+0x1156)
> [0x7f6059be4d3a]
>    #12
> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(smbd_sm
> b2_request_dispatch+0x14fd)
> [0x7f6059bd9d61]
>    #13=20
> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(+0x1e5b80)
> [0x7f6059bdbb80]
>    #14
> /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(tevent_common_i
> nvoke_fd_handler+0x85)
> [0x7f60599d850d]
>    #15 /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(+0xdcd4)
> [0x7f60599decd4]
>    #16 /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(+0xb8af)
> [0x7f60599dc8af]
>    #17
> /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(_tevent_loop_once+0xa6)
> [0x7f60599d7cd0]
>    #18
> /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(tevent_common_l
> oop_wait+0x25)
> [0x7f60599d7ed7]
>    #19 /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(+0xb859)
> [0x7f60599dc859]
>    #20
> /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(_tevent_loop_wait+0xe)
> [0x7f60599d7f37]
>    #21
> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(smbd_pr
> ocess+0x9af)
> [0x7f6059bc809c]
>    #22 /usr/sbin/smbd(+0xdf97) [0x559603ddef97]
>    #23
> /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(tevent_common_i
> nvoke_fd_handler+0x85)
> [0x7f60599d850d]
>    #24 /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(+0xdcd4)
> [0x7f60599decd4]
>    #25 /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(+0xb8af)
> [0x7f60599dc8af]
>    #26
> /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(_tevent_loop_once+0xa6)
> [0x7f60599d7cd0]
>    #27
> /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(tevent_common_l
> oop_wait+0x25)
> [0x7f60599d7ed7]
>    #28 /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(+0xb859)
> [0x7f60599dc859]
>    #29
> /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(_tevent_loop_wait+0xe)
> [0x7f60599d7f37]
>    #30 /usr/sbin/smbd(main+0x1973) [0x559603de0a8c]
>    #31 /lib/x86_64-linux-gnu/libc.so.6(__libc_start_main+0xf3)
> [0x7f60593180b3]
>    #32 /usr/sbin/smbd(_start+0x2e) [0x559603dd90ce]
> [2021/05/20 05:48:47.386307,  0]=20
> ../../source3/lib/util.c:838(smb_panic_s3)
>   smb_panic(): calling panic action
> [/usr/share/samba/scripts/panic-action 3133648]
> mail: cannot stat `/glusterfs/home/w008_/.mail': Permission denied
> mail: Cannot open `/glusterfs/home/w008_/.mailrc': Permission denied
> [2021/05/20 05:48:47.609018,  0]=20
> ../../source3/lib/util.c:845(smb_panic_s3)
>   smb_panic(): action returned status 0
> [2021/05/20 05:48:47.609126,  0]=20
> ../../source3/lib/dumpcore.c:317(dump_core)
>   coredump is handled by helper binary specified at
> /proc/sys/kernel/core_pattern
> [2021/05/20 05:48:48.609979,  0]
> ../../source3/smbd/service.c:166(chdir_current_service)
>   chdir_current_service: vfs_ChDir(/glusterfs/profiles) failed:
> Permission denied. Current token: uid=3D202296, gid=3D100515, 5 groups:
> 202296 100515 10003 10004 10006
> [2021/05/20 05:49:21.701302,  0]
> ../../source3/smbd/service.c:166(chdir_current_service)
>   chdir_current_service: vfs_ChDir(/glusterfs/profiles) failed:
> Permission denied. Current token: uid=3D203773, gid=3D100515, 5 groups:
> 203773 100515 10003 10004 10006
> [2021/05/20 05:50:26.390966,  0]
> ../../source3/smbd/service.c:166(chdir_current_service)
>   chdir_current_service:=20
> vfs_ChDir(/glusterfs/admin-share/allg_verkauf)
> failed: Permission denied. Current token: uid=3D103036, gid=3D100513, 7
> groups: 103036 100513 107007 10003 10004 10006 10001
> [2021/05/20 05:50:26.391469,  0]
> ../../source3/smbd/service.c:166(chdir_current_service)
>   chdir_current_service: vfs_ChDir(/glusterfs/admin-share/cad) failed:
> Permission denied. Current token: uid=3D103036, gid=3D100513, 7 groups:
> 103036 100513 107007 10003 10004 10006 10001
> [2021/05/20 05:50:26.391711,  0]
> ../../source3/smbd/service.c:166(chdir_current_service)
>   chdir_current_service: vfs_ChDir(/glusterfs/admin-share/e_technik)
> failed: Permission denied. Current token: uid=3D103036, gid=3D100513, 7
> groups: 103036 100513 107007 10003 10004 10006 10001
> [2021/05/20 05:50:26.392287,  0]
> ../../source3/smbd/service.c:166(chdir_current_service)
>   chdir_current_service: vfs_ChDir(/glusterfs/admin-share/entwicklung)
> failed: Permission denied. Current token: uid=3D103036, gid=3D100513, 7
> groups: 103036 100513 107007 10003 10004 10006 10001
> [2021/05/20 05:50:26.392680,  0]
> ../../source3/smbd/service.c:166(chdir_current_service)
>   chdir_current_service: vfs_ChDir(/glusterfs/admin-share/qm) failed:
> Permission denied. Current token: uid=3D103036, gid=3D100513, 7 groups:
> 103036 100513 107007 10003 10004 10006 10001
> [2021/05/20 05:50:26.392941,  0]
> ../../source3/smbd/service.c:166(chdir_current_service)
>   chdir_current_service: vfs_ChDir(/glusterfs/admin-share/install)
> failed: Permission denied. Current token: uid=3D103036, gid=3D100513, 7
> groups: 103036 100513 107007 10003 10004 10006 10001
> [2021/05/20 05:54:24.841494,  0]
> ../../source3/smbd/service.c:166(chdir_current_service)
>   chdir_current_service: vfs_ChDir(/glusterfs/profiles) failed:
> Permission denied. Current token: uid=3D203293, gid=3D100515, 5 groups:
> 203293 100515 10003 10004 10006
> [2021/05/20 05:54:24.843205,  0]
> ../../source3/smbd/service.c:166(chdir_current_service)
>   chdir_current_service: vfs_ChDir(/glusterfs/profiles) failed:
> Permission denied. Current token: uid=3D203293, gid=3D100515, 5 groups:
> 203293 100515 10003 10004 10006
> [2021/05/20 06:15:22.372151,  0]
> ../../source3/smbd/service.c:166(chdir_current_service)
>   chdir_current_service: vfs_ChDir(/glusterfs/home) failed: Permission
> denied. Current token: uid=3D203290, gid=3D100515, 5 groups: 203290 100515
> 10003 10004 10006
> [2021/05/20 06:15:22.372634,  0]
> ../../source3/smbd/service.c:166(chdir_current_service)
>   chdir_current_service: vfs_ChDir(/glusterfs/home) failed: Permission
> denied. Current token: uid=3D203290, gid=3D100515, 5 groups: 203290 100515
> 10003 10004 10006
> [2021/05/20 06:15:22.410049,  0]=20
> ../../lib/util/fault.c:159(smb_panic_log)
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [2021/05/20 06:15:22.410132,  0]=20
> ../../lib/util/fault.c:160(smb_panic_log)
>   INTERNAL ERROR: unable to get back to old directory
>    in pid 3144131 (4.13.7-SerNet-Ubuntu-11.focal)
> [2021/05/20 06:15:22.410189,  0]=20
> ../../lib/util/fault.c:164(smb_panic_log)
>   If you are running a recent Samba version, and if you think this
> problem is not yet fixed in the latest versions, please consider
> reporting this bug, see https://wiki.samba.org/index.php/Bug_Reporting
> [2021/05/20 06:15:22.410225,  0]=20
> ../../lib/util/fault.c:169(smb_panic_log)
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [2021/05/20 06:35:46.178550,  0]=20
> ../../lib/util/fault.c:170(smb_panic_log)
>   PANIC (pid 3152237): unable to get back to old directory
>    in 4.13.7-SerNet-Ubuntu-11.focal
> [2021/05/20 06:35:46.179395,  0]=20
> ../../lib/util/fault.c:274(log_stack_trace)
>   BACKTRACE: 33 stack frames:
>    #0
> /usr/lib/x86_64-linux-gnu/samba/libsamba-util.so.0(log_stack_t
> race+0x34)
> [0x7f6059d71c59]
>    #1
> /usr/lib/x86_64-linux-gnu/samba/libsamba-util.so.0(smb_panic_log+0x5f)
> [0x7f6059d71d8f]
>    #2=20
> /usr/lib/x86_64-linux-gnu/samba/libsamba-util.so.0(smb_panic+0x27)
> [0x7f6059d71ef5]
>    #3=20
> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(+0x1ab6aa)
> [0x7f6059ba16aa]
>    #4
> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(fd_open+0x67)
> [0x7f6059ba2a6d]
>    #5
> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(fd_openat+0x88)
> [0x7f6059ba2cc8]
>    #6=20
> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(+0x1ad62a)
> [0x7f6059ba362a]
>    #7=20
> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(+0x1b2531)
> [0x7f6059ba8531]
>    #8
> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(create_
> file_default+0x32f)
> [0x7f6059baa7c6]
>    #9=20
> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(+0x144e27)
> [0x7f6059b3ae27]
>    #10
> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(smb_vfs
> _call_create_file+0x74)
> [0x7f6059bb150d]
>    #11
> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(smbd_sm
> b2_request_process_create+0x1156)
> [0x7f6059be4d3a]
>    #12
> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(smbd_sm
> b2_request_dispatch+0x14fd)
> [0x7f6059bd9d61]
>    #13=20
> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(+0x1e5b80)
> [0x7f6059bdbb80]
>    #14
> /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(tevent_common_i
> nvoke_fd_handler+0x85)
> [0x7f60599d850d]
>    #15 /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(+0xdcd4)
> [0x7f60599decd4]
>    #16 /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(+0xb8af)
> [0x7f60599dc8af]
>    #17
> /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(_tevent_loop_once+0xa6)
> [0x7f60599d7cd0]
>    #18
> /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(tevent_common_l
> oop_wait+0x25)
> [0x7f60599d7ed7]
>    #19 /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(+0xb859)
> [0x7f60599dc859]
>    #20
> /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(_tevent_loop_wait+0xe)
> [0x7f60599d7f37]
>    #21
> /usr/lib/x86_64-linux-gnu/samba/libsmbd-base-samba4.so(smbd_pr
> ocess+0x9af)
> [0x7f6059bc809c]
>    #22 /usr/sbin/smbd(+0xdf97) [0x559603ddef97]
>    #23
> /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(tevent_common_i
> nvoke_fd_handler+0x85)
> [0x7f60599d850d]
>    #24 /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(+0xdcd4)
> [0x7f60599decd4]
>    #25 /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(+0xb8af)
> [0x7f60599dc8af]
>    #26
> /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(_tevent_loop_once+0xa6)
> [0x7f60599d7cd0]
>    #27
> /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(tevent_common_l
> oop_wait+0x25)
> [0x7f60599d7ed7]
>    #28 /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(+0xb859)
> [0x7f60599dc859]
>    #29
> /usr/lib/x86_64-linux-gnu/samba/libtevent.so.0(_tevent_loop_wait+0xe)
> [0x7f60599d7f37]
>    #30 /usr/sbin/smbd(main+0x1973) [0x559603de0a8c]
>    #31 /lib/x86_64-linux-gnu/libc.so.6(__libc_start_main+0xf3)
> [0x7f60593180b3]
>    #32 /usr/sbin/smbd(_start+0x2e) [0x559603dd90ce]
> [2021/05/20 06:35:46.179923,  0]=20
> ../../source3/lib/util.c:838(smb_panic_s3)
>   smb_panic(): calling panic action
> [/usr/share/samba/scripts/panic-action 3152237]
> mail: cannot stat `/glusterfs/home/w141_/.mail': Permission denied
> mail: Cannot open `/glusterfs/home/w141_/.mailrc': Permission denied
> [2021/05/20 06:35:46.301704,  0]=20
> ../../source3/lib/util.c:845(smb_panic_s3)
>   smb_panic(): action returned status 0
> [2021/05/20 06:35:46.301833,  0]=20
> ../../source3/lib/dumpcore.c:317(dump_core)
>   coredump is handled by helper binary specified at
> /proc/sys/kernel/core_pattern
> [2021/05/20 06:35:47.104243,  0]
> ../../source3/smbd/service.c:166(chdir_current_service)
>   chdir_current_service: vfs_ChDir(/glusterfs/profiles) failed:
> Permission denied. Current token: uid=3D203302, gid=3D100515, 5 groups:
> 203302 100515 10003 10004 10006
> [2021/05/20 06:40:41.021829,  0]
> ../../source3/smbd/service.c:166(chdir_current_service)
>   chdir_current_service: vfs_ChDir(/glusterfs/home) failed: Permission
> denied. Current token: uid=3D203285, gid=3D100515, 5 groups: 203285 100515
> 10003 10004 10006
> [2021/05/20 06:53:13.351134,  0]
> ../../source3/smbd/service.c:166(chdir_current_service)
>   chdir_current_service: vfs_ChDir(/glusterfs/profiles) failed:
> Permission denied. Current token: uid=3D203778, gid=3D100515, 5 groups:
> 203778 100515 10003 10004 10006
> [2021/05/20 06:54:06.087034,  0]=20
> ../../lib/util/fault.c:159(smb_panic_log)
> ---------------------
> As you can see in thr look it's a 4.13.7 from Sernet. Here is=20
> the smb.conf.
> --------------
> global]
> =09workgroup =3D NTD
> =09realm =3D NTD.TEST
> =09netbios name =3D fs1
> =09security =3D ads
> =09winbind use default domain =3D yes
> =09winbind refresh tickets =3D yes
> =09idmap config * : range =3D 10000-19999
> =09idmap config NTD : backend =3D rid
> =09idmap config NTD : range =3D 100000-199999999999999
> =09inherit acls =3D yes
> =09vfs objects =3D acl_xattr
> =09template homedir =3D /glusterfs/home/%U
>=20
> [profiles]
> =09comment =3D Benutzerprofile
> =09read only =3D no
> =09browseable =3D no
> =09path =3D /glusterfs/profiles
> =09vfs objects =3D acl_xattr glusterfs_fuse
>=20
> [users]
> =09comment =3D Basisverzeichnisse
> =09path =3D /glusterfs/home
> =09vfs objects =3D acl_xattr shadow_copy2 glusterfs_fuse
> =09browseable =3D no
> =09read only =3D no
> =09shadow:snapdir =3D /glusterfs/home/.snaps
> =09shadow:basedir =3D /glusterfs/home
> =09shadow:sort =3D desc
> =09shadow:snapprefix =3D ^s[A-Za-z0-9]*p1$
> =09shadow:format =3D _GMT-%Y.%m.%d-%H.%M.%S
>=20
> [admin-share]
> =09comment =3D Nur fuer admins
> =09guest ok =3D no
> =09read only =3D no
> =09vfs objects =3D acl_xattr shadow_copy2 glusterfs_fuse
> =09path =3D /glusterfs/admin-share
> =09shadow:snapdir =3D /glusterfs/admin-share/.snaps
> =09shadow:basedir =3D /glusterfs/admin-share
> =09shadow:sort =3D desc
> =09shadow:snapprefix =3D ^s[A-Za-z0-9]*p1$
> =09shadow:format =3D _GMT-%Y.%m.%d-%H.%M.%S
>=20
> [allg_werk]
> =09comment =3D Qualitaetsmanegement
> =09guest ok =3D no
> =09read only =3D no
> =09vfs objects =3D acl_xattr shadow_copy2 glusterfs_fuse
> =09path =3D /glusterfs/admin-share/allg_werk
> =09shadow:snapdir =3D /glusterfs/admin-share/allg_werk/.snaps
> =09shadow:basedir =3D /glusterfs/admin-share/allg_werk
> =09shadow:sort =3D desc
> =09shadow:snapprefix =3D ^s[A-Za-z0-9]*p1$
> =09shadow:format =3D _GMT-%Y.%m.%d-%H.%M.%S
>=20
> [allg_verkauf]
> =09comment =3D Qualitaetsmanegement
> =09guest ok =3D no
> =09read only =3D no
> =09vfs objects =3D acl_xattr shadow_copy2 glusterfs_fuse
> =09path =3D /glusterfs/admin-share/allg_verkauf
> =09shadow:snapdir =3D /glusterfs/admin-share/allg_verkauf/.snaps
> =09shadow:basedir =3D /glusterfs/admin-share/allg_verkauf
> =09shadow:sort =3D desc
> =09shadow:snapprefix =3D ^s[A-Za-z0-9]*p1$
> =09shadow:format =3D _GMT-%Y.%m.%d-%H.%M.%S
>=20
> [install]
> =09comment =3D Installationsfreigabe
> =09guest ok =3D no
> =09read only =3D no
> =09vfs objects =3D acl_xattr shadow_copy2 glusterfs_fuse
> =09path =3D /glusterfs/admin-share/install
> =09shadow:snapdir =3D /glusterfs/admin-share/install/.snaps
> =09shadow:basedir =3D /glusterfs/admin-share/install
> =09shadow:sort =3D desc
> =09shadow:snapprefix =3D ^s[A-Za-z0-9]*p1$
> =09shadow:format =3D _GMT-%Y.%m.%d-%H.%M.%S
>=20
> [e_technik]
> =09comment =3D E-Technik
> =09guest ok =3D no
> =09read only =3D no
> =09vfs objects =3D acl_xattr shadow_copy2 glusterfs_fuse
> =09path =3D /glusterfs/admin-share/e_technik
> =09shadow:snapdir =3D /glusterfs/admin-share/e_technik/.snaps
> =09shadow:basedir =3D /glusterfs/admin-share/e_technik
> =09shadow:sort =3D desc
> =09shadow:snapprefix =3D ^s[A-Za-z0-9]*p1$
> =09shadow:format =3D _GMT-%Y.%m.%d-%H.%M.%S
>=20
> [entwicklung]
> =09comment =3D Entwicklung
> =09guest ok =3D no
> =09read only =3D no
> =09vfs objects =3D acl_xattr shadow_copy2 glusterfs_fuse
> =09path =3D /glusterfs/admin-share/entwicklung
> =09shadow:snapdir =3D /glusterfs/admin-share/entwicklung/.snaps
> =09shadow:basedir =3D /glusterfs/admin-share/entwicklung
> =09shadow:sort =3D desc
> =09shadow:snapprefix =3D ^s[A-Za-z0-9]*p1$
> =09shadow:format =3D _GMT-%Y.%m.%d-%H.%M.%S
>=20
> [vorlagen]
> =09comment =3D Vorlagen
> =09guest ok =3D no
> =09read only =3D no
> =09vfs objects =3D acl_xattr shadow_copy2 glusterfs_fuse
> =09path =3D /glusterfs/admin-share/vorlagen
> =09shadow:snapdir =3D /glusterfs/admin-share/vorlagen/.snaps
> =09shadow:basedir =3D /glusterfs/admin-share/vorlagen
> =09shadow:sort =3D desc
> =09shadow:snapprefix =3D ^s[A-Za-z0-9]*p1$
> =09shadow:format =3D _GMT-%Y.%m.%d-%H.%M.%S
>=20
> [qm]
> =09comment =3D Qualitaetsmanegement
> =09guest ok =3D no
> =09read only =3D no
> =09vfs objects =3D acl_xattr shadow_copy2 glusterfs_fuse
> =09path =3D /glusterfs/admin-share/qm
> =09shadow:snapdir =3D /glusterfs/admin-share/qm/.snaps
> =09shadow:basedir =3D /glusterfs/admin-share/qm
> =09shadow:sort =3D desc
> =09shadow:snapprefix =3D ^s[A-Za-z0-9]*p1$
> =09shadow:format =3D _GMT-%Y.%m.%d-%H.%M.%S
>=20
> [bilder_werk]
> =09comment =3D Bilder Werk
> =09guest ok =3D no
> =09read only =3D no
> =09vfs objects =3D acl_xattr shadow_copy2 glusterfs_fuse
> =09path =3D /glusterfs/admin-share/bilder_werk
> =09shadow:snapdir =3D /glusterfs/admin-share/bilder_werk/.snaps
> =09shadow:basedir =3D /glusterfs/admin-share/bilder_werk
> =09shadow:sort =3D desc
> =09shadow:snapprefix =3D ^s[A-Za-z0-9]*p1$
> =09shadow:format =3D _GMT-%Y.%m.%d-%H.%M.%S
>=20
> [bilder_verkauf]
> =09comment =3D Bilder Verkauf
> =09guest ok =3D no
> =09read only =3D no
> =09vfs objects =3D acl_xattr shadow_copy2 glusterfs_fuse
> =09path =3D /glusterfs/admin-share/bilder_verkauf
> =09shadow:snapdir =3D /glusterfs/admin-share/bilder_verkauf/.snaps
> =09shadow:basedir =3D /glusterfs/admin-share/bilder_verkauf
> =09shadow:sort =3D desc
> =09shadow:snapprefix =3D ^s[A-Za-z0-9]*p1$
> =09shadow:format =3D _GMT-%Y.%m.%d-%H.%M.%S
>=20
> [daten_access]
> =09comment =3D Daten Access
> =09guest ok =3D no
> =09read only =3D no
> =09vfs objects =3D acl_xattr shadow_copy2 glusterfs_fuse
> =09path =3D /glusterfs/admin-share/daten_access
> =09shadow:snapdir =3D /glusterfs/admin-share/daten_access/.snaps
> =09shadow:basedir =3D /glusterfs/admin-share/daten_access
> =09shadow:sort =3D desc
> =09shadow:snapprefix =3D ^s[A-Za-z0-9]*p1$
> =09shadow:format =3D _GMT-%Y.%m.%d-%H.%M.%S
>=20
> [cad]
> =09comment =3D Daten CAD
> =09guest ok =3D no
> =09read only =3D no
> =09vfs objects =3D acl_xattr shadow_copy2 glusterfs_fuse
> =09path =3D /glusterfs/admin-share/cad
> =09shadow:snapdir =3D /glusterfs/admin-share/cad/.snaps
> =09shadow:basedir =3D /glusterfs/admin-share/cad
> =09shadow:sort =3D desc
> =09shadow:snapprefix =3D ^s[A-Za-z0-9]*p1$
> =09shadow:format =3D _GMT-%Y.%m.%d-%H.%M.%S
> --------------
> Any idea=3F
>=20
>=20
> --=20
> To unsubscribe from this list go to the following URL and read the
> instructions:  https://lists.samba.org/mailman/options/samba
>=20


