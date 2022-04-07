Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 444364F8756
	for <lists+samba-technical@lfdr.de>; Thu,  7 Apr 2022 20:49:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=4gLaEq8qIGBRaiClq+78KsY+RGxF+ZZZ0IulHvR+TMc=; b=phCSq1DpGvyrkPpHgDkD/33Bjd
	nGDLVsx7cvcq0i+hzxjW62bvnBJZpLGf3qMoVTwXMM6yz28rWFudPOAmJ0m11HPOo99kXUQlZvEav
	ZpZjIhEgmNoFvvI9oVS4N9Q7LbcIYGGziU7abMTSNH3I9X7Ud63RmwnxPtpjO3FIu4Bb4elX8K35S
	0EhgsYUfPrF+8C7wkxdrndGBUR9wGri6wTIHcJHzpVTsBVcUdsSkdt5XAHacEw6sesHS8Iv49vxHk
	Ou7IPzIQdwoJYHzKiQTHAnOvVyKomktTcGmYoVSq4mZufg4bdzui3jtC1x3zH5UTq8qVniNlL9LGf
	7QtR6GCg==;
Received: from ip6-localhost ([::1]:38794 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ncXCB-00AvMy-OP; Thu, 07 Apr 2022 18:49:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38246) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ncXC6-00AvMo-9r
 for samba-technical@lists.samba.org; Thu, 07 Apr 2022 18:49:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=4gLaEq8qIGBRaiClq+78KsY+RGxF+ZZZ0IulHvR+TMc=; b=k452qxnGH1kDnz9FLagTWoITMM
 Gx1qIgZqU6pMEwtp51bl3nVsaUD4hp/8ok1rf26dd1WnXKtWzX4MatrNOt+xJrGwR29KxriKv6a9s
 qzcBeLOaew8rQRSBqRrXn932Wkgn/tCnfXVNaLzrU1sElIigt5NZZeqEzfzckcltrd3eHZjHMg4X/
 86RFEAf9OIeNOROp4hhq2/vOQgZzDpFCE3ayxcLf1Hnu8vYvCjaBNm2uR4AUQvO7Nk/Q1QmHTNzuc
 t0xtIcBEUraEg0pRFmZIPXibyi2lnBRlmqjU87yc14tN2+G8pUDuSzsMl8Sm4RqWdY0432UIsV/QM
 qBsbfXNTYE1Or4r5ANPKsOJlPQy7XoC3f8a0yqdt/BmkzSmebNNkuISrVnm8PXPoU/WTvXY4btKSj
 hvMiyp9BMh2uEoaP6OOhcTLkx2G3Rvte4V4lDeRC7W5BKcz85yzBrmUGQOOek7IT+DIQMCIVc7Dq7
 haryBNtNmCWwb30yt10yQKBD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ncXC5-005tYC-Aw
 for samba-technical@lists.samba.org; Thu, 07 Apr 2022 18:49:21 +0000
Message-ID: <8f1a87e9-fef6-599a-c0f6-1dc4921e355b@samba.org>
Date: Thu, 7 Apr 2022 12:49:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: SMB1 can now be removed from the server code !
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <Yk8w5TWMP7bKmy0z@jeremy-acer>
In-Reply-To: <Yk8w5TWMP7bKmy0z@jeremy-acer>
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
From: David Mulder via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Mulder <dmulder@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 4/7/22 12:43 PM, Jeremy Allison via samba-technical wrote:
> 
> to David Mulder from SuSE for writing this code, and to Samba
> Team members Ralph Boehme from SerNet and Andrew Bartlett from
> Catalyst for reviewing and improving the code changes before
> merge.
> 

Jeremy failed to mention that he also played a huge role in both writing 
code and reviewing. Thank you Jeremy!

-- 
*David Mulder*
Labs Software Engineer, Samba
SUSE
1221 Valley Grove Way
Pleasant Grove, UT 84062

dmulder@suse.com
http://www.suse.com

