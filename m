Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4DD60F598
	for <lists+samba-technical@lfdr.de>; Thu, 27 Oct 2022 12:44:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=k6vkOzYRr8FG9PxvNSHth44Nw0jg6hIdjggzP/2/mVs=; b=iCoSMpxhcoWeI/fkVF2tQOSQQw
	EqdNIIfABMHeQuVuSYDiF789boYNnOdKhbbNAP8YCYGly5Sdpplk98niIAp361YwjcAwt6qZJNBKV
	prQ7Q7JKfkQdGayYBF5ah29K3POhuGpQROZDaeoCh3YvN3Ic3YmJRfphV5yBYpbDu63RuV77gpiOO
	XocYsFRZcoH/f5VHOKOFbrtA1wlwUgxmablLodor7yTUPbHz7w2nKyilprqdq/nQWBT2Es9JSUVXS
	UhB26jvKy4HCxchFjisNf/xx628ovSlD1ex8D2i6YTeDLWhRcTZPZwi3g/7I46XreJx/nq4Kuzwsm
	5Yd15Fjw==;
Received: from ip6-localhost ([::1]:46730 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oo0Mv-006NZ7-MD; Thu, 27 Oct 2022 10:44:13 +0000
Received: from smtp.arcada.fi ([2001:708:170:33::246]:52206
 helo=hipper.arcada.fi) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oo0Mr-006NYx-4G
 for samba-technical@lists.samba.org; Thu, 27 Oct 2022 10:44:11 +0000
Received: from penti.sit.fi (penti.sit.fi [IPv6:2001:708:170:33:0:0:0:237])
 by hipper.arcada.fi (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTPS id
 29RAi5f4088927
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 27 Oct 2022 13:44:05 +0300
DKIM-Filter: OpenDKIM Filter v2.11.0 hipper.arcada.fi 29RAi5f4088927
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arcada.fi; s=2013-11;
 t=1666867445; bh=oLwW61WyMyBiPIaqySGmkv0MJG1wN/U2zpZtYJyPhz4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Zw198lUnzFbXYadSaQrZU1cHsXOwm4pedwsI/0LlK70RnbMG7K8Th6Wc5L7XodlLG
 jyPhcmTfhc6wyBX0putsy597i9z25znVExL4hNwS/y8RrWv8kUgLMrbXO8KmyKDx+S
 TuGYC0C0eVEb5y/Ol6ILTHapewReujKeMyN9qrAc=
Received: from penti.sit.fi ([IPv6:::1])
 by penti.sit.fi (8.14.7/8.14.7) with ESMTP id 29RAi5g9014968;
 Thu, 27 Oct 2022 13:44:05 +0300
Received: from localhost (harald@localhost)
 by penti.sit.fi (8.14.7/8.14.9/Submit) with ESMTP id 29RAi5N7014964;
 Thu, 27 Oct 2022 13:44:05 +0300
X-Authentication-Warning: penti.sit.fi: harald owned process doing -bs
Date: Thu, 27 Oct 2022 13:44:05 +0300 (EEST)
To: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Subject: Re: Upgrade AD DS from 4.9.5 -> 4.13.13, cannot resolve usernames
 on member server
In-Reply-To: <eca6131a-3c87-d4e8-963b-e00f918e9d67@samba.org>
Message-ID: <2b744d34-9af4-049-48bd-7f7a738eedf6@arcada.fi>
References: <6611f3fb-6ff-565f-c3c9-9476c33fb31d@arcada.fi>
 <eca6131a-3c87-d4e8-963b-e00f918e9d67@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Virus-Status: Clean
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
From: Harald Hannelius via samba-technical <samba-technical@lists.samba.org>
Reply-To: Harald Hannelius <harald+samba@arcada.fi>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


On Thu, 27 Oct 2022, Rowland Penny via samba-technical wrote:
> On 27/10/2022 10:57, Harald Hannelius via samba-technical wrote:
>> 
>> I upgraded my AD DS servers from Debian 10 to Debian 11 bullseye which also 
>> upgraded Samba from 4.9.5 to 4.13.13.
>> 
>> Now I notice that I am unable to resolve usernames on the member servers. I 
>> have only numbers in the processlist for example. 'getent passwd 
>> "DOMAIN\harald"' doesn't return anything.
>> 
>> Did I miss something in the upgrade process?
>
> No idea, you haven't given us enough to work with.
>
> How did you upgrade your DC's ?

apt-get upgrade && apt-get dist-upgrade

> Did you upgrade them in place or did you create new DC's and demote the old 
> ones ?

In place.

> What idmap backend are you using on the Unis domain members ?

 	idmap config domain:unix_primary_group = yes
 	idmap config domain:unix_nss_info = yes
 	idmap config domain:range = 500-4000000
 	idmap config domain:schema_mode = rfc2307
 	idmap config domain:backend = ad
 	idmap config * : range = 5000000-9000000
 	idmap config * : backend = tdb

>> Now when I restarted the smbd, winbind and nmbd I am unable to connect to 
>> the member server.
>
> Sounds like a possible dns issue.

I have to check that next time I try doing this upgrade. Thanks.

> This isn't really the place to be discussing this, you should have posted to 
> the samba mailing list.

Oh, sorry. I'll repost there.

Thank You for Your time, appreciated.
-- 

Harald Hannelius | harald.hannelius/a\arcada.fi | +358 50 594 1020

