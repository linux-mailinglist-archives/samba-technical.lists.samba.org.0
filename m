Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 650F5B243A4
	for <lists+samba-technical@lfdr.de>; Wed, 13 Aug 2025 10:04:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=eTj2xK0JjrVYUVjqCZt/ynIcthZVkTyVVS5/VGlr/VQ=; b=vII9uPyY4Tx3Y+Dz2OuDTiXD4F
	LRP7cLzCjtnk/x2LotHj6w/g49n6JLK3LIqZhgMg27BYag0Q1x5W3V4Xlf+dNAoJ9NWxn6DtkHlsD
	qAghZuIxjZj3KuWc9fv6gtUEhKRw9MTBJ48D96rWrrNaZpfbBTY/mfx+t6mc7GAKvEnuHqyMV7xlU
	dpBWgvNZxrFY7NJ5L4K+d1SJazL4j9gAmFCGFUdVVkx1ImkhVQHfoeyLGSmZwYcadXWsH1/sS46Na
	CT3fiYPo/oqdrr1luo00MeDnjavARSp49NUAwAfRvCWp7WjWu3MrJ6Wjof7kpv0INMK6nJn1tbC9T
	p3cHuKYQ==;
Received: from ip6-localhost ([::1]:62328 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1um6T3-00Ewvi-NO; Wed, 13 Aug 2025 08:04:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57516) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1um6Sz-00Ewvb-3n
 for samba-technical@lists.samba.org; Wed, 13 Aug 2025 08:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=eTj2xK0JjrVYUVjqCZt/ynIcthZVkTyVVS5/VGlr/VQ=; b=W6ayLcY4xJXQooKGBjSj1mNdPO
 9cdj28OarATld6hBYhHfv3mj1tMNAuGYYu2Qn1/skxHBeyONbN/8+OToaBp9nmk/QfLTQKvUoGPlQ
 mRC06+DCZwZDH5d7Z5wJnQS9IWSXaSZ4k8ZUtBdujsH1AClNkBMVnsJkLXpqc3Iskjluhq2LFrFgY
 jLnfXmZhWSoo6FF6oNc+DmszsExr5yY708X760YOg8AdYco7VsUo3JpV69ujOF05f5hJsta6s+OOr
 yoW10LESPEcKMZ6lFl5HSR0QTQI6wC4VVBOiOiXp6Q9TEqBRLjhtBsKz+uwFJMDLnTwC/pMZyNUti
 USX1uS2u0SWZc7SksipvL3ABl89vwq5Dh9LPuBUXz0cfvYsUgEkYW+d3cS3gJmieIba+BcGokOZcH
 ZyXMxkYkUgcdzRxRJp/R29CmqWWm7cjAJ+hOyux3JnnLE64LouldU9dminZobE7Oz4+y4CcdKP49L
 12K6IjS9sWoQJRcwuH+ierK2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1um6Sy-002aI4-02; Wed, 13 Aug 2025 08:04:12 +0000
Message-ID: <6acc8228-da51-4528-87c4-4cb2c96d3e8a@samba.org>
Date: Wed, 13 Aug 2025 10:04:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.16 563/627] smb: client: let send_done() cleanup before
 calling smbd_disconnect_rdma_connection()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20250812173419.303046420@linuxfoundation.org>
 <20250812173453.306156678@linuxfoundation.org>
 <527dc1db-762e-4aa0-82a2-f147a76f8133@samba.org>
 <2025081325-movable-popcorn-4eb8@gregkh>
Content-Language: en-US
In-Reply-To: <2025081325-movable-popcorn-4eb8@gregkh>
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
Cc: Sasha Levin <sashal@kernel.org>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, patches@lists.linux.dev,
 stable@vger.kernel.org, Tom Talpey <tom@talpey.com>,
 Steve French <smfrench@gmail.com>, Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 13.08.25 um 09:59 schrieb Greg Kroah-Hartman:
> On Wed, Aug 13, 2025 at 08:17:53AM +0200, Stefan Metzmacher wrote:
>> Hi Greg,
>>
>> Am 12.08.25 um 19:34 schrieb Greg Kroah-Hartman:
>>> 6.16-stable review patch.  If anyone has any objections, please let me know.
>>>
>>> ------------------
>>>
>>> From: Stefan Metzmacher <metze@samba.org>
>>>
>>> [ Upstream commit 5349ae5e05fa37409fd48a1eb483b199c32c889b ]
>>
>> This needs this patch
>> https://lore.kernel.org/linux-cifs/20250812164506.29170-1-metze@samba.org/T/#u
>> as follow up fix that is not yet upstream.
>>
>> The same applies to all other branches (6.15, 6.12, 6.6, ...)
> 
> Thanks, now queued up.

Even if it's not upstream yet?
I thought the policy is that upstream is required first...

It's only here
https://git.samba.org/?p=sfrench/cifs-2.6.git;a=shortlog;h=refs/heads/for-next
as
https://git.samba.org/?p=sfrench/cifs-2.6.git;a=commitdiff;h=8b2b8a6a5827848250c0caf075b23256bab4ac88

But that commit hash can change on rebase.

metze


