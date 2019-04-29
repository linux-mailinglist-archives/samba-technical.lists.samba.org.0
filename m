Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9003ED47
	for <lists+samba-technical@lfdr.de>; Tue, 30 Apr 2019 01:22:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=u7YWOt+82KYN8jwvLn3infMBC18iICSmbt5EYoOTdvc=; b=6AIUosZyGGRVcmjT7r+geAXeDE
	Rh77mGmPY/7P7bh7823M8SPwYSy7jydYIez9dzkUSskcY8A2LeAFC1NdrLnUMF4Vl/MgKfPjSSc5x
	M6s3Ece8+ypaPCUhX24FEuBu0/bv6KNCuajpyg093u575u8t5RNlEyTZ6EOvtYOH+jXgGiePlNrNU
	e0J6TCsVb2HIgSEXLDxseFsNG5COQUZYXvcPIrhH5WxhUe/B9dCzlKPSF7x8OO0t8OCAoJY3CJ5/B
	11BwkmC0TUcst421kplYVA+Q/2LGF8JxQyR73QbgDxFoYw2FwrI56ewDo/slNxxy/O+bRUOlNP10q
	f9x47gdg==;
Received: from localhost ([::1]:63996 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLFav-003lwb-Fx; Mon, 29 Apr 2019 23:21:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:22190) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLFar-003lwU-20
 for samba-technical@lists.samba.org; Mon, 29 Apr 2019 23:21:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=u7YWOt+82KYN8jwvLn3infMBC18iICSmbt5EYoOTdvc=; b=e1wBmj7qVpH2JxmxPhdvkYikTL
 wtbAZzYQzi8SKk05aNHioCvcCCl6/DFwAe8725JhvgiRSQkMBYHZ1TN2vJBxoQXhhaH2tMgeAvkGp
 YvbK1QL7cRIjYW3oboMCpktbTK6ySAS2MdERwkeApKLnEBa5f4gi5/LO4NGsImLJoLJ4=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLFap-0002Ha-Vc; Mon, 29 Apr 2019 23:21:52 +0000
Date: Mon, 29 Apr 2019 16:21:48 -0700
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: [PATCH] Revert "wafsamba: Enable warnings for missing field
 initializer"
Message-ID: <20190429232148.GA875@samba.org>
References: <20190429193555.GA28948@samba.org>
 <634FD7C2-DD12-4714-9AE8-A95BD3EF40E9@samba.org>
 <20190429200808.GA26142@samba.org>
 <20190429223210.GA23900@samba.org>
 <1556578686.25595.77.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1556578686.25595.77.camel@samba.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Cc: Andreas Schneider <asn@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Apr 30, 2019 at 10:58:06AM +1200, Andrew Bartlett wrote:
> On Mon, 2019-04-29 at 15:32 -0700, Christof Schmitt via samba-technical 
> wrote:
> > On Mon, Apr 29, 2019 at 01:08:09PM -0700, Christof Schmitt via samba-technical wrote:
> > > On Mon, Apr 29, 2019 at 09:51:53PM +0200, Ralph Böhme wrote:
> > > > Hey Christof
> > > > 
> > > > > Am 29.04.2019 um 21:36 schrieb Christof Schmitt <cs@samba.org>:
> > > > > 
> > > > > Revert the patch adding the warnings since that causes problems when
> > > > > compiling master on RHEL7. Many C99 initializers of nested structs
> > > > > are flagged as problematic, so it seems easier to remove the
> > > > > additional compiler checks.
> > > > 
> > > > sorry, didn't thought about older compilers...
> > > > 
> > > > Can we have a compiler check that ensures {0} works included with
> > > > nested structs and then only enable the -Wmissing-field-initializers
> > > > if it does?
> > > 
> > > That should be doable. Let met try adding the check.
> > 
> > See attached patch. That works for me on RHEL7 (skipping the compiler
> > option) and Fedora 29 (using the compiler option).
> 
> Could you make this a merge request please, so we can see it working on
> all the platforms tested there?

Yes. CI is running now at
https://gitlab.com/samba-team/devel/samba/pipelines/59040252

> Also, could you please look into adding CentOS 7 as a supported
> platform via our bootstrap system so we don't regress here in the
> future?  There is partial support already, but it wasn't finished
> (mostly to avoid chasing two rabbits at once). 

That is a new area to me. I see that CentOS is listed under
bootstrap/generated-dists/centos7/. Would the only missing piece be the
centos7 entries in .gitlab-ci.yml, or am i missing something? I can give
that a try tomorrow.

Christof

