Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D01747FCC0C
	for <lists+samba-technical@lfdr.de>; Wed, 29 Nov 2023 01:51:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=iQFMFwe4M2/TPIvnrBRfJdv0UZlQ6wrP6nOWJdKhomE=; b=y3SXuwOW6YiK9b5xQRubk1vSTC
	9rEid4rbXs9sESNVcaT1r71rTxnqPw0T3qm+CyVtnpFthWtVIIQLzHlOivfAtjWOILLTXxCTHsRdZ
	zrDAl1uOOySkYfFpgNIBgy6yST3VOPsaWBDz3QnoPLZStSnuyTdyC90JqgIEPxyI53ccOkWOPuQhY
	KSRHOc40AsKZNb31uoyGuU5KN+Fby/6e6VJ7ik2GULLJL04VThR/qSl6vrn7LjKat5KStM5DP+wc1
	4qvWvmXQTnqm8Yeq13awUHw+nBxPbWRIXqg4eFiK3qk2TfBZK+5c8C7yPbpo8fzUWl/l761dLyW6D
	8hGBfURQ==;
Received: from ip6-localhost ([::1]:44530 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r88mc-001Grs-3p; Wed, 29 Nov 2023 00:50:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48830) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r88mX-001Grj-ET
 for samba-technical@lists.samba.org; Wed, 29 Nov 2023 00:50:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=iQFMFwe4M2/TPIvnrBRfJdv0UZlQ6wrP6nOWJdKhomE=; b=VGmP6Y/Bql5gl25U29fvLfq8r8
 7XkG3lvoNZngtFX9fS0g1TTgzfE38sl0YvxNB83kkgtLbqy1ykjtRfH5iF5H+y0yJixlOngQfxXpi
 i+ypQb4PppqwhXca37YjkGRtppBscTEOzrw4NCe4wGu+86WK05YjYH8/FLmgErljX4XPArIKG3rbd
 LemwcebxwXX/nEJe7g9NMo/8+bKq7wAQBlqPqdZsTUnkBkaCV1/BZfwE82t5C51+viaNVrcKm5zkb
 kKjLrcZe1OkXCzHM7ohwNWLt2OF7Sf49F5hjTdwJPTBjxqkdm/HVWzQxF6xqf9g0BtNVqB8nLTOqu
 hRTqpdwRdgqx4nLr7/NWXtjP/ZWDZFSdHagYPypkXL6/PESR2HHSyLeHx3fGalJD4QvHh6TsThGI5
 3jfDpoPbsQ+y4tA8y/r2VnmRAsl5snT3IE488umhiTuFRhys2QJDKh9tg6XMV1MXCAeeuk9idLL9w
 8d2X2BF0pWSTjStrHDnyxHnV;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r88mS-000zil-0H; Wed, 29 Nov 2023 00:50:20 +0000
Date: Tue, 28 Nov 2023 16:50:16 -0800
To: Steve French <smfrench@gmail.com>
Subject: Re: [SMB3POSIX] File attributes
Message-ID: <ZWaKyLw/Q2uefb+i@jeremy-HP-Z840-Workstation>
References: <e916bdea-4197-4372-a15b-cea41c8ebe03@samba.org>
 <ZVJh3X9GQ5L9mLS0@jeremy-HP-Z840-Workstation>
 <e6bd562a-296c-44f2-8164-8a90d98fa6e2@samba.org>
 <CAN05THS4H1+vHuPSnRQmiRtDDpnw3j0PUUJi6FwFZf_2zrAsRQ@mail.gmail.com>
 <CAH2r5mspC6iufincWMtHWrY=Le6nbsDEB3kpFxUFAhKSWR-2bg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAH2r5mspC6iufincWMtHWrY=Le6nbsDEB3kpFxUFAhKSWR-2bg@mail.gmail.com>
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
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>,
 Tom Talpey <tom@talpey.com>, Volker Lendecke <vl@samba.org>, jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Nov 28, 2023 at 05:32:48PM -0600, Steve French wrote:
>
>Couldn't we implement "chattr +i" ("immutable") by updating the ACL? Or if
>the ACL solution is not good enough (e.g. preventing links to be created to
>the
>file etc.) then seems like no harm in defining an ioctl as a secondary way
>to set the following attrs:
>
>#define STATX_ATTR_COMPRESSED           0x00000004 /* [I] File is
>compressed by the fs */
>#define STATX_ATTR_IMMUTABLE            0x00000010 /* [I] File is marked
>immutable */
>#define STATX_ATTR_APPEND               0x00000020 /* [I] File is
>append-only */
>#define STATX_ATTR_NODUMP               0x00000040 /* [I] File is not to be
>dumped */
>#define STATX_ATTR_ENCRYPTED            0x00000800 /* [I] File requires key
>to decrypt in fs */
>#define STATX_ATTR_AUTOMOUNT            0x00001000 /* Dir: Automount
>trigger */
>#define STATX_ATTR_MOUNT_ROOT           0x00002000 /* Root of a mount */
>#define STATX_ATTR_VERITY               0x00100000 /* [I] Verity protected
>file */
>#define STATX_ATTR_DAX                  0x00200000 /* File is currently in
>DAX state */

I disagree. There is harm in specifying something which
currently has no users or usage. We don't want to add
arbitrary stuff that isn't currently used or needed,
that way lies the SMB1+POSIX extensions - which
defined a chattr but was never implemented on Linux.

We might get it wrong.

Let's start with a minimum usable feature set that
people actually use, and once we have more experience
with that then let's *carefully* decide if we want/need
to expand it.

