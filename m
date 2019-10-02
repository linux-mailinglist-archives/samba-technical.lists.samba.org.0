Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A96C4958
	for <lists+samba-technical@lfdr.de>; Wed,  2 Oct 2019 10:20:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=/bEE1xyAAD2A7joXLyJJnH0NAE3Qsdde4+R2JnpEpaE=; b=LpK6mlMMxqahJSbqNePCC2AJ09
	5RW3i2pn1jn66+RbvCK5lAlA04zT+sS1Ku+nie8vz/dsnZd+OwFYiOH1NAN4WorEjAG9pOF1fUhLH
	42S/ryh/EmQH/Y4+OYfFGktojqTtyZV4ffiNcolF9SQSBErmQ/2ivBmD1PYl5F8swQO+s37fDV/mU
	cBt0Vdq5IHVoCbUUf0Rr7142UIgL+MvBFsYND/4LWjcC4tuVgDgGIYvjKNhfdaB15bKI0K3H45415
	JfAqugHdO3ecVXjuci7fYAwgqeOhGe4dEd/2fKBla5tsCnmjOHTOOqdFLx20BTKfBjJQ0rObXWrHo
	PeAeaZPg==;
Received: from localhost ([::1]:18102 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iFZs8-000Iti-0a; Wed, 02 Oct 2019 08:20:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21508) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iFZs3-000Itb-Sg
 for samba-technical@lists.samba.org; Wed, 02 Oct 2019 08:20:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:To:From:CC;
 bh=/bEE1xyAAD2A7joXLyJJnH0NAE3Qsdde4+R2JnpEpaE=; b=gxuVCiqwFWSbvV+yI4B0QnkEyS
 oe6vlw3hi18v5fth8a2BWJMN5yKyVmHFINZA5PLyKAeJTXJ5DwUYPRIWnn9ye6Aa3/R3jc4hjD6ui
 341AnZkRH7Ijh5l+ktloqrz7UoL6SS0QGE10q/lQmMBukfbPMylmbL+EHr4Yy726TWoo=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iFZs1-0002M0-D5; Wed, 02 Oct 2019 08:20:25 +0000
To: samba-technical@lists.samba.org, Andrew Bartlett <abartlet@samba.org>
Subject: Re: The road to removing Samba's internal copy of AES (and perhaps
 DES?)
Date: Wed, 02 Oct 2019 10:20:24 +0200
Message-ID: <3302192.AWg68A9t8x@magrathea>
In-Reply-To: <1567389837.19432.26.camel@samba.org>
References: <1567389837.19432.26.camel@samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Monday, 2 September 2019 04:03:57 CEST Andrew Bartlett via samba-technical 
wrote:
> G'Day,
> 
> I wanted to write to update the list on where we at at with removing
> cryptographic code from Samba.
> 
> We now absolutely rely on GnuTLS 3.4.7 or later, which has allowed use
> to delete a great deal of such duplicate code.
> 
> We do still have AES code, for the AES CFB8 and CMAC functions.
> 
> These could probably be open-coded against raw AES routines from
> GnuTLS, but for now I would rather not go down that route.
> 
> The operating systems that do not supply that[1], in our CI system are:
>  - CentOS7
>  - Ubuntu 16.04
>  - Ubuntu 18.04
>  - Debian 9
> 
> By April 2020 we should have a new Ubuntu LTS, Debian 10 is already out
> and CentOS8 will be available.  (And we already backport GnuTLS for
> CentOS7 regardless).
> 
> So I would propose we remove the fallback internal code after Ubuntu
> 20.04 is released, or discuss it earlier if we can get a newer backport
> package for the above.
> 
> On a related note, I plan to experiment with implementing our DES code
> via GnuTLS using the CBC-DES cipher and an all-zero IV.  That may let
> us remove that code as well, becoming essentially crypto-free and
> therefore honouring FIPS mode correctly in all cases.  Do let me know
> if you happen to experiment in this area so I don't double-up!

That's an interesting idea!

I'm currently working on further performance improvements for SMB3 encryption. 


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



