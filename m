Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E99429231B
	for <lists+samba-technical@lfdr.de>; Mon, 19 Oct 2020 09:49:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=QIYolwUpve20+CdjxLP7r+wfl4SZQp39YVVP2IWhAPA=; b=kbY44+z7TwPk30fVr6GGI9hHMA
	S6BGdZZXqajgj091uJMdAE0o2qPS6ksM870bID79NGkK3kG3r+AYyEYFPkjtaZ+JoPMTRnGUTzlvf
	s5vMC0b7U4KasE9YG7UT+Hlol5VW1D0MUf/8BX22vS8TQgoh1nsCVgxM9XcsInV6v6wKo4L5D89OB
	Qgqn6TCSXfcHqqSK4fr7v560y2PMStqzk0EyXPCN/iD+11PJv8g8OqdiKfr4Z4YkPBIJyBc2LwxVv
	GXLtWVAhUCAElj8JL8LPyFS2wyXxd2pDpNjtPOvGfFNz155U08YmhNz/ujOdqLGaI1w6n1GH5R7Wf
	VLC7G1zQ==;
Received: from ip6-localhost ([::1]:30914 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUPuf-00CgDv-2L; Mon, 19 Oct 2020 07:49:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49608) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUPuY-00CgDo-HI
 for samba-technical@lists.samba.org; Mon, 19 Oct 2020 07:48:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=QIYolwUpve20+CdjxLP7r+wfl4SZQp39YVVP2IWhAPA=; b=2qOXlEdSyF5VaAkegXiRqqhMJq
 Vv148sRYPqDvVZW7Cpl5sqJ9ttH0SnR2/OwMYb2dk/1V/OaBCpxSNbc9ql4xK+pbUNgHFj6tfN4A6
 +B7Ypx6aJiOTzVaXlSVM0uPWr0t0JHmF4wKkB6rw0EJvyngUhxsA5RYXAgA+EpSqj0eQqUYFHXede
 0qVF7upIzb7VN86DpQVRwfpHeXsTgj+G1IOaZ2ChKirqei7NkyIIiI8hq6sORsPRu/52DJZ61ly1e
 IsM+NAJaZlECeYIWXPNchmhnHGBvRrqbwNxbolO+osCoo+MRmRuovlCpVHOhtj6jxJHVOfvi1Zm/A
 LeIXmGnfKINIdhnwpCoubnGdYLgDdRhPIwdSuRhPD+xSKCQ3+ohsy8IZv5UEsoagpKKmvwUfyqkxk
 wo3s2Ms6qdzJH86smxD+k88F3Pvyir2K9mitCMvHsTrUeNO3j4o7thZNxTSR91s01oZO2v/J3BjVa
 kB7mXUedffa8Q3royMpgkzBc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUPuX-0001D5-Tn; Mon, 19 Oct 2020 07:48:54 +0000
Subject: Re: dns.keytab file
To: Andrew Bartlett <abartlet@samba.org>,
 Stefan Kania <stefan@kania-online.de>, samba-technical@lists.samba.org
References: <e459994f-01f1-afc6-eb21-7f639f96bf82@kania-online.de>
 <7330647068a853703f694614e3bdef55978d69cd.camel@samba.org>
 <402fbc72-ea2d-53c0-d8f1-56512aed4f1d@kania-online.de>
 <ae44fa9c9693748b66725fda82d0dcfcb78f9484.camel@samba.org>
Message-ID: <077c0830-6a13-5655-d9d2-f54b6a55a672@samba.org>
Date: Mon, 19 Oct 2020 08:48:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <ae44fa9c9693748b66725fda82d0dcfcb78f9484.camel@samba.org>
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

On 19/10/2020 02:38, Andrew Bartlett via samba-technical wrote:
> On Sat, 2020-10-17 at 09:47 +0200, Stefan Kania wrote:
>> Hi Andrew,
>>
>> Am 16.10.20 um 22:37 schrieb Andrew Bartlett:
>>> I just saw this with a customer yesterday.
>> I see this every time I setup a new domain, I also wrote it into my
>> Samba4 book. If it's a bug should I write bugreport?
> Yes.
>
> Andrew Bartlett
>
I can confirm this is definitely a bug, just where it is, I am unsure, I 
have found two places in the code that claim that the dns.keytab is 
created in the private dir by a commit, the first one (at least) lies.

Rowland



