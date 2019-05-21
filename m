Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (unknown [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8E72492C
	for <lists+samba-technical@lfdr.de>; Tue, 21 May 2019 09:42:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=ufCFAf2AWY+PFdtN/5bNPoMlbhpkfRQXhr4KBpcfawQ=; b=B8XEETTCZhIDQMrr4tY0dKCSyz
	svr86gpteaiW2+lxh/dWu1y6nfrIdnR2sGFqVDqZTHEAWvVKJfd9afgnQsMrIvy21Fumm17Bs8QgC
	Ci+9jYW5YpFY6mnJr2MP6BbXnZDvYwXoEsSUvDKRDitFgiMV//j9see1GE76rI+8Ll2bSRkHZdGIy
	DKr1BnyR/fThwYuidNJhb5D6z91OkbRmcwq8fBhRTLN88tc2ZfCBqko9qRMBvrBDf5d6+rsuVfO6a
	FYsDXAa5jbYb25Nh6Y/3YfEMq5ZZE3HRYRozOXwbP1KbKSYdxw2GD2ltyjDp3lY0qosJiQZc+IoXq
	B33Flv5A==;
Received: from localhost ([::1]:37042 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hSzPZ-000vLa-60; Tue, 21 May 2019 07:42:13 +0000
Received: from [2a01:4f8:192:486::147:1] (port=39508 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hSzPU-000vLT-AW
 for samba-technical@lists.samba.org; Tue, 21 May 2019 07:42:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=ufCFAf2AWY+PFdtN/5bNPoMlbhpkfRQXhr4KBpcfawQ=; b=sSnTSA+UiHE019rnUcNxg5aokq
 9SFQk5jxokD8YQsfonIJ1j5d+oVI2ZWla+9sdbJn/uNK5ubkJbF8RCFT3VstA5XHuYY5fch9Zf4/k
 q24KECSuVTCfNFtCvOdC4icimFUbpoiN30G02h25ACQSYKcOkEnr1FPQlZpD5AYB4Jmc=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hSzPN-0000oP-PV; Tue, 21 May 2019 07:42:01 +0000
Subject: Re: Samba 4.11 Freeze Date?
To: Andrew Bartlett <abartlet@samba.org>
References: <1554082801.4036.4.camel@samba.org>
Openpgp: preference=signencrypt
Organization: Samba Team
Message-ID: <88c02bab-06fc-69b1-793a-dad6851804df@samba.org>
Date: Tue, 21 May 2019 09:42:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1554082801.4036.4.camel@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andrew,

Am 01.04.19 um 03:40 schrieb Andrew Bartlett:
> I'm wondering if you have a suggested freeze date for Samba 4.11 yet?
> 
> It would be helpful for our planning to ensure we land features with
> plenty of time.

sorry for answering late.
I just updated
https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.11

So July 9 will be freeze date.

Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

