Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 724CE84224A
	for <lists+samba-technical@lfdr.de>; Tue, 30 Jan 2024 12:10:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=V2u/6ek3ZxKaEUYjSeoMNVMpJ95CTRCNIO14KwSDJpE=; b=dafqEpS2q3gpfItpDqnS26GYXi
	kxB2KCn+zzy5uVXmU2/0H/QVMPlWXK865YqDm2CZCMte5ViFcrZyfWnuITcAqerVktloRkmPYNYmh
	00q9wPMvUoKkVAVtEKtAaabKktCldUoaOimkb9gn+i2MxmCirTdgJ9ttjncnt7YWvn9isPlA/TXqi
	KVMjo3ReWQ7SuSqQ2k42Kwxuz3CcGydsFXZW3ECv2VYIrJfCts+5imgrAlYwTC0itdAJQ07TVy7rQ
	glYl/hO4DOaO9toCYqwV5GHBKvWoqyKlf5LxUOO3sb+UF8iMKQOSsQMvva5ppa0arI8xFILEw5Xrt
	VJVDsAuQ==;
Received: from ip6-localhost ([::1]:63454 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rUlzr-005418-Ur; Tue, 30 Jan 2024 11:09:44 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:43863) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rUlzn-005411-2f
 for samba-technical@lists.samba.org; Tue, 30 Jan 2024 11:09:41 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id AA74448B93;
 Tue, 30 Jan 2024 14:10:30 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id F1A7F6ED7A;
 Tue, 30 Jan 2024 14:09:35 +0300 (MSK)
Message-ID: <5c521818-f293-4549-9d3f-afce5354fbf1@tls.msk.ru>
Date: Tue, 30 Jan 2024 14:09:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: libndr 4.0 issues.
Content-Language: en-US
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <e7c468ef-5466-4ae7-97c9-39c9fe6d627e@samba.org>
 <9aa8499f-c764-4963-8112-a3f571f2a237@tls.msk.ru>
 <9dbc25ad89a932a035c943c7a4b9c1de37441996.camel@samba.org>
 <6906e5c4-edbf-4731-a254-3a08bc4b3e31@tls.msk.ru>
In-Reply-To: <6906e5c4-edbf-4731-a254-3a08bc4b3e31@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

30.01.2024 13:04, Michael Tokarev via samba-technical:
...
> Now, the "right but not exactly trivial" way would be to actually use
> the symbol versioning mechanism.  It is not a black magic, it's actually
> quite simple once you understand how it works.  So that will be the same
> set of (wrapper/compat) functions but done in a stright-forward, clean
> way, without hackish re-#defines.  You write ndr_size_string_v3(uint32)
> which just call new ndr_size_string(uint64), and mark the v3 one in the
> ld script (or right in the code) as belonging to the previous version.
> Having ABI/*.syms files makes it easy to implement proper symbol versioning,
> but this has to be done (so at least some python/waf code needs to be
> written), and done in a way to be at least somewhat compatible with
> the before-versioned symbols - that means, at least on per-library basis,
> after ABI bumping.

Samba does use some form of symbol versioning already, so there's no
conversion needed.  But it does not allow for multiple versions of the
same symbol, and the versioning itself is done a bit wrong.  Namely,
current wafsamba only looks when the given symbol appeared, not when
it changed.  For example, when a program uses one of the changed in v4
symbols, such as that same ndr_size_string(), it gets linked with
ndr_size_string@NDR_0.0.1 (it was ndr version 0.0.1 when this symbol
first appeared), instead of the correct-by-now ndr_size_string@NDR_4.0.0,
since it's version 4.0.0 when this symbol with this signature first
appeared -- ndr_size_string@NDR_0.0.1 is not compatible with current
interface.

I just committed a change to debian bumping all changed symbols
minver to current:

https://salsa.debian.org/samba-team/samba/-/commit/b48cc627abb0ea1aa924de420419dcb2c21616dc

but this should be done in wafsamba using this @VER mechanism.

(and I missed similar changes in ldb before too, don't remember
the details already).

FWIW.

Thanks,

/mjt

