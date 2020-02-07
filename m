Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E939155C36
	for <lists+samba-technical@lfdr.de>; Fri,  7 Feb 2020 17:54:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=EqJdfE9LXsJlSW8qf7pwlPEkDLB8CGzmFELSMIlfOMo=; b=O5Ln6U2HouULmU+Fq/uqnA/uwI
	Prd2Kf+0QOdxaKvQMaBuIWAGkGdy9mDR7OgMKrauSzVXDbIzS3+RadFM5r7/1FFRwo72ZusMrdMuq
	F+l2DEyPLo02g4f4rCgC2Umr6bT+8/ZDCTin2G+RYVh0TXHfMCiv4AFTAMXkh7RhWdjIAb5UlMvl2
	rfVEaZKxeRJQN1aX0pHLN83cvxzfUQW7clQy1HncEBaccZncaItBci/xWYpRJQrWPaI8STAB+1ZhZ
	5OYfGLcKUYjlnLQsgFP5bNr54zFk12kVtyUd2tPmXt230+IbDGqoWd2UEkxvKFuY35Y3+KA74VUJD
	uJn3yFNg==;
Received: from localhost ([::1]:29720 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j06tb-008jSt-Ap; Fri, 07 Feb 2020 16:54:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36952) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j06tX-008jSm-3s
 for samba-technical@lists.samba.org; Fri, 07 Feb 2020 16:54:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=EqJdfE9LXsJlSW8qf7pwlPEkDLB8CGzmFELSMIlfOMo=; b=iDcHVa2shfyFS3u2cbgOHYIkWm
 XHPGuoilz2Lr7BLyES6kC9MwLsT8t6/eFazBMlC5p0ZemwOXmN+zyU943B5PWeW5qHNRkgnYc9Xe3
 ewyJFuSyOdtehs3CIeqw7QvyVKyjLhOpLMcEebWYe/scaEoCE7YHa1GxENZY/8aft48Syf53IL6au
 gyOCMGRMulPTJqDxT3J26kNl0n54ofgig6EBbm/doymOofBaJmtRW4aOr17h/eI0g3YdUmhtKVnFM
 HheWhzDAZj7FRKRihTYZM9zmuZySc3vi1uTeln+8BMNtbqKYHyYLo99WAFXk8juse5kSMNNQLXGxx
 Q/fN1+/Si5EEAgPqzi43QlZ1rESvIHKeiEVfe4Q/TtEVMitn7QihEaGeaYSmmHaIwo6mjoljmjx62
 JZJhq/Kdoi+0qGvwU5FlSf5nszXQyyexpDgHd2yR7rQutjX1F/PY6otaFVcpjD/W6BU2ZsKB1kKOR
 +fPx8z8gkeBQhypkXQbaAWmW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j06tW-0002mO-2W; Fri, 07 Feb 2020 16:54:18 +0000
Date: Fri, 7 Feb 2020 08:54:15 -0800
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: Linux io_uring VFS backend.
Message-ID: <20200207165415.GA8730@jra4>
References: <20200125002104.GA188423@jra4>
 <9de9b007-07ec-e9d2-f2ff-8c3c4eee215c@samba.org>
 <f8f26e1b-8cf2-7d66-2dc1-2dde874b2083@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8f26e1b-8cf2-7d66-2dc1-2dde874b2083@samba.org>
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

On Fri, Feb 07, 2020 at 02:14:06PM +0100, Stefan Metzmacher via samba-technical wrote:
> Hi Jeremy,
> 
> >> Any chance we can get the io_uring VFS
> >> code checked in for 4.12 ?
> >>
> >> Would love to see that as an option
> >> for Linux users.
> >>
> >> I'm happy to review / test !
> > 
> > Look at https://gitlab.com/samba-team/samba/merge_requests/529
> > I just rebased on current master.
> > 
> > The ubuntu 18.04 hwe kernel is up to 5.3 now.
> > But you need the liburing library from https://git.kernel.dk/liburing
> > 
> > I typically use
> >  ./configure --prefix=$HOME/prefix/liburing
> >  make
> >  make install
> > 
> > And for Samba
> > 
> >  PKG_CONFIG_PATH="$HOME/prefix/liburing/lib/pkgconfig/:${PKG_CONFIG_PATH}"
> >  export PKG_CONFIG_PATH
> >  ./configure ...
> > 
> > Note it won't currently work with a 5.4.15 kernel. The regression
> > is revert in 5.5 and most likely backported to 5.4.16.
> > 
> > Please test and it and play with the possible config options.
> > If you can provide some numbers, which show if the options have
> > any impact.
> > 
> > If everything works out ok, I'm happy to push it to master and
> > backport to v4-12-test.
> 
> Ok, I've done some basic testing and I'm able to speed up
> a smbclient 'get largefile /dev/null' against smbd on loopback
> from ~ 2.2GByte/s to 2.7GBytes/s by using the io_uring module.
> 
> I've added at least compile time tests for gitlab
> and removed the WIP status of the merge request.
> 
> Please review and push to master. Once it's in master
> I'm happy to backport it to v4-12-test and write a WHATSNEW entry.

Great ! Thanks. I'll review asap.

