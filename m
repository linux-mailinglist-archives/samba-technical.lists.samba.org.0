Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDA58AB294
	for <lists+samba-technical@lfdr.de>; Fri, 19 Apr 2024 17:56:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=7qF7hVDKUt4SPeSocwhUSFA2qqcVa8SJ+ZdaNQ+3G+w=; b=FS8+USz+Yig9K2yanjYJWLh5ZP
	qh6keIH/MnUbltoLsJLiss8qLr4zBBZshRBNzqxX+RHxU3lfyTSgIx/oyW4C8uJhsNqTkisS4/qaK
	zRQWvVaJSAs6SYliMamaGxqy3ESGCyPcbJENhccaUzCL4H8xnRiNdWM7MsRYgAEUk/CceYlQJeRTF
	nzR9pNkAbM5Dcx2pI0xn/aGO3CjltmGfrm8aryn4vzxMHtRpekBMgwOWEbUBpB6Et54A27ehn3BcS
	KIM5sN8bh0Af/h3+2XWYBiqclFnWNVpbZubFK9WgRkRlhnD5tWIKuCsTDOG/k6/P7NaJQvMigiYDO
	OS7orlSw==;
Received: from ip6-localhost ([::1]:56846 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rxqb5-005Cbf-Un; Fri, 19 Apr 2024 15:56:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50916) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rxqb0-005CbT-Kj
 for samba-technical@lists.samba.org; Fri, 19 Apr 2024 15:56:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=7qF7hVDKUt4SPeSocwhUSFA2qqcVa8SJ+ZdaNQ+3G+w=; b=vEL2h1Ucu7AgnJZFCKY3wyAp9y
 /mek9r/K0qdQLjpITCloGAqTCzaaRso+ijAezWduUAqk7Hv6P/MXnUkZOkONFh3n7xqy0mdKkpa4g
 enb3INur2f4VQgQRLNze+RvM0Wv8vPkj9pJZm8TBqNJY7VUL8bmRueM6kaVQ18ACLWTtm3eUZlRlM
 LC6CwL+Kdo19EmM25lnzeH9Fuxip4ptNFm+n6RNcIGpYhDkkUgAq+cVgpYvckE8swNsABKTaZwb/c
 J2KXH7+05pYeBbCalYu1yg2cuDcPCrWB3cxzO+4IlZwxsM3uN/G9MTXlH0w4aGb/KEnojQRYnsKn2
 a49UdNTVz3/NY4I5bOFWuer3Ah9BYFKy11gn9PyWd7cI0Z9y/8bXHOZxHvFeK8gQBFvfBMDnbDQiA
 8G0Np5c44JefDc/ZroOkzgOwibhCDpzgC9H4uUyDAy0Vw+d3k58eVyTQem7UQcMKrXPhTM1dUymJi
 kpLdV/EIrZrcSeGtgYZBqdDl;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rxqay-007HNR-2M; Fri, 19 Apr 2024 15:56:13 +0000
Date: Fri, 19 Apr 2024 08:56:10 -0700
To: Xavi Hernandez <xhernandez@gmail.com>
Subject: Re: Doubts about Samba's unicode translation tables
Message-ID: <ZiKUGvWj3xp07NO8@jeremy-HP-Z840-Workstation>
References: <CAO9H7P_SpZ0fGDvTc_2XDLRiR1rSdy-2ztBv07h1ECmj_mnoHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAO9H7P_SpZ0fGDvTc_2XDLRiR1rSdy-2ztBv07h1ECmj_mnoHw@mail.gmail.com>
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
Cc: Stefan Metzmacher <metze@samba.org>, gd@samba.org,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Apr 19, 2024 at 11:04:40AM +0200, Xavi Hernandez via samba-technical wrote:
>Hi all,
>
>I'm currently trying to integrate Samba with CephFS, and one of the
>important things to improve is to access CephFS files in an insensitive way
>without needing to scan the entire directory from smbd.
>
>During this work I've found that Samba does the case insensitive comparison
>using a couple of UTF16 translation tables (one that converts to uppercase
>and another that converts to lowercase).
>
>Looking at how NTFS does the same thing I've found that it also uses a
>UTF16 table stored in the $UpCase special NTFS file located in the root of
>the volume.
>
>The first question is why Samba uses two tables while Windows only requires
>one ?
>For what purpose is the lowercase translation table in Samba used ?
>Is the Samba's case-insensitive comparison method actually equal to Windows
>?
>
>I've also extracted the $UpCase file from a Windows 11 machine and I've
>found that the Samba's uppercase table is very similar but not identical
>(there are 339 different values). Is this expected ?

Posting the differences would be very interesting. Thanks !

