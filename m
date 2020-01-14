Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EA40113B49C
	for <lists+samba-technical@lfdr.de>; Tue, 14 Jan 2020 22:47:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=vt2JYs13j5ENs31vxW8aBi6KLzeo+697Yex1bFFsxm4=; b=ar0LysHSvdLzk562cYNKEY2HAV
	rzXCIOUr3RFk0tcsUqr9aSnG/mfDRNzGGqJhWWfQ0MpxMVH0Mzw+T9SOqspM8WDb+PVwGpnYzE+NU
	UeRKKWiu63Z1q51eeQ6ekqJ/XMp7aZlIrMs46dbwzA5Rd29Xd6CeQPz9oW/sHy7XLGoAHASK9g7Rj
	inJ9eoW7vARz6ljf2l++W/fV4I5xDBdsIJh+24PaUinH8Or4rUB7Z+TisgNkpgt5ViZy5YfBN1gxB
	NCZbSLtEtUSGTBVSXW1PvGe0RIsoJ7FPeJA/VO+QBr5DlKN9eunZjhApmcd+KKSJTnN85aehRJTX9
	Z0ejTxnA==;
Received: from localhost ([::1]:20246 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1irU1F-003S3y-6r; Tue, 14 Jan 2020 21:46:37 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:3558
 helo=mx0a-001b2d01.pphosted.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1irU17-003S3p-V4
 for samba-technical@lists.samba.org; Tue, 14 Jan 2020 21:46:35 +0000
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00EKveKo121192
 for <samba-technical@lists.samba.org>; Tue, 14 Jan 2020 16:26:34 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xhbprf5rq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <samba-technical@lists.samba.org>; Tue, 14 Jan 2020 16:26:34 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00ELIb9T029417
 for <samba-technical@lists.samba.org>; Tue, 14 Jan 2020 21:26:33 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 2xf757yg9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <samba-technical@lists.samba.org>; Tue, 14 Jan 2020 21:26:33 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00ELQWJE57803080
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <samba-technical@lists.samba.org>; Tue, 14 Jan 2020 21:26:32 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43D87136063
 for <samba-technical@lists.samba.org>; Tue, 14 Jan 2020 21:26:32 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F4B113605E
 for <samba-technical@lists.samba.org>; Tue, 14 Jan 2020 21:26:32 +0000 (GMT)
Received: from mail.gmx.ibm.com (unknown [9.209.242.114])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <samba-technical@lists.samba.org>; Tue, 14 Jan 2020 21:26:32 +0000 (GMT)
Received: from m01ex005.gmx.ibm.com (10.148.53.45) by m01ex002.gmx.ibm.com
 (10.148.53.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Tue, 14 Jan
 2020 16:26:24 -0500
Received: from m01ex005.gmx.ibm.com ([fe80::7d2d:476:2d5a:cb2f]) by
 m01ex005.gmx.ibm.com ([fe80::7d2d:476:2d5a:cb2f%9]) with mapi id
 15.01.1779.002; Tue, 14 Jan 2020 15:26:24 -0600
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Port knock of 445 prevents smbd from starting
Thread-Topic: Port knock of 445 prevents smbd from starting
Thread-Index: AQHVyx9AitqUBvVdV0i8bf/gHBfTHQ==
Date: Tue, 14 Jan 2020 21:26:24 +0000
Message-ID: <041d851df04040098cd3576cb2b91118@ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [9.16.14.33]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Warn: EHLO/HELO not verified: Remote host 148.163.158.5
 (mx0b-001b2d01.pphosted.com) incorrectly presented itself as
 mx0a-001b2d01.pphosted.com
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

In our cluster setup here, we use a load-balancer in front of our ctdb clus=
ter to steer the SMB traffic.    We've been doing this for years.    It doe=
s a simple TCP connect on 445 to verify that each node's smbd is still aliv=
e.

This is all on AIX, and some time, in the past few weeks these knocks start=
ed causing smbd to exit.   Here's the output from an smbd -i -d10.

First I see this (x.y.z.219 is the address of the LB.  202 is the server). =
   I changed the addresses

---------------------------------------------------------------------------=
--------------------------------------------------------------

Allowed connection from x.y.z.219 (x.y.z.219)
Connection allowed from ipv4:x.y.z.219:49463 to ipv4:x.y.z.202:445
ctdbd_control: Sending ctdb packet reqid=3D7, vnn=3D4026531841, opcode=3D23=
, srvid=3D17509995351216488448
ctdbd_control: Sending ctdb packet reqid=3D8, vnn=3D4026531841, opcode=3D44=
, srvid=3D0
INFO: Current debug levels:
---------------------------------------------------------------------------=
--------------------------------------------------------------
Then after the debug settings, I see:
---------------------------------------------------------------------------=
--------------------------------------------------------------
init_oplocks: initializing messages.
Registering messaging pointer for type 774 - private_data=3D20141c48
Registering messaging pointer for type 778 - private_data=3D20141c48
Registering messaging pointer for type 770 - private_data=3D20141c48
Registering messaging pointer for type 787 - private_data=3D20141c48
Registering messaging pointer for type 779 - private_data=3D20141c48
Registering messaging pointer for type 15 - private_data=3D0
Overriding messaging pointer for type 15 - private_data=3D0
Deregistering messaging pointer for type 16 - private_data=3D0
Registering messaging pointer for type 16 - private_data=3D20141c48
Deregistering messaging pointer for type 33 - private_data=3D2011cf18
Registering messaging pointer for type 33 - private_data=3D20141c48
Deregistering messaging pointer for type 790 - private_data=3D0
Registering messaging pointer for type 790 - private_data=3D20141c48
Deregistering messaging pointer for type 791 - private_data=3D0
Deregistering messaging pointer for type 1 - private_data=3D0
Registering messaging pointer for type 1 - private_data=3D0
event_add_idle: idle_evt(keepalive) 20203538
event_add_idle: idle_evt(deadtime) 202040b8
event_add_idle: idle_evt(housekeeping) 202041c8
read_fd_with_timeout: blocking read. EOF from client.
receive_smb_raw_talloc failed for client ipv4:x.y.z.219:49463 read error =
=3D NT_STATUS_END_OF_FILE.
setting sec ctx (0, 0) - sec_ctx_stack_ndx =3D 0
Security token: (NULL)
UNIX token of user 0
Primary group is 0 and contains 0 supplementary groups
change_to_root_user: now uid=3D(0,0) gid=3D(0,0)
setting sec ctx (0, 0) - sec_ctx_stack_ndx =3D 0
Security token: (NULL)
UNIX token of user 0
Primary group is 0 and contains 0 supplementary groups
change_to_root_user: now uid=3D(0,0) gid=3D(0,0)
setting sec ctx (0, 0) - sec_ctx_stack_ndx =3D 0
Security token: (NULL)
UNIX token of user 0
Primary group is 0 and contains 0 supplementary groups
change_to_root_user: now uid=3D(0,0) gid=3D(0,0)
smbXsrv_session_logoff_all: empty session_table, nothing to do.
setting sec ctx (0, 0) - sec_ctx_stack_ndx =3D 0
Security token: (NULL)
UNIX token of user 0
Primary group is 0 and contains 0 supplementary groups
change_to_root_user: now uid=3D(0,0) gid=3D(0,0)
setting sec ctx (0, 0) - sec_ctx_stack_ndx =3D 0
Security token: (NULL)
UNIX token of user 0
Primary group is 0 and contains 0 supplementary groups
change_to_root_user: now uid=3D(0,0) gid=3D(0,0)
msg_ctdb_ref_destructor: refs=3D0
msg_dgm_ref_destructor: refs=3D0
Server exit (failed to receive smb request)
Terminated
---------------------------------------------------------------------------=
--------------------------------------------------------------

I'm doing a binary search to try to isolate the change.   It seems that it =
assuming that the port knock is an incomplete SMB request based upon the EO=
F, and then exiting.    Any idea of what changed?   I haven't eliminated th=
e possibility that it's problem with locking and timeouts on AIX.

If I shut the availability probe-off, everything comes up fine immediately.=
    It didn't seem to affect a running server (although my testing was limi=
ted).

Regards,
Chris

