Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 64402A015D0
	for <lists+samba-technical@lfdr.de>; Sat,  4 Jan 2025 17:35:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=ufO+ZnSxxTMQH/3L1D4+/GvaNywS66Zd1H+0NuTF1Is=; b=B3Dd1jGzOHaQzJILYrxxiqdYsq
	2MaVmL6KfcEzBy/8S6db3uBSFkWM6jQ+ZucvLdeP7LoZvS5U8U6Jq6A+9YV1RT3w25GIS7eu+At5I
	svoruliEnYk5ONgt4RInicJH2XoVRaF2gLoEwQXhUxZmDMekY1ubenZ84nt5/NX/Z+uwHZK7/5Ty7
	6+wcxFY8gLQyFJjbzQs8bPo6LoZUp8B8s5bQGl84OpNqqcUqj9Hx58GKWkaf4/LYgueXOS+nTh+YV
	2m3WnMNq0HKSTbOaj6ZcYwbb1UlNwN//BXRr9k4MPueA0d0cMMRak5FQPvwOQRY55XehmEslP90lK
	5vDY/NhQ==;
Received: from ip6-localhost ([::1]:54966 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tU77S-007HAr-Fp; Sat, 04 Jan 2025 16:35:22 +0000
Received: from relay4.ptmail.sapo.pt ([212.55.154.24]:60756) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tU77J-007HAj-TY
 for samba-technical@lists.samba.org; Sat, 04 Jan 2025 16:35:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapo.pt;
 s=sapo20240325; t=1736007547;
 bh=ufO+ZnSxxTMQH/3L1D4+/GvaNywS66Zd1H+0NuTF1Is=;
 h=From:To:Subject:Date:From;
 b=oPvc1wHSPxLt6g/PaDV4ge7VbXECSQz3Xs4violKNMsuOp1LSHFfpbc3w1ZXH+iIF
 +eNSQq8gFSy1G9jDNB8o6czjr9Y9aSkFByMHYEbIYRvFGRM80dMldAKl3rHi5O7LY7
 O2n6uqs+PdF2nn+D/y3tzzu5WPh/ZOsEhi3WYn2bBoBjkpgPvyz38NlUvbLIXKS4Xo
 6l4SUGT+tUldX0R9KlBzfSTJkG2XGXyl9Hds7NG8UbmB3SRd/VRbBigpE04ysXU99W
 G9khH8K00rd53zXb6mVDUZ3fZ5s6fhlMD1yWxcIH5Zb5mqRiWoTSpDrxfe3iPpRlDY
 IxYIjJeYo9SdA==
Received: from sapo.pt (unknown [10.134.36.75])
 by relay4.ptmail.sapo.pt (Postfix) with ESMTPS id 4772FB55CD2
 for <samba-technical@lists.samba.org>; Sat,  4 Jan 2025 16:19:07 +0000 (WET)
Received: (qmail 27275 invoked from network); 4 Jan 2025 16:19:08 -0000
Received: from Sepher3 (unknown medalist@sapo.pt@[85.245.190.191])
 (envelope-sender <medalist@sapo.pt>)
 by ptmail-mta-auth01 (qmail-ptmail-1.0.0) with ESMTPSA;
 4 Jan 2025 16:19:08 -0000
X-PTMail-RemoteIP: 85.245.190.191
X-PTMail-AllowedSender-Action: 
X-PTMail-Service: default
To: <samba-technical@lists.samba.org>,
	<samba@lists.samba.org>
Subject: Upcoming discontinuation of Samba 4.19.x (creation of new GPOs
 impossible with versions 4.20.x and 4.21.x)
Date: Sat, 4 Jan 2025 16:19:08 -0000
Message-ID: <0a6801db5ec4$61f552b0$25dff810$@sapo.pt>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
thread-index: AdtexD70iMH9RTcMRCupE/m/gAODGA==
Content-Language: pt
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
From: miguel medalha via samba-technical <samba-technical@lists.samba.org>
Reply-To: miguel medalha <medalist@sapo.pt>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Are Samba developers aware that the only way to create usable GPOs (which
are arguably one of the most important features of an AD environment) is to
use a Samba version (4.19.x) that is two versions behind the current one and
that, according to "Samba Release Planning and Supported Release Lifetime",
is scheduled for discontinuation in March 2025?

https://wiki.samba.org/index.php/Samba_Release_Planning

Please note that I am not bitching or demanding anything, I am grateful for
what we have and I truly appreciate the hard work of the Samba team members.
I am just calling attention to this fact. I really wish I could help, but
unfortunately I am just a sysadmin, not a developer.

https://bugzilla.samba.org/show_bug.cgi?id=15738



