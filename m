Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7292113B527
	for <lists+samba-technical@lfdr.de>; Tue, 14 Jan 2020 23:14:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:Date:To;
	bh=WrzcLaJCIsGh+Pc4IkWjnzyZbbdjFd9Q5+TWRiQRUaY=; b=PoaVZw0qQ0UhvqUvwRMR9iQFLF
	ldmUQ0SovQE8fQd+KvTKX797flgCsCauGMMvHpUQoCgoxLm4qN6ltEk0LSKWJKJzhlQE2laspTxbS
	Qwo3ReIEhZ4GGysbEqgAIxgFce1CR0L1/PVOghrawlrapafzQEMrUGs6Fz15xF/X74p8CqNV9aT7t
	P5FqE8HX8c8FosdkL7UaqtaZdpLZkLT14EIggkjXG3/BJ2eGZ6pkZ0cMQZ3bMp3NKAxbqtO+VM/zR
	arj/NxFkBqrKusdIPZK0l9TQrtz7RwFwXj7p3M6PeJLQan/xgFporcbarIYM+AAtMPjKGG8haQ4Vu
	0AzceclA==;
Received: from localhost ([::1]:23294 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1irURj-003SV8-KQ; Tue, 14 Jan 2020 22:13:59 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:27716) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1irURe-003SV0-Hk
 for samba-technical@lists.samba.org; Tue, 14 Jan 2020 22:13:57 +0000
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00EMCngc135019; Tue, 14 Jan 2020 17:13:50 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xhbps0xwd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jan 2020 17:13:50 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00EMDlqU021967;
 Tue, 14 Jan 2020 22:13:49 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02wdc.us.ibm.com with ESMTP id 2xf750gcwc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jan 2020 22:13:49 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00EMDmsP66585008
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jan 2020 22:13:48 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 012CB6A0B4;
 Tue, 14 Jan 2020 22:13:48 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C579F6A0AC;
 Tue, 14 Jan 2020 22:13:47 +0000 (GMT)
Received: from mail.gmx.ibm.com (unknown [9.209.244.200])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 14 Jan 2020 22:13:47 +0000 (GMT)
Received: from m01ex005.gmx.ibm.com (10.148.53.45) by m01ex007.gmx.ibm.com
 (10.183.153.186) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Tue, 14 Jan
 2020 16:13:34 -0600
Received: from m01ex005.gmx.ibm.com ([fe80::7d2d:476:2d5a:cb2f]) by
 m01ex005.gmx.ibm.com ([fe80::7d2d:476:2d5a:cb2f%9]) with mapi id
 15.01.1779.002; Tue, 14 Jan 2020 16:13:29 -0600
To: Jeremy Allison <jra@samba.org>
Thread-Topic: [EXTERNAL] Re: Port knock of 445 prevents smbd from starting
Thread-Index: AQHVyx9AitqUBvVdV0i8bf/gHBfTHafrGUKA//+fncc=
Date: Tue, 14 Jan 2020 22:13:28 +0000
Message-ID: <cb951458c2004bf7a39ab19f0f49916b@ibm.com>
References: <041d851df04040098cd3576cb2b91118@ibm.com>,
 <20200114215623.GE217935@jra4>
In-Reply-To: <20200114215623.GE217935@jra4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [9.16.14.36]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re:  Re: Port knock of 445 prevents smbd from starting
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: "Christopher O Cowan - Christopher.O.Cowan--- via samba-technical"
 <samba-technical@lists.samba.org>
Reply-To: "Christopher O Cowan - Christopher.O.Cowan@ibm.com"
 <Christopher.O.Cowan@ibm.com>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Sorry, that's my commit of Amitay's patch.

Here's the compile I did:
So it should say de768710e16

---------------------------------------------------------------------------=
---------------------------------------------------

commit 375ee2d8fee (HEAD -> J2020-01-14, dev-gsa-I)
Author: Christopher Cowan <christopher.o.cowan@ibm.com>
Date:   Fri Sep 6 10:50:16 2019 -0500

    Amitay's ctdb_recovery_helper.c debugging changes

 ctdb/server/ctdb_recovery_helper.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

commit cebb451491a
Author: Christopher Cowan <christopher.o.cowan@ibm.com>
Date:   Fri Jul 26 10:09:44 2019 -0500

    Call out GNU/freeware timeout utility explicitly

 ctdb/config/events/legacy/00.ctdb.script | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

commit de768710e16 (upstream/master, upstream/HEAD, master, develop)
Author: Bj=F6rn Jacke <bj@sernet.de>
Date:   Mon Jan 13 13:02:29 2020 +0100

    tests/DNS: add MX/SRV record tests with multiple spaces

    BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D13788

    Signed-off-by: Bjoern Jacke <bjacke@samba.org>
    Reviewed-by: Bj=F6rn Baumbach <bb@samba.org>

    Autobuild-User(master): Bj=F6rn Baumbach <bb@sernet.de>
    Autobuild-Date(master): Tue Jan 14 11:58:20 UTC 2020 on sn-devel-184

 python/samba/tests/samba_tool/dnscmd.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

commit af7a0e3371e
Author: Bj=F6rn Jacke <bj@sernet.de>
Date:   Mon Jan 13 00:21:41 2020 +0100

    samba-tool: fix adding of dns SRV/MX/SOA records

    Thanks to Denis Cardon for finding

    BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D13788

    Signed-off-by: Bjoern Jacke <bjacke@samba.org>
    Reviewed-by: Andreas Schneider <asn@samba.org>
    Reviewed-by: Bj=F6rn Baumbach <bb@samba.org>

 python/samba/netcmd/dns.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)



________________________________
From: Jeremy Allison <jra@samba.org>
Sent: Tuesday, January 14, 2020 3:56:23 PM
To: Christopher O Cowan - Christopher.O.Cowan@ibm.com
Cc: samba-technical@lists.samba.org
Subject: [EXTERNAL] Re: Port knock of 445 prevents smbd from starting

On Tue, Jan 14, 2020 at 09:26:24PM +0000, Christopher O Cowan - Christopher=
.O.Cowan--- via samba-technical wrote:
> In our cluster setup here, we use a load-balancer in front of our ctdb cl=
uster to steer the SMB traffic.
> We've been doing this for years.    It does a simple TCP connect on 445 t=
o verify that each node's smbd is still alive.
>
> This is all on AIX, and some time, in the past few weeks these knocks sta=
rted causing smbd to exit.   Here's the output from an smbd -i -d10.
>
> First I see this (x.y.z.219 is the address of the LB.  202 is the server)=
.    I changed the addresses
>
> -------------------------------------------------------------------------=
----------------------------------------------------------------
>
> Allowed connection from x.y.z.219 (x.y.z.219)
> Connection allowed from ipv4:x.y.z.219:49463 to ipv4:x.y.z.202:445
> ctdbd_control: Sending ctdb packet reqid=3D7, vnn=3D4026531841, opcode=3D=
23, srvid=3D17509995351216488448
> ctdbd_control: Sending ctdb packet reqid=3D8, vnn=3D4026531841, opcode=3D=
44, srvid=3D0
> INFO: Current debug levels:
> -------------------------------------------------------------------------=
----------------------------------------------------------------
> Then after the debug settings, I see:
> -------------------------------------------------------------------------=
----------------------------------------------------------------
> init_oplocks: initializing messages.
> Registering messaging pointer for type 774 - private_data=3D20141c48
> Registering messaging pointer for type 778 - private_data=3D20141c48
> Registering messaging pointer for type 770 - private_data=3D20141c48
> Registering messaging pointer for type 787 - private_data=3D20141c48
> Registering messaging pointer for type 779 - private_data=3D20141c48
> Registering messaging pointer for type 15 - private_data=3D0
> Overriding messaging pointer for type 15 - private_data=3D0
> Deregistering messaging pointer for type 16 - private_data=3D0
> Registering messaging pointer for type 16 - private_data=3D20141c48
> Deregistering messaging pointer for type 33 - private_data=3D2011cf18
> Registering messaging pointer for type 33 - private_data=3D20141c48
> Deregistering messaging pointer for type 790 - private_data=3D0
> Registering messaging pointer for type 790 - private_data=3D20141c48
> Deregistering messaging pointer for type 791 - private_data=3D0
> Deregistering messaging pointer for type 1 - private_data=3D0
> Registering messaging pointer for type 1 - private_data=3D0
> event_add_idle: idle_evt(keepalive) 20203538
> event_add_idle: idle_evt(deadtime) 202040b8
> event_add_idle: idle_evt(housekeeping) 202041c8
> read_fd_with_timeout: blocking read. EOF from client.
> receive_smb_raw_talloc failed for client ipv4:x.y.z.219:49463 read error =
=3D NT_STATUS_END_OF_FILE.

What version of Samba. These debug messages don't
quite match current master code.
