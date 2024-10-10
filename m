Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB81998DB7
	for <lists+samba-technical@lfdr.de>; Thu, 10 Oct 2024 18:43:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Vj5KpDy6+wRoimMezhxY3Vwgej5JKpoav3MEFnPK//8=; b=cV173ODC2gi9/hDtCyXa0o6zeq
	5DOOoaIQtLf+Tna4map0LZCoGj/YKK/9y6WrJTyQNbEI3553VLukC0ONUHomzP9DMhguK75ODLi3p
	valFe21orq00AtPgDYyvqnSmq4vBPChaIvqp9edzvRyYLF8Jtdd44/xPaFExjVPf/af8LXhWJyNel
	QWhyajK9ZPhihx3HpNeU+HBZSC1g7LTQxmJxs/M6QniEo2iRJ/J9QRNxBT0ZrUTYdUikXRuN/Fgbm
	ZgjoSycBfIh1EEIBfd5LYleNfiQXn+L3gPm4OyjQg6++SJxq2AomNBjZq81upkBLw8cv+J33j+l0N
	LUKV1vyQ==;
Received: from ip6-localhost ([::1]:60898 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sywFi-003VKz-7I; Thu, 10 Oct 2024 16:43:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16100) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sywFe-003VKs-HP
 for samba-technical@lists.samba.org; Thu, 10 Oct 2024 16:43:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=Vj5KpDy6+wRoimMezhxY3Vwgej5JKpoav3MEFnPK//8=; b=Qjb5CzINBAm1J7Q/gyDX2suIss
 +vMZd0L7+VWECIvLYxr4z9Nq3nCa1ROVaHB2QmrOXov5g23trsPxH1AgFo8tjmQjGZOQlo4NAhD94
 BmH9L6vKqU1/HannobBWHjinRXWpVsEXBPPNlXebmvdUIOeIs8B1BP74OH/vm//uNSnY1YBiFJgUK
 EaeS1itce2JyfPiP7tCWbgxTVq4W4jWCQcQ9022t4MLFj7SksmS0h+SQaOuHCpS82UjWrHUPe+jLr
 oDjbj10mlipk6R6r6vfTHYHLu79VYlMpIzu7TFCWEb1PcKcGatoSDYkh2z1eqYuLeRZpPiDGnZr4X
 DXn04ZCf24jdx7neFsxpPdA8gceOO9/ye/HRZ/6GQwQQOFzTkG7nThu9xDSAe9Kl33PoNfvOufuTf
 H7jYB/VdSYQmEZWKfENV29QeBCcTkBWpRZjJARbE1q4kf1cHIkuHtM0C3OieYXejYgpkLKLsaC+7u
 oeEjJvHUcpzF+m8hnlCy9N4E;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sywFc-004Eae-1s; Thu, 10 Oct 2024 16:42:56 +0000
Date: Thu, 10 Oct 2024 09:42:53 -0700
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: Current Samba master incorrectly returns STATUS_INVALID_HANDLE
 on copy_chunk
Message-ID: <ZwgEDfnvQWwd1R7N@jeremy-HP-Z840-Workstation>
References: <CAH2r5muqSmNy+3SViFKNJ=5Sm61u8r9ej9Wy8JLUDeC2XHwccA@mail.gmail.com>
 <77aff6ef-291d-4840-82e2-b02646949541@samba.org>
 <d84732db-dea1-4fbd-9fc9-105c115c9ca0@samba.org>
 <990b4f16-2f5a-49ab-8a14-8b1f3cee94dc@samba.org>
 <ZwVM1-C0kBfJzNfM@jeremy-HP-Z840-Workstation>
 <569625f6-e0d2-43db-88cf-eb0fff6eb70e@samba.org>
 <ZwbczZYBsTU03Ycv@jeremy-HP-Z840-Workstation>
 <b84b2bb0-0afe-4f9e-9553-1a0201ed92d3@samba.org>
 <ZwblLYrVQM92eFl8@jeremy-HP-Z840-Workstation>
 <7980bb29-e434-487f-b70d-aa9d29156f00@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <7980bb29-e434-487f-b70d-aa9d29156f00@samba.org>
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

On Thu, Oct 10, 2024 at 11:01:48AM +0200, Stefan Metzmacher wrote:
>
>MS-FSA 2.1.5.4 Server Requests a Write has this:
>
>If ByteOffset equals -2, then set ByteOffset to Open.CurrentByteOffset.
>
>So I think if a file is opened with O_APPEND (on the client), a write() syscall without explicit
>offset (so no pwrite), could be mapped to an SMB2 write with offset -2.
>But I fear the linux vfs layer already replaces offset before cifs_file_write_iter() and friends
>are called... But I guess the per operation IOCB_APPEND flag can be used in order to decide
>if offset -2 should be used. On the server we could map that to pwritev2(RWF_APPEND).
>So O_APPEND could be a client only thing...

Hmmm. We should test against a Windows server doing an open with
FILE_APPEND_DATA|SYNCHRONIZE and an offset of other than -2, and
see if it writes at the end of file or not.

Looks like the protocol has one way of expressing APPEND, and
the internal syscall has another. We need to figure out what
is required on the wire to see what works.

