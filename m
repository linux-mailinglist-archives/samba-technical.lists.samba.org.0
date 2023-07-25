Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBD7760925
	for <lists+samba-technical@lfdr.de>; Tue, 25 Jul 2023 07:20:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=lXNIKV9ie+97yNzoMBYwfCs3i3wZu3cSuju3kRNeC/I=; b=oWZa+wIh0ZjzN3rPXj8EMDymRC
	pOykS9budxMauTaMW0OqaSE04YTNMqa/yDfOiSYLgZPgexOE2yk+ZL9VeJZ9ssC2avGCAXqMmJ1NN
	qWp9vr3tVs4rGgOlMA6hir/Idg1PvHFEtn2Ev3P+0bnHvAug+pUhWbMp4SCBe/H2zbJK2yovj8jJY
	ZlPj8lrXnrYz28rp/4Z/I173yp4suC2BOCOe2cvXxZJug7xIzMWP/WtE3JzplKiQ37MNylI7GMHVa
	OFfBAOEXL24RE3ND3LZY9VFON4xMKif5yNR7nvsrzqdulFsiiehLxRHDUxoh2R27Nnj3gL/tD/HBh
	/00KpzCw==;
Received: from ip6-localhost ([::1]:61960 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qOASY-00513G-14; Tue, 25 Jul 2023 05:19:46 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:36784) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qOASQ-005137-0i
 for samba-technical@lists.samba.org; Tue, 25 Jul 2023 05:19:42 +0000
Received: from [192.168.1.219] (unknown [114.23.142.188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 4806881B66
 for <samba-technical@lists.samba.org>; Tue, 25 Jul 2023 17:19:16 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1690262356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lXNIKV9ie+97yNzoMBYwfCs3i3wZu3cSuju3kRNeC/I=;
 b=MWr7UmHSFe19BCMnAPGxuDErdOdCD9Xv4ZxlJojtn0PhZdr7QXLEMVFTOkhRF0sbaRSEZC
 vHC6CfFE3Gbah1GH80mjo+dQ8Glbz7Wr2ciboKJ/JQOiiU/uohsoVF49JGJ5m1QJpd5Uq1
 SHA2Axl8vfF9t95dLlMtCWuY3KMXE2jys5MdHw79B5vLxeN+HIphlYOIxsdEk3DMEUhio1
 CQMzemVGi7jgIOgtK98iiYoBnme4E3o1H65AzwE9qokkDAvydFZ0HFrYezQhwhsR9LoBmP
 PAnNMkkx1SmBh/59SGS5EreQCtbb0rkQvLs9k/Pg4CROpdEuFNSVHCGn/wrtwQ==
Message-ID: <6a0d3223-321a-624d-111e-1c1a67ef4396@catalyst.net.nz>
Date: Tue, 25 Jul 2023 17:19:13 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: increased `make test` logging in syslog with "debug syslog format =
 always"
To: samba-technical <samba-technical@lists.samba.org>
Content-Language: en-NZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=douglasb@catalyst.net.nz
 smtp.mailfrom=douglas.bagnall@catalyst.net.nz
X-Spamd-Result: default: False [-0.10 / 15.00]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 DCC_FAIL(0.00)[failed to scan and retransmits exceed];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 ASN(0.00)[asn:56030, ipnet:114.23.0.0/16, country:NZ];
 MID_RHS_MATCH_FROM(0.00)[]
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Since 83fe7a0316d3e5867a56cfdc51ec17f36ea03889 and 
ca7b7bde3915a821b1b9911abf18d2d441665382, aka
https://gitlab.com/samba-team/samba/-/merge_requests/3034 ('Add and use in 
selftest "debug syslog format = always", which logs to stdout in syslog style'),
I see marked increase in the number of samba lines in /var/log/syslog (or 
journalctl for the newfangled).


For example, this:

$ make test TESTS=samba.tests.auth
$ journalctl -S '3 minutes ago' | grep samba | wc -l
72

while the [pseudo] old behaviour is:

$ git revert ca7b7bde3915a821b1b9911abf18d2d441665382
$ make test TESTS=samba.tests.auth
$ journalctl -S '3 minutes ago' | grep samba | wc -l
0

That infinity-fold increase is not universal: the old behaviour was to 
occasionally log copyright lines when a test server starts.

It is only disconcerting for me -- I never run Samba for real, so I'm not fooled 
as to where the lines came from -- but I like to imagine better test isolation.

Now, those commits ARE doing something useful, but what I can't quite work out 
is whether the leakage is a necessary part of the usefulness, a regrettable but 
difficult to avoid side-effect, or something we could fix in a flash.

Does someone now?

cheers,
Douglas

