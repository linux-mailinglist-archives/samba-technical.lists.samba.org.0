Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 10423400621
	for <lists+samba-technical@lfdr.de>; Fri,  3 Sep 2021 21:50:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=h39oL7XRBi8MO5i1Oq1BNuSgPWutEhIK2il83zK+gwI=; b=lTRAFf5sxvnIm09Yyk+uBknwcM
	QfG0no3c8SA73VlI17ivz9zXr0ueAZLC6x1aDRuFtviT8CXT4drSsvTzlNZ9vQHh8adqmVG598B4R
	Q0WNG7hhYJF1oMpsdp8yYgRphg8KGiYIPWhILAQ9CuPeFpWIRUh1BlPiUNwQLPo/afHEeayPMQZDa
	TzugUx7w3tkFhvnVIlS6IrLxRx8a7b6GChCmgnAsWchmCPH9T+VIT6lvaSy5hs2SKd9yAXRCVtCz5
	yMiMDNaKvp/PgRPYaTZG6lmtMyCP/i/iQdpQoolk1MYm6yXD5svBDVo6iB1LxpbFzUz6nRBCMBwdy
	ysF1JHjw==;
Received: from ip6-localhost ([::1]:57034 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mMFCO-00DDvA-0Q; Fri, 03 Sep 2021 19:50:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24894) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mMFCI-00DDv1-Gc
 for samba-technical@lists.samba.org; Fri, 03 Sep 2021 19:50:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=h39oL7XRBi8MO5i1Oq1BNuSgPWutEhIK2il83zK+gwI=; b=Inz5tDrFstFqg2VK+HPg6qwNUM
 8VgkXhqw7Zrf71IhMyiQPU9m0ntMZ3t6vAmmo2+8Ow+Zv/QveOiOMdxAPI3SR1j8GHyW4kMPUcUoD
 dNh+GGTl8eKrQxenrNRpV+JiRhKwTsL8PmuwIFYMVnLfOaCJHnhiA36xqxD11Ur+XdjS5fyCy+jSG
 /Y448gU7N70XoNrKqRn1uU4AM/u3rElft4tWTfFREZoZZX5jxS6xqlW/DkqzNKXfsPecBywvQ3B51
 CxWVnwlM4yM3oP5K2vWJDtg6GpQTvmUwYTUb14u8kYEbSTWSa/nDgs3R9N7q/JG8gEyQp4eJdQBaL
 LJl+cLPHO1ahKFI+wfITsg0ZeA3hy2/HfJbGrEY8ilIfMdqxg2A4oTJ34nS1QyDDlZSImaou0NCDc
 TLeLa9IJZ3sIbO2FxyRZfvIdG7+1DzyZYXXvMhd6s7F+Hz5pOnLh3LU5p2gnIrdGrBQEnJfwKiAX8
 YfjB50pGA+5mph0pVPplCNqw;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mMFCG-004VjE-Qi; Fri, 03 Sep 2021 19:49:57 +0000
Message-ID: <f2b1e57143e2fdfc2865de71412399d7c156333a.camel@samba.org>
Subject: Re: OSS-fuzz needs some love
To: Uri Simchoni <uri@samba.org>, Upstream Samba Technical Mailing list
 <samba-technical@lists.samba.org>
Date: Sat, 04 Sep 2021 07:49:51 +1200
In-Reply-To: <2fc73976-5505-cbb9-7341-10c323b7a095@samba.org>
References: <599cb100381a83de23ae9db47e3fa55eb87a7f13.camel@samba.org>
 <b4086e94339753e8ee26d4443f4924b7889ee9dc.camel@samba.org>
 <2fc73976-5505-cbb9-7341-10c323b7a095@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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

On Fri, 2021-09-03 at 22:11 +0300, Uri Simchoni wrote:
> With the attached obvious patch, the oss-fuzz build succeeds on
> their 
> stock image. Haven't actually *ran* the fuzzer binaries though.

If you could run some of the check_build steps that would be awesome. 

https://google.github.io/oss-fuzz/advanced-topics/reproducing/#reproducing-build-failures

> What do you suppose I should do on the oss-fuzz side? Do I just issue
> a 
> pull request, or do I have to be listed somewhere?

A pull request is all they need, you will have to do a CLA.  Do that
once you get your change in master via the normal process.

> Regarding drop of 16.04 build, we don't seem to have one in CI, so I
> can 
> just remove the old Python exception. Do note however that oss-fuzz 
> builds with clang, so we might want to have an Ubuntu 20.04+clang CI
> job 
> to ensure that build doesn't fail when it gets to oss-fuzz.

See the samba-fuzz target in .gitlab-ci-main.yml.  That needs to match
your change in what you attached.  

In terms of the clang thing, as a second step we could change that
target to more closely match oss-fuzz now it has a modern base.

Thanks so much!

Andrew Bartlett

> I hope that helps,
> Uri.
> 
> On 9/1/21 11:10 PM, Andrew Bartlett via samba-technical wrote:
> > Looks like work needs to be done to confirm we build in oss-fuzz
> > mode
> > on 20.04, upgrade the Dockerfile on their side to say so, then on
> > our
> > side drop the 16.04 build (and the old python exception for the
> > fuzzing
> > case in buildtools/wafsamba/samba_python.py).
> > 
> > Andrew Bartlett
> > 
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


