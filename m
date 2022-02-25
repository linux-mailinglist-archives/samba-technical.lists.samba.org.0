Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 876484C41F4
	for <lists+samba-technical@lfdr.de>; Fri, 25 Feb 2022 11:08:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=omHy4sPeelURTJ8yU7NZ6RLLvBxmlPiLdNTa4wAOV/Q=; b=Wazc1rV1p7wbyh6ahLyIvc5GHd
	n5A+mgzUzvy7O3CyodA9dlHAUWy5BnDAQc/SCrgEuS3erlngoxf4g6q9mT1jgJJtDmNjX6rASuMpl
	EcMd/eA8QVgMReJ3uwYO7l1iWgez9KEiAhFbJRQLYaKRlL/4+EznT8WNkqC/b7kN2RXAYvzpTGEgP
	yqng8BFLMP/luOOTz7q2RIJGHHOaP28/QpCG83F9zJN1eFUtabgUZeIfPqKMervSjE1kK+uTh8nJc
	UP+EedKqT5CEgsFhJoCendTJN5zsff/A2BJ5BzzubHVpyRuSGVl9Egj1JiOuwD8izLZtRnj53o5i6
	0FLboz+w==;
Received: from ip6-localhost ([::1]:48528 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nNXW7-00BdSE-Kd; Fri, 25 Feb 2022 10:08:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49208) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nNXW2-00BdS5-6c
 for samba-technical@lists.samba.org; Fri, 25 Feb 2022 10:08:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=omHy4sPeelURTJ8yU7NZ6RLLvBxmlPiLdNTa4wAOV/Q=; b=M3iOYj5zdiLDJN2TbzqRgY8k9i
 QHNy7EjflGwYzlv/S0c/jhEFMx3eKDMJbKzD47KVLAU8lDgfuRYCGe13eMvO74N2AdR+Rq2ITOrjX
 z7OEEqa6rS4di4VaXZZk9pNWha2SZTPgKTCJ1b3K/2qpxlVlp8q0uIhbGuDaQfz+hx2NqfrQfQYUj
 F4t6RfAPFdJk/91IAsM6FSFxkqYetmqj9oq2X1UeZb4j0Ftd56vBISYMca3fX/1Il3LNwvI+pIMeV
 u9XJV5GiBMOJb7o++eKsN7nXYTCxFLSHiYZPQAGenESai89+utwoZ2QN0JWAFgg9Ma2WPkN8B5DnL
 vwjlirj7SQTUq4+qURC+cBbCqHrcST2ItYvYqZ+QRpe0Caj6OWardC+xNdTqNnJTUeAF/5v2/QpTG
 dSgB6rlNXSo5XSDRFM5YGHSvkxvrZRHwmJuh4fjh4xPkDX2vKp3FLKKTHANYADc50SJpL0Yj2OPTV
 jAjL/RQ8FUpUliZ8CVmJVU/R;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nNXW0-005RTy-A2; Fri, 25 Feb 2022 10:07:57 +0000
Message-ID: <d61e615650ba4f3d531d3ba0e2b73b27293ec59b.camel@samba.org>
Subject: MIT Kerberos version support for the AD DC in master (eg 1.20 and
 1.19)
To: Andreas Schneider <asn@samba.org>, Upstream Samba Technical Mailing list
 <samba-technical@lists.samba.org>
Date: Fri, 25 Feb 2022 23:07:51 +1300
In-Reply-To: <2427635.MdZvMZBkg4@magrathea>
References: <reply-4ecf65ee6e5c0adbf25c57ec268d6f8e@gitlab.com>
 <note_855084458@gitlab.com>
 <23462492d1a7b61ee1c40313445f737296421f2a.camel@samba.org>
 <2427635.MdZvMZBkg4@magrathea>
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

On Fri, 2022-02-25 at 10:41 +0100, Andreas Schneider via samba-
technical wrote:
> On Friday, February 25, 2022 9:48:52 AM CET Andrew Bartlett via
> samba-
> technical wrote:
> > I think this is a discussion worth having somewhere a little less
> > hidden than a MR.  So sent to Samba-technical, but BCC to the
> > MR.  Lets
> > see if that works...
> > 
> > On 
> > https://gitlab.com/samba-team/samba/-/merge_requests/2330#note_855084458
> > Andreas, Alexander and I are caught on the philosophical point of
> > what
> > MIT krb5 versions we should be including runtime support for in
> > master.
> > 
> > My point is that we test MIT 1.20 on Fedora.  The non-Fedora builds
> > all
> > build Heimdal.  That is, with these changes the MIT 1.19 support is
> > untested in our CI, so we shouldn't put untested code in such
> > important
> > codepaths.
> 
> This is not true!
> 
> Take a look at the pipeline:
> 
> https://gitlab.com/samba-team/devel/samba/-/pipelines/478777772
> 
> samba-addc-mit120 - This runner tests MIT Kerberos 1.20 (pre-
> release). It
>                     tests the most important bits which have
> significantly
>                     changed. Like the KDB interface, S4U and RBCD.
>                     If you look at the log you can see:
>     $ if [ -x "$(command -v krb5-config)" ]; then krb5-config --
> version; fi
>     Kerberos 5 release 1.20-prerelease

Thanks for that.  I missed that detail when I looked over the patches,
I didn't consider that the patch was further extending the number of
jobs (this is a different also difficult issue). 

> 
> samba-addc-mit-1 - This runner tests MIT Kerberos 1.19
>     From the log:
>     $ if [ -x "$(command -v krb5-config)" ]; then krb5-config --
> version; fi
>     Kerberos 5 release 1.19.2
> 
> samba-addc-mit-4a - This runner tests MIT Kerberos 1.19
> samba-addc-mit-4b - This runner tests MIT Kerberos 1.19
> samba-admem-mit - This runner tests MIT Kerberos 1.19
> samba-mitkrb5 - This runner tests MIT Kerberos 1.19
> 
> > I'm honestly not making this argument to destroy the MIT KDC
> > effort, on
> > the contrary I want it to succeed!
> > 
> > But for it to be a long-term success we must also be able to learn
> > from
> > the past 6 months in particular to ensure we have a viable,
> > practised
> > process for changes need to be made in both codebases.
> > 
> > In particular, I'm concerned that the AD DC 'will build and
> > securely
> > operate against the MIT version found on enterprise distributions'
> > is
> > just not a promise we can keep, so setting that up as the baseline
> > expectation sets us up to fail.
> 
> What sense does it make to drop support for the latest MIT Kerberos
> release 
> (version 1.19) and require our users to build MIT Kerberos from git
> master 
> with the next Samba release?

Fair enough.  This makes a lot of sense.  It also answers a bit of my
question (that I've been trying to figure out how to artfully put) of
how to make incremental development of features that cross the
Samba/KDC boundary practical and viable.

More importantly this looks like a pattern we can follow - security
releases will be harder, but even that could be handled similarly (with
an in-script private build of MIT rather than a COPR repo).

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


