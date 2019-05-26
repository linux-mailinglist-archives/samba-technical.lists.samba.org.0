Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 796072A94E
	for <lists+samba-technical@lfdr.de>; Sun, 26 May 2019 13:01:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=uQ5/adhB2rZNWYB9hQjHtDF/CK5JOgaT6DV6vGaVvBA=; b=iW7/8PS0ZKovs25fDCPB8vX/gg
	eBxoqKSR6jrsMV3WPx6E+Cdctf0GbA+k2OxUWxBW7EZPMsmscoMlgDWZVrkX3NrLfNOQjymNM/d50
	XxrGIWX+3Scha9GEmgm6FEItkCDBVlUPZZN0XR7fmEvTRHw53jbaQSq1sDbX7/oKfdeYZqnbswL5m
	ATlviluvbv2+lMjTTcwBxbLXhRZQLBezaV6v4Dvq/slr6E6z3vMAfZKRUPlMnr7jeaVU1QGRQfMXG
	SLtlpVUxMafqlSKYM3eR3CZUgMykuxadt49Mh47Yetd8D9g0lgv2xX+x/dEM3Zyr9lXZMgOetx0dA
	QUOyXM9w==;
Received: from localhost ([::1]:19282 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hUqsp-001u1M-JZ; Sun, 26 May 2019 11:00:07 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:46842) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hUqsi-001u02-8n
 for samba-technical@lists.samba.org; Sun, 26 May 2019 11:00:04 +0000
Received: from [192.168.1.110] (unknown [203.97.236.46])
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 0105880EFD; 
 Sun, 26 May 2019 22:59:48 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1558868389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uQ5/adhB2rZNWYB9hQjHtDF/CK5JOgaT6DV6vGaVvBA=;
 b=gDUE9nXxN0fSuG1GI5aRlU/UwevH/hFTqxXfbUbVRrxsenStbZ4mBVuiBCtPyns8hHDUWG
 uw8ds6BFd9LqD/IcOB696hHJCPN/Q+XfSPWn25xLmFGW1+8Q0khTnZ+KeO1eJ9IY4MUUOt
 1lmhwwK56MTUESMHdK90AIE71D9QhCeEtvS1gqh1uqymGeDKcUMx9R9705P1WzTET65cbi
 4Hi0z0bE8jnA305/3G+KQvZIGhMZLhqgMTNoVwgmExw5B/U7PdqCEmpiXKkch6gkkqRQuQ
 Zy4FuRvjpKNfDiZD0pOT7tQgX3vem1UvKujKoCCOvQMbRV2NApOUc1o2QWWxTQ==
Subject: [PATCH] Re: samba-tool fsmo transfer - uncaught exception
To: Rowland penny <rpenny@samba.org>, samba-technical@lists.samba.org,
 =?UTF-8?Q?Julien_Rop=c3=a9?= <jrope@linagora.com>
References: <642f86fb-36b6-e647-ec52-e6e93bab2950@linagora.com>
 <b2b6f46b-c819-c917-37f7-ead663bf4cf4@samba.org>
 <1c97651b-c97b-6f38-249b-aff5a091b24e@linagora.com>
 <4f70f827-6b7d-ff57-beaa-6519a8d80633@samba.org>
Message-ID: <c636364e-f0d9-5c50-4d8e-dddfdda43a67@catalyst.net.nz>
Date: Sun, 26 May 2019 22:59:33 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <4f70f827-6b7d-ff57-beaa-6519a8d80633@samba.org>
Content-Type: multipart/mixed; boundary="------------E76F9060FC2606A4D3BC54E1"
Content-Language: en-GB
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1558868389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uQ5/adhB2rZNWYB9hQjHtDF/CK5JOgaT6DV6vGaVvBA=;
 b=U5c8ubKGSKxwHGek5OtcNvSqETh0jO70IzS0maxcMaKPsCBRl3h6XPYHv2ykBoeA8hOBrR
 fik3AuIUbbpbY52kG29X3iGzECT6p+Ll0KplsG9bfsueHomY94ARt6jpeKcg0NiD6PnQNq
 pW7Jj4nVUozc2Iuy1ZfSQ1hyJGaN780QxAUYhXBbbDThBa35IMFzmlJyCAvUx2BrzL5CEU
 vrCdwrPWP7Yk4s4YV8WzczZLPmxkdpOkgqvZL6/52hY/4a9SArmPhduvTSJ2Nn/HT12y4X
 Px8WISrD4dia0vxyRrZbZjVXjbq07a8ybz+UAXSnTwVAfA4wTXwDmEa9PAzzwA==
ARC-Seal: i=1; s=default; d=catalyst.net.nz; t=1558868389; a=rsa-sha256;
 cv=none;
 b=F1RwygTvmr0qCknz/HcThVbf+glE3GETQDBLFsSIzoU0l3jPPj31PuppV4O8j04IFryBA2
 1IjmgbH++YHrTMv9bG/gQEfZtFQhYZiiBFofEdr/33AeaNko8Q/NbV1QtSv6NQJfMXEFZE
 6osDKXteug6RGm5gF7Irnf8vwUlvldRJZPFoJ6LJdfCKkfR8D6j8y7xC70Dwf5QcfccC0U
 l8RGruQgGj9zNVWmS8/ChAJToXSJfpAZA0U1oxh5EsYtbK8LMFzbOM3qS2SCoAJrC+bWw1
 A4yRY+4LIvaCDdEYNxiDyAOTK6shyUdBe+QyXsK/cV8S24hVg+qesGuoq8V1nQ==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=douglasb@catalyst.net.nz
 smtp.mailfrom=douglas.bagnall@catalyst.net.nz
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=douglasb@catalyst.net.nz
 smtp.mailfrom=douglas.bagnall@catalyst.net.nz
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------E76F9060FC2606A4D3BC54E1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Rowland Penny  wrote:
>> Transferring other roles doesn't cause an issue, but as I understand,
>> only the DNS-related roles require the drs_utils module.
>>
>>
>> Note that the transfer seems to be effective in the end, as shown with
>> the command "samba-tool fsmo show". But this exception makes me think
>> that something did not complete.
>>
>>
> It seems to be failing whilst trying to replicate the changes, which
> shouldn't be a big problem, because normal replication should do it.
> 
> What I am struggling to get my head around is, why does 'import samba'
> fail when 'import samba.drs_utils' doesn't ?

Because Python imports are strange like that. The samba module is not
actually a "module", it is a "package".


Earlier Julien Ropé wrote:
> These show the error was found in 4.5, 4.6 and 4.7.
> 
> Each time, the solution was to modify the file "[samba]/lib/python27/site-packages/samba/netcmd/fsmo.py", by adding the line "import samba.drs_utils".
> I have verified that this fixes the issue for me.
> 
> 
> I understand the problem is not seen in every environment, but it still seems to be there for some users.
> If this issue is known and the fix is so easy, why isn't it applied?

Probably because nobody supplied the change in a patch format, or if
somebody did, they weren't persuasive enough. Perhaps they didn't open
bugzilla bugs.

> If this is because there is something wrong with the environments of the people that see it, what should they (we) do to fix it? Is editing the code ourselves a good solution, or does that hide something else we should look at in our environment? 

The real fault is in python/samba/tests/samba_tool/fsmo.py which
*should* test this but does not.

cheers,
Douglas

--------------E76F9060FC2606A4D3BC54E1
Content-Type: text/x-patch;
 name="0001-samba-tool-fsmo-properly-import-samba.drs_utils.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename*0="0001-samba-tool-fsmo-properly-import-samba.drs_utils.patch"

From 1cfaa185c353035a30a0349adaf41c6d9fb4d304 Mon Sep 17 00:00:00 2001
From: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Date: Sun, 26 May 2019 22:36:10 +1200
Subject: [PATCH] samba-tool fsmo: properly import samba.drs_utils
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This fix was suggested by Julien Ropé <jrope@linagora.com> and
apparently several other people over the years.

Signed-off-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
---
 python/samba/netcmd/fsmo.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/python/samba/netcmd/fsmo.py b/python/samba/netcmd/fsmo.py
index b916f9c97b8..c171e4418e4 100644
--- a/python/samba/netcmd/fsmo.py
+++ b/python/samba/netcmd/fsmo.py
@@ -23,6 +23,7 @@ import ldb
 from ldb import LdbError
 from samba.dcerpc import drsuapi, misc
 from samba.auth import system_session
+import samba.drs_utils
 from samba.netcmd import (
     Command,
     CommandError,
-- 
2.11.0


--------------E76F9060FC2606A4D3BC54E1--

