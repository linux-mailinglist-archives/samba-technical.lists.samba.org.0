Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 925D37110B3
	for <lists+samba-technical@lfdr.de>; Thu, 25 May 2023 18:16:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=ztcgYMBj9Yt01yBi1C4M1q81670ZmoC1VEW/2juynxM=; b=jFjqgjPhMs4m4ZZokKmb3akaTL
	kPnzCnyZ74i8neuO82xGHE4x9dRpvVxnqbNDss7rJfgQPh5WJzKO68IZxsFNUstmYSvLdMWFABkf2
	f1+aU/+AB2X1g/mUTdEvMf8v4YWu4R9pYTYeXibF4FQaoi19M6Le8vQznL6Vg8T3iKCq/xX9YsQGa
	gs7T1jEEf9wgfq5DdWMCBlvU3LIIbkRs7/fudj9WNMv/S+xzd742cwRZUXFnZc80rke7FKuN1hZ0D
	KnYL0wyMDaPpl3DtF0kVEXPCnYCpFrYQ8FZ71VfEIllp5EE7E5Z//qopmdma8vn1KuZX6BmomdgDT
	ZPRsBB7g==;
Received: from ip6-localhost ([::1]:60510 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q2Dcx-00CCtT-U9; Thu, 25 May 2023 16:15:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11826) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q2Dct-00CCtJ-Eo
 for samba-technical@lists.samba.org; Thu, 25 May 2023 16:15:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=ztcgYMBj9Yt01yBi1C4M1q81670ZmoC1VEW/2juynxM=; b=eyjI4XIQOhoe4GUPmtSqNv1Zwt
 fQMSesrAGkh6jo2tb/GjxqTcXjMwNpR1syBIdi4u/GmDUnFPwHQi+56JdR0MDgovYBj+m3R05MqyF
 IaTYKHcDHM8y9FViC08BC7SubZYhmkbYKxJdZVMh00gc49LB8QlowT6EKsYTwAbTNjB0frGDbCOXn
 UtSLP2uGGyEMilXeuJ/GCwBMqNi2bbAf2V3bCrbVgaP03eBy3B1SZs1C4Fyzot65mvTuezGxOJ4/m
 P6Mp0k8Uk5EdoFv2YSVxxDoEO6hHIwqkz4VKE1dMiFuiovmBlcWND7aArlE4eC/l5/lCVaoJvb7Hu
 XfI95AstaLljEGHL4eD8ZDSBk+AuJ50A+10QaVlGguOUrABoTUDmIZLbgpM2XM1kAcCboe4gUEi3O
 51PJeIvUgUBmE2kTWxX52+3WVYU7xg8mFwDrpORovOohAzIMyf8nnbbw8GsSwoBhZWBs0qWzLdGbi
 SK4YKTlcXgULsFbTBbcqh7fH;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1q2Dcr-00C9vq-E5; Thu, 25 May 2023 16:15:42 +0000
Date: Thu, 25 May 2023 09:15:36 -0700
To: ronnie sahlberg <ronniesahlberg@gmail.com>
Subject: Re: Displaying streams as xattrs
Message-ID: <ZG+JqEwIdPHmHhVa@jeremy-rocky-laptop>
References: <CAH2r5mv8nAncg-f=Z5u8LkH4o7kfJLJdtoksYQgiguF7efKZkQ@mail.gmail.com>
 <CAN05THRKq9XPD11rBWXyTL_OGSh4pP6mQyufeW+xc+J3wvkMmw@mail.gmail.com>
 <CAH2r5mtJfSiQXBRUwv6zcR5rhG2Q-pCvjH+n+_SZmVQo1pMeVg@mail.gmail.com>
 <ZGuWhzP98U9Niog+@jeremy-rocky-laptop>
 <CAN05THRnHcZtTMLxUSCYQXULVHiOXVYDU9TRy9K+_wBQQ1CFAw@mail.gmail.com>
 <ZGzo+KVlSTNk/B0r@jeremy-rocky-laptop>
 <CAN05THQyraiyQ9tV=iAbDiirWzPxqPq9rY4WsrnqavguJCEjgg@mail.gmail.com>
 <ZG0/YyAqqf0NqUuO@jeremy-rocky-laptop>
 <CAN05THSWHq-3bJ5+tzZ==j9uGFGfbALw0FoLVa9UyucaZ92bGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAN05THSWHq-3bJ5+tzZ==j9uGFGfbALw0FoLVa9UyucaZ92bGQ@mail.gmail.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, May 25, 2023 at 08:57:18PM +1000, ronnie sahlberg via samba-technical wrote:
>On Wed, 24 May 2023 at 08:34, Jeremy Allison <jra@samba.org> wrote:
>>
>> ADS - "Just Say No !"
>
>I think that is a flawed argument.
>It only really means that the virus scanners are broken. So we tell
>the virus scanner folks to fix their software.
>Viruses hide inside all sort of files and metadata.
>There are viruses that hide inside JPEG files too and some of them
>even gain privilege escalations through carefully corrupted JPEG
>files.
>We fix the bugs in the parser, we don't "drop support for JPEG files".

What is the use-case for ADS on Linux ? And don't say "Windows
compatibility" - stories about your mother's advice about
jumping off a cliff have meaning here :-).

Give me an actual *need* for ADS on Linux that can't
be satified any other way before you start plumbing
this horror into the internal VFS code.

