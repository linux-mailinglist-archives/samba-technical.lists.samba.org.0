Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D4C40CB42
	for <lists+samba-technical@lfdr.de>; Wed, 15 Sep 2021 18:52:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Iay7pGNdJ5dDLoilQ4bQO35TJDXTPZVnv57t0xxObMM=; b=egWFlwRkTuPPDUkkXtycgNhvPG
	AOeKqoGIa09v3Olr7bJbluz0IYlekZdN9vj4lWj3rSyUHC2nJTQxQqiX8uv1Tb4Wbkvn0y9PCppBN
	U1u5jiFJ4zntK6hXnf0gSBwmKAu4ZsuWYI+xGTyrnS7kpoGzugyHF2jYenz7XgvEaxpQRpOBoA0vO
	nKbjmZzMSU3wrJE5SuPFovT0G2hbQRKVB7uRXln69EFuJhtI1Rr+6eZ+MXsXXVguzEVJx10i3ikQB
	+WYayyytQ5tA84XPVeRDbLCiTXAjPtUPZYw4QLaa0PfEVLbCUErX3W3z9zDhwlngbAS6ttDF1o8XI
	caVkmYzw==;
Received: from ip6-localhost ([::1]:38586 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mQY8c-00FEtj-AK; Wed, 15 Sep 2021 16:51:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19704) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mQY8W-00FEta-Fv
 for samba-technical@lists.samba.org; Wed, 15 Sep 2021 16:51:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Iay7pGNdJ5dDLoilQ4bQO35TJDXTPZVnv57t0xxObMM=; b=tP7jXbMsuE1aoFrQNsFmvvLpVq
 zDPON3QK118JuH3GMwGaHeLKldD0+mflqEuXYZWheB+FSBD4l2bVHChALDAcSpbyoMlgs68NHwskO
 dm5KQRy11V57PMoCrjWo1jMBbI09po1qBFp8D6ReExMxTvb6uxhX3FW40sDqh7cvDFa75ScDgLL8R
 Lnrx+Y3T323G06c6PP4iMNoXHORsYx+Z7y0XeZY8n6yp2BZGpubDe0oUh8RVf8K7aMUgEk9WCsKYp
 jbfqPRdVY+F1ltg4r0JXcE/QYpwniI52pFAwdJHvP3B7quIjTtCgnYyRhoSWqeH5GBNAIqb1HDifL
 8zcZSB9YspdaW5m9HsEBFLgQ3KVxutf8JzvHZ1ublQL5lMLya6tI16ll+QwH4Lpglx6Vgfiweh0O4
 drO/H7MtIYrXXjLMr4PZlr//VBLTNszviuOp7gB7Qfz4y4thcZRcV5hiasVCgZ0EljSTF6HZxEW+N
 9s1cAMZMuNf9fcpCS42PekCw;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mQY8V-006KIN-B5; Wed, 15 Sep 2021 16:51:51 +0000
To: Ralph Boehme <slow@samba.org>, samba-technical@lists.samba.org
Subject: Re: Is Samba's compile_commands.json useful?
Date: Wed, 15 Sep 2021 18:51:50 +0200
Message-ID: <2603791.mvXUDI8C0e@krikkit>
In-Reply-To: <20210909170916.045b5e3c@martins.ozlabs.org>
References: <20210909122517.5bc193cb@martins.ozlabs.org>
 <877e249b-c99d-380d-45d1-d5950e2b50d4@samba.org>
 <20210909170916.045b5e3c@martins.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thursday, 9 September 2021 09:09:16 CEST Martin Schwenke via samba-
technical wrote:
> On Thu, 9 Sep 2021 06:49:52 +0200, Ralph Boehme <slow@samba.org> wrote:
> > Am 09.09.21 um 04:25 schrieb Martin Schwenke via samba-technical:
> > > What am I missing?
> > 
> > I also noticed this a few days ago when using lsp im emacs as well.
> > 
> > It seems it's a regression introduced by
> > 5d53b848f60efbb71e4cd2f51f33a06369ca9055. If I revert this change I get
> > a working compile database.
> > 
> > Looking...
> 
> Thanks!
> 
> That was one of the commits I took a brief look at while trying to
> understand the problem myself.  I didn't try reverting it.  I also
> didn't notice the new call to:
> 
>     Scripting.run_command('clangdb')
> 
> in buildtools/wafsamba/samba_deps.py the first time around.
> 
> Duplicating that from
> third_party/waf/waflib/extras/clang_compilation_database.py looks like
> it should do some deep magic... but it seems like it isn't quite working
> as expected.  Deep magic always deserves a comment to explain some
> subset of what, why and how... :-D

I've tried to fix with metze the issue that waf build fully regenerates the 
compile_commands.json event if nothing changed at all. The problem is that it 
fails to add the include path now.

However I'm on vacation till Sep 28th so it would be great if someone else 
could find a way to fix it or revert the commit.


	Andreas



