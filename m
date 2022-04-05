Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A452A4F3D5F
	for <lists+samba-technical@lfdr.de>; Tue,  5 Apr 2022 21:42:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=vHeFE1VumfXLOPEEnQe0zZwmYrVZ9dwj7Hsl8n2yTTI=; b=KM2ccR9ax2FJnhkXMHwQ9uy6QS
	/SfHi2W+aHU5zUh4TRpiW8Ma/25raAh/oGIusuCJrtIFzYmMnKLHXWtyEVQXJibjE55XklsJKoTHP
	PEs+3EEIc9bsoIC55OphrG90RPJjP9EcokIqg/e/lRh2zQT4KdmaAqbUkJrvuWp4o0ecd0Ofctm8z
	YlqnLS4Bv9fyu6otN7G5yf/5WgTR9Q3qX7DWIHksgK08Tt+EVKAy7Vk4YvgVEzgxRrCzjyK1SW/61
	TI2SEewOlkYMrUqXWH5+hapvd36kR9BgJ5iMb6YMny8yE0YlxLzc6LmZ9zp7JDIGcexvdYwd3kPxT
	lYt9KLdw==;
Received: from ip6-localhost ([::1]:43840 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nbp4V-00AF9o-HS; Tue, 05 Apr 2022 19:42:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38174) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nbp4Q-00AF9f-NZ
 for samba-technical@lists.samba.org; Tue, 05 Apr 2022 19:42:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=vHeFE1VumfXLOPEEnQe0zZwmYrVZ9dwj7Hsl8n2yTTI=; b=vhFsO1GGuQP1Is3Jc0SvcVJtMB
 MeG1NGROuRM+8kgciLsTAQhAFuAqsUQCF88mN2LDsjuNI0aPrGIZVmMwL2oJ0PO2+lmgtSP1Q7o0Q
 rVuO61iBzwLUR53POZCHwyIKx87vRWCodnDMHPojcAbyqVsL/2YccRdCqAF00n4LqefIScqgQ/GFC
 92oV8cAjPTzw6bWk64yU6wC86KY4BFt6TNMpXFHKJ5AAD7P1CT+4jq7k2w9EU08nYe3LTnAe+yCBw
 B9/dTsMmxQh5UI/dizZjnddVZ2Z46i/E4qg6Oofcmc88HwBT761h9B3+tfbFs9ZMAVTDhTIK3ugpc
 iFdeqfcbZgc/OvYpq0k6oOPjiBfV047QGB7blqK2DqT+oo7/qC+utdPyxn5FHOasLUmUFAHojouE3
 u6d26EtivqWps/IWi0/AWkQZOVGlXN7vv/8pzpsVAcmjzCeqiEPY1uGHPY2DRda9CUwVU9+kPM1Ed
 ed+ynt3W7X0dcrEA2sKR0134;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nbp4P-005Tfw-Bk
 for samba-technical@lists.samba.org; Tue, 05 Apr 2022 19:42:29 +0000
Message-ID: <0a7f7fb7724efaa78937a1020ffb110eb5e6b75f.camel@samba.org>
Subject: Re: doing a test build of samba
To: samba-technical@lists.samba.org
Date: Tue, 05 Apr 2022 20:42:28 +0100
In-Reply-To: <794ca2a4-6d67-ae04-2dec-ca291d633cc8@msgid.tls.msk.ru>
References: <245e18ba-a620-6a19-33d5-8794f010a617@msgid.tls.msk.ru>
 <5f048c2b3b9a93b653f19e2573b2f60ad4688af3.camel@samba.org>
 <30f1d626-f8c4-ca8a-38d0-a2c7eb2ed03a@msgid.tls.msk.ru>
 <9327243.eNJFYEL58v@krikkit>
 <794ca2a4-6d67-ae04-2dec-ca291d633cc8@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2022-04-05 at 22:14 +0300, Michael Tokarev via samba-technical
wrote:
> 05.04.2022 22:01, Andreas Schneider wrote:
> > On Tuesday, 5 April 2022 00:52:14 CEST Michael Tokarev via samba-
> > technical
> > wrote:
> > > So it looks like the answer is "no" :)
> > > 
> > > I just dislike the hacking around renames or duplicating the
> > > source tree for different builds.. :)
> > 
> > `git worktree` is your friend ;-)
> 
> Yeah, Andreas, thank you for the tip!  I use it here quite a lot.
> 
> Unfortunately I was asking about something different. Think automated
> build of an src.rpm on different architectures with running the
> testsuite
> in the process. Unlike of rpm, who has whole build directory
> available
> and extracts source in a subdir, in debian it is done differently:
> the build system has to work from within the already extracted source
> dir. And everything's done inside. So the sequence, most likely, will
> be like this:
> 
>   configure, build normally
>   run tests:
>     mv bin bin.prod
>     configure --enable-selftests; build; run tests
>     rm -rf bin
>     mv bin.prod bin
>   install:
>     install from bin/

> 
> This is because the build script is called to build things
> first, to test them if build was okay, and to install things
> if tested good.

I am definitely no expert here, but why are you running the tests ?
The idea (as far as I am aware) for the tests is when the code is
changed, the change can be tested. When the code is released e.g.
4.16.0 , it doesn't require testing.

Rowland
 
> 
> If there was a way to specify --out=./bintest things
> would be much cleaner.
> 
> Unfortunately, as it turns out, there are quite some things
> in there which makes this to fail, eg:
> 
> buildtools/wafsamba/samba3.py:                            '../bin/def
> ault/third_party/heimdal/lib/asn1' ]
> buildtools/wafsamba/samba_headers.py:        if
> hpath.startswith("bin/default/"):
> buildtools/wafsamba/samba_wildcard.py:    if cmd[0:12] ==
> "bin/default/":
> docs-xml/manpages/smb.conf.5.xml:               <!-- WAF build places
> it in bin/default/docs-xml/smbdotconf/parameters.all.xml //-->
> selftest/wscript:    os.environ['CONFIG_H'] =
> 'bin/default/include/config.h'
> 
> /mjt
> 


