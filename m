Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E184E453FD9
	for <lists+samba-technical@lfdr.de>; Wed, 17 Nov 2021 06:05:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=W/xAhcuykX4vaAyBS1QCuV3yYv1Vu21arkjs7MDX1I0=; b=JOZvAHs7WomfZI94qpodqjsqzV
	Dfbv+FhWZf2jX4GKdHO58rUQTi/n/0uwDM+qcTSD/09HThckygmbS6R1ECSTXOEJZ5SGBvud6IS+R
	/FXVhj9VBbTjfYb6pcpo1E5jKeNOPjlFvMNZB05FWiLbQ7djas7vdvF1/E1grxpwgIQumpL8jJJcx
	9OTxTpX6uMHUSDCb15eaLWvidyrx6POnS9OO3MLDlfYxdu2swe1vMuQ8M8JPSwuYyFh1oxW8zqqjP
	MPJkfQi9+jkH6UXNYxVl7l8rlqTgRWkHeVQCsgZlpilm7CinETazS0ebPgG/Uh9LS3k+RznKD7/Fj
	K4eNUxVA==;
Received: from ip6-localhost ([::1]:25740 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mnD7s-002ElD-Q1; Wed, 17 Nov 2021 05:04:52 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:41086) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mnD7l-002El3-L1
 for samba-technical@lists.samba.org; Wed, 17 Nov 2021 05:04:49 +0000
Received: from [IPv6:2404:130:0:1000:908a:471a:7cfa:8943] (unknown
 [IPv6:2404:130:0:1000:908a:471a:7cfa:8943])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id D73B781535; 
 Wed, 17 Nov 2021 17:45:46 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1637124346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W/xAhcuykX4vaAyBS1QCuV3yYv1Vu21arkjs7MDX1I0=;
 b=sPesyR1gkL5xT7a/GCe69l5KFrG5Nv11BMAOOcctNqqYnPCKWrjUrCnQ8AvZwAIrCoSwnE
 63IXvh7QjSfHHqtQuSTISr8QsypPojWMILfZspzo2CUbrNfDKNqrNmdUb9uGqxJ4c0C4x2
 tXhATSuTVbCDCeEyaDOwz3Pgq0KV2qn6dacQOjE4t7D/YPI69Ap2LwvVPVO6cdouSZvrv8
 B/8kaQQEPYcTPimM/E9evgz9EY35Cj6y6aGVECc19xRMt9J9kqadZ3CF+FpdmxHPpaT++O
 +2Fs2ZvkpiB9EHb4H5SLq5wqHQB9GEBHw16Ip89doh1+D0ui9NQdhAgd644TjQ==
Subject: Re: Heimdal working around gcc strcmp issue, can someone check Samba
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <9480d292b7a87f26988fe5ab8d43819615e3e329.camel@samba.org>
Message-ID: <bdf93a25-4e11-8c2f-3fc8-bd4392dce0f3@catalyst.net.nz>
Date: Wed, 17 Nov 2021 17:45:45 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <9480d292b7a87f26988fe5ab8d43819615e3e329.camel@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.10 / 15.00]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
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

On 16/11/21 7:01 pm, Andrew Bartlett via samba-technical wrote:
> I just got notified of this PR for Heimdal:
> https://github.com/heimdal/heimdal/pull/855
> 
> Can someone work out how much this bites Samba (and can we just ban the
> buggy compilers?)

Although

     if (strcmp(a, b)) {

is contrary to our target style, my reading of the bug is that it does 
not affect strcmp, AND it does not affect the

     if (memcmp(a, b, len)) {

case, because of the implicit `!= 0` there. See
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=95189#c17

In other words, as noted in its comments, the Heimdal PR is mixing 
general style changes with compiler-bug-workaround changes.

What we need to look out for is

      cmp = memcmp(...)

and

      return memcmp(...)

of which git grep says we have 61 and 25 of respectively. Which is quite 
a bit, especially given changing these would mostly not be a style 
improvement.

The good news is there's no memcmp() at all under bin/default.

Banning buggy compilers would be nice, if it left us any. Judging by a 
glance at changelogs and running the test in 
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=95189#c31, the default gcc 
(9.3.0) in Ubuntu 20.04 is affected at -O2.

Douglas

