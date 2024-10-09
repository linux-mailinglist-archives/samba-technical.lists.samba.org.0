Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A15B09975DD
	for <lists+samba-technical@lfdr.de>; Wed,  9 Oct 2024 21:43:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=mJbCIKSNymdP0JuBAmlGHDVFpevqFviZQ+cMQqealV8=; b=1I2Eo2D8UGPniVCUk+tw4Fw/Ag
	DQAjL63J7a6aBinqMA1tFoWElnXgOo1cUaQdtrtm3icMeXNx+c7j5BZcAKzZHQJOP42XEI+Sj66Bx
	5FljjXAkXOy9I7HA9oZuco1JKGQYiKEVmyLwraBmr0Vm4z21tPvh5Hz5U89TM/zb6INvvSdzDSxIk
	6FZUEj1I0yMe0/5HoCw0CfPPiC85N3KFOa5GbGW8FXUkKw498Uxaaz2l9t95mN8pVnIGL7e/dxuTK
	3yth+wDk4zmFxVguwT4nBbV+niCZHLooToH6h+2Loq4Tgqat0pw2Nfqb+aJzoIACMtUl2JwKaoBgl
	gvJZAILw==;
Received: from ip6-localhost ([::1]:21392 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sycac-003PRF-EQ; Wed, 09 Oct 2024 19:43:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30988) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sycaX-003PR8-QS
 for samba-technical@lists.samba.org; Wed, 09 Oct 2024 19:43:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=mJbCIKSNymdP0JuBAmlGHDVFpevqFviZQ+cMQqealV8=; b=cPdskftLJ3fjOIqd9GRJ75S+XZ
 ndwL2DxQyDnfq/nbeBcmcZqaQyAogViI6/jkMaqC+Rk+Y6pb7RAxDarnWlR2d03RdzlmyPIwZwxgL
 vumWMJWsEjagoozMJKKozgN6tvCcFerd+2aHBhyHK9GsPsdDx+XQSu5extcj0yLNpAom/GqvOf0wf
 Rq9NhqrCsOhhGMY9krcGAAuQCEwG7cdPlwUwwWYA7CqNaY5tyz/j2tum7x65hEMwyutBgxqr2W/Ws
 owDHWUISOuhefdw+f7kLAw8Xe3udLxIhVnCzQT7Bn6Lh0KnEPxuHjaiZ7euQDlZNjaX/xvV05QBl8
 7xVfjSrXj6GFPcnk4cpLpPqdGpc9IeXvBBq1ReAlGNZKdmb077bi4iIt5187xZBwkYOl9vvKdZ8cx
 HO4JtVmuT+uJok1GdvufWCa/rHh/Pju6GZoVZOYFx7JLi1rSzv/QvA2/3ibTE80kmtqO22IS9n5tv
 uzvy1c3lCiusvIm5lDOkTEIq;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sycaW-0045wd-1G; Wed, 09 Oct 2024 19:43:12 +0000
Date: Wed, 9 Oct 2024 12:43:09 -0700
To: Ralph Boehme <slow@samba.org>
Subject: Re: Current Samba master incorrectly returns STATUS_INVALID_HANDLE
 on copy_chunk
Message-ID: <ZwbczZYBsTU03Ycv@jeremy-HP-Z840-Workstation>
References: <CAH2r5mt7cE8Cc2K5K8nRM2RL=R-rwuAR9h6SSyEqtApuochtuQ@mail.gmail.com>
 <e12d7594-02df-4cbb-80fc-276d907afd90@samba.org>
 <CAH2r5muqSmNy+3SViFKNJ=5Sm61u8r9ej9Wy8JLUDeC2XHwccA@mail.gmail.com>
 <77aff6ef-291d-4840-82e2-b02646949541@samba.org>
 <d84732db-dea1-4fbd-9fc9-105c115c9ca0@samba.org>
 <990b4f16-2f5a-49ab-8a14-8b1f3cee94dc@samba.org>
 <ZwVM1-C0kBfJzNfM@jeremy-HP-Z840-Workstation>
 <569625f6-e0d2-43db-88cf-eb0fff6eb70e@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <569625f6-e0d2-43db-88cf-eb0fff6eb70e@samba.org>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Oct 09, 2024 at 08:54:12PM +0200, Ralph Boehme wrote:
>On 10/8/24 5:16 PM, Jeremy Allison wrote:
>>It was done as part of the SMB1 extensions - trying to "pass-through" all
>>possible POSIX open flags.
>>
>>Just remove it.
>
>ok.
>
>But then we still need a way to pass O_APPEND over the wire with SMB3 
>POSIX and we're currently lacking a sane way it seems.
>
>What about using one bit of the 17 reserved bits in
>
><https://www.samba.org/~slow/SMB3_POSIX/fscc_posix_extensions.html#posix-mode>
>
>There are more possibly interesting open flags though and I wonder 
>whether packing all of this into those 32 bits is a good idea, but the 
>alternative of changing the SMB2_CREATE_CONTEXT request to add a new 
>field "OpenFlags" is not really a great looking option either.

SMB1/2/3 has FILE_APPEND_DATA.

  From the definition of NtCreateFile (the NT kernel
system call).

https://learn.microsoft.com/en-us/windows/win32/api/winternl/nf-winternl-ntcreatefile

"If only the FILE_APPEND_DATA and SYNCHRONIZE flags are set, the caller can write only
to the end of the file, and any offset information on writes to the file is ignored.
However, the file is automatically extended as necessary for this type of write operation."

Can we just map (access_mask (FILE_APPEND_DATA|SYNCHRONIZE)) ==  (FILE_APPEND_DATA|SYNCHRONIZE))
to O_APPEND, regardless of POSIX mode ?

