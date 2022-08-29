Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB0B5A4AE2
	for <lists+samba-technical@lfdr.de>; Mon, 29 Aug 2022 14:02:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=bHe4L5PfQ6RCkA6nahrEOADDcfuRIHmq4nJSvWIhhq4=; b=CnqN+mTZFKwDrRYhob1JG2gyUx
	o9q2vaalXDsBtgyvkObA4Gqxj1+JgptLF4k01ZfRioqi8ukzwBsZKLQ/6kZ5HI87MWT47zN5MGeA7
	4BnWYJV3rwKQkF4fsOnvFkS3MJisA39erLmmrm1JX3nc1uEM7MyQVNsp3h4UDx648UohwqxDL+C45
	MOCY5vBpj0VF67Ya6qznlnOGQVNrK8gvDAZ8GtZScVvmLlw611PBBb8NjlmEVnAk69KVTqJ48+WbI
	lH3y4X0YQK90jF6BtEp9rY056l9wxDVBvcvxumnmou2JbDUw4gieUElQSUXPlvaZmeoZEtS+plzTz
	bAf9oLhQ==;
Received: from ip6-localhost ([::1]:31550 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oSdT2-002rwx-Ak; Mon, 29 Aug 2022 12:02:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35814) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oSdSy-002rwE-5D
 for samba-technical@lists.samba.org; Mon, 29 Aug 2022 12:02:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=bHe4L5PfQ6RCkA6nahrEOADDcfuRIHmq4nJSvWIhhq4=; b=Rw+ZGBvS2jWjpxNGzDZmHLV1aa
 zPO7jYyLDAVjovw6jUX+b6h/472SaCb1tHSQCPVTw5ihBpBdG4AIu7ab56ZfpvuHTPsNAbKAA79FO
 xA8G0LHDldLozsupeeGkSzeXlGffXbb+Pdq7nALN/W/ZleqPSKJsYkEXNb0aCC9mXxgbBzovhXLOx
 Tms2Ubp9QEqBCycLDHqpPyxvWZJCYtqI6W5W/HcwHvioeUtaWCoUB7dzqjUBDuYfNbkdWLHdul47e
 fiGhsfFa27vPl3E8Vel0QSHhe2NKarRDHbInj66PnaLIpkAt2ZEYGjcLj+cD0eD0/aDJ3k0GB0fLt
 zEEsVesFN0U0qM6+mtTrsgGZRzsCa5BvwJ6y70+g9+mzdswnGfQ3LBNM9DkKQX0x6y1GFraPWJnh3
 pg5jFaklb4ttl19yiu7d4q1MGRp3ez6QI2ZexqqF2XWnELBEO9OhGMyDvNTVig1ODzW71IkWmU2Ze
 toqAYl/iBd7/9bqT/qokhxHK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oSdSw-002DHN-SE; Mon, 29 Aug 2022 12:02:06 +0000
Message-ID: <4783cd29bf7b56727e5a1a79a50e6a5d8294b5da.camel@samba.org>
Subject: Re: Samba and ShellCheck
To: Martin Schwenke <martin@meltin.net>, Andreas Schneider <asn@samba.org>
Date: Mon, 29 Aug 2022 13:02:05 +0100
In-Reply-To: <20220829214711.03b3fe89@martins.ozlabs.org>
References: <4766256.31r3eYUQgx@magrathea>
 <20220823180243.565f35e2@martins.ozlabs.org> <5601373.DvuYhMxLoT@magrathea>
 <20220829214711.03b3fe89@martins.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland Penny <rpenny@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2022-08-29 at 21:47 +1000, Martin Schwenke via samba-technical
wrote:
> On Mon, 29 Aug 2022 09:01:05 +0200, Andreas Schneider <asn@samba.org>
> wrote:
> 
> > On Tuesday, 23 August 2022 10:02:43 CEST Martin Schwenke via samba-
> > technical 
> > wrote:
> > > I use an "excellent" convention for local variables in /bin/sh
> > > scripts,
> > > specially designed to reduce readability.  ;-)  I prefix any
> > > local
> > > variable with '_'.  However, it makes no semantic difference, it
> > > just
> > > acts as a hint.  
> > 
> > Either we convert everything to this convention or we disable the
> > shellcheck 
> > warning in those scripts. What do you prefer?
> 
> I wouldn't want to force that convention on anyone.  Out of those 2
> choices, I would say disable the warning.
> 
> > ./script/check-shell-scripts.sh $(pwd) warning >shell.log 2>&1
> > 
> > 
> > Example to disable the warning:
> > 
> > 
> >  ctdb/tests/run_tests.sh | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/ctdb/tests/run_tests.sh b/ctdb/tests/run_tests.sh
> > index ff431f8831f..12e495e3dc0 100755
> > --- a/ctdb/tests/run_tests.sh
> > +++ b/ctdb/tests/run_tests.sh
> > @@ -1,4 +1,5 @@
> >  #!/usr/bin/env bash
> > +# shellcheck disable=SC3043
> >  
> >  usage() {
> >      cat <<EOF
> 
> It looks like check-shell-scripts.sh is wrong.  It should not force
> POSIX shell via --shell=sh. 


+1 from me about that, from the shellcheck manpage:

 -s shell, –shell=shell
              Specify Bourne shell dialect.  Valid values are sh, bash,
dash and ksh.  The default is to use the file's shebang, or bash if the
target shell can't be determined.

I think you are forcing 'sh' to be used, even when it is a 'bash'
script.

Rowland

>  shellcheck passes on
> ctdb/tests/run_tests.sh with no options.  It is a bash script and
> shellcheck can figure that out.  There are other shell scripts in
> ctdb/
> historically named with a .sh suffix but which shellcheck can't
> figure
> out the type of, and they would be a problem.
> 
> Note that in ctdb/ we already have ctdb/tests/UNIT/shellcheck/, which
> contains tests to run shellcheck (with some exclusions) on all
> scripts
> that are known to pass.  Try:
> 
>   ./ctdb/tests/run_tests.sh ./ctdb/tests/UNIT/shellcheck
> 
> I have WIP patches that add coverage for more scripts.
> 
> I think ctdb/ is relatively under control.  We have been improving
> shellcheck compliance for quite a few years (since 2016, apparently).
> :-)
> 
> peace & happiness,
> martin
> 


