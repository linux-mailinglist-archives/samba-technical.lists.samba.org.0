Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D597A1AF30
	for <lists+samba-technical@lfdr.de>; Fri, 24 Jan 2025 04:56:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=bSv1XtTknb2wNfaK+rBnVLPi2jbhhcvCUDAQZxSQJ5Q=; b=SZNFl8s921CuDbPOMaM7mtuzFN
	IPRUIfbKb5CglIBdesC+8Gib6KNFKg3klN3flKJ341DcSk5HD/IewufwxRRGWMwAw5VQnw5Hph7DH
	qReoBOPjZEte+8am/JM9ys7vpoJlEjvbBQJQS7+hY5Lj9QZR0NhQR7XF86YMo2+AX79Nl+zztEal/
	XQR597l2Tr/IS5aKpxS5rBgnIf2lIZmWfrtzR9K8/SRIe4Fo3iHrKW3trmSGHIXTBFNqafsjhalFA
	OvQfXQYkgkJjGY99kSKEg9jJP66f9HYHhWg5/Fsu+dBHjQr7EUwjqnW4vpI8PtKXrc2xfq7DI4BHC
	2gG2SBXg==;
Received: from ip6-localhost ([::1]:56782 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tbAmw-009Pim-Np; Fri, 24 Jan 2025 03:55:22 +0000
Received: from cat-porwal-prod-mail11.catalyst.net.nz ([202.49.243.52]:53694) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tbAml-009Pie-O1
 for samba-technical@lists.samba.org; Fri, 24 Jan 2025 03:55:16 +0000
Received: from [192.168.192.96] (wlgwil-nat-office.catalyst.net.nz
 [202.78.240.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail11.catalyst.net.nz (Postfix) with ESMTPSA id DD0EA1D6; 
 Fri, 24 Jan 2025 16:36:39 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=catalyst.net.nz;
 s=default; t=1737689799;
 bh=mFggACDGau+sj8JvT9BenbQ8PuYU81KAO31zEXFeivM=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=GXJ8PQC45eTGlCwv2MyzYvhziSYk6U83QLz4uqOyKh9qxvxTKrXA8OVIL5GDuS7Fj
 SbSeC6DUuFSPNkTodZw2rbk9lTC1RQPO5hLi7vDk8+3OkbRICa5+yPbp5oKx/4FymW
 9FQCC1v3wdiDjKosZcOtTj1vW6QCYXtzP3FVTp23ppqqnPEBkbwjMcMicOonIKVkTJ
 BNoAEj633P6DoiMFN+kSLZu9pbqCMXBr5fN0cJDGwyO/vKf38Ol31v4/BLIL8idRc9
 N2wc6RsoGE9q4AXRx9mEtVg5S0kB4CYNZubvHttFP1C3MZt6hAmN58IkhpKQKzSToj
 nWMa/Jcuy//SQ==
Message-ID: <c7183eb7-dd94-44e0-aab7-0dd11f093090@catalyst.net.nz>
Date: Fri, 24 Jan 2025 16:36:39 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Need Security Descriptor in SDDL Format (using libsmbclient.so)
To: Nirmit Kansal <nirmit.kansal@veritas.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
References: <IA1PR20MB5052B5C1BC44A6A0F6B4F107EA132@IA1PR20MB5052.namprd20.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <IA1PR20MB5052B5C1BC44A6A0F6B4F107EA132@IA1PR20MB5052.namprd20.prod.outlook.com>
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 9/01/25 19:19, Nirmit Kansal via samba-technical wrote:
> I am using the smbc_getxattr() function (from libsmbclient.so) with the system.nt_sec_desc attribute to retrieve the security descriptor. However, the retrieved descriptor is in binary format, not in SDDL. Additionally, I couldn't find any attribute in smbc_getxattr() that directly provides the security descriptor in SDDL format.
> I need the ACL information in SDDL format to use with Windows SDK APIs like ConvertStringSecurityDescriptorToSecurityDescriptorW() or ConvertStringSecurityDescriptorToSecurityDescriptorA(), which require SDDL as input.
> Is there a way to obtain the security descriptor in SDDL format using libsmbclient.so, or an API available in Samba to convert the binary descriptor retrieved by smbc_getxattr() into SDDL format?
> Any guidance would be greatly appreciated.

OK, it seems like we don't offer that in a public library, which is sort 
of a shame, because we have by far the most complete SDDL encoder and 
compiler outside of Windows. (OTOH, I am happy, because maintaining 
public APIs is a real nuisance).

We do export it in Python however, using `sd.as_sddl(domain_sid)`, as 
seen in this context:

https://gitlab.com/samba-team/devel/samba/-/blob/master/python/samba/tests/sddl.py?ref_type=heads#L75

In an earlier message I wrote:

>> It should also be possible to cast a Samba security descriptor to a Windows
>> one using the NDR wire format rather than SDDL.

I still think this might be the way to go. It isn't common to transfer 
security descriptors as SDDL. Usually Windows and Samba just pass the 
bytes back and forth.

Douglas


