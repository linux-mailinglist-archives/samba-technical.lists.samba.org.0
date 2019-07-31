Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C937C77D
	for <lists+samba-technical@lfdr.de>; Wed, 31 Jul 2019 17:50:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Y5MSDVkmYqU3DQBJZs0zH0GoVwya7poSDlu9Gd1YVJc=; b=ODhTW4w0dB3CDNRW72pPsJSVHG
	bJGdbdyMpo3HjSp2Uo3eQWrhaaEyfKWGQFJ3KBLf6dXYK7ak+Y6UJm4jlVddNJ92fMiZv4XodPs+G
	yFu+tqF6LSMSFgU2ohfusz//afPFL5vbBk2cUFc3KsmRO79zVWwowl6KPGEwDOaD9ZVG7pGnMmMlD
	ybtv7WPOs1qn/P5K9Zm1bBPBRtaNvaqkN/RM3IV60OfE7wvLSOwScvRfwsTt+V00z9wa6tL+PgidZ
	ftvQxXe5NocRyQoHp+D81c/R74vB5LMIiNfFPxCgTA8ncbpaCkUB7CD2JS+kUniSvReer3CNdXU3T
	Br1FTjbQ==;
Received: from localhost ([::1]:43440 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hsqs1-001VhT-HZ; Wed, 31 Jul 2019 15:50:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21434) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hsqrw-001VhM-9s
 for samba-technical@lists.samba.org; Wed, 31 Jul 2019 15:50:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=Y5MSDVkmYqU3DQBJZs0zH0GoVwya7poSDlu9Gd1YVJc=; b=mG5nN6jO/OeAcOTw3wizUa45X1
 1oWvTepoIskBCyxP7E+yyMqoPcdQoPk1TE8ZpMXSQcKHB1iy4Jw6LegBGut90IJLlcMedeyIdl2/T
 urmWTp/bKbb9o6nosv/hVfKHREtccpejUuyPJKDB6uZQbkl5ti1Yg5rN/HhQwA0GBZFI=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hsqru-0001Xr-W9; Wed, 31 Jul 2019 15:50:23 +0000
Date: Wed, 31 Jul 2019 08:50:20 -0700
To: Noel Power <NoPower@suse.com>
Subject: Re: RFC --picky-developer (for developer builds)
Message-ID: <20190731155020.GA234347@jra4>
References: <82e23c37-0bdc-e35a-373c-71b0591becd9@suse.com>
 <ab16fa62-dbef-9281-da4d-6ae2e6c9d1db@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab16fa62-dbef-9281-da4d-6ae2e6c9d1db@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jul 31, 2019 at 08:35:14AM +0000, Noel Power via samba-technical wrote:
> 
> On 29/07/2019 10:48, Noel Power via samba-technical wrote:
> > Hi All,
> >
> > I had a merge request https://gitlab.com/samba-team/samba/merge_requests/591 (now closed) to enable --picky-developer for developer builds, this was a pretty low impact change to make developer builds build with '---picky-developer' by default.
> >
> > note: it modified the configure.developer wrapper script rather than the --developer option itself
> >
> > Metze however pointed out that he had an old branch hanging around trying to achieve the same result (but I think at the time too many warning as errors still existed in the codebase)
> >
> > Metze's branch:
> >
> >   a) removes the '--picky-developer' option but instead make the --developer option use the same flags (in otherwords make --developer do the same a --picky-developer)
> >
> >   b) replaces the '--picky-developer' option with '--disable-warnings-as-errors'<https://gitlab.com/samba-team/samba/merge_requests/667/diffs?commit_id=3195e4a57ea74fae2b81536b327c13148b1529fa> to allow to avoid -Werror
> >
> > I think Metzes' approach is better and so rebased his branch,  (see https://gitlab.com/samba-team/devel/samba/pipelines/72975003)
> >
> > Surely it's better (for developer builds) to be as 'picky' as possible and ensure we keep passing with that)
> >
> > what do others think? I'm all for merging this but such a change probably needs some wider discussion/agreement
> 
> If I'm reading the comments from others correctly then I don't see any
> objections to pushing this to autobuild right ?
> 
> Please let me know if not :-) Anyway, I'll not do anything for a couple
> of days to let anyone else chime in if they want

Making autobuild work with picky developer would
be great ! Thanks, please push.

