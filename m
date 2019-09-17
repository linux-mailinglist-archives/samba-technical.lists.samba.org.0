Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E4203B5634
	for <lists+samba-technical@lfdr.de>; Tue, 17 Sep 2019 21:34:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=DGhDTbHMyBzZ7EU3p5lWrF8DjFlG34DGc6ob5KiTi9g=; b=PCYB8P7eAIkSvKXEdmOzhL4KX/
	4aMh+LyG/GaGktzEiyI7x+X29/+E8Yt9RG1fDQ2Mu4r8WasH6Oi4/PhP0q4nkJ70dsk4ehQ32IOMA
	e2mLSBgtxukoZMSSRAjCvQKC2gQD5h0I/hfoV8Q+ZN24jWy8mOvFZ02tTchccrZgX+4q79BVNOOay
	nP5m+1pZlhddY4l08PJ/qvySybPpGlqGzsZjyL63J/LA17MV1MLXLFOB5CRd6AuZqz2d5N8m54SME
	Uqi3R+KH0LuuqIDNEz5JXO4Kr4jTn0TozPqws4hXyXEZQmo/GWxBQwaFIGv7h3yyhdoaOAy70abse
	KGcZA+bQ==;
Received: from localhost ([::1]:22802 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iAJE2-006JNr-TJ; Tue, 17 Sep 2019 19:33:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31972) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iAJDx-006JNk-3z
 for samba-technical@lists.samba.org; Tue, 17 Sep 2019 19:33:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=DGhDTbHMyBzZ7EU3p5lWrF8DjFlG34DGc6ob5KiTi9g=; b=KH1I0GHsxq6bnoBanraL1ZAP/W
 S+tiZDkUhloO14CYx0Gmw4kIszJZs07mfID6mVR9246PaXQc6P7SZh/QpKHz/N85ky+9bhDJByvWb
 UBL988TUiUnaELysj12eqofoI6Hz+xC+4wyaJqFl1FuIMRVZVKhZIOXvS+eL0d7Yx2+0=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iAJDv-0001Gn-6H; Tue, 17 Sep 2019 19:33:15 +0000
Message-ID: <b34d077e33bcb6e72a25e6cd0b32ed28e570c7e0.camel@samba.org>
Subject: Re: samba performance difference between old and the latest ?
To: Namjae Jeon <linkinjeon@gmail.com>
Date: Wed, 18 Sep 2019 07:33:10 +1200
In-Reply-To: <CAKYAXd80cwJ2XUOBoP25M94mB_P200Y7BnajsSZwWkMuuXO8Yg@mail.gmail.com>
References: <CGME20190906020151epcas1p487a64747d0a00c84bc683fe0d07207bd@epcas1p4.samsung.com>
 <006701d56457$0c77fc60$2567f520$@samsung.com>
 <371f328678d7f01b7051d657499ec0f8b341b2f9.camel@samba.org>
 <CAKYAXd80cwJ2XUOBoP25M94mB_P200Y7BnajsSZwWkMuuXO8Yg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
Cc: Namjae Jeon <namjae.jeon@samsung.com>, sergey.senozhatsky@gmail.com,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, 2019-09-07 at 14:58 +0900, Namjae Jeon via samba-technical
wrote:
> 2019-09-07 12:20 GMT+09:00, Andrew Bartlett via samba-technical
> <samba-technical@lists.samba.org>:
> > On Fri, 2019-09-06 at 11:01 +0900, Namjae Jeon via samba-technical
> > wrote:
> > > Hello,
> > > 
> > > I found something strange during measuring performance with samba
> > > these days.
> > > I checked the performance of samba 4.7.6 and 4.10.6.
> > 
> > 
> > > samba 4.7.6 : 11.6MB/s
> > > samba 4.10.6 : 9.5MB/s
> > > 
> > 
> > Jumping back to the top of this thread to focus on what you could
> > help
> > us with.  If you built Samba for both of these tests, then perhaps
> > you
> > could do a git bisect between those two versions to work out where
> > this
> > degraded?
> 
> Yes, I agree to narrow it down.
> > 
> > Of course, this assumes it was a single commit, but who knows, it
> > just
> > might be.
> > 
> > Either way, if you were able to additionally test 4.7.latest,
> > 4.8.latest, 4.9.latest, 4.11.0rc3 and master (so as to add to the
> > dataset) it would be a massive help.
> 
> Hm, okay, I will make time.

G'Day Namjae,

I just wondered if you had any more numbers to share with us?

I know I asked for a lot of work, but we would really appreciate any
insights you have on this.

Thanks!

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




