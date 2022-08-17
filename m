Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F2F597659
	for <lists+samba-technical@lfdr.de>; Wed, 17 Aug 2022 21:20:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=DGqLK+z0ReBHMMmkT++tUqQkx1eWjxoLxv46jIWSB78=; b=zRFfxHkudDoVZ5PzR8UqLF8Z7y
	6WbwStYdRKa6IN9LdClRh3V7I053BPbYwUxNeGUjo3jKLxA1Fgi8fBPnjQshmQ29YYFokjwOeQv/d
	a9Dy+/FujIiBYhco/B7SlBq17V4Rrz44fJve6NmtWHkQKBdlY/O3JmJO/sjggeaJ0dYHBvNoyDVOE
	VhZTLuxIfQd/JCXTfAMUFN046GPmUOLJiTmfmNjk4GX6+GyJnMbrwbXHUbvQi3orZzRUGFMe9eRLr
	HHYnmfxC+PA3TBhn/4vkT206Mq+nyvsQjdRusDQMVXaQrrB5OosIW8JQzNfh+3ggFBBsLUSRiKsCt
	iHIEgBhg==;
Received: from ip6-localhost ([::1]:44290 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oOOaf-000hry-Gi; Wed, 17 Aug 2022 19:20:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41510) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oOOaT-000hrp-E7
 for samba-technical@lists.samba.org; Wed, 17 Aug 2022 19:20:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=DGqLK+z0ReBHMMmkT++tUqQkx1eWjxoLxv46jIWSB78=; b=ABA9ts0kaLTcSnOKd2ayZ48SX4
 NunANEWua5yELcRf6ivw2MD3cgHRaKzCbhvk/OVXk4anEFJjOAziMr/TLvNKA7kixNrOOb91l9mBP
 w9Eeu28/UH+INhSBY+qNJY3lLHuyjUPBZ1oNNhtu6lleZxpAelvRxDQ2elUMNlnmSq58i78W/Lpqj
 OcIoLTAG3rsAtm3w8Aj5+DbtQKbe7cSYOi3tRr7sgp0TOpBIjQExU7SsGT2Lqsb3nTU8ujCmbKp4A
 9aVvR4lJX8k+lS0piEIOK6DcCW2lARtcYweXxY7LJO0ISaWDtGonKOaHfg7SAruIvz+uIIiEVV2Q/
 AG9/BiAAKheMFFd2ZB1LXvi4N9Ozj1vxaB7D1465tX8lHpWnENlrGb58HZXcg7gSZrhpkar+K8/Mq
 27GtO3jxiaUJHBXauPHLk7PqQdjKYVjROoDSrGRkEdWLUuS6NnTfIUTFFOzOJ4XFmVJUA5c7/kGUc
 Uw12xHgVQniQE0oCpbOt90LE;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oOOaF-000aer-Rq; Wed, 17 Aug 2022 19:20:08 +0000
Date: Wed, 17 Aug 2022 12:20:03 -0700
To: Ralph Boehme <slow@samba.org>
Subject: Re: [PATCH] WHATSNEW: document new volume serial number smb.conf,
 parameter
Message-ID: <Yv0/Y8cf73x4n3a2@jeremy-acer>
References: <686f397f-223c-d7d9-64ad-86f63f2f810f@samba.org>
 <Yv0vkWopKBzdKlEq@jeremy-acer>
 <5966ee03-d528-3b10-5354-fcdb3a3008c5@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <5966ee03-d528-3b10-5354-fcdb3a3008c5@samba.org>
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
Cc: Stefan Metzmacher <metze@samba.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Aug 17, 2022 at 09:14:45PM +0200, Ralph Boehme wrote:
>On 8/17/22 20:12, Jeremy Allison via samba-technical wrote:
>>On Wed, Aug 17, 2022 at 01:56:05PM +0200, Christian Ambach via 
>>samba-technical wrote:
>>>Sorry, forgot to add the new parameter to WHATSNEW while working on it.
>>>
>>>
>>>Regards,
>>>Christian
>>
>>Christian, if you want this in 4.17 you'll need to log
>>a bug - required for all backports for 4.17.rcXXX releases.
>
>not quite.
>
>Iirc we just push this to the v4-17 branches directly, this will never 
>go into master.
>
>Jule or metze, can you please pick this up or the next rc?

Works for me :-). Thanks !

