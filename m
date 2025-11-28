Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C78A3C92DDE
	for <lists+samba-technical@lfdr.de>; Fri, 28 Nov 2025 19:00:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Q0UagAmJCOM6kXxCn7e4/UCYXU+NgrmQc/VIu6AMX6k=; b=pexZD7Ipbs4lnWnobx5G1FBjLZ
	0meg0dHyopwCAIRDyrQBJs+KxG+vQzS+iQPzIz5AzJ0cshyJ6D+vIkq//cg5NFVvljsNHUFZN/F5f
	mUu3feNzPgvxv3q+1+RSGTuseLv26ctdzHzs5kszjBb6kAbFMPHBRLkfJRmXvtkjaI4R0c6rGtlbE
	/4XgihaB2kk5YeCga/qgJBgcXuj+PlhWzv7j66IscayKGqZt2J5Wc3I1X62+iqcsHHRsrvYDU6nao
	igjgkCPuP4pTarni3c7/O0wdeu2Y3HgKMXv/2vtokg6LJ2b1231NFoXmsu7OG2wjVCwZFzfsCqebm
	zSxUCfYA==;
Received: from ip6-localhost ([::1]:46848 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vP2lp-00DY29-Up; Fri, 28 Nov 2025 18:00:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22800) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vP2lm-00DY21-0R
 for samba-technical@lists.samba.org; Fri, 28 Nov 2025 18:00:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=Q0UagAmJCOM6kXxCn7e4/UCYXU+NgrmQc/VIu6AMX6k=; b=DuNOecWuOyqbZwaNqjAfo6g6YZ
 V1Rokc9sdrzLBBXdWvoSEIVNvBecZ19jgv5tbz6X57VC9Bjm45vY+NCuM/iCIYhAPZWlpapUBnhCM
 1FzmLb8i0S7h3Azh//cHXTRO/mO9yJcLqQAXlbOoeP3bzlJj0VI+/QO/3gto0UEf6fdrSRarHC3rb
 FIDCHxNqIKCL74IC719wPCrBwFCm7m1f59AW6BrA3GuphtoLd5Kq3jn1qiO+lBxMPvN/+k5NVYXO0
 w6OTkRi4/b1PaKE0evZK7kZZ8knu+TaL4CEofi/Y2CiHEjuR9s0Nm4XGSFSvhSZ7qu8tzycejX5wH
 4fvcLaqdBfQKrpYu+VV/TZOSzq5qNkIvX9GammkZqE9IxbFwVaOBYWbZ/VZ+1lgHWFHWUr6WNRK1T
 RJnyWmjnRhOB6ZDnr1Xcye/j9QAj5Zy/qRmqnKmeGX15rejfleuCam33TfEg+jWVJ3wmeuensW1qi
 cUSrXYd24KuFSBTjUZGO8k0N;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vP2ll-00GAfZ-0t; Fri, 28 Nov 2025 18:00:33 +0000
Message-ID: <7ff0bc80-f94c-4cc9-b85a-0ddc1393c9a1@samba.org>
Date: Fri, 28 Nov 2025 19:00:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: change git.samba.org to https
To: Steve French <smfrench@gmail.com>
References: <20251128134951.2331836-1-metze@samba.org>
 <CAH2r5msBaRVPNkaMy0iQKPq9COR+p5+UUNf-B-Fh6=v7zKNRnQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAH2r5msBaRVPNkaMy0iQKPq9COR+p5+UUNf-B-Fh6=v7zKNRnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 28.11.25 um 18:48 schrieb Steve French:
> On Fri, Nov 28, 2025 at 7:49 AM Stefan Metzmacher <metze@samba.org> wrote:
>>
>> This is the preferred way to access the server.
> 
> Are you sure that is the preferred way?  75% of the entries in
> MAINTAINERS use "git git://" not "git http://" but ... I did notice
> that for all github and gitlab ones they use "git http://"

It seems a lot of them were created long time ago.

> But maybe for samba.org there is an advantage to https?!

Yes, the admins of git.samba.org prefer that clients use https://
instead of git://

I also checked what linux-net uses and it also uses https most of the time:

$ git lo -187 linux-next/master  | grep 'Merge branch .*\/\/'| grep https | wc -l
178
$ git lo -187 linux-next/master  | grep 'Merge branch .*\/\/'| grep -v https | cut -d ' ' -f2-
Merge branch 'main' of git://git.infradead.org/users/willy/xarray.git
Merge branch 'master' of git://www.linux-watchdog.org/linux-watchdog-next.git
Merge branch 'master' of git://git.code.sf.net/p/tomoyo/tomoyo.git
Merge branch 'next' of git://linuxtv.org/media-ci/media-pending.git
Merge branch 'docs-next' of git://git.lwn.net/linux.git
Merge branch 'master' of git://git.kernel.org/pub/scm/virt/kvm/kvm.git

metze

