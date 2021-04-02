Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A626E3524E9
	for <lists+samba-technical@lfdr.de>; Fri,  2 Apr 2021 03:07:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=MJNn00HnH79Pubg/wyxjJvUfkn+6c5mfTwAV4ijmVrs=; b=GTj5+g6apWsqO0avEj/G4MESKH
	faO5ggyqrSeR7PUR1E5NtLQVLnGOtRIH+NOxABrFB/jTiY9ldY+9DqxZFakpUrlQbQKfu77IpYmPm
	oO6RXh5z2UugdZ6Hmh1YnwYFXdwDbQJNIhyLB2azfs3CTzc7uT3theZ5QpVgUNs5EZ70kwpUmDRlx
	gDZZvjZ6fSnJ/EHJcSHso+TLRESCkT+Z74dPU9o9zxyEH2tKhQfscTHdq+VbWrBCr+Yr9vwT31WPv
	EQVt4/EmDgvncGwlN1DsjkAPDSdt35jh4MmDWoFTtxocfPXrzdVx07V01ate55RxJtSAsPYzp+JDx
	Jcg+9U7g==;
Received: from ip6-localhost ([::1]:59668 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lS8H3-009b2h-Lt; Fri, 02 Apr 2021 01:06:57 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:55426) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lS8Gw-009b2a-Es
 for samba-technical@lists.samba.org; Fri, 02 Apr 2021 01:06:54 +0000
Received: from [192.168.1.110] (unknown [114.23.142.188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id B1DFD80911; 
 Fri,  2 Apr 2021 14:06:33 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1617325594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MJNn00HnH79Pubg/wyxjJvUfkn+6c5mfTwAV4ijmVrs=;
 b=a+9xIwsmW4EBrGSlWtwY684jDDOUhntI/SjtcJydis6Dhd2jNLKMBOBu7T52FypddDHl4K
 jIaLX7REuBakaNJr0e93ijxztJ42pMiBGJih/a88MzZnknG5izbOoWWccSG6zQUvyLWU0r
 Sn4BlZuS0H8ZwDya8Unuh73pvGLu8fP4MaPG2hIqXD/ZZnR2yqBflKMM3eowJfUSYd6gvT
 8/BnM2MX9/KlWznLcg7ec8wBEvZKGdsToO2T4VEEpcdQ6HTU6asOTm5jQSh1ADEU7Jd/O3
 Ow8ixm3tXKOlJa9rf2dygBLnYYREn3/3yYLc6qLRqfFWOPRARI3iBnrWXIHMjA==
Subject: Re: Improving LZXpress decompression/compression algorithms
To: Matt Suiche <msuiche@comae.com>, samba-technical@lists.samba.org
References: <CA+NQ6=xa2itZO0oYTPp784jfHqg6uAVYhEGkCuLynhgkd6eKzQ@mail.gmail.com>
Message-ID: <ac17e7d0-6f6f-ae92-8ac2-7aec24c578ab@catalyst.net.nz>
Date: Fri, 2 Apr 2021 14:06:31 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CA+NQ6=xa2itZO0oYTPp784jfHqg6uAVYhEGkCuLynhgkd6eKzQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=douglasb@catalyst.net.nz
 smtp.mailfrom=douglas.bagnall@catalyst.net.nz
X-Spamd-Result: default: False [-0.10 / 15.00]; ARC_NA(0.00)[];
 MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:56030, ipnet:114.23.0.0/16, country:NZ];
 MID_RHS_MATCH_FROM(0.00)[]
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 1/04/21 9:13 pm, Matt Suiche via samba-technical wrote:
> First of all, thanks a lot to Douglas Bagnall for the assistance.
> 
> While I was revisiting the LZXpress implementation, I discovered that the 2
> official documented cases from MS-XCA were not supported:
> https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-xca/72da4f8d-2ba3-437d-b772-2e4173713a0b?redirectedfrom=MSDN
> 
> The attached implementation includes bug fixes in the decompression
> algorithm, a rewrite of the compression function and additional tests as it
> only had a single test.
> 

I have created a merge request from these patches:

https://gitlab.com/samba-team/samba/-/merge_requests/1882

Two things:

1. Patch 1/2 lacks the Signed-off-by.

2. The build fails on this line:

 ../../lib/compression/lzxpress.c:356:4: error: for loop initial
declarations are only allowed in C99 mode
     for (int i = 0; i < length; i++) {
     ^
Our style is to declare `int i;` (or likely better, `size_t i;`) at the
top of the function.

(Interestingly it is only the Centos 7 compile that failed on this).

I will attempt a full review after easter.

cheers,
Douglas

