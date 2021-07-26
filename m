Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 144C73D66AC
	for <lists+samba-technical@lfdr.de>; Mon, 26 Jul 2021 20:23:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=fNRon6Zd0Zptdv+PUVH2lK9Wv3HmMUizrqGCCRdWGtI=; b=LrSh6NOALhZLWmckWUj6IXbtuO
	I6ZtddM6V7zAHQVdLOY5C/ZjG9R8F7dHbqNEMV4YoJuT/d6/km3oYTokGpmJnlVelm61OgFM+4rBN
	S2hISXEO0YGhu/TYr53QD3cMfOotJMuohHziOQgKHPVNzdx8csQzM8Vm6hH4uS1JqeDa8diE2Vcgw
	JAaJ4t3x+L1wbOBu6aW5sr+4r998paAtW1MlZXDnNp1Q23nto8Cv4pZOYOWwwPz5+XvorsfvjdKbA
	bqS/ZUcVsZhUxn908D2ciKTVBBHOElq5sC00noqs89LWk9c/uxmnWDEUbDeW6v2g/jeR6q/xtrF+T
	9cANAKug==;
Received: from ip6-localhost ([::1]:46698 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m85Fx-000sDU-VF; Mon, 26 Jul 2021 18:23:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54106) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m85Ft-000sDL-Ae
 for samba-technical@lists.samba.org; Mon, 26 Jul 2021 18:23:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=fNRon6Zd0Zptdv+PUVH2lK9Wv3HmMUizrqGCCRdWGtI=; b=Flp7fRpWRaXgQ/xF621UFpunuP
 4i+tumO1oecAzTdrqyPWWIudde/uJj2hxFB44CqPaDcrnW+rGJd0fi8hvimqkwXd+NOUUq9fGtkeF
 d3/aNxeTndplttnfSn0YfKsHBO2MyJ4JYy4nIkMwCjPIF0E6saHZTkwS19Uxu7mF9BOiwpr64wY0U
 TrX5xxfDgsy7PLGGu+cZFlon6u0W94OpZaPuH9PIDlAR9qwKe6ezQtWGYFeuFiWbKDu9lkjn2+DV2
 /1Za5c1TK48gwC4nbtnm9OVnNC7w0iT3M8UzLP/3BUMkjR2jYhP68P6DVeXlY6PbnhUijvhPnSwma
 QfuAzLWBpnAr53UAgqC6othxVJsQPWj9hpbOxfcQY/IFB56I73SviqLqEvKEyCGlo4uFg4+0UkX0m
 V1mFWuwlPh9dOiUjwY1/CCSLAlUZtd2Mu/CCrIFZh8xBzoQ3Xmz1tdkPWh2sGeuplIpcbd91f0cxd
 xiXFPfgLrgqzwlO+rkmdhb/U;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m85Fr-0008DC-Ov
 for samba-technical@lists.samba.org; Mon, 26 Jul 2021 18:23:08 +0000
Message-ID: <5d214a265708c2062855bcf31550416c5183089d.camel@samba.org>
Subject: Is "acl_xattr:ignore system acl = yes" recommended?
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Tue, 27 Jul 2021 06:23:04 +1200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

In our wiki:

https://wiki.samba.org/index.php/Setting_up_a_Share_Using_Windows_ACLs

there is the fairly strong suggestion to set:

 acl_xattr:ignore system acl = yes

I feel like this is a fairly bad idea, we should defer to the kernel
unless we really know that just doesn't work.

But I don't fileserver every day, so I wanted to ask first.

What is the broader view on this option?

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


