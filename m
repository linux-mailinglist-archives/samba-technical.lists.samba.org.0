Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9AA51CE0
	for <lists+samba-technical@lfdr.de>; Mon, 24 Jun 2019 23:13:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=4QYjvBtAm4Rrim9T565/WyudQA7YDmZM1PZlexLvVa4=; b=LWDIPndBfFezhge4IFte4Tgi1w
	YqHm2ufCdjW0xCPLzFSM6U1bYxN8MiTKnHShmXqGHkxP3YLcm522p0PRPmVxHC2QleRSPXNFYlcYn
	af0ov93//x5SYQ7yR2mN9NHsTEde1SPzjSXAZgnDuxmMbfkD3oRFwjwETKE2h3KDZSWvqDfrC7xLq
	DxH59iStzkFaFyu83mR25JkAEUWc6rnOY1fmywK6XiP8NsTdupOvAQkUDkt8sYQEV3Lg0bjQoXSSg
	7n86omfwwSHm5OrbFl540zV7THi1RhkXMkysCebkwjzGc0EsWuOTSpTNMQqARkVW1ZEemwAcuhroU
	tfCrYZ0Q==;
Received: from localhost ([::1]:35836 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hfWGG-001WwC-Qn; Mon, 24 Jun 2019 21:12:24 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58874) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hfWGB-001Ww5-Fi
 for samba-technical@lists.samba.org; Mon, 24 Jun 2019 21:12:22 +0000
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5OJutpb086749
 for <samba-technical@lists.samba.org>; Mon, 24 Jun 2019 16:01:54 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.91])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tb1vjrbj8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <samba-technical@lists.samba.org>; Mon, 24 Jun 2019 16:01:54 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <samba-technical@lists.samba.org> from <Christopher.O.Cowan@ibm.com>;
 Mon, 24 Jun 2019 20:01:53 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 24 Jun 2019 20:01:51 -0000
Received: from us1a3-mail267.a3.dal06.isc4sb.com ([10.146.127.216])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2019062420015114-1116995 ;
 Mon, 24 Jun 2019 20:01:51 +0000 
MIME-Version: 1.0
Subject: SMB2/SMB3 workloads for testing.  (smbtorture?)
To: samba-technical@lists.samba.org
Date: Mon, 24 Jun 2019 15:01:50 -0500
X-KeepSent: 98773EBD:D1411451-86258423:0069EA03;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 10.0.1 November 29, 2018
X-LLNOutbound: False
X-Disclaimed: 5707
X-TNEFEvaluated: 1
x-cbid: 19062420-9951-0000-0000-00000D071F05
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.423878; ST=0; TS=0; UL=0; ISC=; MB=0.127075
X-IBM-SpamModules-Versions: BY=3.00011322; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01222742; UDB=6.00643412; IPR=6.01003902; 
 BA=6.00006341; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00027449; XFM=3.00000015;
 UTC=2019-06-24 20:01:52
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-06-24 18:55:23 - 6.00010087
x-cbparentid: 19062420-9952-0000-0000-00003D3923F6
Message-Id: <OF98773EBD.D1411451-ON86258423.0069EA03-86258423.006E0810@notes.na.collabserv.com>
X-Proofpoint-Spam-Reason: safe
Content-Type: text/plain; charset=US-ASCII
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
From: Christopher O Cowan via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christopher O Cowan <Christopher.O.Cowan@ibm.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



In recent years, we've set the MIN Protocol to SMB2, in production, but I
had not been running that way in my lab.

Since, I have been using smbtorture and bench.nbench to simulate
workloads, things broke when I made the change to Min Protocol.
I'm getting "Failed to open connection -
NT=5FSTATUS=5FINVALID=5FNETWORK=5FRESPONSE".  I'm thinking either I don't k=
now the
magic combination of switches, or I'm going to have to change the code a
bit.    Fully expecting right now, that a different loadfile is needed, as
well.  (Unless I'm mistaken)

I found two conference presentations in with the SambaXP stuff, but not
sure that I fully grok things, yet.   My understanding is that nbench is
just replaying packets previously captured using one of the VFS modules.

I would appreciate any advice for generating a representative SMB2/SMB3
workload, hopefully smbtorture.

Regards,
Chris

PS: I'm also looking at dbench, as well, but I having a little trouble
compiling it on a RHEL7 desktop.   Wading through that, right now, as well.


