Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 406C298B152
	for <lists+samba-technical@lfdr.de>; Tue,  1 Oct 2024 02:12:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=G1MlVwEZPWlHCaQFIO7SPoJL5Tvilwjl1Y6FX7QwH6w=; b=P9sxyLf+Xm0vjx1ISyGAfkdqkr
	wzGT5YGGwmiD5QlhM7A23V29l3TjPKgaTLetYKrSO6QlG5wtKH1bST7FpE9M84aA4K8lqZAGRp4rR
	h3YpVpp220VfuxunBrAmlZcAARonQMBdlkUuhJ0psjRBukj3Q6umkGlA6s/D6u2yLGRCUz3+oLHwr
	5ivc2LYU4xlqrCIMQGq+Y6lbXnv2pcRXlK189ZDGt5h2PZ3+RpYqMw9LLi6/GwaYGsz5zkjn+YFzI
	6bfPVe0KU5kBeoxCy2GKLQR5srQ0C1tAcOuWrbfAZTpymGA9TTkp6K/WzlM9rnCpFfQTL70GbL/ek
	LAVYFZew==;
Received: from ip6-localhost ([::1]:32634 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1svQUW-002kZp-6k; Tue, 01 Oct 2024 00:11:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10088) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1svQUR-002kZi-C3
 for samba-technical@lists.samba.org; Tue, 01 Oct 2024 00:11:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=G1MlVwEZPWlHCaQFIO7SPoJL5Tvilwjl1Y6FX7QwH6w=; b=JRqM9bKQy8LSbEnbA3HtRK7lQY
 pM43GEFPT4MQgbKYVZphiymKKInVpFyIPZn1wFV6MNg3YTf/QgeWLSL/NKVBrBYtB7fDjBRcBV2WT
 vv2uNR49Neg6oSlA1KngUuJFMW4DBgZdBbNvIp1724hxc9Yozbt1EHL61MhABOqFJxNJ4hvTdygVJ
 zf9/ZoRtuZUMu7KSbjwdmgAD7ZaJ/Hwxdy24r5Nxu/6leccSBGYL/Z4durgqVnol3w+PHHEDjHE7m
 RzgXHADq6dWnFMbjBLMT9taqczeerlxniTOU0EnAwW83fdG2c9dXXPPmjFrNVb+XFwD8NpzHoGmrk
 kKwh6b8WOkY0Zklcrim+cmZ9lfKQl2Q/EX3OEhs5NUGHJAaU4u5XkrA4WNiQvQadHc5y3q6tK0U7t
 /w/crMbH+IWvLl4v4YaOt78r9RZ3L0iI0Fbvq6XE8z4eVZGLUCFkut4yOpuHMoLfx5VEjZ7JYklkM
 3BjBX/6t7GiuXdRXyCYkhvUX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1svQUQ-002nPF-0I for samba-technical@lists.samba.org;
 Tue, 01 Oct 2024 00:11:42 +0000
Message-ID: <1402f334-328f-44bb-9cb5-34250e0cc1d1@samba.org>
Date: Tue, 1 Oct 2024 13:11:29 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Clarification on MS-PAC KERB_VALIDATION_INFO and Samba's
 implementation regarding UserFlags
To: samba-technical@lists.samba.org
References: <52296fc1-872e-4b82-899b-338d18108300@siemens.com>
Content-Language: en-GB
In-Reply-To: <52296fc1-872e-4b82-899b-338d18108300@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: Jennifer Sutton via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jennifer Sutton <jsutton@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 1/10/24 2:49 am, Osipov, Michael (IN IT IN) via samba-technical wrote:
> Hi folks,
> 
> I seek guidance from you experts on the following case whether Samba's 
> implementation and your understanding adheres to the specs off MS-PAC:
> I have moved a server from one forest to another last weekend while the 
> actual users remained in the old forest. The server runs Samba 4.16 ATM, 
> but also also custom software written in Java utilizing the MS-PAC from 
> the service ticket.
> 
> While processing the PAC from one specific user the KERB_VALIDATION_INFO 
> failed to be parsed because ExtraSids pointer is set to NULL, but 
> UserFlags has flag D set. The domain controller issued that ticket is 
> Windows Server 2019 Standard running on 
> domainFunctionality/forestFunctionality 6 and 
> domainControllerFunctionality 7.
> Now re-reading [1] it says that if flags D/H are set the appropriate 
> pointers must not be NULL. Something does not add up for me here.
> 
> In Samba code the NETLOGON_EXTRA_SIDS [2] is always added regardless 
> group_sids_to_info3() may actually not add any extra SIDs [3]. On the 
> contrary, this code [4] does set this flag only if any extra SIDs are 
> available, so does this test code [5]. Especially according to [5] my 
> KERB_VALIDATION_INFO case is expected to fail.
> 
> My question is now: How to properly understand the 
> ExtraSids/ResourceGroupDomainSid/ResourceGroupIds when those are NULL, 
> can the flags still be set? If those are non NULL, the flags MUST be set 
> for sure.
> 
> I can provide the dump and a parsed view from the dump privately before 
> and after the server migration.
> 
> My actual fix for the problem is here [6] and the issue for it here [7]
> 
> Best regards,
> 
> Michael
> 
> [1] 
> https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-pac/69e86ccc-85e3-41b9-b514-7d969cd0ed73
> [2] 
> https://github.com/samba-team/samba/blob/f749330ddaba04cdae20570a9e842327715f3594/source3/auth/server_info.c#L613C27-L613C46
> [3] 
> https://github.com/samba-team/samba/blob/f749330ddaba04cdae20570a9e842327715f3594/source3/auth/server_info.c#L252-L254
> [4] 
> https://github.com/samba-team/samba/blob/f749330ddaba04cdae20570a9e842327715f3594/auth/auth_sam_reply.c#L399-L404
> [5] 
> https://github.com/samba-team/samba/blob/f749330ddaba04cdae20570a9e842327715f3594/python/samba/tests/krb5/raw_testcase.py#L4195-L4214
> [6] https://github.com/michael-o/tomcatspnegoad/pull/24
> [7] https://github.com/michael-o/tomcatspnegoad/issues/23
> 

I am not sure that Windows itself is entirely consistent about the 
NETLOGON_EXTRA_SIDS flag. For example, the KDC ignores the flag 
(treating it as set) when extracting SIDs from a TGT to fill the device 
info PAC buffer [1].

Feel free to use your own judgement, but I would think to treat 
ExtraSids/ResourceGroupDomainSid/ResourceGroupIds being NULL the same as 
if they were empty. If those pointers are non‐NULL, you can *probably* 
assume that the respective flags will be set.

Cheers,
Jennifer (she/her)

[1] 
https://gitlab.com/samba-team/samba/-/blob/aac22d9ebaba854daf56b8d75a1534375a3bb408/python/samba/tests/krb5/device_tests.py#L71-73


