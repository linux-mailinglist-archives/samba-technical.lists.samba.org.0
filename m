Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA1712787
	for <lists+samba-technical@lfdr.de>; Fri,  3 May 2019 08:12:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=oduwej7VxrEAaCBU+tcH7CrPI4zG0ZVatd6myHeWdfs=; b=x1XNFahVe3gTsuvqbGEn59fUA0
	wae5S2kpZM99CAEdvIbhFbQ/v5aCDbwzG39e1CuSvJ2+kD+3LpUQEfoxSIWWxByXFAKdLVd3kJyjC
	QKT+IOX7+asTmXZZLbFPAZQFaRH6MSxM0F8TnhnfTFC4o1/Zoy9NbTgkcbSrJgH+klaLDBIdrMmkY
	ru8Q2KQ0bnKQi0CvAwib97TOoNZq6LqnFfkW0f8mCXJ47yLiby22lhcWprUT4r51YcU8i08cRIjBE
	QyZvogdL34t2467ME2lWd7Ai32SeFoZMb9pfyEYbqZbbHqW2oQpk1m6kjB/Pzrg87e1Euk3CwXvoE
	3JfRH0Cw==;
Received: from localhost ([::1]:61268 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hMRQ2-0029jc-PA; Fri, 03 May 2019 06:11:38 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz ([202.78.240.226]:48544) 
 by hr1.samba.org with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim) id 1hMRPs-0029jV-Fl
 for samba-technical@lists.samba.org; Fri, 03 May 2019 06:11:37 +0000
Received: from [IPv6:2404:130:0:1000:5c1c:66f2:b8fd:c94] (unknown
 [IPv6:2404:130:0:1000:5c1c:66f2:b8fd:c94])
 (Authenticated sender: joeg@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id C314381544; 
 Fri,  3 May 2019 18:11:16 +1200 (NZST)
Subject: [gitlab-ci] shared tag added to rackspace private runners to avoid
 pending jobs
Openpgp: preference=signencrypt
To: samba-technical <samba-technical@lists.samba.org>
Message-ID: <38af29e8-62c6-fc41-d3df-005c084ff415@catalyst.net.nz>
Date: Fri, 3 May 2019 18:11:16 +1200
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

Our shared jobs in gitlab ci got pending quite often recently, which
seems because we hit the daily free ci resource limit.

After discussion with Andrew Bartlett, I rebuilt our rackspace private
runner with these changes:


1. increase check_interval from 5s to 10s.

2. add `shared` tag to private runners.


This implies, when a shared job is triggered, if no shared runner picks
it up, our private runner will do.

The 10s check_interval will make our private runner slower than shared
ones to pick up jobs, which save the cost.

This also means, the shared jobs which always ran on shared runners
before may run on private runners from now on, which may cause flappy
failures.


This is an experiment to try to fix the jobs pending issue.

If it doesn't work and annoys you, please let me know.

I will try to improve the solution or revert it back.


Joe Guo



--=20
Joe Guo
joeg@catalyst.net.nz
Catalyst IT

