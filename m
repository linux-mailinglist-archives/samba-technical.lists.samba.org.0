Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F30537F3F3
	for <lists+samba-technical@lfdr.de>; Thu, 13 May 2021 10:19:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=82l4rYUCaXCzUknIej5BDnJINAvrKMRgmvZR5LN8K6U=; b=1TYMq4dj3VKwXtIu1g1FYPZjtv
	5PLacB48zN57DZcp6nbYd+WACu1emn/BdjYBLJf6jGqKoXiOq+ysw/f4XO6ztWMLaeeM5M9mC/B1u
	bT+7xhjwYr29g55sfXPD3MKnQpy81E3UnabrtyOQ8NnQGArcjqKm1dXsjheIJfqA9lvs/9mKrhFaJ
	KF7ntLcHRcgS39gNHV7HQqYL1wMmR3Cf4oj/LMPU0Z4s+cdt8LZOJSePFG0zJ8CkkYrPum13zKhC+
	10GgTZ4qx2i2CDkGRBzO9VBTTiM6BosnkUnNSFKQhIkAJLdY5yllrtHKbEKg0taoG9nkn4xicI8Rt
	xviqoNFA==;
Received: from ip6-localhost ([::1]:29974 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lh6Xo-00HRGX-Ar; Thu, 13 May 2021 08:18:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15878) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lh6Xi-00HRGN-8L
 for samba-technical@lists.samba.org; Thu, 13 May 2021 08:18:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=82l4rYUCaXCzUknIej5BDnJINAvrKMRgmvZR5LN8K6U=; b=IqRz01XLHBMmXH3sjoq4zYcenJ
 88Qr4ygbu1Tzl4P31wnVF6TSRbgaMRaSIH+oKp39FgLZRiBM0vYFT7oOTOigmWBZ88twTFl9DkGji
 SilwpBxEOx1jvgtTJz68WKJhJkzePJO/IJOWLSRwYxluK6hXkKwdsLrWqRZFbQukduz64usgHUHP0
 6hzQB0QNGhTYNTxVAd30wzreuP3g3fw2kOCqFfDuG21quASWfWuxV4PtsZ53aflbyl8o15AOonzXB
 Lzt33+MBVOo1U9yWuvaES0Ky6vX6CSNu9XPZo6XzroO1sf+9lWIS6NgbvPyJ6UqLN+EtFbvgyeeBn
 DqcWikaknehOmQHUETqVsvUmEiP9AmZJKgEpyWqR4c4O8H2pT6FdG3PDinV1kiU7pJkp6lAohAp8V
 3E3vNIrg1VLj+4f9e2uxd6xZC1dLzBTENGhgHbB9HzoaCCXm0W0wKX2QM5/UIHTbJ2HBmBNTCdBUk
 QA34izpea/I4E3L8gh7Ttdda;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lh6Xc-0005dC-U3; Thu, 13 May 2021 08:17:57 +0000
Message-ID: <516bd798642997a15016d81f9ae6e17e9250f677.camel@samba.org>
Subject: Offline logon flapping in autobuild?
To: asn@samba.org
Date: Thu, 13 May 2021 20:17:48 +1200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

My most recent autobuild, with (I hope) unrelated changes, fails with:

[141(1068)/143 at 6m5s]
samba.blackbox.offline_logon(ad_member_offline_logon)
ERROR: Testsuite[samba.blackbox.offline_logon(ad_member_offline_logon)]
REASON: unable to set up environment ad_member_offline_logon - exiting


could not obtain winbind interface details: WBC_ERR_WINBIND_NOT_AVAILABLE
could not obtain winbind domain name!
failed to call wbcPingDc: WBC_ERR_WINBIND_NOT_AVAILABLE
python3: lpcfg_do_global_parameter: WARNING: The "lanman auth" option is deprecated
python3: lpcfg_do_global_parameter: WARNING: The "lanman auth" option is deprecated
dcesrv_netr_creds_server_step_check: CVE-2020-1472(ZeroLogon): netr_LogonGetCapabilities request (opnum[21]) WITH schannel from client_account[OFFLINEADMEM$] client_computer_name[OFFLINEADMEM]
dcesrv_netr_creds_server_step_check: CVE-2020-1472(ZeroLogon): Option 'server require schannel:OFFLINEADMEM$ = no' not needed!?
Unable to resolve group domusers to a SID
Unable to resolve group domadmins to a SID
Unable to resolve group everyone to a SID
You are not root, most things won't work
Creating Users failed with NT_STATUS_ACCESS_DENIED
smbd child process 1606143 exited with value 0
nmbd child process 1606141 exited with value 0
winbindd child process 1606142 exited with value 0
smbd child process 1606143 isn't here any more
nmbd child process 1606141 isn't here any more
winbindd child process 1606142 isn't here any more
failed to start up environment 'ad_member_offline_logon' at /m/abartlet/aMASTER/b1332721/samba-mit-build/selftest/target/Samba.pm line 126.
samba can't start up known environment 'ad_member_offline_logon' at /m/abartlet/aMASTER/b1332721/samba-mit-build/selftest/selftest.pl line 824.
teardown_env(ad_member_idmap_ad)
teardown_env(ad_member_idmap_rid)
teardown_env(ad_member)
teardown_env(ad_member_rfc2307)
server_stdin_handler: samba: EOF on stdin - PID 1566292 terminating
server_stdin_handler: samba: EOF on stdin - PID 1485145 terminating
dns_hub: after poll()
dns_hub[UDP[10.53.57.64]]: before shutdown()
server_stdin_handler: samba: EOF on stdin - PID 1491950 terminating
server_stdin_handler: samba: EOF on stdin - PID 1476425 terminating
dns_hub[UDP[10.53.57.64]]: after serve_forever()
dns_hub[UDP[10.53.57.64]]: after shutdown()
dns_hub[UDP[fd00:0000:0000:0000:0000:0000:5357:5f40]]: before shutdown()
dns_hub[UDP[fd00:0000:0000:0000:0000:0000:5357:5f40]]: after serve_forever()
dns_hub[UDP[fd00:0000:0000:0000:0000:0000:5357:5f40]]: after shutdown()
dns_hub: before exit()
make: *** [testonly] Error 1

I'm doing another GitLab CI and will try autobuild again in the
morning, but in the meantime is anyone else seeing this or know what is
going on?

Thanks!

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


