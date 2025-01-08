Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB96A06760
	for <lists+samba-technical@lfdr.de>; Wed,  8 Jan 2025 22:43:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=qlMcDLgLrc/Du/a/Z+JPpk4W0suuhdoEfiwh+ZSNDas=; b=isOqvUPIk385P4zM9XgyxTo2Lk
	CevfABGax/6j9zFk0sxTbxwrMYCPnsI75RoCzV9Wiq9VzhiRCD+uAxSOEEh3E8lYL6eWUDtQwupI0
	f61EbnegjAqUxiyZUmKHl4OEW8dSFE1NhKuRUqPlogQijzkW19VzoA7IslmIuKG3pwvR3BIx+xmv8
	6hvzUp6Tpuc38Y4KUXxZpEYmXQ5NwdZtn8Ev7gGmMymAN3YdDVuxrbCJ0Fcp5ELdNJfTTsYqT9WkP
	X4/WI3SHDsIt4wHjKRC+muSkiT8Ry6CK0M7UutbWcDkzZfnxrViwpIE8uhsgQxNqUjd0nv6EVshmN
	XlXTO9uQ==;
Received: from ip6-localhost ([::1]:62718 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tVdpC-007dEt-6V; Wed, 08 Jan 2025 21:42:50 +0000
Received: from cat-hlzsim-prod-mail21.catalyst.net.nz
 ([103.250.241.204]:33880) by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tVdp8-007dEl-0y
 for samba-technical@lists.samba.org; Wed, 08 Jan 2025 21:42:48 +0000
Received: from [192.168.1.219] (unknown [114.23.142.188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-hlzsim-prod-mail21.catalyst.net.nz (Postfix) with ESMTPSA id 1315482;
 Thu,  9 Jan 2025 10:32:33 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=catalyst.net.nz;
 s=default; t=1736371953;
 bh=dVPge0Bmdl9DiU6YcHYHhSZtw1AWi83VKoymeFuzkok=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=eTvoM+6uV0v4DXjKw7KSFyDQM9YCM4SsMUakLEYENfEa1l2k0qrWK7GQbuD9CtjBj
 wu2nUY5V1skuksfjZi99VKVXJb5PV/z27PUHZaZdIzOWdevnZlldAOvoNJWAq7DZhU
 I3778cHYtS6Df6fVnu3rwODkGDTIK7kZpD4NrNoejzkNyJ7iEmsyswcjmrOy/13rL0
 d1N9Tg4wA4OpHCjIu0D/hunFlvT3ZiH5uFVyjDEXCsrV2kLrWstCcf6Mj+resQfBCJ
 sAsrNetCilWLX3m6GXefHwRocZU15KR4cq0cge20IoCYKVFETbL4KkE1+sDgvva7j1
 PVCeDEHqs9tVw==
Message-ID: <b252702f-7c37-431b-a50a-0afd8edc1567@catalyst.net.nz>
Date: Thu, 9 Jan 2025 10:32:31 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Samba] Need SDDL Format Security Descriptor (using
 libsmbclient.so)
To: Nirmit Kansal <nirmit.kansal@veritas.com>,
 "samba@lists.samba.org" <samba@lists.samba.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <IA1PR20MB5052234E8091409C04558E51EA122@IA1PR20MB5052.namprd20.prod.outlook.com>
Content-Language: en-NZ
In-Reply-To: <IA1PR20MB5052234E8091409C04558E51EA122@IA1PR20MB5052.namprd20.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
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

hi Nirmit,

This kind of question is probably best asked on the Samba Technical mailing list
(https://lists.samba.org/mailman/listinfo/samba-technical), which I will CC.

On 9/01/25 02:04, Nirmit Kansal via samba wrote:
> I am using smbc_getxattr() function (in libsmbclient.so) with the "system.nt_sec_desc" attribute to retrieve the security
descriptor, but this is not providing the descriptor information in SDDL format.
> Also, I am not able to find any attribute in smbc_getxattr() which can provide SDDL format.
> 
> I need to use the ACLs information extracted from smbc_getxattr() into windows SDK APIs such as
ConvertStringSecurityDescriptorToSecurityDescriptorW() / ConvertStringSecurityDescriptorToSecurityDescriptorA(), for
which SDDL is required as input.
> 
> So, I am struggling to get SDDL format security descriptor using smbc_getxattr() APIs. Is there any known resolution
to this? Do we have any API available in libsmbclient.so which can convert output value received from smbc_getxattr()
into SDDL format?
> 
> Any help is highly appreciated.

I don't know much about libsmbclient, but I know we do SDDL encoding in
sddl_encode() in libcli/security/sddl.c. It might not be publicly exposed.

It should also be possible to cast a Samba security descriptor to a Windows
one using the NDR wire format rather than SDDL.

cheers,
Douglas


