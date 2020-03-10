Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5096F17F063
	for <lists+samba-technical@lfdr.de>; Tue, 10 Mar 2020 07:15:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=oJlFokHF1XcHEVLG7Xi43KP07GCtsWKQtMjwQGZXgbQ=; b=NBiT21rFanCkm05rv1YJ3bBg4r
	z3WWHzYXcJgZbr8ZIc/VUKliVqfSTG19Z+W9YBQ6I/p/IzB70lZm/F5/Xc5OrUOUUrz4dOyiPJcjc
	9NhipazemFTZQFqjvPMg4DLEynUchxydMX+ZAsWnwmLXnMo0yRYTZv3l/CKXRn+kGt14oCXyoYhI9
	Xtm00/pUd1fRpyZgAU2YcyEbCPsiG+yfUV2gCvx8B+Us/h+2sbE/6/yeth/Ron4+2BIED8ksqqG80
	el38wq1vBosz4iGKs/SXZOPAr2PK0SXV2xXX9X0+eboz6BaxhjvCmj3gXdWb83sUN5hGAIRZOvRYd
	XTgUorzg==;
Received: from ip6-localhost ([::1]:26904 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jBYAI-00FayB-2u; Tue, 10 Mar 2020 06:14:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49276) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jBYAC-00Fay4-TN
 for samba-technical@lists.samba.org; Tue, 10 Mar 2020 06:14:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=oJlFokHF1XcHEVLG7Xi43KP07GCtsWKQtMjwQGZXgbQ=; b=wqmA3W+2j7N8GUVYXdK9ZZaBWp
 YJ8CL2x9dX9Sv5+YJUxHjshTolOyz6z8bK7B9N5Smi/ql6Kn1ygBKZaP4z8KMxO2/8luqKWHkY7a+
 Ap0KSPCQa2+P1E5XUz7YPkTiLrRJalEQmH14bh2IAKFwk/llj/lOBkI/u+D9A0gN+pKy2LvDdJksR
 y9XMDepMvxKI8OtPnPmjcpwsL7/5NELmTmEkXbc+4XhZ5ViGWgf9mJoe/hb0pthIDSRw1sm+f4SB8
 /du2OjTiv7vfiFnvhZRw9IX7arV8JiRUgsejmi+f9kzLNXL3UqC3J3PVJLvaHdBD8YPtcL50EcXew
 +CLPbRQppkWq3ihEOd0fqGL0CJSRUg2KQyD//s7H7U94JoVj+THnlncYYx95r18zoBYAlT7z2BNUT
 oD7yLcP7PejWwCMLJA2zeOVr3s95PErAT9/v5Hs7CHvSYFGLewNMZeTOD5JiL2f8yewfX63c80MkR
 ZNjujGe78iI3mlB2WxGeSA/9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jBYAB-00043x-Dh; Tue, 10 Mar 2020 06:14:48 +0000
Message-ID: <186d5e75133319a7620bedd5776729a852634657.camel@samba.org>
Subject: Re: Samba File Server and Docker
To: Dan Seguin <dan.seguin@Cord3Inc.com>, "samba-technical@lists.samba.org"
 <samba-technical@lists.samba.org>
Date: Tue, 10 Mar 2020 19:14:44 +1300
In-Reply-To: <1583819968953.36738@Cord3Inc.com>
References: <1583784238870.92348@Cord3Inc.com>
 , <5703e4c814b59b0624e2dbe99f7d89e79775115f.camel@samba.org>
 <1583819968953.36738@Cord3Inc.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2020-03-10 at 05:59 +0000, Dan Seguin via samba-technical
wrote:
> I'm writing a VFS module for a back end encryption and KMI system. I
> hope that I can provide something somewhat like the Scanner VFS does,
> i.e. an api for a plugable backend. 
> 
> I have a design in mind, not sure of the ramifications involving
> disconnected/reconnected sessions and statefulness. 
> 
> I hope there's interest out there on this, I'll outline how I'm
> approaching this.  I'll share what I have as things progress, and
> publish (if deemed solid). 

I looked into this for a client a couple of years back, and I strongly
suggested that they use the kernel VFS or block layer encrypted file
systems.

The reason I say this is that is is quite tricky to do this right in
Samba, with complexity and issues similar to the recently removed
'write cache' code.

The challenges is that Samba clients expect to be able to:
 - seek to arbitrary file positions
 - read and write less than a whole block, and not on block offsets
 - do so safely from multiple clients where a write to position A and B
are safe and independent, even if they are in the same encryption
block.

Of course, if your backend is already doing this and you just need to
interface to their userspace VFS interface, then go right ahead, just
don't blame Samba if the backend doesn't quite life up to the promises
it makes :-)

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



