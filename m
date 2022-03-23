Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2C54E4AFC
	for <lists+samba-technical@lfdr.de>; Wed, 23 Mar 2022 03:39:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=4HKIjFQYMfFcRYUIundfC8sdbggBvrs3FJen1eraIeg=; b=xUHbNOb6Lgeb6csoWCzXSahK9A
	m/ge3CPxjJ4vchvk8tmh9FITcQFk3MFFAjzNs/G+wT7/5/DfPIr8DlT9zoIfGhYLNx1ka1b3Y+BDZ
	7OignJZhBpDrkW7oxUCvlKOtEuaTLxK7tOKLmhCUhKb3JQmPtgy8ShxrKJvW8E6sgiV46ZaIhNJdR
	fCzGWSzMCOOBa4ehhtKdYn+wc0LG5CO0mbEFgtxBJ97yVePxo/gTVpNp/e5kMpSt+LWcCp4UZZenI
	pGGI3CJOJnhiqccJSWwS7eNsUZzgmGQAd69e7k410bRfN6bXe3gBbjZvdyg+8Hoicg9bN5VN49Q+5
	xsHxZKbQ==;
Received: from ip6-localhost ([::1]:58938 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nWqt6-004IP8-TS; Wed, 23 Mar 2022 02:38:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37784) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nWqt2-004IOy-0P
 for samba-technical@lists.samba.org; Wed, 23 Mar 2022 02:38:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=4HKIjFQYMfFcRYUIundfC8sdbggBvrs3FJen1eraIeg=; b=Aoi8c+fGK76eyYVK80rx2kOuJt
 j5RpbCSu//u+hd6N1oMss3tZzmqRu0hbYPOqu1F8mRVgn4poGYnXIwBK8VqiQg5VDRHu3b2cSsM8H
 nHpRNFhG+XzKF0dTEEoOfvWGG1nMX6OxgSZfePuakkB9rfE3712Noa3Ow5lHRg6FzjIn+8WoQmC5o
 9I0sImzsyc9W+hHMb1nj51vI5x0FtdKB4SCcg1fqy15gbjNE6eol9viVYqLufu0GqvVc5ISOcrvYF
 5Hr9ma/lYvoJnEu07iQMWkCyKcBc+7xr6UYwSUjsNSmrCc589O56zgZABbfSDO6gGZdRbjdAKECGs
 tPeSZV3SSQEj0Rm7SgQjPxvtBLQnIzzGjJaW7UwmtVjQpSMqgv2YSEONn0V/a5+cYmEXwzKgCpL/O
 4Z++mWXCqZ2OjVsr9LTrAqrXzVEfFXP78mzbtaEFLTAMW4Y3fATAlwE70sgJ+WsOmgNFbkFO+6oqJ
 yoSB7FrpW07tAh2+ZtkaKqoP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nWqsz-002vkL-KJ; Wed, 23 Mar 2022 02:38:10 +0000
Message-ID: <94244c0fe851b635a68ce718a0e37be755c50d00.camel@samba.org>
Subject: Re: We need to rework "allow weak crypto" mode in Samba
To: Alexander Bokovoy <ab@samba.org>
Date: Wed, 23 Mar 2022 15:38:05 +1300
In-Reply-To: <YjWlCoHEI9qvaUn/@pinega.vda.li>
References: <e0c3b5921e018a5b74448f40a26af4015193824c.camel@samba.org>
 <CAH9M6r+uJ8VPTdHy_=094QXOqQaf63DpfN9H0k0kUaKfUk5ajA@mail.gmail.com>
 <0d1584239bc53567cb2165074b63338d6570f4d6.camel@samba.org>
 <CAH9M6rL7Xc9BnymYt5vgiacwG4jOStNBmumvgOt0dDMGwSwVVg@mail.gmail.com>
 <3ada695fdff1b1cb3e1f0edd14b41e9b4605dff4.camel@samba.org>
 <YjWlCoHEI9qvaUn/@pinega.vda.li>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Aleksandar Kostadinov <akostadinov@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, 2022-03-19 at 11:40 +0200, Alexander Bokovoy via samba-
technical wrote:
> 
> 
> Note, though, if you'd follow strictly FIPS 140-3 (or even FIPS 140-
> 2)
> requirements, krb5kdf function is not FIPS-compliant, so aes256-sha1
> and
> aes128-sha1 encryption types could not be used in FIPS mode. Active
> Directory has no support for RFC 8009 types (aes256-sha2 and
> aes128-sha2), so in a strict following of a FIPS 140-3 environment,
> there is simply no way to interoperate with Microsoft Windows clients
> in
> Active Directory. I believe Samba AD has no support for these
> encryption
> types either even though underlying MIT Kerberos and Heimdal do
> support
> them.
> 

Thanks Alexander, this and the other comments that I didn't quote do
help.  

It is now clear to me that we should ensure that Samba has independent
configuration for the 'weak' crypto operations that we may wish to
enable/disable, totally aside from a system 'FIPS mode'.

We can still override and disable operations if that is be globally
defined of course.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


