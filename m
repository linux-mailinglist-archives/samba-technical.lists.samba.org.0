Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A096408AA5
	for <lists+samba-technical@lfdr.de>; Mon, 13 Sep 2021 14:02:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=tagAxQTAsHO+/LCtRgr81ubx6rbYhSNkeTppz3AhRnY=; b=PbpGEtf6P+KhhM+O153PUrZqWI
	SICOcsQRBXjFHk52uXzUTByLKGXsTRH0XGv8IxxbsyLx+BzTLQFDZf+fkOlSiXmNEDH57EccZbQyI
	YmufEIybBbA78Rw4pbnRCrQGTDAC/ay8oz3vzE077UKiUAMHuJqRqoGiB3FPK7a9omE2mKV9qQoCx
	lRIt0pazEl2UQAsKow8lZCIGPBJwkQLfRxpjw1dKDty1YL4+rl6piRbkQVYn6A/9BeBuz/joIxW65
	WBw2X1CTI+UgX4mvA0TJifGrE1OJMYBljTTqsiOhc4wJ7qsbrDheQeno850Bpcu61b4cJGd+envBF
	AvosDqBg==;
Received: from ip6-localhost ([::1]:35938 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mPkez-00EqV7-C9; Mon, 13 Sep 2021 12:02:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64414) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mPker-00EqUr-VD
 for samba-technical@lists.samba.org; Mon, 13 Sep 2021 12:02:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=tagAxQTAsHO+/LCtRgr81ubx6rbYhSNkeTppz3AhRnY=; b=kq1y4qZ+gvMy4DFLTRtvYXt6ke
 zOnINdFj4BzUDZa5L1pZPbW1JKfNPLfa2bqTwJfANzQsspuapBjjhwPXayj8+iwfyXaQ6AhV6eMSB
 4WclfiuVrI1+qCR1aSxCFMkCiKdZq2h5getstFzm8osgi5BHDd6x5zPVORGONELAMx1esuPDk3l/L
 PhX6fnuK7jA+D8yEjuOjc6NOviVncavqHIvVPwiBpdzSh6MwmUu4x8YUXQ8eDAdpAlj7AVT3xbLvm
 YR8ezASfcTFf/vPP91nABkRlmAWRcQr5HaYt1GipfkT3PIvVEvU13PeKHm3a0AnZIvgly8EngQYMy
 PO/PcBhFk8PCvRJHIp/TZEaikVUvCdWZFRUSXYa0lP6NB1rJAhvqUNdn3CaKJBI0104r/uy1AZx4R
 UNCUzGjqzTlZt1gH42UiwuGesGqZ+HDj+PvbLzFR+NSjSKj/MhmiLzSSon0NcxYGza+LyJz5omxhM
 rqzDBlvCUgRxaMKjKX72J9aH;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mPker-005x2f-BO
 for samba-technical@lists.samba.org; Mon, 13 Sep 2021 12:01:57 +0000
Subject: Re: [Release Planning 4.15] Samba 4.15.0 delayed
References: <fffaffbf-f8aa-428b-6d48-91c7b53f0f37@samba.org>
 <d01e3a71-b22b-bd6b-2e2a-b832077dd606@samba.org>
To: samba-technical@lists.samba.org
Message-ID: <6aadadd5-6399-c381-f4f7-f11e15096f59@samba.org>
Date: Mon, 13 Sep 2021 14:01:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <d01e3a71-b22b-bd6b-2e2a-b832077dd606@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

unfortunately, another regression bug popped up, so Samba 4.15.0 had to 
be delayed again.

It's now scheduled for Monday, September 20.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.15
has been updated accordingly.

Best,
Jule

Am 06.09.21 um 13:49 schrieb Jule Anger via samba-technical:
> Hi,
>
> some more important bug fixes popped up in the last days, so the 
> release had to be delayed by one week again.
>
> It's now scheduled for Wednesday, September 15.
>
> https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.15
> has been updated accordingly.
>
>
> Best,
> Jule
>
>
> Am 01.09.21 um 11:53 schrieb Karolin Seeger via samba-technical:
>> Hi,
>>
>> unfortunately, two (potential) showstopper popped up this week, so 
>> Samba 4.15.0 had to be delayed.
>>
>> It's now scheduled for Wednesday, September 8, but there is still one 
>> regression under discussion (bug #14803).
>>
>> https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.15
>> has been updated accordingly.
>>
>> Cheers,
>> Karolin
>>
>
>
-- 
Jule Anger
Release Manager Samba Team	https://samba.org
SerNet Samba Team               https://sernet.de


