Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8677DBF65
	for <lists+samba-technical@lfdr.de>; Mon, 30 Oct 2023 18:53:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=0JHEN7F+HubJPRqWmxF0rT+Ig/53aHfoWhUcJH3S0ec=; b=kF0dOGlHijPUprk4NNZr2RbI11
	DyXoiQ6VTFKhqbYkJ5j2QIYpPyEb5knOoWIkrlrSnABEoku2/MBhU6O13qS6Qc6hVhqkNWI6IDYN7
	6Qq9ym8r/Pl9DxxeB3TrC0yAaBdBCi+DvOGBu38CW/QM8zwE/5YBzHYN+EM6KFi2JjBbMIRRjhXNA
	wnA8t5mawWuzj5hwwBJtAKKbcJrf6NyZMnvRxP643qQyMKhsgVddKrZjIh7hJxr2zhMnVMKmfgYfM
	7N8f4pT8vKx9Wp1ODwtn6SXSZgGymdRLQ/eg174ab0AsCPF8t21E68KqpY96SAi/Z3jfEqo+dt+e3
	BKrinBPA==;
Received: from ip6-localhost ([::1]:34684 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qxWRS-003aqV-Kz; Mon, 30 Oct 2023 17:52:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64822) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qxWRN-003aqM-A0
 for samba-technical@lists.samba.org; Mon, 30 Oct 2023 17:52:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=0JHEN7F+HubJPRqWmxF0rT+Ig/53aHfoWhUcJH3S0ec=; b=zADziAq4SeVuKBUtQCUDk8Y94D
 Pl1D+i+50w9Va6MdAJx/L2RXe4udYH3p2XUIz7UdozyVwZViANA/mxkObtT531AALEJbae1/B6hOX
 gHYXKFaX1rxKsfb0fRyobLLw5RMc7rcQgqQSRSrCmJRD4UN4toh+wQoD0yEtx8FgtHRsekTuXE+uQ
 Hj3XUxYhl7KiK/DmF/EXDqKrt2yKE7Ln5u90xHYTw+OGsTNEdGaZnY8yY3WsSZ3XxPlXF7M/b7hrA
 NKKBRvAHfwnHzCWa4M//AzGjP0oTaPz7CdHp+Nhik3//Iu1zWHETEIlrjp49pJzrmZM4qp1uqBm9o
 tqZxTTpsfYjvoQtwFP4nblNqtpBeimvsmd8lweJwSO6+vrteBhjvXrxMt+phYC+8XWo6thk9oJ+B+
 fjgc9ReV1+vMGeFW2jUwSWuC6WH5Wcr+Y4qciZouDkOZIgF5TopUrOIhtCaTQdq1wSgtVBspse7xg
 ABJCdDBcojF5LIOpADqXX4dd;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qxWRL-003Mau-0J; Mon, 30 Oct 2023 17:52:39 +0000
Date: Mon, 30 Oct 2023 10:52:35 -0700
To: Ralph Boehme <slow@samba.org>
Subject: Re: [SMB3 POSIX] POSIX client creates a file, set the ARCHIVE bit or
 not
Message-ID: <ZT/tY0fVsAaaqpZE@jeremy-HP-Z840-Workstation>
References: <3b2fa1bd-2eae-482a-a9d9-543ebb921046@samba.org>
 <ZT/ZoUmdarteCey4@jeremy-HP-Z840-Workstation>
 <18abc825-a35d-441b-9476-32c6c368275f@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <18abc825-a35d-441b-9476-32c6c368275f@samba.org>
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
Cc: Volker Lendecke <vl@samba.org>, Stefan Metzmacher <metze@samba.org>,
 Tom Talpey <tom@talpey.com>, Steven French <Steven.French@microsoft.com>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Oct 30, 2023 at 06:26:16PM +0100, Ralph Boehme wrote:
>On 10/30/23 17:28, Jeremy Allison wrote:
>>I *think* it was back from when most servers were running
>>without EA's, so archive was mapped to a POSIX perms bit.
>
>ah, that makes sense. Thanks!
>
>So building on that, maybe a tweak like
>
>if (new_dos_attributes & FILE_FLAG_POSIX_SEMANTICS)
>    if (lp_store_dos_attributes(SNUM(conn))) {
>         new_dos_attributes |= FILE_ATTRIBUTE_ARCHIVE;
>    } else {
>         new_dos_attributes = 0;
>    }
>} else {
>    ...
>}
>
>or similar logic is due?

Yep, sounds good to me !

