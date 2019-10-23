Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BCEE1886
	for <lists+samba-technical@lfdr.de>; Wed, 23 Oct 2019 13:08:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=YCjCXIltgUkUQol8sil1yk6N61kCDuWWXR8U81CZAOg=; b=kwMR+z2QZZAo/UQIGqBNg/fEn/
	h8Oj2YK7y0/zEiS65Is7V8agmYan5+0OWlJGH/i19y1jT2AOCoppXTGPjCJUlVoxCTskead6fmlOK
	LHPDVV7KVwKa1ckXOR3MpGjokKzAARwSfb4U5mkq6GGRa9wgr8vHo2q5ZYq8j4puggzG+59H7aMlw
	vHIpxUWVBw/n2GpYctOysxx+IEuBnSVearyOUxy2TWzueBqvMgFRYdHwdrpp8O/8cdXZ1/dbNK5uP
	MYmAVK0nVG5z2/LKXP9T5/uiXzkHt/cyqHuKiF+09v9DkUlpkfp4mZn2c0/nfis/h7Uxk27RnSPOW
	2kXOrUWA==;
Received: from localhost ([::1]:62152 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iNEV0-001fTY-ST; Wed, 23 Oct 2019 11:08:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18670) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iNEUx-001fTR-2n
 for samba-technical@lists.samba.org; Wed, 23 Oct 2019 11:08:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=YCjCXIltgUkUQol8sil1yk6N61kCDuWWXR8U81CZAOg=; b=C71vYdbmSAYSNOz4nMJPXKkRMj
 qfS/hd3VpNkLHqoB07/ZV27nm0Ad9BaKFA6Cqqcq9Ulb2FvOlXPjrMeWM/x6rtCe7jQdYxM8QfgE4
 Lw8vsktv46xWFpyZVioiEldKp1EJ8YAOEia/4Z8+65r96TmNHhvsBwONJCr8L5ivkKe10erNh0TUM
 G+fnm6hFor95Wb16xAwokJD2C7Ou2d+1R3dr9N7p6MWVQL1pCegoMWpTcncMe5xBZWEkdBIipcvFw
 8Nb3H6kdlRzxbseL8jIUjO0i7UDL9Yzj4zJfpn9rxXFrbQXqr8swUZ8f68i7y8atJkV9LCS5OLTWw
 BxMt5uh9z19wdAPiSleAkS3J15aJw26Dkf0/YLGu35kSiFBby+9fgvRXAK3d6xXq7Bg1odw4lsswi
 Fszq5MhIjozuOayDYnqJ1p+7c6rhmO6MGJd+uI8MSi1waMT3HZCxfK/LX4qKQBclW7UOv6VWmMBvq
 sT3s3IY92sIPrVzz6VGaDVqO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iNEUv-0000Yp-UH; Wed, 23 Oct 2019 11:08:14 +0000
Subject: Re: Converting SMB1 tests to SMB2
To: npower <npower@samba.org>
References: <f0f71737-cd07-b361-1c26-58116e6e8ed8@suse.com>
 <be6770e5-5bf0-4665-4a88-3e4182e4c82e@samba.org>
 <0981db46-93bf-f153-c98f-15d5cf404353@suse.com>
 <ed7eb92f-46a7-758e-f3b5-185d71b8b98a@samba.org>
 <002434db-63ef-edad-d091-76e3efe783d1@samba.org>
 <15dfbaf6-c774-debe-b61e-c3ef4e7f9727@samba.org>
 <d9625941-c85a-a686-2162-30c80a2e84b3@samba.org>
 <fa464ebe-cfe7-1d6e-7435-c896e2cc188e@samba.org>
 <f479113c-7a74-8259-823e-4ae1c4a713c6@samba.org>
Message-ID: <47fef5d6-7fb6-b054-a8c5-7a28b63e97c8@samba.org>
Date: Wed, 23 Oct 2019 13:08:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <f479113c-7a74-8259-823e-4ae1c4a713c6@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 10/23/19 12:38 PM, npower wrote:
> On 23/10/2019 11:05, Ralph Boehme wrote:
>> For each item we:
>>
>> - check is the *same* test already exists as a SMB2 tests
>>
>> - if no: rewrite test as smb2 test
>>
>> - remove smb1 test, remove entry from skip list
>>
>> Am I missing something?t
> 
> * There are tests there that are mixed smb2 & smb1, certainly some blackbox tests fall into this category, there maybe others, so skipping them currently skips the smb2 parts

yes, sure, I was skipping the finer details here.

> * There are tests that hang and crash, I am not certain they are running any smb2 stuff, without going through each and every test in the skip file to verify, it is impossible to tell if using the skip tests removes valid smb2 tests from the suite

I'm afraid, we have to do exactly that.

> * I thought that it would not be acceptable to just effectively remove all of these tests without a clean transition path, e.g. they run till they are removed

All this has to happen in a private branch of course, you can't push the
initial changes upstream of course.

> I'd prefer to just skip the tests and work through them, I am a little worried about doing that though, that's all

Hm, isn't that exactly what I'm suggesting? Phone call? :)

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

