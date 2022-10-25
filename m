Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED2360C9B4
	for <lists+samba-technical@lfdr.de>; Tue, 25 Oct 2022 12:15:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Nl2cTKD6tk33F3i+QqxMRdQYs/pxkBXNcPCD2FAcea8=; b=r7wZkp25A8VqUCydOegcLLkFjK
	y6/Nba6sZ1w/tauHBNH5fLY/8FYoeJ8Qkv5aJSjiumt2Ff7fFao4XSXEVwU53AB5T5eearrZsQMob
	zaDH9KQAFyk1tHWxNZ0Zt3bEfC1rJeh/vwaS2lFfSp1yPIjRI9/wfUuYqicxXVW6utQtzpTaAgqh9
	zFw38K+6ufBFaNWYRFMvDlSYZe0DDBkL56nUf8RxGBPdsyT3VHSxQrgrG2o6i7eLnGfV9+RZcUdF7
	wLl3DRtNI5DeOLNXg+GynQupJEFuMD+jbMWD0fI50isxCDptrviUpjfx1NhVfRIVogGi+3njKJjyk
	jsIMKmUA==;
Received: from ip6-localhost ([::1]:61344 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1onGyG-005qqw-6f; Tue, 25 Oct 2022 10:15:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36438) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1onGyB-005qpR-I3
 for samba-technical@lists.samba.org; Tue, 25 Oct 2022 10:15:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Nl2cTKD6tk33F3i+QqxMRdQYs/pxkBXNcPCD2FAcea8=; b=qUfGLBvNaqfKEhKGSMDerLOxLh
 7StX3YoI84YW7ExDS/gaSmNnOTXx0mRfBt78T7sUJvw3DWIDlKt3sfM9MZBejJoMuQ+R3/BWZvy8J
 w/BA5ihaIsUNQUi1YdvdV2w3yO6H1XGxt9W8hUHoOyLgcod21QOBBeI9aCMZxEtC5EG8TtBno/VEX
 wsNoAsow2Ga20La+goRqICcZ2A8wkK3q/dCSONqm8F8pLxtwoO6sIIxoIwEmRP5mXnCTItcAiH5QW
 YSaa10d2PuzdgOCs20MmBRd4n1jHJXipP9SNJScWK0GE4fKK5Fao/5wNCBmZTjPTmZLwzXVVRNryn
 ftsBcK6HQjs5JX+FEidS54hHePCgv1Pcoz62Mm6prWTnlH1E5dYk+PysB75MOhIekF18fhqbk0YYH
 BL0RKwRNcuA8iJIy5s3QCOmtIO3PkMSK9WfjDbHmDIy63Y3WFOwmA6JPTnZQ8aJ6Je0gDI+jxTQ6H
 vJC1k1LqM7mOKjVRDlzElQaR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1onGy1-005hDq-Bl; Tue, 25 Oct 2022 10:15:30 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: Re: running only selected tests in samba sources
Date: Tue, 25 Oct 2022 12:15:28 +0200
Message-ID: <2656048.mvXUDI8C0e@magrathea>
In-Reply-To: <7fc71093-524a-2936-32c6-c41d83777569@msgid.tls.msk.ru>
References: <587ebe9d-3f91-7389-5ad1-c6d96e435b99@msgid.tls.msk.ru>
 <5854748.lOV4Wx5bFT@magrathea>
 <7fc71093-524a-2936-32c6-c41d83777569@msgid.tls.msk.ru>
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
Cc: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 25 October 2022 11:16:30 CEST Michael Tokarev via samba-technical 
wrote:
> [Rehashing a relatively old thread]
> 
> 19.08.2022 09:40, Andreas Schneider via samba-technical wrote:
> > On Monday, 1 August 2022 16:35:15 CEST Michael Tokarev via samba-technical
> > 
> > wrote:
> >> Hi!
> > 
> > Hi Michael,
> > 
> >> Is there a way, after successful build of samba source, to run just
> >> selected tests without running whole testsuite, *and* without
> >> (re)building
> >> everything with the --enable-selftest option?
> > 
> > you can find documentation in our wiki here:
> > 
> > https://wiki.samba.org/index.php/Writing_Torture_Tests#Running_tests
> 
> All this applies to a build with --enable-selftest. My question was how
> it is possible to run certain tests (like ldb selftests for example)
> without building whole thing with --enable-selftest.

Run 'make test' in the ldb package. See the libldb spec file.


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



