Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9B34707EE
	for <lists+samba-technical@lfdr.de>; Fri, 10 Dec 2021 18:57:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=DyRnymFFdXb8L7n+h/nd9EbP2OylsRENYYyQeXOa6Ps=; b=5NDvUzYi2d5EFCShaFGGENbjw2
	ZuOgI6+37aci8RqpMLA+zSfxJYUiTV+1f4cJCS3XywcDE+OOhxsmZkIJTYhl+vMnEq2Ct8lo4l2ae
	xvCT82iEUyNjh8lKtizyb1zaA+2XODDIjq/LnMC/0qkhrzNGzHdB2r3488x4sMnbRzbaNE5ikt76N
	qOV6tbIVEev5vr4XH3QRp4TZKtknkZnKSZrDN8VIvbAmLC73gvDlAP1vH3ikLGSD6JfNsIRbeUmUr
	tjw9fSSYCOOEkBlf4HnuX1p6q/lKsGnj6HsOVnQg8aUUcQ92p8Op7VSDsaSYsyNoqEW4aOIoirjIF
	b0bmsv0g==;
Received: from ip6-localhost ([::1]:46806 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mvk8z-00559N-3q; Fri, 10 Dec 2021 17:57:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54438) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mvk8t-00559E-Mw
 for samba-technical@lists.samba.org; Fri, 10 Dec 2021 17:57:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=DyRnymFFdXb8L7n+h/nd9EbP2OylsRENYYyQeXOa6Ps=; b=zNjUmMN34gdNahTtLFjRDnMKhb
 IgdwcnQ7bqefU5EW4UUPaTARJOHUzdofEYmjAd+HPPGLddb4FKtqpks7CHVabstLTeiTeGr3Lf4kH
 /ANgj3SjTEMNahJ0hlDoD2vtcRwZBJv0Rf2aVgMGUilwVB2yIEWq7eL2B3ZCHepb8m8hQTgq8BKBD
 hfgWUhy+0HoCyO0OK2eS04FhE95HAckh2lGM/hRStu+ApJSZ/JUfWyrVvJnPbODrYdW9s9YIUGjX4
 XqooLd2fQG3ZOnpSSzvEaEKD1SJRGGYSzZZS55q1hnB5h62TkD48b4PPVeJdt9tuY/cU8amuRknA4
 rfE9af3LRiloi0QzAk4bV6EjWvsG8XfoAbEHeAt8V7ThuYuORofPvB/ErHtAU5bfINvjQohPfPWwM
 wH4FEpxS4/Qk7iFKY1Q5bBIzPQlF/ALy6hWhxHxzx5kVI6ahofpB4pEh350QmEIyq1gaqPbVgW8FM
 rOBsQtwfa+uwaXDjS1+PJGPC;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mvk8s-002Cn3-Q2; Fri, 10 Dec 2021 17:57:11 +0000
Date: Fri, 10 Dec 2021 09:57:07 -0800
To: Ralph Boehme <slow@samba.org>
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
Message-ID: <YbOU84ZAt6FE81gb@jeremy-acer>
References: <fdbdbd51-92cf-d424-655f-fca636583e13@talpey.com>
 <CAB5c7xqZcK9-Oa+o+w5Mva9Dr8_wWojx=krWiP+4zQ0X3ksH+Q@mail.gmail.com>
 <6c8aca36-8856-cf8a-2ea9-902106d0adc3@talpey.com>
 <a25972a3-3688-367b-fcab-fa748e590153@samba.org>
 <CAB5c7xp-zEwjcZSHfjL8YyWd_4y=K3HC3GSjAzvMoJR9aPOv6A@mail.gmail.com>
 <9bbb9a27-9100-9a61-50e3-bdc7ab0bab1a@samba.org>
 <CAB5c7xpys+Ch65-6v0qv6rtGonFcKkMKJRYEzOboiRfiOPLs4Q@mail.gmail.com>
 <a806f198-69d1-a836-b5d8-c1b7b37c4d87@samba.org>
 <CAB5c7xpBqoumBu_dX9N7eVY_vYUhu57Y+PDeT-S7jOs325GcyA@mail.gmail.com>
 <9ed4d4ed-155c-7740-854a-8819eb7bec91@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <9ed4d4ed-155c-7740-854a-8819eb7bec91@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Andrew Walker <awalker@ixsystems.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Dec 10, 2021 at 06:06:56PM +0100, Ralph Boehme via samba-technical wrote:
>On 12/10/21 17:56, Andrew Walker wrote:
>>That's a good point, but if MacOS SMB client is faking up an inode 
>>number based on a hash of the filename in the zero-id case, isn't it 
>>even more likely to yield a collision at some point?
>
>well, it's somehash(name) combined with the parent-inode number. I 
>know, it's not ideal.
>
>But going back to inode numbers brings us back to:
>
>https://bugzilla.samba.org/show_bug.cgi?id=12715
>
>*scratches head*

OK, seems to me that we need inode numbers by default,
as that's what works with both Windows an Linux clients.

If Mac's need special handling here, then we have the
capability to detect them and switch out the inode
numbers for Mac clients (fruit... :-) :-).

