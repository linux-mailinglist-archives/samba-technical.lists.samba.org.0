Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 835A5597EF6
	for <lists+samba-technical@lfdr.de>; Thu, 18 Aug 2022 09:09:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=VR+SiATrDJ4TEHyH+RVUreJj3WodgZiqCUhzVDLKxiI=; b=R7UgRM7aaOyBVQHVcFINRkQabd
	ZIs4nuz5cMZATvnqh8VuRkXKgZSNk0KZLGSdaKFRoE+UlNkuFqXEG98FoKfKMzIJf5msAMNcfoNGb
	vIO1bCw7vcBkIb3opzlaeVL4C+Z2JWwRx/Xguing2SCkA4TtZZl7iv1bnDFFygXMCGYcc2Cd2DZAr
	SZeL1XbaSaPosQE4+7G1Pv2CkVw29+fV3jXvMIiyPULauYHXcUjLy4QeFZYFcebNKyV8fWg1rIQuz
	HzhInPLXGI8CtgGTLz5BZJeT0IvJDRDct2itZIngLgWQ/NM15+X3UiyLOD5jGh80ETzj37PxHGi2U
	lczrf+qw==;
Received: from ip6-localhost ([::1]:39300 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oOZdP-000mdR-3T; Thu, 18 Aug 2022 07:08:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13756) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oOZd0-000mdI-S8
 for samba-technical@lists.samba.org; Thu, 18 Aug 2022 07:07:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=VR+SiATrDJ4TEHyH+RVUreJj3WodgZiqCUhzVDLKxiI=; b=HKYFHk1IiVku+1wJ40Sm3cr4me
 MvQ717oY4Lv6XAGdxLwb5NAwlMurMeuHaaUae2XIOVHlzAcYH4uUqDlVaZpqqeYxRs1RjfneIVnEm
 5Aj2mjeWlvOsjjns6KWe6DW2I40xDVcp5MywDR+PDhXj+Uv1C9nr4Phde7AN4hZAnPFTsY9XULFMA
 VJzCCZdwjU6jtnWJlJfCDlMvBzW40XlD3h3PhReTYA3AKKii8pkUqa+B/5Wz+1R6eUpwqxcGscuz7
 PS0bqqrqwa4Hv7PWlAnmlaMJsHRBc87sCZWoWOgkUqFgJntn1SQUJ99yehIxlkxfMKELaZPwM3ica
 l5jg6SKRaH3MGn0rUv7013XIIFB5ecBugSUgHO0qHcpy1fpuOe7uWyneCz0uwehzj172LYYdkqw6/
 4k4B8VVJQQkEwJinK7lGLf1yOkSjwGdLyehwoqS6BzXDrXp9JjiMDTTJD7DbY+uPnc//SOQojlYGP
 H12qu+uLcGB7BEDOA+DvkKWq;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oOZct-000fMA-9Q; Thu, 18 Aug 2022 07:07:35 +0000
Message-ID: <64d84288-d1be-bcfc-b377-e0fea216356d@samba.org>
Date: Thu, 18 Aug 2022 09:07:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH] WHATSNEW: document new volume serial number smb.conf,
 parameter
To: Jeremy Allison <jra@samba.org>, Ralph Boehme <slow@samba.org>
References: <686f397f-223c-d7d9-64ad-86f63f2f810f@samba.org>
 <Yv0vkWopKBzdKlEq@jeremy-acer>
 <5966ee03-d528-3b10-5354-fcdb3a3008c5@samba.org>
 <Yv0/Y8cf73x4n3a2@jeremy-acer>
In-Reply-To: <Yv0/Y8cf73x4n3a2@jeremy-acer>
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
From: Christian Ambach via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christian Ambach <ambi@samba.org>
Cc: Stefan Metzmacher <metze@samba.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 17.08.22 um 21:20 schrieb Jeremy Allison:
> On Wed, Aug 17, 2022 at 09:14:45PM +0200, Ralph Boehme wrote:
>> On 8/17/22 20:12, Jeremy Allison via samba-technical wrote:
>> Iirc we just push this to the v4-17 branches directly, this will never 
>> go into master.
>>
>> Jule or metze, can you please pick this up or the next rc?

Right, the patch was meant for the v4-17-test branch directly, not master.
Sorry for not pointing this out in the initial mail.

Regards,
Christian

