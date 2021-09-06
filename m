Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F144940162C
	for <lists+samba-technical@lfdr.de>; Mon,  6 Sep 2021 08:06:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=SIr5wXzxC5UGyQJVgdcPZJXZ6WeMryzO5bwA35oywjY=; b=N9GdTDf+rPOlCGpCJ5utsEK7Od
	kCGQQzpaN+s3dA3gkKZehVuINta/mXaIAHH3moG7tfGk7CBq9kZeHLjv2dbxNk2cDwSjKcIxthyXt
	GorE9mqGsKWAdvTkjLxNG1klvzPoLG3UsJahUdESPTIQ6dWdaY7/kh8YCtWHlS//BURc6LJobsZ/B
	LMEXHsUXSGE4WbdAkyboWW8yKWailp88nZM0lhjgYCnIs5cPmg57XBNYuTGZpmJM/ex+hhipVR8Rf
	LsrIzwgYiWRkFV42lmRi5SZCMFYqxtuRiXQam7Gjvm/mm1FgwGljwz98/MWkpwmO3c9gPrOq7nKBb
	CA/Bj4Dg==;
Received: from ip6-localhost ([::1]:31548 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mN7kT-00DR7m-Ex; Mon, 06 Sep 2021 06:04:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36610) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mN7kK-00DR7d-RX
 for samba-technical@lists.samba.org; Mon, 06 Sep 2021 06:04:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=SIr5wXzxC5UGyQJVgdcPZJXZ6WeMryzO5bwA35oywjY=; b=heVEiyoAULXlx87rYkwVv0ZUiU
 eBH0H8m3DlfbcTeSbuaMflDEKOV5DFNmBJYG2h3FeGazV9sIhPyLfItiG6LI1gEQO69nIwAlVtcEh
 jFVFdQINAtuu9yz6CYtL+xmWKbLfhJqFm6nJLMaOywMgZNGJOVbG9Tw35ALky7CBGdjEuw87l0fFz
 lqv1katLdG+jo8gzUZgXOcpL0Z6/YabUjbeKt5KrPuOf33vzS1cL7fqKnyoahdsX28CN8Zd1fKzBE
 dHsFBoi+08Q//fz4UpIRXVg/it3oMyUvGyV00Ko7chWYIZuXvSMQw8dISh9SQvu6qPmOKULSDQzbl
 +Ln/BFc0F94Ev3UxWTsLUqmVeq8P9K6F9EbctENfWM8Y5Zs2ndffkB2xuU42vBGdXxmc3/Gj9T9sj
 /f4j9pUnLvgKTxP2yCdE/3TJd5m2hM+DdIaVxYyguoKRnAXnwVI4/dszARiZQg/Cza3GTy91VrTTP
 WwCxKRmYa6blJvb2xvPAOwjk;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mN7kJ-004pMZ-75; Mon, 06 Sep 2021 06:04:43 +0000
Message-ID: <12f2878d17c78e5ae88b0fa831022471cbc0ceb2.camel@samba.org>
Subject: Re: HEADS UP: The Joys of Logging, or subtle behaviour change of
 logging in the daemons in 4.15
To: Ralph Boehme <slow@samba.org>
Date: Mon, 06 Sep 2021 11:34:40 +0530
In-Reply-To: <f4ce9085-24be-55fe-e71c-ac7c67b845e4@samba.org>
References: <f4ce9085-24be-55fe-e71c-ac7c67b845e4@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
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
From: Anoop C S via samba-technical <samba-technical@lists.samba.org>
Reply-To: Anoop C S <anoopcs@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2021-09-03 at 18:22 +0200, Ralph Boehme via samba-technical
wrote:
> The following MR addresses all of the above
> 
> https://gitlab.com/samba-team/samba/-/merge_requests/2150
> 
> 
> Behaviour of 1) is restored to what we had in 4.14.
> 
> 
> 2) is addressed by opting for stderr instead of stdout, ie
> 
> - in 4.14 all daemons were logging to stdout
> 
> - in the previous 4.15rc's:
> 
>    - smbd and nmbd were logging to stderr
> 
>    - winbind and samba were logging to stdout
> 
> - with MR 2150 all daemons log to stderr when started with -i
> 
> 
> Not that all of this really matters, in the end it's just logging.
> But 
> given the vast amount of tooling around logging these ways, we're 
> worried that the subtle changes in 2) may be an issue.
> 
> 1) isn't really problematic, but what shall we do with 2) ? Go for 
> stderr as implemented in the MR or rollback to logging to stdout as
> we 
> did in 4.14?
> 
> I'd vote for stderr, what do others think ?

+1, that's the right way forward.


-Anoop C S.


