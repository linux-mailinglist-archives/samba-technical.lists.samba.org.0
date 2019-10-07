Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BF102CEDAC
	for <lists+samba-technical@lfdr.de>; Mon,  7 Oct 2019 22:41:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=u7QFPQaidX0skfVG65gUAYHbHZ/4m0lLrk0cMYhGi2o=; b=kHM0RjbFGfsNzZ9FSyk4Ycl/aR
	SIxKITjzeUYDVeK0U0e7yZnCku4KVE6aZx2kzMdiOxuFbySUijh2KNX+zID91iVCIhSCrFV3Qf++F
	oF23oxMjd1com+o0SMh1+UvZHZXt570xxdSmKX/OohJdbWIFCk9QZvonotlX1BPOmbh6C7Rqf5eFA
	2R2MBzwse+kXEmLFCNxm9ZlW393oNDKyOM2KyN1h3pgU3rq2sGCrU8lblsjoE1/XYnogHJzffz9fe
	qmHhnrySvdYYN2sQVZnEkfGy0JtTlmm8QSM7sW5tPBm8iNicDDDnRXHODbwGlHhkVWfLU+lYy2CTa
	O28nyLIg==;
Received: from localhost ([::1]:18716 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iHZoL-001upK-MW; Mon, 07 Oct 2019 20:40:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20824) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iHZoH-001up9-Q6
 for samba-technical@lists.samba.org; Mon, 07 Oct 2019 20:40:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=u7QFPQaidX0skfVG65gUAYHbHZ/4m0lLrk0cMYhGi2o=; b=M1KYfDrCSw1ZGpsFDdls5EZk/7
 a6TDLdAcsYbipeppz/rtAvn7LxB5IpK4HIJwiOu4lScQg8h4ldgVcPOaWhxM8xD4TjmW+CWEhP2Oo
 d6VKRpbYLPcRR9ZgUHHW+dP40PELBNbltHufhy1C7mTSo4ugd55vKtA5nI02lN6ikYSU=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iHZoG-0000JJ-WE; Mon, 07 Oct 2019 20:40:49 +0000
Date: Mon, 7 Oct 2019 13:40:44 -0700
To: Gordon Ross <gordon.w.ross@gmail.com>
Subject: Re: Patch: Let smbtorture run when EAs are not supported
Message-ID: <20191007204044.GA16890@jeremy-acer>
References: <CAD0Ztp3ZioeuGwzsjL3ehpCMxXgbrXsTQxMXXKYP53m0q6wDqw@mail.gmail.com>
 <CAD0Ztp1wjUnYqQZV9=gxZxgDSCxHDOVsk7eKi48r3fZ0KFnBUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD0Ztp1wjUnYqQZV9=gxZxgDSCxHDOVsk7eKi48r3fZ0KFnBUQ@mail.gmail.com>
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
Cc: _samba-tech <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Oct 02, 2019 at 11:24:31AM -0400, Gordon Ross via samba-technical wrote:
> I forgot (and Volker reminded me) that I needed to use NT_STATUS_EQUAL
> in that status check.  I did that in a later commit but forgot about
> that when I extracted this change from other work.  Attached is a new
> patch.  This one passes gitlab.
> Volker reviewed and did some testing.  (Thanks!)

Sorry for the delay. Looks good to me - RB+ and pushed.

Thanks Gordon !

Jeremy.

> On Tue, Sep 24, 2019 at 12:11 PM Gordon Ross <gordon.w.ross@gmail.com> wrote:
> >
> > Some servers (and some file system types) choose not to implement OS/2
> > style EAs.  As one example, the server I work on supports named
> > streams but does not support EAs.  I gather some file system types
> > (even on Windows) also don't support EAs.  Many smbtorture tests that
> > have little to do with EAs refuse to run only because
> > smb2_create_complex fails if EAs are not supported.
> > Attached is a patch to make that failure non-fatal.



