Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 688D049D149
	for <lists+samba-technical@lfdr.de>; Wed, 26 Jan 2022 18:57:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=tE0UwFAKBEEI6t9pTXyqpGFAE7FqUsh6fC93SlnwWbU=; b=1xXf5ITvUpU1v7tJ6GGslXhXmX
	2i5Ab7scgB8hmJ9uwuHMNLIBMTQjtWD1QGHjRlESykdJWPlOZqkTzyYk2+C0h74NbzUKYlExov4dq
	IVgnaE7DIya4TCba2hqqG4Q4Z0QTs2yYcepbVQsrzYDMGHBkyQmRcSkNgwdwVkKNA7pAjxGD5RVjv
	ehJolODb0UotvWw/ZDYs+DTDnK8lzRHJjd1t/EDgCdBB58NGRl4L7i5r3bBE35lji/b2FLR3lSdps
	F3IqzU4z5G3re2ytz8GOJpr0PAI17sljnlYosw9fd7JAKBmrHRClGSPLJGBc/3QTlFfP4mgyw8ZQS
	nQslEpQA==;
Received: from ip6-localhost ([::1]:18866 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nCmY5-0019jj-Is; Wed, 26 Jan 2022 17:57:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48384) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nCmXz-0019ja-Qa
 for samba-technical@lists.samba.org; Wed, 26 Jan 2022 17:57:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=tE0UwFAKBEEI6t9pTXyqpGFAE7FqUsh6fC93SlnwWbU=; b=ypTwdZeoYmZ+1k/9rsaToeWiw5
 UyK59tbsZafZuNcd8LAV6hgxt47CZyJM3lvPbdnRI27+0vOhy/BGJWZDCDImKMPBzjiTKvBinBqm2
 c/lz1//roeOO0fRNDHX6auTF76iHqnj5wvomns8lUOyJYajltAWQzHANfw/72DO/PcfKBMlS0UVbA
 TeTd0TkZqBAdxzx2e9DcLUR1QP9+CGhtpiT6svpDLi7iQoaDmngMV+4PlFe6IMdEH6hNMT2utSIo2
 dEuU3dxPYzPMYN0/VPU1aH9lN4LpT0QksvhsvuDCdK8zVoe4n37AScCuU8LDRkUqIYtgKbdW+vbci
 cOutx1vcqVORydr3eBvsQ8uSXg+BVf1R0+8vZXBU38MGkQXhjLWW1XdnTOIN64LsT/gHP5Sra4ZHV
 35pn85QxiVaU0eDdVEXmniVGJbBBGiR5/YtQGLeCLSxbWib4RgwheW29t5IqQTFmAMIosum6/pI6w
 crsFaWTS+BEzjndKQOes/v0h;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nCmXx-000kev-AY; Wed, 26 Jan 2022 17:57:30 +0000
Message-ID: <bab38b9741214fdd5b11040caaa0480b58305aaf.camel@samba.org>
Subject: Re: Samba build error: module 'time' has no attribute 'clock'
To: Steve French <smfrench@gmail.com>, Jeremy Allison <jra@samba.org>, 
 samba-technical <samba-technical@lists.samba.org>
Date: Thu, 27 Jan 2022 06:57:23 +1300
In-Reply-To: <CAH2r5mvVanfR+7ipZfUfOg+3i_3+C8aYT=z2i6+C8RU8SA08fA@mail.gmail.com>
References: <CAH2r5mvVanfR+7ipZfUfOg+3i_3+C8aYT=z2i6+C8RU8SA08fA@mail.gmail.com>
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

On Wed, 2022-01-26 at 11:40 -0600, Steve French via samba-technical
wrote:
> Not having much luck building Jeremy's master-smb2 branch (
> 
> https://git.samba.org/?p=jra/samba/.git;a=shortlog;h=refs/heads/master-smb2)
> 
> on Ubuntu
> 
> 
> 
> Anyone recognize this Samba build error and how to fix it?

Try with a very clean tree, if you haven't built Samba for a very long
time.

We had a Samba python file called time.py that could therefore jump in
front of the system time, but I never saw it cause build errors.  We
renamed it a long while back, but an old .pyc file could be the issue.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


