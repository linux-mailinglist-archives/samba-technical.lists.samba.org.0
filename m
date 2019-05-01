Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 541A4104EE
	for <lists+samba-technical@lfdr.de>; Wed,  1 May 2019 06:34:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=LFVAMp3bFFjCRu8HxLUkAyCqEu59aMPhFJxzey4Iv0s=; b=znXkfO0/231agT3VV3+I6neujU
	lEXkFhFx8SzVGBsCoMnUQHdidI3GcVZBmWHc8XLqdd/QKWvbg8mp3JxzQQJ+UJmqSuLCSBPU7zK+h
	v0MQv9yDNcGBqEAA4zkCZQw99hqp7KQyG6Qm29enQl+s708cL5cylPXnlbYl66dRMyMx2dTSl+3KR
	MdkU87xZJTWSO8IoUn+9///RomF/wMWUFsVY+YRRrd2/qntEdGkOjuODs5K/VuCNZts5rrnRvT9m1
	JdC9P6WMjeszkHfOAj4LvIeUmimNA8RK3RjeSCQhru4lZHWQT5vFE86r0fG6/99GecmNlY3O9X2H7
	rqjlwBsA==;
Received: from localhost ([::1]:39664 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLgwD-001l1t-7Q; Wed, 01 May 2019 04:33:45 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz ([202.78.240.226]:37208) 
 by hr1.samba.org with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim) id 1hLgvz-001l1m-5A
 for samba-technical@lists.samba.org; Wed, 01 May 2019 04:33:40 +0000
Received: from [IPv6:2404:130:0:1000:c474:9b54:b7c9:4153] (unknown
 [IPv6:2404:130:0:1000:c474:9b54:b7c9:4153])
 (Authenticated sender: garming@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id D564080FCD; 
 Wed,  1 May 2019 16:33:16 +1200 (NZST)
Subject: Re: [WIP] [PATCH] ldb: new on-disk pack format
To: Aaron Haslett <aaronhaslett@catalyst.net.nz>,
 samba-technical <samba-technical@lists.samba.org>
References: <09dfb485-0056-44f9-3baf-3ba38675758a@catalyst.net.nz>
Openpgp: preference=signencrypt
Message-ID: <01caab91-5ec4-392a-0227-c4782db5959e@catalyst.net.nz>
Date: Wed, 1 May 2019 16:33:16 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <09dfb485-0056-44f9-3baf-3ba38675758a@catalyst.net.nz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Garming Sam via samba-technical <samba-technical@lists.samba.org>
Reply-To: Garming Sam <garming@catalyst.net.nz>
Cc: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Some initial testing shows that the new format has 50% more throughput
(for unpacking group-like objects with a few thousand (member) values
like what happens in the LDAP bind). Or in other words it's 33% faster
to finish a single call. It also leads to much better memory performance
under load, which is harder to predict in terms of overall improvement.

ldb_kv: Avoid memdup of database records in the case of base searches

a76d2865372988c29baef42ecc4257e861692e7b

The pack format specifically helps only after patch which is already in
master which avoids making a copy of a full database record, which in
the case of large groups might be megabytes large. In such a database,
the LDAP bind median performance does not actually appear that bad, but
under even moderate (or even small) load binds can blow out to seconds
long. With the new pack format, this should be more reliable and
predictable (at least until the next bottleneck). Still working on some
current numbers, but this was the observation during some PoC work.

To Aaron: One more thing is that looking at the patches, avoiding the
use of function pointers could be desirable given how hot this code is.
I think the overall approach is fine (and you don't necessarily need to
change it right now), but I don't know how much better or worse the
compiler is in these cases, where these functions might be better off
inlined. In theory, it's just a marginal improvement but maybe someone
else could comment (Douglas?).

Cheers,

Garming

On 30/04/19 2:25 PM, Aaron Haslett via samba-technical wrote:
> Garming discovered poor performance when recursively calculating group
> membership for a user during LDAP bind.  This WIP patch attempts to fix
> the problem by separating values from the rest of the data in our LDB
> pack format.  This should dramatically reduce the amount of data loaded
> into cache while unpacking with flag LDB_UNPACK_DATA_FLAG_NO_DATA_ALLOC.
>
> Correctness testing is included and a CI run is here:
>
> https://gitlab.com/samba-team/devel/samba/pipelines/59051539
>
> To be done:
>
>   * Performance testing
>   * Research into OpenLDAP's pack format and possible modifications to
>     ours based on theirs
>
>
> Thanks :)
>
> Aaron H.
>

