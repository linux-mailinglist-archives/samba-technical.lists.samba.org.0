Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A05808EEA
	for <lists+samba-technical@lfdr.de>; Thu,  7 Dec 2023 18:41:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=6Dx/xHDA5bswLH7hOt9ozbRBLobX7v1+DWHkXXnAEGU=; b=MW4dyw8PLt7u/KQfPXJUFwDQ1F
	fYG5sPOXcVnPh9vljfZTbzSIpDoIxpmv2XWjyKXtzE238np1S7H2HvnKUpU/vZLL2Khq6L8OkXQ6T
	5vJq6g7K69sRHGc7p0pBf9NtO8ZNt7lN0WuAKwLm2vufwAOKsQI86K1mTKlKprT/0i+ESrefFpX3w
	TntxKfNyIB7ExHDDQ8p7TqoGlHPPv6cLMvVZsVzcbrUcgrN+9VCnayEkf2RZ90hq/mBm/Qax9KM4q
	vv575r46jv6LnOD2kqEd88nyhBKnd9o0UlHw/uJTcvNtezO+y1i30oUNVa9QCPot3k7p/dCMzt5L0
	GVWxS1Mw==;
Received: from ip6-localhost ([::1]:38758 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rBIMU-0050V6-Un; Thu, 07 Dec 2023 17:40:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62734) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1rBIMP-0050Ux-5E
 for samba-technical@lists.samba.org; Thu, 07 Dec 2023 17:40:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=6Dx/xHDA5bswLH7hOt9ozbRBLobX7v1+DWHkXXnAEGU=; b=mXUBpnumu8oIKipJijbTqMSLG1
 ZfQNW3yQAEwVsb1s6Zv/FEDD5xnKvuqLAKEEbBrICGXxLr1Z0A8kFJJTFWn+aZfFjYjU+H1MLHGVS
 LS1LUggLofb7ADhdbm3xq5xXVS0+fGSJuuErwuS5B21AsImLtxlKOavPNjS9LQ4DYax0MrQK/aJOn
 1WGntH5Y4JKHasXz5Y3cANDUUpQxkkY+kP0MfRpnQ/T5WuXfeOIvTx+CIsDzxo4KQP9eh4U28Z40w
 31Av1CshYvJ8g0onhUczhVxowycjIBoPG/GIX2pCWqXhAVd7M+JRxPrziub+piMNWvFOwJRDEWB2V
 iVddDpsTOdK3xuhJvhHhY7je+62bf/6JTU2gebfuhhmJVkZ/MJj4cmLVJaFBkMU3S9ayM1M/l6ngH
 QRoi8CXw9CzjE5/0iwWDZSlkMYtGrWvRbBRGtVmkEsNZdtsWZUT+MBDqY+PCNUoUN99gte60yWu9b
 g6Oayszt97c53mKHXHkaJoD3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rBIMI-002QYw-0w; Thu, 07 Dec 2023 17:40:24 +0000
Date: Thu, 7 Dec 2023 09:40:18 -0800
To: David Howells <dhowells@redhat.com>
Subject: Re: Can fallocate() ops be emulated better using SMB request
 compounding?
Message-ID: <ZXIDgvZ8/iBhYXwy@jeremy-HP-Z840-Workstation>
References: <700923.1701964726@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <700923.1701964726@warthog.procyon.org.uk>
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
Cc: Stefan Metzmacher <metze@samba.org>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, jlayton@kernel.org,
 Tom Talpey <tom@talpey.com>, Steve French <smfrench@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Dec 07, 2023 at 03:58:46PM +0000, David Howells wrote:
>Hi Steve, Namjae, Jeremy,
>
>At the moment certain fallocate() operations aren't very well implemented in
>the cifs filesystem on Linux, either because the protocol doesn't fully
>support them or because the ops being used don't also set the EOF marker at
>the same time and a separate RPC must be made to do that.
>
>For instance:
>
> - FALLOC_FL_ZERO_RANGE does some zeroing and then sets the EOF as two
>   distinctly separate operations.  The code prevents you from doing this op
>   under some circumstances as it doesn't have an oplock and doesn't want to
>   race with a third party (note that smb3_punch_hole() doesn't have this
>   check).
>
> - FALLOC_FL_COLLAPSE_RANGE uses COPYCHUNK to move the file down and then sets
>   the EOF as two separate operations as there is no protocol op for this.
>   However, the copy will likely fail if the ranges overlap and it's
>   non-atomic with respect to a third party.
>
> - FALLOC_FL_INSERT_RANGE has the same issues as FALLOC_FL_COLLAPSE_RANGE.
>
>Question: Would it be possible to do all of these better by using compounding
>with SMB2_FLAGS_RELATED_OPERATIONS?  In particular, if two components of a
>compound are marked related, does the second get skipped if the first fails?

Yes:

https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-smb2/46dd4182-62d3-4e30-9fe5-e2ec124edca1

"When the current operation requires a FileId and the previous operation
either contains or generates a FileId, if the previous operation fails
with an error, the server SHOULD<253> fail the current operation with
the same error code returned by the previous operation."

>Further, are the two ops then essentially done atomically?

No. They are processed (at least in Samba) as two separate
requests and can be raced by local or other remote access.

