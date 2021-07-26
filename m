Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B30073D68D0
	for <lists+samba-technical@lfdr.de>; Mon, 26 Jul 2021 23:42:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=0ZSqwBBNVhRpge02QGEENbTILwybm5tzLl2frgBkXq8=; b=Ge1DMZCTSJ4wqXGxpdyKXS/B/g
	v6TwvaCJJdvWfJM5GYIi4FGVtH+ZLQs57Xs/P3YxdEgcBNRoth+An9wCYtkWrqyv8ymuu7b4qcmrL
	4TLN5gqKAop8N3HOyePz5xWWo80atDLlJK0WneRJ8PyQhkFCtP/te/PMvo/MYMVT9Fwx+Pdm4jwbi
	ALqKTr7O0VvOnK7u1YzNvQ0F87GwBmwA5QYhYqCW4GN/cydHp9PXuYcqel++BGdyqPYXl4gTaXsNw
	IbBH5rvDixOTb9ryfxNNPvuZ0U9mNUR9a5+XRL3z4T1Iol8tY5EpZb+eMSW/F06HZcGYFFrSe5IGQ
	ifP+2O7w==;
Received: from ip6-localhost ([::1]:55376 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m88Mr-000w8L-8l; Mon, 26 Jul 2021 21:42:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50436) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m88Mm-000w8C-Qn
 for samba-technical@lists.samba.org; Mon, 26 Jul 2021 21:42:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=0ZSqwBBNVhRpge02QGEENbTILwybm5tzLl2frgBkXq8=; b=rloZAJVfGJ5bZmcD9uhKzEwmhp
 Zmaja96yWZHe4zvB2gBSPJWTc9VConmX9BcNj6f+Of2dwq+V9IXRkc/eZQS+jul4Bikyupkw9iyJ9
 /BOwFGQLkfRHxXoRmgQoJ84audhJfql36oAHLsrUE7uCxhG2JbT82tnRjD/ostqLvPENgyxbsNZ9A
 /4gHPw58NjdSYiKDUjf+10D2yz12m3xWTOx416CRS6K7WwhJLL5IBillCGyCWxdZ3VMEY2nojvDsd
 VtbytQEzhXVj2kkKMlEMb012CvQ9CW6fF1zvGcl1QgaJ/Sl6q66j+INau1YCy6c9gNgYmxPJSLgKk
 QvLffFsmF/0Xuf9KwMSOg/LIgYWMmcIVerkVSkcnEiprTJZAS3M5o7eDTMwXN16a7JdcXXk+vDm+G
 Um108KBczUMCmIXiPRmbrQWRzYbdDQFTXCf8SqOtbPBZsn/YT8PyNXzCuAz76iEOQNVjsd1bmNJMq
 pewZmeblb+qNtQqa7yYBTNUY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m88Mi-0001CH-1B; Mon, 26 Jul 2021 21:42:24 +0000
Message-ID: <28f83edc900152a2323afb243dbb2b6682505326.camel@samba.org>
Subject: Re: Is "acl_xattr:ignore system acl = yes" recommended?
To: Andrew Walker <awalker@ixsystems.com>, Rowland Penny <rpenny@samba.org>
Date: Tue, 27 Jul 2021 09:42:18 +1200
In-Reply-To: <CAB5c7xpyq=CEGgrS2ONTPaG-w9W4Dki4zcGgcKoVgfxur-Zaqg@mail.gmail.com>
References: <5d214a265708c2062855bcf31550416c5183089d.camel@samba.org>
 <754a4adf537fa6f92b4d75d8cff8f414ea49f952.camel@samba.org>
 <CAB5c7xpyq=CEGgrS2ONTPaG-w9W4Dki4zcGgcKoVgfxur-Zaqg@mail.gmail.com>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2021-07-26 at 17:38 -0400, Andrew Walker wrote:
> 
> 
> On Mon, Jul 26, 2021 at 3:17 PM Rowland Penny via samba-technical <
> samba-technical@lists.samba.org> wrote:
> > To me, that means with 'acl_xattr:ignore system acls = yes' set,
> > the
> > normal Unix 'ugo' permissions are not changed, so where does the
> > kernel
> > come in ?
> > 
> > Rowland
> 
> When acl_xattr:ignore_system_acls is set to "yes", create mask
> parameter is set to 666 and directory mask parameter to 777. POSIX
> ACLs are enforced by kernel (that's why they also apply to other
> processes / local access). It may be a problematic recommendation
> because it leaves filesystem access wide open. This is why I've been
> working quite a bit on NFSv4 ACLs in Linux on TrueNAS SCALE (and why
> they exist on FreeBSD), you can get pretty close to 1 to 1 mapping of
> a security descriptor to NFSv41 ACL with the result that permissions
> behave same whether access is through Samba, NFS, or local.

Yeah, that's exactly my are of concern.  

Also, the POSIX ACLs being enforced by the Kernel is also our fail-
safe, so I'm quite nervous to recommend bypassing that.

NFSv4 ACLs would be really good, I'm think Samba can be rightly quite
frustrated they have been so difficult to get traction on with the
Linux kernel community.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


