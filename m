Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD36810640
	for <lists+samba-technical@lfdr.de>; Wed,  1 May 2019 11:07:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=OEQnV+ykDx7BZeio2LrGXUH+m9oaZghKddgddMzlM88=; b=ghO36VYxkluG0qfgVbsnqZb26X
	GjrYt7bOhSRrqRKo4SSfJI+yh6nQNetXiBv1PghthsmjoDZgOSnsGNIqnN2ExSm8MhcZqysiWuWgG
	Jr2xx5RyRuom6u6HFw2pX0zLOqUpMoOgcZX4kWQRkJzx3a9mGmVuqv/ysmaTfXMpeg097bfLTMwey
	QZ2mzap1WUagSNZxNSM6Qj/u+rdbWP/5eE2Xi280SFhf5v/QHRwz22Oi6QyoHHvQIR2agxLEIfjpN
	ifkYt4ynB/0VDw1dwayDQ3H3ijAggtnGZUeDgm2J9QBk2/HHiZ1tuWWzXr6XNnb6L1Qa7sAANM2Wx
	eKpLI6Lw==;
Received: from localhost ([::1]:56444 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLlCD-001ngv-MN; Wed, 01 May 2019 09:06:33 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:33144) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLlC9-001ngo-Lz
 for samba-technical@lists.samba.org; Wed, 01 May 2019 09:06:31 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1557306382.96798@JKej7ve+4Y/2plLWWcDx7Q
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: 5366612050D.A5E57
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id 5366612050D
 for <samba-technical@lists.samba.org>; Wed,  1 May 2019 11:06:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1556701582;
 bh=OEQnV+ykDx7BZeio2LrGXUH+m9oaZghKddgddMzlM88=;
 h=Subject:From:To:Date:From;
 b=TQhOLG2kXRBIS31qZv2ahhO/RNtWcm8zvbgGZ7HjToOadMoiReAxeDAzxkoQtxYqC
 v0eU8mDaKttTc195pOwsTX5iOfcl1rKOXQkJH1yE/ZwYnAexzfjSrM1Ihk0tXivI22
 aPH0u4QsHCq8MIrHuIFIL1qKT6lQXgpX11DIQ7pIzchKbBonMgeB5Uz7QfsoAZLxhu
 aBov/nv+ILd1l/kjsBz5bNC3Gy+r6XD3Ta3kF85B4BRqqsf9L2LxxGwQJ1v5733GRo
 hGCkzjESF/qc47My7t9yVhUunPaxvoVA2ZaJKjWlfd3+xg6Q54Dow9eFmZXecnzk5g
 RacGalXkXPWXA==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id 742633AF8C
 for <samba-technical@lists.samba.org>; Wed,  1 May 2019 11:06:22 +0200 (CEST)
Subject: Need a verificaton on ntp settings with apparmor for samba
To: =?windows-1252?Q?samba-technical=40lists.samba.org?=
 <samba-technical@lists.samba.org>
Date: Wed, 1 May 2019 11:06:22 +0200
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: AdT//SVGqjBRiOb4TF+aHGMeqSQ8EQ==
Message-Id: <vmime.5cc9618e.2343.215bd6e214788f6e@ms249-lin-003.rotterdam.bazuin.nl>
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: "=?windows-1252?Q?L.P.H._van_Belle?= via samba-technical"
 <samba-technical@lists.samba.org>
Reply-To: "=?windows-1252?Q?L.P.H._van_Belle?=" <belle@bazuin.nl>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hai guys,=20
=20
We found some things off in the ntp settings of chrony and ntp=20
=20
I dont know which parts are exact used buy samba and/or winbind in conjunction with ntp.=20
=20
we know these are correct.=20
=20
 # To sign replies to MS-SNTP clients by the smbd daemon in /var/lib/samba
/var/lib/samba/ntp_signd r,
/var/lib/samba/ntp_signd/{,*} rw,
=20
I notice this one was in ntp its apparmor profile but not in chrony, is this one needed at all=3F=20
# samba4 winbindd pipe
/{,var/}run/samba/winbindd r,
/{,var/}run/samba/winbindd/pipe r,

And i've added this part in case its needed but again i can't tell if thats correct.=20
# samba4 winbindd_privileged pipe
/var/lib/samba/winbindd_privileged r,
/var/lib/samba/winbindd/pipe r,

Can someone verify these winbind parts.=20
Then i can update the bug reports on this on Debian.=20

Best regards,=20

Louis



