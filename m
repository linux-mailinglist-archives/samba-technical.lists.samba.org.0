Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 039D61C8196
	for <lists+samba-technical@lfdr.de>; Thu,  7 May 2020 07:37:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=6BneHVRRfOlx0rhYP3R4brGCUGggTc+T33z2Oz2QODo=; b=YGGEjNthOXFB0GoaxPTng9HHBu
	tPLas1e3dtvccBmzmULnMO1Vu4fwI/dcoxiR3nfLe8YQv15yWSF6JV4CYg+oxVmSjxbfSXQyopEZy
	CRfJv2kZ+Cb6fhI5in3xb3QDagTvYOgwfkZNR9WbsJbXj03TDkSNjiLw72aFyk3lvCsUFjfTYTNZ3
	xkaXcNLp2KSAfn5+CYH00DytyvzxTR81z0AiNerr5jcQ/QfFBj2jDgYD6sky7fzSlOJhmivtewpWY
	NtNtiI3radh0JaW71jS3ysL5p8kp8iVEo5Pf7sdBwmVUnThAiVrM2XX69ZM8Z5N5L2ntjlKJ6JOA+
	fibf0yIQ==;
Received: from localhost ([::1]:59756 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jWZCP-0035OO-Tz; Thu, 07 May 2020 05:35:58 +0000
Received: from latitanza.investici.org ([2001:888:2000:56::19]:39113) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWZCJ-0035OH-93
 for samba-technical@lists.samba.org; Thu, 07 May 2020 05:35:54 +0000
Received: from mx3.investici.org (unknown [127.0.0.1])
 by latitanza.investici.org (Postfix) with ESMTP id B593B120259;
 Thu,  7 May 2020 05:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cryptolab.net;
 s=stigmate; t=1588829748;
 bh=6BneHVRRfOlx0rhYP3R4brGCUGggTc+T33z2Oz2QODo=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=MVHqLEe3cp+jrCAtGsHNg+tjYEEBByjgaGrz/eA7YAciDOUizsT+PTRL33OsAfPgX
 nMuD3tYlzxUk2FEyBahYDy0cLv58vAxCEgbBhjt5fb3u+2ZI86AAexJjUNnL+piQFN
 U6yuBomB0Cog8rVlSf4vyr+fBR/ztNi89kBZ+m8c=
Received: from [82.94.249.234] (mx3.investici.org [82.94.249.234])
 (Authenticated sender: anoopcs@autistici.org) by localhost (Postfix) with
 ESMTPSA id 23AB8120165; Thu,  7 May 2020 05:35:46 +0000 (UTC)
Message-ID: <fd81e3efec4bac47f53c6f097fb037c1388ab31c.camel@cryptolab.net>
Subject: Re: Samba with GlusterFS - the bug is back?
To: lejeczek <peljasz@yahoo.co.uk>
Date: Thu, 07 May 2020 11:05:40 +0530
In-Reply-To: <4b3fdecf-e666-dd76-d618-0150b2549f07@yahoo.co.uk>
References: <4b3fdecf-e666-dd76-d618-0150b2549f07.ref@yahoo.co.uk>
 <4b3fdecf-e666-dd76-d618-0150b2549f07@yahoo.co.uk>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
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
From: Anoop C S via samba-technical <samba-technical@lists.samba.org>
Reply-To: Anoop C S <anoopcs@cryptolab.net>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2020-05-06 at 09:00 +0100, lejeczek via samba-technical wrote:
> hi guys,
> 
> I fear this or very similar - 
> https://bugzilla.samba.org/show_bug.cgi?id=13585 - is back and I
> wonder(must be no me alone): would that be(if this same old bug)
> Centos maintainers' fuckup or it's in the upstream?
> samba-4.10.4-10.el7.x86_64
> glusterfs-server-6.9-1.el7.x86_64
> If anybody here is a glusterfs mail list consumer, then it's "Unable
> to create new files or folders using samba and vfs_glusterfs"
> 
> I'll say this is a small catastrophe, once again, for all those of us
> who run with glusterfs.
> Would you have advice with a quick fix and/or workaround?

This list is focussed on developmental activities. Any usage issue with
Samba(and related projects) can be discussed on samba@lists.samba.org
list from a user's perspective. Since you are using GlusterFS backend I would prefer continuing the discussion on the other thread you have initiated on gluster-users@gluster.org for which a response is awaited.

Thanks,
Anoop C S.


