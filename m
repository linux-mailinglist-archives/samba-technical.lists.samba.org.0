Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 87ADE4D992
	for <lists+samba-technical@lfdr.de>; Thu, 20 Jun 2019 20:39:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Pp1D6RRfhIz+1TM6EVRZbg/eMoJJGTRgrPV5TEc02WM=; b=5oAzjeQabbl0MjRyg1q3hT9P7T
	ZPcsYf1kB6uk43ZzHMPIrlvgSjuOIi1FkpVP7sRDd7utvJdH9FsenB7MH6GmnXuF5UfwESTssvo/W
	ErTEaSlbj+rrGWIaA3gCNvWVMbD0jvhjjzlg7J+Uh1D3mnxuY0Wkexx5Bv+P1IBS66gI5I4TfNMDo
	gJfg0jsB8CwUKaGn03OJLtMYa5GS5AmEErgp2788dM932Y3Zbf+A4G1CRUK/eYR1L/3evuEfR8cNi
	sGRDd3Rs1KoF7ZAePA+Tbb0IJoZU0ahA9n3NM+S8onH78vpx/VzQmO5ExgEBcBINvPgqxi3o8zgPr
	/DGwvvfg==;
Received: from localhost ([::1]:31638 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1he1xj-000nEi-31; Thu, 20 Jun 2019 18:39:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28250) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1he1xd-000nDZ-0X
 for samba-technical@lists.samba.org; Thu, 20 Jun 2019 18:39:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=Pp1D6RRfhIz+1TM6EVRZbg/eMoJJGTRgrPV5TEc02WM=; b=tBHI4rM8l5pqUKzvYhqa/0SDHA
 jT9FwgumcBofG4RSB7qCFI9DzLsGs7Yvbs1GxuO2sMuwSNZGGLG8+VwNHd6DA897mNSp2vPBRBbhU
 UMLe5fdSHiw3JGweeWtzRC9ScSxuAcHlZTp5DWlEa6QILGGhE2Eae9elzIfEfXLWL5SU=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1he1xc-0007yL-20; Thu, 20 Jun 2019 18:39:00 +0000
Date: Thu, 20 Jun 2019 11:38:57 -0700
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Using gitlab question
Message-ID: <20190620183857.GH109029@jra4>
References: <20190620172908.GD109029@jra4>
 <19d1f8f70f3d8418dadcd3e92af54dd85bb884be.camel@samba.org>
 <20190620182657.GG109029@jra4>
 <7c6785a090d40d9136f2522321e6595c296198db.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c6785a090d40d9136f2522321e6595c296198db.camel@samba.org>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Jun 21, 2019 at 06:36:01AM +1200, Andrew Bartlett wrote:
> On Thu, 2019-06-20 at 11:26 -0700, Jeremy Allison wrote:
> > On Fri, Jun 21, 2019 at 06:23:25AM +1200, Andrew Bartlett wrote:
> > > On Thu, 2019-06-20 at 10:29 -0700, Jeremy Allison via samba-technical
> > > wrote:
> > > > I have a pending merge request:
> > > > 
> > > > https://gitlab.com/samba-team/samba/merge_requests/558
> > > > 
> > > > that has been made unmergable by a commit from another
> > > > Team member that needs to go into autobuild before
> > > > my change (it's a minor change to test code lists
> > > > that needs rebasing).
> > > > 
> > > > What is the correct procedure for doing this ?
> > > > 
> > > > Do I close the existing merge request and re-issue
> > > > a new CI-run followed by merge request ?
> > > > 
> > > > Or is there a way to ammend my existing merge
> > > > request with an updated patchset once I've
> > > > fixed the rebase conflict ?
> > > 
> > > A good question (because it isn't in the wiki really)!
> > 
> > Any chance it can be added there ?
> 
> It is a wiki, there is a very good chance you can update it ;-)

Bit busy with other things at the moment, but will if I
have time / need a break :-).

