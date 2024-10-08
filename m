Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C58E299531D
	for <lists+samba-technical@lfdr.de>; Tue,  8 Oct 2024 17:17:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=e32O0NXV/VjU0tZcqVjHSltKqE5C0YTzWJ8kYHFbhD8=; b=wkZ13DZrZn5RCsfMybRayuCEHe
	b3bx81YrV6lDHqFaX97WrRc4Qr7KH1O56B6OLHzlLeggrl1lMJWZ+0xsLqpHpcNm0y725l7PD+ApH
	CL9gBbLSqArSFq6z0E4bqqrp6c3gPKWzOl/GWbYRK3SmVMpWk1ohE7CWRIXYKQdTnvwXJArTGTG20
	9RIfBZdmwbsqdChI+ZTZqAHAo5Jvfbo5taZO1PWHP3xzIOC99gR/7zZzy3O4zayofvUe2HjvFU8YU
	+d7k/ixziWuzjgZ4AxQspqDU0wTdrE2nGhUzWI8BGcg9Fz3oxY0LOM8SSL9Hdtz6L33WByGKO8zh8
	npVhxxWA==;
Received: from ip6-localhost ([::1]:48846 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1syBxB-003INd-0P; Tue, 08 Oct 2024 15:16:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44038) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1syBx6-003INW-1f
 for samba-technical@lists.samba.org; Tue, 08 Oct 2024 15:16:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=e32O0NXV/VjU0tZcqVjHSltKqE5C0YTzWJ8kYHFbhD8=; b=2GKrd0kIC6b+ODicSpGDDrqgfb
 8Y2TzqPAFBFI3Fb7UQUaBuFWOrIAYtqflqZepdkEFHSWv+J/nd4Kh0ivZcF1cxdFQ6UM0KduW1Hz/
 zUiM8GZICWClPcMX6yhWGJEHF673sxnCWBoXzEhTTnRLM/ECP2RDgcszHUTMQ9ii2Rj0VpIe811NX
 0X2ysdupFsN5RMFCCpJwfAQaPyKph5bKgAxMkDFCrxlt8azfFFYvz75kV+jVS8uwV8hhsSc8TomiW
 8zh4GMyCuqDkG8PN7oGMC/NxaK54TTo1ZGgA5MGgw0EJmTM6l6Jdf1KHXKLRvNVbQr/Pq+GLgiXbB
 kQwKi2Qjxmws9EO9pC0q/Y0T9oNt4dF8X5CuLdKfxnyvHxsLiMShTl7n8P9E4I7RH+8FUs6TOaHI5
 u6jpg4ivDqoCwGBs+JQN9nHjHgcRssPYZ1nYDRc61cut8ly8HcVDWicLjzAnBGPtpD2yfBf4XmjH4
 G5VodV8eCBxWXv+UFkeLB9VH;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1syBx4-003vvF-2F; Tue, 08 Oct 2024 15:16:43 +0000
Date: Tue, 8 Oct 2024 08:16:39 -0700
To: Ralph Boehme <slow@samba.org>
Subject: Re: Current Samba master incorrectly returns STATUS_INVALID_HANDLE
 on copy_chunk
Message-ID: <ZwVM1-C0kBfJzNfM@jeremy-HP-Z840-Workstation>
References: <CAH2r5mt7cE8Cc2K5K8nRM2RL=R-rwuAR9h6SSyEqtApuochtuQ@mail.gmail.com>
 <e12d7594-02df-4cbb-80fc-276d907afd90@samba.org>
 <CAH2r5muqSmNy+3SViFKNJ=5Sm61u8r9ej9Wy8JLUDeC2XHwccA@mail.gmail.com>
 <77aff6ef-291d-4840-82e2-b02646949541@samba.org>
 <d84732db-dea1-4fbd-9fc9-105c115c9ca0@samba.org>
 <990b4f16-2f5a-49ab-8a14-8b1f3cee94dc@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <990b4f16-2f5a-49ab-8a14-8b1f3cee94dc@samba.org>
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

On Tue, Oct 08, 2024 at 11:35:16AM +0200, Ralph Boehme via samba-technical wrote:
>On 10/8/24 10:45 AM, Ralph Boehme wrote:
>>On 10/8/24 10:41 AM, Ralph Boehme via samba-technical wrote:
>>>The problem is the O_APPEND on the destination file handle.
>>>
>>>We pass that flag if
>>>
>>>         if (posix_open && (access_mask & FILE_APPEND_DATA)) {
>>>                 flags |= O_APPEND;
>>>         }
>>>
>>>Is this on a posix mount? Otherwise it seems to be the clients 
>>>fault passing FILE_APPEND_DATA.
>>
>>gah, it's an "&&", not an "||", so it's your client I would say.
>
>thinking about it, I wonder whether that condition is actually useful 
>or if we should remove it.
>
>@Jeremy (or others): mapping from FILE_APPEND_DATA access mask to open 
>flag O_APPEND seems wrong imho. Do you remember why you added it? Or 
>anyone else?

It was done as part of the SMB1 extensions - trying to "pass-through" all
possible POSIX open flags.

Just remove it.

