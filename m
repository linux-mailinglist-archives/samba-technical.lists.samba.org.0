Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 32056D51B5
	for <lists+samba-technical@lfdr.de>; Sat, 12 Oct 2019 20:46:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=rfmGK60/hjeJfO4INUTgrjabOrFfwjjeR42IKb0MGvI=; b=uz9PkcnEpYPHsNEfJeOaUsfzw5
	JVDIL3UlfrW7CKrlBO9saqGuQFM1rWD6mbqe6gGWCgtFbNUQsuqFHCwpTl+DH8sy9dzUX3BWKuiUl
	wfawQrEgH/RYvC2UtCwjpgnqZQRbZsQno/8je4k4tEwP/Acn23aiZWP6tMgHts30gBA7dLPM7nJBs
	suM7jpmDWJbMuWsishoxSMge8P6M+rRnBdRB0JfzVkxFCGjPsF93eQvVo9VqGwoRaTuoO00WcwzM3
	4xTPYLx5CkBzq/p6X7r3PaclaIB5iC0bl9BlgiM9byMoRejH0qM/jzOpQjXMYi6fzz201JXSQzqaX
	dmT6OC2w==;
Received: from localhost ([::1]:55274 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iJMOZ-003HPp-Nq; Sat, 12 Oct 2019 18:45:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10600) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iJMOV-003HPi-Oo
 for samba-technical@lists.samba.org; Sat, 12 Oct 2019 18:45:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=rfmGK60/hjeJfO4INUTgrjabOrFfwjjeR42IKb0MGvI=; b=hsZhGWGTOO+4cXocOMJ3vxPk4V
 8SYGzGFFiKxk0RGB00nKb3PG0HCUEfRyjnEjpE4gOS/mue/7O4oUKJWbFLsuoD0HzTkM5DvtS2S9r
 EyzF64qzTJfP9hkc7s2X7/A9xors21iRmKH55u7ibpRaXk10h6xsLjMq2jUaF6jK6FcvOHPgVh58i
 qo94CH5Ckm7cvWlXufcRfACazI0b7b1X2nldH1kT+SEOz0HRaCpaJZhyuo8Cb7lbGzO9PVbYCM5jU
 rI3rnrNhnsfiioEnjM5yXFEpdEh5ixeuQtDSm05cRKhIIfk1q6f+wJitJ+/V9VeVsQriStfcFSHII
 bkuye/llw4ujWSmpFYO7rWhbn3dpgBr9N68fVL1SrwAW574XuwPD3z/Q1J1v+8cQKJZlCVRVrKsV/
 rLs/LQs216O6zDtztr8XffCJXpoBE8EiMkx7YeCRUOV1F8b1WGxsf+nEin00bP6dxcsGa8kUMos75
 9dbvIZmEo5x5srvgJHI5Hy/M;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iJMOS-0005wL-Ni
 for samba-technical@lists.samba.org; Sat, 12 Oct 2019 18:45:32 +0000
Subject: Re: Samba and legacy Windows support
To: samba-technical@lists.samba.org
References: <5849953.E8HlOTvGIY@magrathea>
Message-ID: <a137e3ff-f2b7-b1ee-2ba8-bb9cf0acd6d0@samba.org>
Date: Sat, 12 Oct 2019 19:45:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5849953.E8HlOTvGIY@magrathea>
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

On 08/10/2019 09:59, Andreas Schneider via samba-technical wrote:
> Samba with version 4.11 currently still support a lot of systems which are
> already out of support. We still get bugs to either fix support for Windows
> NT4 or OS/2. Also we know that Windows Server 2003 with Active Directory is
> still deployed.
>
> In order to remove support for those platforms which are very long EOL, we
> should try to make announcements when we plan to remove support.
>
> ## Steps planned
>
> With Samba 4.12 we plan to disable SMB1 by default and then remove support for
> it in Samba 4.13 or 4.14. This means end of 2020 or beginning of 2021.
>
> If we remove support for SMB1, we could also remove support for NTLMv1 and
> Kerberos support for DES, 3DES and maybe RC4. Already on Fedora 31 use of
> these encryption types is blocked by the default system-wide policy and is not
> available through MIT Kerberos. DES support is fully removed from MIT Kerberos
> 1.17.
>
> NTMLv2 is still widely used and it uses RC4. This means we can't remove
> support for it till there is a valid replacement for the pure file server
> case.
>
> ## Questions
>
> * Can we remove NTLMv1 and LM keys for Samba 4.12 (remove `libcli/auth/
> smbdes.c`)?
> * Can we remove DES and 3DES Kerberos support for Samba 4.12?
> * When can we remove RC4 support with Kerberos?
>
>
>
> 	Andreas
>
>
Just in case any one is interested, Univention will be releasing version 
5 of their product next year and they will be dropping support for 
NT4-style domains.

Rowland



