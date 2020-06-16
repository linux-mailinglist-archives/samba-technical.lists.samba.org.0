Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BACC91FAD27
	for <lists+samba-technical@lfdr.de>; Tue, 16 Jun 2020 11:54:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=NGDR+J6Gm+TM8uucYAtb5/PsC3amozxydI1PdXSgS14=; b=dOZn7fJhY3YtDi62ourvT2NMcU
	9zPMwpLlNjkJkabPPbkoJ/hiq2mCUrJtdHB3mqJq8G9iLU+0nk/FLjPN1toj9TGDjlfJSIa8UVnU1
	PQYEQVApJC0JEvdXphThGXhrw2h3jUIELIhJGiZgec47peXLLu5S0Y0EDzEIsqSz/cI7xIQR8N5nL
	N2gUQ5AnTq/HYYc78JWMdofWnPJhPqPxH3pPOkTjIqdZAAKnrEy3fgGqSaXfMzrZgfAuFKezRdIIp
	+/r1Vy/gzSaGu2baqjd+LPaSl0eiCQibpu/kczgrTRufy0OQUqUyMszzrlz2+V07nW2gVBRl1Ul5v
	K4Asho6A==;
Received: from localhost ([::1]:65534 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jl8I5-000biC-36; Tue, 16 Jun 2020 09:54:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40324) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jl8Hx-000bi5-Oj
 for samba-technical@lists.samba.org; Tue, 16 Jun 2020 09:53:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=NGDR+J6Gm+TM8uucYAtb5/PsC3amozxydI1PdXSgS14=; b=CT4L2uIo4wM68y8DtPgEVxPE8R
 jBgmqsq/hTvFEhbV2rCZ/IQSlZP3FItIEPy4P6iiZ7zggd+mzLbf7r3XO5xC8SHPD2ENMZ6VUBSW4
 BQMSM+57cyyJPjqBR49MZDFjeSlvessALx/vX0YnZx3HXXHyy2cHNqamlThkRS9EMJBCvS4WYhSNq
 Naa7+l/wgTtZNFrEUrlH8TtGkmNPjurHG7aPEKgIX/6IDqXZpfFVWXzbSWRCW28AWekraBNIl2yTa
 beARWsqbDa4Dg5kXmXA0jSNz6l68xkE0U0r5LIpqPGsqK30I0UxxRKxfSD5HjGEIBEtF/t9uEnSE1
 myNl4d88MYvHMW/7Jzymbm7WfOY8CcohBFmzTbLcOZJIzuiOrnTHbh9NSDWpFYPcCVMj6F+ZyVVgB
 SnRke7oDpUQil/tNgwCd6CCTsj9tE1ZsrQg92UDglfBe4+ax+udmhzSk0EricYXZ1Iej2OTtPVDOr
 ioxP9djDbIXNn6Rk47Ic89JW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jl8Hw-0004CJ-KT; Tue, 16 Jun 2020 09:53:52 +0000
Date: Tue, 16 Jun 2020 12:53:50 +0300
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: deprecate pdb_ldap and "NT4-like" domains in Samba 4.13 to allow
 removal for Samba 4.14 in March 2021?
Message-ID: <20200616095350.GE3036357@onega.vda.li>
References: <d48e22dab11b2cc72cd1e402730814a506e7c363.camel@samba.org>
 <20200616082636.GD3036357@onega.vda.li>
 <bac9c345a806ece858c12211b176fd6bb6d49996.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bac9c345a806ece858c12211b176fd6bb6d49996.camel@samba.org>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ti, 16 kesä 2020, Andrew Bartlett wrote:
> On Tue, 2020-06-16 at 11:26 +0300, Alexander Bokovoy wrote:
> > What is required from FreeIPA side is a set of operations to provide
> > implementation of PASSDB interfaces that deal with searches:
> >  - search users
> >  - search groups
> >  - search aliases
> 
> Can you do that on the FreeIPA side?  pdb_ipa isn't in the Samba tree,
> could you handle the maintenance of the code it depends on?
> 
> Presumably you have plenty of other ldap client stuff on the FreeIPA
> side of the fence you could plug into?

So basically you are saying that you don't care how FreeIPA would handle
integration to Samba PASSDB, neither you care about PASSDB being
testable and used. Is that right?

My concern is that you are looking to deprecate interfaces without
providing sufficient functionality to handle those needs, neither
acknowledging existing proposed replacements need to be improved before
even considering them.

Outside of FreeIPA, most of home storage devices built on top of
Synology, for example, rely on pdb_ldap. There is support and
integration for Samba AD DC to be run on Synology but there is a
separate LDAP Server component and an integration with that one for
Samba requires use of pdb_ldap.

As far as I understand, same feature and support is available in QNAP
devices.

I personally don't think it makes sense to deprecate pdb_ldap now.
Instead, I hope to look into improving its test coverage now that we
have a good way to create test environments and use them in CI.

-- 
/ Alexander Bokovoy

