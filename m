Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0CC4F876E
	for <lists+samba-technical@lfdr.de>; Thu,  7 Apr 2022 20:52:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=NWOe6rgrKfDvJ9gkHUGK464q8vrVbmhEuhEhO+YZTag=; b=hyb1z31eOCvrTUitoppeV/aFrx
	wMgtSNDNoVnMDkqieNh2GQO8Zp/B2Vs7cowjQ5RC9fULESgsrPkjqWJRDSY21KNnPpKgQB+7UWxMU
	q8YWm7VXR86oBj/XeAVh9d+r/G3oYRAhl9RFelQgSVCiHI38KFPZ61ROMnua45em94KvGyCnkU3VV
	ohkdWCfysCAM71Bj7x3qrk7SMvL46FBNbGp1CPQjdEPOdJldYUSx4/SPHuUz0AN0EjZPVIiGpmBa0
	9+IePKNGAilPWxlmNySdvfQ4aKg9hXm8knj5/twcPZOX8gYc8mrOkMaHg7rcUD8mwFNJNT+twoXuQ
	bFpBTL6w==;
Received: from ip6-localhost ([::1]:39474 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ncXF7-00AvgG-Cf; Thu, 07 Apr 2022 18:52:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38250) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ncXF2-00Avg6-Kq
 for samba-technical@lists.samba.org; Thu, 07 Apr 2022 18:52:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=NWOe6rgrKfDvJ9gkHUGK464q8vrVbmhEuhEhO+YZTag=; b=ktmaph/t0G2LYBFwtAbYpVPB0U
 DeaGGQILEb2aH5qpTOy3JELnZDaKWBBlzYrpokeBR0F+U6NRIqgSMYUa4bwgMbyqad4ACdF3cqqcL
 hfYeCH8PE5SZH3epSsAhjMF/o44/9exqC8HXFmLSGG0StQdg2pQW2JQ6t3udyyVCysBE4Drk1wp2Z
 4PfHea1mk1CQQYzOD7oEQJrTfZ8KkNpyn9Q9fZ23+qQnOSmh9hdSXLGaVCUX8YWRVkw4c0fic+QkZ
 3tMkVq4r/2L93y/t18eHxyPDcYUjitJwjO86GQYOEQE1iLOiYU3/Ex724K1Ve+vZ6XX6uj8H6YGji
 KsloFn6AM+Fseq955Qd0OVGWCGeYJrR8bh4qOdZ6cPE48MBn2dsRv/BgoAJCntxOhOXTPtAulw4vq
 GBS+8+xXH8u+sAQUbg9xd+t6LUTJ3Vp601tTsw+A4imtW16kXtAmLG2M8sV4+Xy2+6NB2oHZlfsD0
 hJbM8bWxJyB03Lu1RKe/EYRi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ncXF1-005tdn-Uo
 for samba-technical@lists.samba.org; Thu, 07 Apr 2022 18:52:24 +0000
Message-ID: <0d486c94-2570-c79a-a582-a049d908be50@samba.org>
Date: Thu, 7 Apr 2022 12:52:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: SMB1 can now be removed from the server code !
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <Yk8w5TWMP7bKmy0z@jeremy-acer>
 <8f1a87e9-fef6-599a-c0f6-1dc4921e355b@samba.org>
In-Reply-To: <8f1a87e9-fef6-599a-c0f6-1dc4921e355b@samba.org>
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

On 4/7/22 12:49 PM, David Mulder via samba-technical wrote:
> On 4/7/22 12:43 PM, Jeremy Allison via samba-technical wrote:
>>
>> to David Mulder from SuSE for writing this code, and to Samba
>> Team members Ralph Boehme from SerNet and Andrew Bartlett from
>> Catalyst for reviewing and improving the code changes before
>> merge.
>>
> 
> Jeremy failed to mention that he also played a huge role in both writing 
> code and reviewing. Thank you Jeremy!
> 

Also, thank you Volker Lendec! He also participated in code review.

-- 
*David Mulder*
Labs Software Engineer, Samba
SUSE
1221 Valley Grove Way
Pleasant Grove, UT 84062

dmulder@suse.com
http://www.suse.com

