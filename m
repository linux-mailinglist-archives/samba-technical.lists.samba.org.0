Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA02142F7
	for <lists+samba-technical@lfdr.de>; Mon,  6 May 2019 01:16:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=DiMkK6mbZCDjJMD77zDRfiqpcd6kIcqGVz7z4HiT/T4=; b=S2i/TgCsHvpUL3KQrzWHEpi5aG
	Yw3RUB3WuU0FhVVn7ZgoM4xx76pHbt9ZyD/A5Z2uxHHtVIC48KOXKOOgiLVERSMujQVCCeXg5IKpB
	Q4QsIO6hZXfCmV4e3iCg1QxfQxO0CI2+7x10vDMBDwttwAunR0Y0kegWnJUpFFIeDmderIvSnQpx2
	hL7TDyoKJXFQWFhD7esgXF09LdsH0IaJL4+SNeWDQmVNxNplVhhbQ4cqUH69BNWfZVIXxnAR2oIbQ
	ZX4/KAq0FEUauEVsGKIYZ+MJz5Qadlw8OsBu9uv+S3IEi56FL9JOOimWhaKIbshkEYb0LEebU7ly8
	p2yydSlw==;
Received: from localhost ([::1]:50102 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hNQN1-002UwQ-11; Sun, 05 May 2019 23:16:35 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz ([202.78.240.226]:39664) 
 by hr1.samba.org with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim) id 1hNQMv-002UwJ-8W
 for samba-technical@lists.samba.org; Sun, 05 May 2019 23:16:32 +0000
Received: from [IPv6:2404:130:0:1000:d0be:cba3:501b:8223] (unknown
 [IPv6:2404:130:0:1000:d0be:cba3:501b:8223])
 (Authenticated sender: joeg@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id A80D78104E; 
 Mon,  6 May 2019 11:16:21 +1200 (NZST)
Subject: [coverage] enable coverage in autobuild.py and publish html report to
 gitlab pages with ci
Openpgp: preference=signencrypt
To: samba-technical <samba-technical@lists.samba.org>
Message-ID: <13fdf77e-b5a7-d6d9-7f24-bca982c19812@catalyst.net.nz>
Date: Mon, 6 May 2019 11:16:17 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-AU
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
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
From: joeg--- via samba-technical <samba-technical@lists.samba.org>
Reply-To: "joeg@catalyst.net.nz" <joeg@catalyst.net.nz>
Cc: Andrew Bartlett <abartlet@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi team,

I am currently trying to add a new option `--enable-coverage` to
`autobuild.py`,

so we can enable this option and publish the html report to gitlab pages
automatically with gitlab ci.

(Actually we did have coverage report 7 years ago, according to Andrew
Bartlett.)


I already got a decent report here:
https://samba-team.gitlab.io/devel/samba/

The pipeline/branch which generated this report is here:
https://gitlab.com/samba-team/devel/samba/pipelines/59682470


I am still polishing things so the report may not be accurate, but happy
to share this report in advance.

If any one discovers problems from the above report or has fancy ideas,
please let me know.

New tests are welcome to increase the coverage percentage from now on:)


--=20
Joe Guo
joeg@catalyst.net.nz
Catalyst IT

