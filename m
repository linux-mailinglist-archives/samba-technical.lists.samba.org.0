Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FBB62E19A
	for <lists+samba-technical@lfdr.de>; Thu, 17 Nov 2022 17:26:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=28qsusM0dKIBeb+QN1iS4sQD/d+otONyx83fbDxldwk=; b=Odgv6PEFgJnoet96eOvdEN0mhG
	FUblZq43Ea7PWzRTvST2HDIZ77MjSURXOATXwVn7/fTgUcugUSKWNLpKjsxXPKDDsRLXrYLNiTGus
	WGH7Xe+NzammXufXZqeUAp/TJaMVJbGbxxUr5S6X3ldP5RAmoOOzYjfp5VdH+3NluvS9Ja5bFpjVX
	/WA5ArKMuiY1RZqZg0D4ZRF+S4se2Z1QCj1BJaB+OdNJZLvoOMjXn00Me1ZfI5s90kdcRnHdtJYUr
	9nugsALx3Oyl6FlTna6sCPf+PPdpXpywnbnAEuY3YA5ybAlkjlhIRFaR7mfbD4MrZsn+8pJCP0jWd
	g3/9lgmw==;
Received: from ip6-localhost ([::1]:41116 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ovhhj-00EyXO-BD; Thu, 17 Nov 2022 16:25:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25568) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ovhhc-00EyXE-Sc
 for samba-technical@lists.samba.org; Thu, 17 Nov 2022 16:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=28qsusM0dKIBeb+QN1iS4sQD/d+otONyx83fbDxldwk=; b=dirEiSJZKMYPGoRTiT7sOI1Olh
 9zbeVLmKzFRbXutiffXuDhrE6CsqTCEBd4t8MRf5uokb0+qsptoTs6qA8b7U++Rn8Lq8uY9vfapnE
 dPDIolmZ/ceIGF2SnmGYHKYBN9iyYvMUUCXoE0X8CnKqlHqJ9N5EK7AQg7DLkmEC6f74GunEZWKQL
 RiGb5O/qDrnpxadac8VMq/xomA0n4iH7/GyVvOXKRYNtLAZAYZjqPrnyn5zGaCzyRGRfrxgbinRc9
 m4CwxjeOPeXCrx5uC4lf0bVz2MaW5Jcen8Fn2J4APWL1CkLGbuXp2KPA85ihLdhb7Q5nQM0ORQAEr
 KqaKT5zq87FHRoqepdJ/S2GnJBfBerE0JXVcTqHdzwiPoUEJNp/DCUqNFRAy58Cl9IViVagLV+2Kz
 BNziIbl9ss/XyHIzjfJQZ4zCS2YI54qfzM+gYP/l7CFSOnFeW8HXKBvK+Zy8J9CvhFDTFfVH6vT15
 uRhFSNCrDvTVO8Kjuo+G9TsO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ovhhW-00953X-LT; Thu, 17 Nov 2022 16:25:19 +0000
Message-ID: <17ba2422-03e6-9a5d-d0b9-358e392396c3@samba.org>
Date: Thu, 17 Nov 2022 17:25:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Can someone please build us a 32-bit Debian container image
 please?
Content-Language: en-US, de-DE
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <c2802ea35aa48ada6a638c31ff19b7235845c268.camel@samba.org>
In-Reply-To: <c2802ea35aa48ada6a638c31ff19b7235845c268.camel@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Uri Simchoni <uri@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 17.11.22 um 02:02 schrieb Andrew Bartlett via samba-technical:
> https://github.com/docker-32bit/debian is GPLv3 and small, could
> someone please adapt that into our bootstrap system and buildar and
> have us build a Debian i686 image for our CI?
> 
> We might even be able to do less, provided we do two stages, one to get
> enough for our normal bootstrap to run, and then proceed as normal.
> 
> We have had (eg
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=974868) a number of
> 32 bit bugs, not just the recent PAC issue and we need CI and safe and
> easily downloaded image we can use.
> 
> We are assuming that 32-bit userspace on a 64-bit host will be enough
> for now, so no emulation is needed, just time setting up the image and
> getting us past the samba-o3 build on it.
> 
> Uri:  You have been incredibly helpful with things like this before,
> would you happen to have time?

Lets see where this goes...
https://gitlab.com/samba-team/devel/samba/-/jobs/3340360869
https://gitlab.com/samba-team/devel/samba/-/commit/e2cec9d775ebda50ed341632b107f7de86437357

The hardest part was to find the need to the 'registry-1.docker.io/' prefix before
'i386/debian:11', 'docker pull i386/debian:11', but podman requires
'podman pull registry-1.docker.io/i386/debian:11'

On ubuntu18.04 i386 I needed --disable-warnings-as-errors in order to compile,
but the warnings should be fixed, as they might also be real 32bit bugs.
And lmdb is also not available on 32bit...

metze


