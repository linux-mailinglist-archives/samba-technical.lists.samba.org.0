Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (unknown [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5441424814
	for <lists+samba-technical@lfdr.de>; Tue, 21 May 2019 08:30:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=QCbcOlN/tNW0pFw3rVoJmoWg/42i/NIqMG5JWgCET48=; b=fMZuY8UTa+E4OZn1SozKLCuoDa
	VaCEtCFxY6gYfyGUG7qqjU5qqHgA5saIVCu7RhHMMdQRucQB9x9r7hI7pQiGoLpeKRBis5fWs3iB2
	VzevRuceP/O7yNIBnBLire/0czHmttS9hjL+2Xm0QNaO1KqQBl13JQG44BKKV7ksSIxnBKXzQCb7G
	tQWpxdYL36FMMTR/SJCwpQlx/p6iCMlE4TDkp8lpfybSrlozIHydD0GAEeyPNOcLN/CzygQwiRoF5
	FMtvPd//gd0khOxTndIAXxv3luxeHRnkiX8plpd7+OJKcSyv1Fw7GidLqiudb8cV37Am/xmP5Q+9L
	xHS/JzZg==;
Received: from localhost ([::1]:31610 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hSyHX-000uVb-Dy; Tue, 21 May 2019 06:29:51 +0000
Received: from ozlabs.org ([2401:3900:2:1::2]:41145) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hSyHG-000uVU-Qs
 for samba-technical@lists.samba.org; Tue, 21 May 2019 06:29:38 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 457QpX6Frnz9s1c;
 Tue, 21 May 2019 16:29:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1558420164; bh=RbxxAYL+/viEvmJvnowLvc1Js1DFlh15QBd6iQuWJtk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rMgKHmcNpeWz7js4cqzGEEAozGmh8V6At/jZP/wDs5KP707xSCAHdmHEmNgfZbUDI
 eN9v9wW8Mj6LlnoXeuGDivG/a54+u7jRdyIl2p3FX4YnvysyQukNFVhtyiJhmlYQRn
 fRC2/TPoRoX6mJ1/1N/0D++TJC3kqvolXhLj+kN3AY4/5UhWjqsHbCNasjdc5Nlhr+
 Vo3XqQwuDH/G1QzXva9N3DCKTgIEDyJ2vJTbOaziUDf4v7Z0xGQSGbmQ7Vs1dA2drJ
 NLRNF98MpIKJ/SLZJUBYmyEw9svaHxNPgnx6/tZqpTgISiMGGqZvRs+23BXmzLFGmZ
 mTPNwcadFMBfw==
Date: Tue, 21 May 2019 16:29:24 +1000
To: Andreas Schneider <asn@samba.org>
Subject: Re: New csbuild run
Message-ID: <20190521162924.4444f055@martins.ozlabs.org>
In-Reply-To: <4043444.PDZQgdqHAT@magrathea.fritz.box>
References: <1902926.C4UlyRiazf@magrathea.fritz.box>
 <20190521113607.55e693da@martins.ozlabs.org>
 <4043444.PDZQgdqHAT@magrathea.fritz.box>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andreas,

On Tue, 21 May 2019 08:19:26 +0200, Andreas Schneider <asn@samba.org>
wrote:

> On Tuesday, May 21, 2019 3:36:07 AM CEST Martin Schwenke wrote:
> > How can I run this locally on my laptop?  
> 
> you need to install csbuild which is normally available on Fedora. You should 
> use Fedora 29 or newer.
> 
> You can run it like this:
> 
> https://gitlab.com/samba-team/devel/samba/commit/
> 5e996a902488ecb3f6e6afcd528cfdd135038c50#587d266bb27a4dc3022bbed44dfa19849df3044c_228_289
> 
> Line 289-296
> 
> for 'make -j$(nproc)' you use e.g. 'make -j8'
> 
> You don't have to specify a commit range if you just want to get all errors. 
> But normally it compare a range. It will create a diff what is new, fixed or 
> currently not working.
> 
> for '--git-commit-range $CI_COMMIT_RANGE' you use for example:
> 
>     --git-commit-range master-mybranch~20..master-mybranch
> 
> which will compare the last 20 commits. It is interesting once you fix 
> something.
> 
> As csbuild also finds quite some false positives, the above command is 
> interesting, because of the diff it just doesn't report them as 'new' if it is 
> in both commits. So normally you only get newly introduced issues.
> 
> Does that answer your question?

Almost.  :-)

I run Debian, so is csbuild available from some other place than as a
package in Fedora?  I know that I could find a Fedora RPM
and unpack it, but I figure there must be a web site somewhere that I
can download it from.   Unfortunately, searching the internet for
"csbuild" finds too many other things.  :-(

Thanks...

peace & happiness,
martin

