Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C59D2899B5A
	for <lists+samba-technical@lfdr.de>; Fri,  5 Apr 2024 12:55:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=5k2BN16xaVzKfnDNlM2l7Fy2X+jfElKEfTSio5MLzyI=; b=syl6AoLJQOyoIBHBPRc4oB4pzo
	d8+DN2oSvPl8YnvHZExdCSwDynI2hx37O2BCKgfccUOz/+9vJh++KVq9BMechsFqAwKB4taxEMjjF
	he7AL7LKTbl6A8xWSmHkyN+zaaQoYoGKhvhh3LE5PpkgL0m0VjIrmcyFngECUJUCSE/dnK+o5YIAH
	XJbRptl3cc7yXHxpwddt38iRF82ZI1WF0FMPxmtcK1eQNKfLH36MZkN6Nh/YRZcKRDsIf+2mwClBW
	y5xo2R2GJUiN2f1fGZA2pphp56EvO2ICpzLYDB+9+thvbZ3BdVXNpolCEWe9my9/yJ5lQDbjKG6CS
	/rD48tiQ==;
Received: from ip6-localhost ([::1]:26580 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rshDu-003yeY-Eq; Fri, 05 Apr 2024 10:55:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19540) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rshDq-003yeO-73
 for samba-technical@lists.samba.org; Fri, 05 Apr 2024 10:55:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=5k2BN16xaVzKfnDNlM2l7Fy2X+jfElKEfTSio5MLzyI=; b=GPRzy+sSu10G35xo1178bIXQzh
 OB9KUnVOM123ADQkyvvS2yOcJTxJb3DBMNw2SN3E120W8vgUu6yBSr6DMuBh1wIYQb43T0vxiKuYN
 tgecXvgUSxt9myxXmSPK856uA+J31AMTg0uUk0X/m6xgpBiRJxWrctoopr5YS2ULQwS6VUiJ0u0dX
 ZaSDA7nPdswE7Lyz+KhpYKgaX/2gL7hCVBDFkd/MgkrrCiNaFG4wNMI6HF7lj+O/QVuebddqVu0Ry
 MuyxfFsILRpn4BIOlefOgGNsXJoOjIKOGWw2Q2OBVnVeVweV0lYgDjhXx0lujycuZIfrMyQnGRSiB
 wqaeur51hv1pGS+PvTsTVaokp8AyGoHvXsZRfDhbKstHH0OWmCFfeyad0fpG3/gUlFbqqeqPwiKbS
 JmLKqWwzEF+MbnMv0RmwwTqqu3ipeqnm8hDvoW/cDYfcETlhjtSlKySt8mM6IPknI07R0xlFeGJM1
 du16Wld1dg20fIP6KQh4LShh;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rshDo-004tIx-2m; Fri, 05 Apr 2024 10:55:01 +0000
Date: Fri, 5 Apr 2024 21:54:55 +1100
To: Ralph Boehme <slow@samba.org>
Subject: Re: Simplify copy-reflink code
Message-ID: <20240405215455.1099794a@echidna>
In-Reply-To: <b0967fbb-0805-4021-96cf-0735c3c1b5c1@samba.org>
References: <2c5e4e5d-4115-49b5-9af5-a488cfc601a8@samba.org>
 <20240402202621.2c234f13@echidna>
 <e5c49135-4fa4-40ec-bdbd-6446e1d156cb@samba.org>
 <20240404125840.230c5d67@echidna>
 <b5f914db-41b9-4e76-89a8-fb5dc45e28f8@samba.org>
 <20240405162145.40ac3bc4@echidna>
 <b0967fbb-0805-4021-96cf-0735c3c1b5c1@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 5 Apr 2024 07:57:28 +0200, Ralph Boehme wrote:
...
> On 4/5/24 07:21, David Disseldorp wrote:
> > I don't think dup-extents should fallback to copy; with the initial
> > implementation we had VFS_COPY_CHUNK_FL_MUST_CLONE to make this
> > explicit. However, the MS-FSCC spec doesn't appear to state that cloning
> > is a hard requirement, only that it should be supported alongside
> > FILE_SUPPORTS_BLOCK_REFCOUNTING and that offsets+lengths need to be
> > "logical cluster boundary" aligned.  
> 
> MS-FSA 2.1.5.9.4 FSCTL_DUPLICATE_EXTENTS_TO_FILE makes it pretty clear 
> what should be done and that a fallback to data copy is not in scope.

Ah great, I was wondering why I couldn't find anything clear in MS-SMB2
or MS-FSCC...

> > We probably need to do some testing against modern ReFS to check some of
> > these questions.  
> 
> 
> I'm working with a customer who is testing with a Windows server with 
> ReFS where he uses a testing program [1] running on the client that 
> allows manual control over the operation and results confirm the spec: 
> no fallback, failure on non aligned IO request.
> 
> [1] https://github.com/tdewin/refs-fclone

Interesting, thanks! What about unaligned lengths when it covers the end
of a file? Btrfs has similar (FS block size) alignment restrictions for
clone, but will permit unaligned clone lengths when it corresponds to
the final extent. IIUC the existing MS-FSA pseudocode does't accept
any misalignment.

Cheers, David

