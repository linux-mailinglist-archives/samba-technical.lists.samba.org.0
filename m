Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D02F36DF7F
	for <lists+samba-technical@lfdr.de>; Wed, 28 Apr 2021 21:23:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=F22soonSueiLUhIrsYClfDItiaDBPMO9aN8J6sW6WgY=; b=Kh6ODkSOPWJBE98ron40LUy1sH
	/8sGjTm2/6JyA4QX4XyhXBIiyHKJte4gxuDV2hdznjJUxFsU9PHn9U7XWjWHLRwCptEhstUr5MQ6K
	SzkuFxkd98SQ9kTif77lHASih32tHd9rsbC7UX7qZN7oPxMfG5vraziMebQCHKlewSn6e4JyqPNvm
	MZFF3rC1BQVJYQNiMlAtMO0pvEpvrUDy1C442RFCT21L5Apr9nbVRxRZUGUOCpZFMg7AKTozWQjeF
	ROE1FwjUtPfSyoSO7P92JRdhAOa53t/QzMfiVMAjQIZ/4Wt1jI9fVXIlfsCJrmUTgr9wy+urMY7ph
	blRV/U5A==;
Received: from ip6-localhost ([::1]:52938 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lbplR-00Cw6h-BF; Wed, 28 Apr 2021 19:22:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14188) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lbplL-00Cw6a-Gc
 for samba-technical@lists.samba.org; Wed, 28 Apr 2021 19:22:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=F22soonSueiLUhIrsYClfDItiaDBPMO9aN8J6sW6WgY=; b=GAvJCxCDRkUs2zhsEs64yQs3G5
 62hC97RYGBU1gdll0GrFMbzrS4nHBTHEneCB43jBIFF5wi8PRwfqGiov94fhYrHCjrh1dRKjIfN6C
 ErFfosTPEYl6dDj+8MMkXDATSfAs0KFwGt6CwzOhQ35FrWS7SlO/hJmNXCmQxXWBRIhcK2He0RWQs
 LXaPJYwFJazUp5NzrnzuT9nP5QECqjKAvTiowOVw+HpaFjrrvCR0ZpoU2xiCGFLuSzoJRuNkC01Ri
 L0VM0vv35HLSLfiMyza9iP0V9W2SdQNvsCRmDwEbuLbEFA7eC6Jsrxd24wNMxVGgWVIJ+kDV45qRK
 tj51W60YBjAsrQvk+Wug1HjgO0991HsjmbMFvXNkA+hMkRVRVc2epf4Cv6jGCmg4/iEpVYsyOPrc2
 bly6EE8tv6bhA0DQC9Ler3xdnmrmXxcBPHiieo6f5yQuiVvwQETr1WTColwlKH4Xl4i2/15BR1HLI
 5eOYaP8XZnAj3Wdwr2Tu0aRD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lbplJ-000398-Ld; Wed, 28 Apr 2021 19:22:18 +0000
Message-ID: <b76012f7512f99d4ea31e04fa86ac80a8c4cec08.camel@samba.org>
Subject: Samba git and our MR process (was: Re:
 ctdb/utils/etcd/ctdb_etcd_lock python => python3)
To: "L.P.H. van Belle" <belle@bazuin.nl>, "samba-technical@lists.samba.org"
 <samba-technical@lists.samba.org>
Date: Thu, 29 Apr 2021 07:22:11 +1200
In-Reply-To: <vmime.6089435c.6458.7483af847178031c@ms249-lin-003.rotterdam.bazuin.nl>
References: <vmime.6082be4c.4114.8306c142307950c@ms249-lin-003.rotterdam.bazuin.nl>
 <vmime.6089435c.6458.7483af847178031c@ms249-lin-003.rotterdam.bazuin.nl>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
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

On Wed, 2021-04-28 at 13:13 +0200, L.P.H. van Belle via samba-technical 
wrote:
> Hai Martin, 
> 
>  
> 
> > -----Oorspronkelijk bericht-----
> > Van: Martin Schwenke [mailto:martin@meltin.net] 
> > Verzonden: woensdag 28 april 2021 12:50
> > Aan: L.P.H. van Belle
> > CC: samba-technical@lists.samba.org 
> > Onderwerp: Re: ctdb/utils/etcd/ctdb_etcd_lock python => python3
> > 
> > Hi Louis,

> > Let's just make the obvious change that you suggested.   If we only
> > support Python 3 then we can't leave this script at Python 2.  If
> > it
> > breaks then someone can report a bug and hopefully send a patch.
> > 
> > Can you post a git version of the patch with your 
> > Signed-off-by: line or
> > should I do that and just push it with my Reviewed-by:?
> 
> Yes please do, im atm not setup for git and before i push things into
> git
> I need to be better with my git skills, its to easy for me to mess
> things
> up in the samba git.  :-/ 

I want to reassure you that None of us (essentially) ever push directly
to Samba git master, so it is harder to mess up than you might thing.
 Remember, everything goes up as a MR first, see

https://wiki.samba.org/index.php/Contribute
and in particular
https://wiki.samba.org/index.php/Contribute#Subsequent_Merge_Requests_.28and_complex_first_requests.29

Also, even if you try to push to master, it will be rejected unless you
go via autobuild, so accidents are pretty hard.

Hopefully this helps you gain some of the confidence you need here.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


