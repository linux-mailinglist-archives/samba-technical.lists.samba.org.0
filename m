Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBDFD0B0F
	for <lists+samba-technical@lfdr.de>; Wed,  9 Oct 2019 11:26:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=eIxJyjayterS3OxQ/Pqm5h1RehAHtYQXdCPMYzcpwzc=; b=4NHzg0oJQWy8oX4PiaZ0WxzQ04
	4wzx+VE+T+v82yhXyiezDEx9mbcb0w1nFr0BH+Xa2x9PARmpPR/vfboaDaWV1ENjlgBrRsQoOaSjP
	z/boWSfqKA5BRQrK85IUaIMmA8JtWHiHOiXe4Jzkq4eGUDoCASE3rNlI5/+dbvV2pTtOE8e+t40vZ
	kpQbJ/hG5LpfgfxRrcKaMTPGHC9yoMJ0boLf1DPyE/SO/stFWf0RwP2s3yg6K/ovXFtwU+czR3ROL
	Z4jxs77qjex5Mg7OW47CcaQSCr3ZF0y9t3kzc2wHn0GzsSc6s/aMiC4SOvK90AoPFB/W6LqU4fHfY
	WJ6pxggw==;
Received: from localhost ([::1]:60452 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iI8Dq-002Ljc-O0; Wed, 09 Oct 2019 09:25:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23682) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iI8Dg-002LjD-Ln
 for samba-technical@lists.samba.org; Wed, 09 Oct 2019 09:25:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=eIxJyjayterS3OxQ/Pqm5h1RehAHtYQXdCPMYzcpwzc=; b=WjUzG1yMx+FH/m+LoVTdNiEPlp
 jYmgoGxciGGZ6HnzeiMaqpOnvqIXYZD8Q1qLhvMTpJx2Vkzxa65BbQKHb2dlXaLW0dDYc4O6QrkwS
 x18MqwHmVS3ivWBU3NkyMIdmTGKVBiqe/QAJjO86yvzB2k7KzxEhwrVPFCL2FDXrC3+abVQdtnp4F
 RdmYsS+pCFEE2+j+cqcdP2P5CH6T642jsW3wI1hXRiCvRmuyLjSVKW8SidILWa1sdSiNaA3PgDnoq
 b3HjJoG4+Cy1R75+dBPSWwkcHbKNNtlRh7+xuB/xjPcO0fUzB2nV6kE0w757+Kn4cJ/gr40mbdo5I
 rHTI9gom119aaU1uYRx65psC0fE5KihuTclfOFwflA+lB+qYn4UAG3A65bzhNiuyD/Pj1SaxFHy5j
 jjxA905o3ecXkvOsxOUv+1w6VXtxr2GNApMGDd7DvPs26SOZKNvlq8ANFdL+bIrG9shJ3OTtxoTeb
 FGgrGf/kP/k8wivTqQ2hWIxm;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iI8Df-0006SF-Dj
 for samba-technical@lists.samba.org; Wed, 09 Oct 2019 09:25:19 +0000
Subject: Re: Samba and legacy Windows support
To: samba-technical@lists.samba.org
References: <5849953.E8HlOTvGIY@magrathea> <20191008182451.GA1583@jra4>
Message-ID: <288345e4-890f-bf07-7f3d-e170f1266d46@samba.org>
Date: Wed, 9 Oct 2019 10:25:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008182451.GA1583@jra4>
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

On 08/10/2019 19:24, Jeremy Allison via samba-technical wrote:
> On Tue, Oct 08, 2019 at 10:59:41AM +0200, Andreas Schneider via samba-technical wrote:
>> Samba with version 4.11 currently still support a lot of systems which are
>> already out of support. We still get bugs to either fix support for Windows
>> NT4 or OS/2. Also we know that Windows Server 2003 with Active Directory is
>> still deployed.
>>
>> In order to remove support for those platforms which are very long EOL, we
>> should try to make announcements when we plan to remove support.
>>
>> ## Steps planned
>>
>> With Samba 4.12 we plan to disable SMB1 by default and then remove support for
>> it in Samba 4.13 or 4.14. This means end of 2020 or beginning of 2021.
> I think aiming for this by the end of 2020 is possible. There is
> a lot of work to do first though.
>
> Announcing this is what we're going for is a good first step to
> allow people to prepare to move off SMB1-dependent systems.
>
> Jeremy.
>
You do realise that we are discussing this on an open mailing list and 
by doing this, we could be seen to have already announced that we will 
totally drop SMBv1 from version 4.13 or 4.14.

Rowland



