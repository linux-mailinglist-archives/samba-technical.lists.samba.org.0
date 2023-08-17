Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 437FA7801F2
	for <lists+samba-technical@lfdr.de>; Fri, 18 Aug 2023 01:52:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=OA0ogspV/W18f7E7GziO1E4gMPZEzSsoxJWbRCymAWs=; b=oiHSZmlrLiKmIDdxvRIvEkgwBv
	zScXa+aZHiLwpfNSpHiihg/HlBz4lTrt3F/uCtq+gj/VHnaRncnu+lUJZEFfN274Gt3A46h9yxBnz
	N65yxoRBuG9cX79ZmFAjjPiov4e5De+Kuy3qwEV23DCehazb0xsp88SC3leh03zcya/hOYqv5qdHf
	PKNKhrLgJXUlTPM9yEEUV0ahyan1Bz02so5UoEn9K0i1HozuY1y2QRpozbIgsp5glXS5RyXSXJ/Hd
	GusDy8GbTjrQ2Ba+YUB8tFwVAnf1ARp+dmqsONoLgw7caberpb5N2mRyr6mps7R7sooi1umPD+vNB
	gflokRCQ==;
Received: from ip6-localhost ([::1]:49506 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qWmmw-00Cxvl-OT; Thu, 17 Aug 2023 23:52:26 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:57410) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qWmml-00Cxvb-Rf
 for samba-technical@lists.samba.org; Thu, 17 Aug 2023 23:52:21 +0000
Received: from [IPV6:2404:130:0:1000:2225:64ff:fe75:8a7f] (unknown
 [IPv6:2404:130:0:1000:2225:64ff:fe75:8a7f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id D2C1481152; 
 Fri, 18 Aug 2023 11:52:05 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1692316325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OA0ogspV/W18f7E7GziO1E4gMPZEzSsoxJWbRCymAWs=;
 b=lHsWAMWbIZvzOo7t+lWpkjqzk9SPCStbhMmdqoYqYbxcdSwHiN7QVp+eZb/gKDRGZfKR73
 +CemtsWPRgGa3tLRG8es61OIvTB9nHB+9RswEi8XYm/7W8m+ftQNyDKADsCVyUMu7Vqobz
 sOVYXCHhb5puMv3M7mJzuknfMKEu5qZwlxjLAuJ+gGTr2Rh2ioH3nsf4McjX/DimKw7VTZ
 JrZokfKM9aKDr0U/jWwewSJMlEc88bTmXrwMH9RpNgW97A4a+7h6dasdbUaxOgd9jDOarh
 4D5THgxKrpnsgNHLYQWlpfFvJtQWP2zwjGEuW1ZCMgXRBHiA6dhS8YdIr/F4DA==
Message-ID: <4db84791-6dbc-4f8e-f1d7-7582451d19c4@catalyst.net.nz>
Date: Fri, 18 Aug 2023 11:52:04 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Drop RHEL 7 / CentOS 7 support and move to Python 3.8 minimum?
Content-Language: en-US
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <6725d25bf9dbbfebd0b1ad248fc6b397f89165c8.camel@samba.org>
In-Reply-To: <6725d25bf9dbbfebd0b1ad248fc6b397f89165c8.camel@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.10 / 15.00]; MIME_GOOD(-0.10)[text/plain];
 DCC_FAIL(0.00)[failed to scan and retransmits exceed];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
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

On 18/08/23 11:20, Andrew Bartlett via samba-technical wrote:

> We need to reduce our CI time, and one way to do that is to reuse
> objects as much as possible, creating read-only objects once per class,
> not per test.
> 
> This is much cleaner if with the addCleanup() and addClassCleanup()
> methods, so I would like to be able to do that.
> 
> To do that we need Python 3.8.  The primary blocker for this is the
> CentOS 7 build which uses Python 3.6 from EPEL, and a newer Python is
> not in that repo.

I had a look at the Python 3.8 git history for Lib/unittest to see if it 
would be simple to backport/recreate the ClassCleanup code into our 
TestCase wrappers (like we used to do for various assert methods), and 
the answer is NO. Thankfully.

I have no opinions about Centos 7, but I do agree that the supported 
Python versions need to be exactly determined by CI.

Douglas


