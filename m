Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 971F340183C
	for <lists+samba-technical@lfdr.de>; Mon,  6 Sep 2021 10:50:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=LBLYNhdX7vqUuXznJ4Z1bErNJXyWcCZL0Pl46gA2OAs=; b=srO6M1ws53SGkBRSnriqjP4Qfz
	sBwnlkP21brUDnUqNzEBP4qL7r0Ko1wC8PsYc/SNGo7HAWu2bEfomMWryURlBTzi4vWZCWuMjQJyJ
	b1An3Uh98YRVa50eJVg1RoNYSy4wCV7pNfVcRmygfB+tBXpkn/ruYoYJo3ZgjKQI8CIU2Ts5wjmpL
	Z4st1+Uokv/4eATkGAtQdhc8KbvtH556U4POXqiAmCs/5xxrN9l1IoXhQCDNUqkWaEuKufY0EnrXd
	TlySDc9O+96gl2s4BYIULQ68NPpp2+8gbeMX7adJttEtONTDJ7ZbTHk+smBR67MAhA9wNvWhyZpLK
	FG5qo2Rw==;
Received: from ip6-localhost ([::1]:34376 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mNAKQ-00DSbs-FN; Mon, 06 Sep 2021 08:50:10 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz ([202.78.240.226]:45476) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mNAKF-00DSbj-Fs
 for samba-technical@lists.samba.org; Mon, 06 Sep 2021 08:50:03 +0000
Received: from [192.168.1.80] (115-189-86-182.mobile.spark.co.nz
 [115.189.86.182])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: josephsutton@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id A998581488
 for <samba-technical@lists.samba.org>; Mon,  6 Sep 2021 20:34:03 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1630917243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=cshnD9anQAbRxBqbPKjutmLDm8sst6WIAlk+/B64jvg=;
 b=f80N6kjREsJbS+T2G+5btawuUnv9sgCqO/KsaoDzt2XYqw7CHmw3n7BRfjp63lnt7idE5S
 DbwvLu3pF3dzf8oZwZ//I/QCNLn2LrFs6Qp8DTIoya4YC01B5MvpnRRyEbay+ndFQBZ7Pj
 WTYtlC11MrDnNZf7/ZVBZYoVi1bzf0tquys6qqyDbie9OXUZl+eL0jZFIMUvhKAmfs7Jk7
 b0VJu6DldgYAsipK7OQBjP6aU/1oKpoAC9vmwST2+LvcvDGueHh03pToyAGEqDZqbmDfZC
 eTeS/iVG08jD50J/MeRPXKjdkmEv8rcjoSzr/5q3p2OphW9Q/ErVL/k9zSe3fQ==
To: samba-technical@lists.samba.org
Subject: Test failure in samba.tests.blackbox.smbcacls_basic(DFS)
Message-ID: <f4a174ef-09bc-6b7b-dc1a-d4cb0311bc8a@catalyst.net.nz>
Date: Mon, 6 Sep 2021 20:34:01 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Language: en-US
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=josephsutton@catalyst.net.nz
 smtp.mailfrom=josephsutton@catalyst.net.nz
X-Spamd-Result: default: False [-0.10 / 15.00]; ARC_NA(0.00)[];
 MIME_GOOD(-0.10)[multipart/alternative,text/plain];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 MIME_TRACE(0.00)[0:+,1:+,2:~];
 ASN(0.00)[asn:4771, ipnet:115.189.80.0/20, country:NZ];
 MID_RHS_MATCH_FROM(0.00)[]
Content-Type: text/plain; charset=utf-8
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
From: Joseph Sutton via samba-technical <samba-technical@lists.samba.org>
Reply-To: Joseph Sutton <josephsutton@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I noticed this failure occurring with the samba-no-opath2 job on GitLab
CI, after rebasing seemingly unrelated changes onto master.

|[146(644)/150 at 22m53s]
samba.tests.blackbox.smbcacls_basic(DFS)(fileserver)||
||found ACE for samba||
||mismatch: inherit: !=3D inherit:0x0||
||differences between file ACE: ||
||user_dom=3DFILESERVER,||
||user=3Dsamba,||
||type=3DALLOWED,||
||inherit=3D,||
||permissions=3DFULL,||
||and expected ACE: ||
||user=3Dsamba,||
||type=3DALLOWED,||
||inherit=3D0x0,||
||permissions=3DFULL,||
||remote remove failed: Command
'/tmp/samba-testbase/samba-no-opath-build/bin/smbclient
-Usamba%fileserver //FILESERVER/msdfs-share -c deltree
smbcacls_sharedir_dfs/*'; shell False; exit status 1; stdout: 'b''';
stderr: 'b'''||
||falling back to removing contents of local dir:
/tmp/samba-testbase/samba-no-opath2/bin/ab/fileserver/share/smbcacls_shar=
edir_dfs||
||UNEXPECTED(failure):
samba.tests.blackbox.smbcacls_basic(DFS).samba.tests.blackbox.smbcacls_ba=
sic.BasicSmbCaclsTests.test_simple_single_mod(fileserver)||
||REASON: Exception: Exception: Traceback (most recent call last):||
||=C2=A0 File "bin/python/samba/tests/blackbox/smbcacls_basic.py", line 7=
7,
in test_simple_single_mod||
||=C2=A0=C2=A0=C2=A0 self.assertTrue(self.file_ace_check(remotepath, ace)=
)||
||AssertionError: False is not true||
||FAILED (1 failures, 0 errors and 0 unexpected successes in 0 testsuites=
)|

The full job log can be found here:
https://gitlab.com/samba-team/devel/samba/-/jobs/1564265401
<https://gitlab.com/samba-team/devel/samba/-/jobs/1564265401>

I'm not sure exactly what caused this failure, but I'm reporting it here
in case this is an issue that could warrant further investigation.

Regards,
Joseph
