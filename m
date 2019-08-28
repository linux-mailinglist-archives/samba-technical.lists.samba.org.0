Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4DCA0A36
	for <lists+samba-technical@lfdr.de>; Wed, 28 Aug 2019 21:13:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=dEHdniApmIZb7Kz7uNOmQL4TBdPSBJHGKwxDrieJJfE=; b=B57CXp3DCzc0oJZ5s2tSRWGjAg
	Vwk58vgvSAZMUne3jRjWcoMoRl2bImXx9i81KTj3jBsEhuJLssoY4m7G6DzjSkiXQYnqfG8SUL93T
	OIZ3CCiIFhxwEfqEJmL68aCFJ4akg1p6tlrzZHI4PU9ZZXvuHxbqP22LVoSgczLHEVWvSdtsCdaKe
	v/DJclxf/vMS+i3bo+g1lqNiLEF+BJR6bMuiy12NQXfWAIht37tI6bvezQ+ZNiev3ttsUYHCywhFd
	1IbNxKzPq/4cxZr+bsS2FD6pfFVbX32fL/uEObCqHA9yIS3G0i0QYVhAc7SygS/cH21GGp7Q3nFUY
	Jc5/2qcg==;
Received: from localhost ([::1]:60942 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i33No-0006r3-6k; Wed, 28 Aug 2019 19:13:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32070) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i33Nj-0006qw-9T
 for samba-technical@lists.samba.org; Wed, 28 Aug 2019 19:13:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=dEHdniApmIZb7Kz7uNOmQL4TBdPSBJHGKwxDrieJJfE=; b=uFtl1DKPNnWe26GI2T7X2ab+oq
 F1MdhWN2r3qIbGYrO21xNPiq/a9gfJR72mQeA+9IScB5oM4QIQMAY97nHWixIAV1kXunsD8zBT64M
 3M8m1Uw2+UwDpYm5yW0c2BJXgm/+4DyzVYdXb8HXDuy0eLcLdf7WQse+GYfpnDpsmcS0=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i33Nh-0002F0-OF; Wed, 28 Aug 2019 19:13:22 +0000
Message-ID: <bc08536df3f95f74260f9e69be44901cd6a40943.camel@samba.org>
Subject: Re: [PATCH] re-add pidl install
To: =?ISO-8859-1?Q?G=FCnther?= Deschner <gd@samba.org>, Samba Technical
 <samba-technical@lists.samba.org>
Date: Thu, 29 Aug 2019 07:13:18 +1200
In-Reply-To: <ee7ef5951ba67e788cff73811a29cda46afb7356.camel@samba.org>
References: <a4cd67f4-ae87-1ac4-7053-1946a19bf7b0@samba.org>
 <ee7ef5951ba67e788cff73811a29cda46afb7356.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Thu, 2019-08-29 at 06:32 +1200, Andrew Bartlett via samba-technical
wrote:
> On Wed, 2019-08-28 at 19:08 +0200, Günther Deschner via samba-technical 
> wrote:
> > Hi,
> > 
> > attached a patch to re-add the pidl waf install. At least openchange,
> > although a dormant project atm, requires pidl to be available in the system.
> > 
> > https://gitlab.com/samba-team/devel/samba/pipelines/78660819
> > 
> > Please review & push.
> 
> If needed, why can't it use the perl MakeMaker makefile based build
> that we have tested in autobuild?
> 
> Also, please use GitLab merge requests for patches to Samba, for
> consistency.

I would note for context that this was removed because it was not an
optional install, but a mandatory part of 'make install', which was a
problem for this vendor (Google).  

From memory I suggested removing it (given the independent makefile)
rather than adding a '--without-perl' or similar option to our already
over-complex configure script.

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



