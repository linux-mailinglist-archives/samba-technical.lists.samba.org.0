Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE428BFCC9
	for <lists+samba-technical@lfdr.de>; Wed,  8 May 2024 14:01:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=jkY7hamX+lHMCgPKqolwUQ0VRRvcjV27Be5oa4GmLrc=; b=srGhL1d7AKEv7dYcjKZQFsmijn
	GRTIBhq3v+9nhKl8VjMGu4MBxdKCKKgKPLAq0owqWI5Fc5K1fHtKkJe/0NaZQ0T2F0lrHSzmJHm+k
	xuENBn9drTfDiUdDpOUhADYa5WSAd9vnhgVSZRqDCkM2bAhv22+iwyO0l9ThgFBVrf2moZnqq1MJh
	xPK2/Zy21r7kHDj95f3cwoFc2wIkxqrQrNdajfDo2PRTod2WG36OIK0Uy/cXx+Pjgdit980in97XA
	hKoAW3d0XPgDjxl0HqA5IjbbitvWTfjvfp0UPvlGkT5u+uKEwDG8RWZzRvxcdM2v38e7NLbWqz7K3
	VGh0iymg==;
Received: from ip6-localhost ([::1]:22976 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s4fym-008Wxf-Hs; Wed, 08 May 2024 12:01:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32686) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s4fyh-008Wwd-5B
 for samba-technical@lists.samba.org; Wed, 08 May 2024 12:00:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=jkY7hamX+lHMCgPKqolwUQ0VRRvcjV27Be5oa4GmLrc=; b=UyPTZajz1KgWLQvvQShGrSeHVp
 zhZlJeMtF+RfI0K0p9Qm7tOQgYhf19C67JWYVsu6JV1p4Oh26l1wuIOd21W8J/pjfmo+3g7vKG5Oy
 wEgLJN+U+4SewkAb1eYrBcT9gVEkqaWMNa/pZKDGkJgLJR5Gg3mXnvut43qZ+yfPE3GO8Gq7rahCK
 YvuzJalOEu7wqSzXJn42TvWfGaREJ0NOHe3lWKVt+web2+JNSa+gy7EFGNvuakntZehYkva5sJHFQ
 r4NgOjIsAZ4lG1Tj2Vg59g7Q89VzOPeecOQZiDG3R91Al02SLP/I1e7HnNIcR0wAwYco5yR6i3Dq9
 7BYI/BxOCgct+OTzJjiRy6KMOAz5UoT/UtP9oIl0OZsshAn+Km17oPZLRhQkJjQyPevLW9dEr/hJ0
 495kyqeikSWbAF+3O4DVUJdYyJLZ9zZY2vk0sSwvKfZBW6cDF3dnr4EA3cAyIXWTnzHjvS4WkBO0k
 fZZ+O5idJqrA0sjGCWjU79wi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s4fyZ-00AQf4-0Q; Wed, 08 May 2024 12:00:47 +0000
Message-ID: <2a68e98b-a3a0-4ef1-bf36-2dc9a99e32df@samba.org>
Date: Wed, 8 May 2024 14:00:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Gitlab CI fails
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
References: <2650765.fDdHjke4Dd@magrathea> <2823827.DJkKcVGEfx@magrathea>
Content-Language: en-US, de-DE
In-Reply-To: <2823827.DJkKcVGEfx@magrathea>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 08.05.24 um 13:50 schrieb Andreas Schneider via samba-technical:
> On Wednesday, 8 May 2024 08:15:41 GMT+2 Andreas Schneider via samba-technical
> wrote:
>> Hi,
>>
>> the CI fails for me for all o3 runners [1] with:
>>
>> [70(1029)/303 at 3m36s] samba.tests.ntacls
>> UNEXPECTED(failure):
>> samba.tests.ntacls.samba.tests.ntacls.NtaclsTests.test_setntacl_forcenative(
>> none) REASON: Exception: Exception: Traceback (most recent call last):
>>    File "/builds/samba-testbase/samba-o3/bin/python/samba/tests/ntacls.py",
>> line 87, in test_setntacl_forcenative
>>      DOMAIN_SID, self.session_info, "native")
>> AssertionError: Exception not raised by setntacl
>>
>> I can reproduce this locally as my home directory is ext4. On gitlab
>> runners, the filesystem is also ext4.
> 
> The test succeeds if I run it on btrfs.

The main thing that changed compared to yesterday is from
kernel 5.4.109+ to 5.15.109+.

metze



