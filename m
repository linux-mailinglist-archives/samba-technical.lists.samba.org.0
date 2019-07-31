Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 453897CC13
	for <lists+samba-technical@lfdr.de>; Wed, 31 Jul 2019 20:36:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=kZz//uSmfpIVKejmo2yJa0BpuH/YzwKTPKq5sOTKmII=; b=Bk8EMfaZ6W42AMp6zh59IN4LaW
	JInCCTBu/U5kBL7zf8707boWNzeEwgwHy820HBmGhkg46vHnMwjBKfvBe1p1wMGe4u5SM3zojXTXH
	C3GCN79VfPK8VjQc+PCpXgW50GjJxuPfd9S7umMF7dDOYnb8ZQPKRoyM0GBpnpybVutmQelAdPCFc
	9GPerHY+NbOvtzq964Zpx5IymZWoSHmpsQ+ylHNk3iMtVf1VatchSp8iH5VSIxy7ih+hX9hDWIcgO
	2M9xKLAvNIg3AvDmU2dMxN1XBJ9OvyVaW1CbYx3uEYp8NvzjH05MZQ/zemaPsViprLoP9n2TGFzxV
	webbN+ZQ==;
Received: from localhost ([::1]:30618 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hstSR-001aXw-9e; Wed, 31 Jul 2019 18:36:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11738) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hstSM-001aXp-MX
 for samba-technical@lists.samba.org; Wed, 31 Jul 2019 18:36:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=kZz//uSmfpIVKejmo2yJa0BpuH/YzwKTPKq5sOTKmII=; b=qV5BceIWW/rBiDVVKGWV0pkYxG
 P7OB96E8wHw1eywx13EYUHct+q4IAQwKYDUz234nGcr6EpjiTRsye3Di4bZyUG7EK31O+JL2eIFld
 GxPZ47AsbYKw2aclr7+vo5cRYOGDWo159Ual+YTRT9R0jCc36jvwOhoszarXVDTdr8fI=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hstSK-0003eL-Qm; Wed, 31 Jul 2019 18:36:09 +0000
Message-ID: <df405916a3b548e3e63c37467a92848015c3e4c1.camel@samba.org>
Subject: Re: RFC --picky-developer (for developer builds)
To: Jeremy Allison <jra@samba.org>, Noel Power <NoPower@suse.com>
Date: Thu, 01 Aug 2019 06:36:04 +1200
In-Reply-To: <20190731155020.GA234347@jra4>
References: <82e23c37-0bdc-e35a-373c-71b0591becd9@suse.com>
 <ab16fa62-dbef-9281-da4d-6ae2e6c9d1db@suse.com>
 <20190731155020.GA234347@jra4>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2019-07-31 at 08:50 -0700, Jeremy Allison via samba-technical
wrote:
> 
> Making autobuild work with picky developer would
> be great ! Thanks, please push.

To be clear, autobuild already uses picky developer, this would just
make all developer builds use it unless you opt out.

It should save fruitless CI cycles and may pick up more issues if your
local compiler is even more strict, but doesn't affect our 'gate'.

The main impact will be on those who run a more picky (which can mean
more OR less recent!) compilers than 'most' developers, as they may see
their local development impacted by upstream changes by others. 

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



