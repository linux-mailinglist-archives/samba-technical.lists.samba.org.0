Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1527DFB484
	for <lists+samba-technical@lfdr.de>; Wed, 13 Nov 2019 17:02:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=IHjqOT6r3WXXsUhK8w6kJnHnFC9tF6jAMnBHYhwTmA8=; b=UZjMHULbODgsp3S3fGWXX1VQjJ
	hFYDcJfhuNj86ADf3ni42I00eo7rx5rwaLUsK6n1fUQ3MWFeIHRu2EDl7azsddhN5FQR24hkHRt/E
	HRB5G1Rv8X4ao6yyTM2J/xJHV7zthqw55y9tEJTVyw3Epj/A2oUaccgTRTMAmAhhbs5Pq4suC7INQ
	iBp1qId/kFuHG5rKhuFI2V6v2mmYshkD5rRX/i1haw6CGsBBb+bCydlNmWYVl9oGdZujhwUBWC/Em
	UsVGGuoHedbmK92+TYpfWFeySDILCJWcrx9P57CibSfO0rMv3m+KJ7rbrhOYuVr5hOejFR6CP72Ag
	pUDRKp8w==;
Received: from localhost ([::1]:20354 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iUv5a-000CKN-Ds; Wed, 13 Nov 2019 16:01:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10354) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iUv5W-000CKG-Rg
 for samba-technical@lists.samba.org; Wed, 13 Nov 2019 16:01:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=IHjqOT6r3WXXsUhK8w6kJnHnFC9tF6jAMnBHYhwTmA8=; b=Kgi7ZeNSFZTUtiWnnwRlNTM4Bv
 qP6/kTj514c5Nz1Uf58oiPpU8gh9TBwGTitI+P0YBXyDo2hQ5u1vJk9tQLBCRDIPYvKXpPEfYHoJR
 E72RRN1Z5g4pTUCBjnVJyj7BCdk6bI9Ar87xosp22ajBoAKiQ/Us+tc2ZPe9ahWAT0xOcl2PIGJyD
 Bz1qQhFMDET+DSycawLikux1KsR8DcfHAd5K91/jndfXCQDEfZ0ezJOUY0lxq9+dpVTexmB1y4Xsk
 dxGkW0/zz7JqpP1eSlbvNx/iQlWTWcyMi3dpS7aL1KGDBUknUz+NVTErlNZESqUPuPqt9XepM4ayv
 6n9mFo9D7yVYRfVJmqec9Du46xnZ9M6OTW3vBRHUfl3P71ktCAgB1K1xnpOLD6ikQxerO9BptbVAe
 iIs3UspbpgU4K49KSO4AiLkNz5GDcWQ8/alBSaV5d/IBqkxAg/kd795q+iXm9QosYWUQ3BUA9I8Jd
 uOODhTBcPwfHNbEJoIrzYLe5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iUv5U-0004vU-SO
 for samba-technical@lists.samba.org; Wed, 13 Nov 2019 16:01:44 +0000
Subject: Re: RFC: Add some functionality to net ads changetrustpw
References: <aa05a22c-1fae-b4e0-c194-88f8609c0307@suse.com>
 <700e8c5e-9fb7-c0e6-75ff-7c82d112864e@samba.org>
 <6974328a-3d55-9f1e-0e37-ef5e45035a54@suse.com>
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Message-ID: <8afaa4f8-da9f-5459-cd0a-4dff22b9ff0e@samba.org>
Date: Wed, 13 Nov 2019 16:01:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6974328a-3d55-9f1e-0e37-ef5e45035a54@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 13/11/2019 15:23, Noel Power wrote:
> On 13/11/2019 15:05, Rowland penny via samba-technical wrote:
>> On 13/11/2019 14:26, Noel Power via samba-technical wrote:
>>> Hi,
>>>
>>> I have a patch here resulting from a customer request where they wish to
>>> be able to periodically run a command to trust pw after a number of days
>>> has expired (so something they can run in cron job) The would be
>>> something similar to what winbind does with 'machine password timeout'
>>> param. So this is something to be used when winbind isn't used.
>> Now I am probably missing something here, but doesn't kerberos use the
>> machine password (which means ads) and this means winbind must be
>> running (at least from 4.8.0)
> I don't recall which samba version this was reported against, but then
> again I am not entirely sure about if it isn't possible to run without
> winbind in more recent versions.
>
> Also I believe it's possible to run with sssd and no winbind

Sorry, but you must have missed the 'using sssd with Samba is no longer 
supported' discussion. If you use 'security = ADS' or 'security = 
domain' with Samba >= 4.8.0, you must run winbind, see here:

https://wiki.samba.org/index.php/Samba_4.8_Features_added/changed

Rowland




