Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B014426763B
	for <lists+samba-technical@lfdr.de>; Sat, 12 Sep 2020 00:55:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=usyLNWCtgQ+lPEdcdu/pwk3+jnjIkiduai03i7ZGS1A=; b=ks+Bsd8XmY7G21dmrcBYKazLan
	qXUazkbqQ3psG4qk2pY5wfgbSKQxWFlAt05BxoIzDwcndzltpqRNxcuc3Kj3hx9OV0TrPUW2co1Vl
	UbbqU5XQbVjXjXHvOVtnISt8c0pKFYCFC3ANYb5xi923XX3x2u6la17Awu451vCdZhRk7vTayzlj9
	w5kUIkek2o2Yz86KF5Cts+lFbaSN1tTIp8anBs8XfWsDLFv2Rrv9Cr+UgN+uk+sVZjlmbLWUDGpLD
	DaPjJ3XjllvXINfaTm02noXUG/j3jeCn02wADPHaeg9Ayhg2vFUvXzaTJbFfsF5aeOatRWGAo7GeQ
	zR9iN3KQ==;
Received: from localhost ([::1]:42946 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kGrvt-005Ct5-Gd; Fri, 11 Sep 2020 22:54:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10024) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kGrvo-005Csy-HK
 for samba-technical@lists.samba.org; Fri, 11 Sep 2020 22:54:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=usyLNWCtgQ+lPEdcdu/pwk3+jnjIkiduai03i7ZGS1A=; b=kCpggMRrgvgw8sb8oG6B7yQFoT
 kdLakdiCSmtV78nAXgqzELBLg/pw9w0P0BsFQdPJvgJOokKTgOfHUVcXjtPMKymsaOI3PzDmYFHvD
 7nGbY7HMMfWNRmxByWLXrkpJUqG48ZufoIISTYWRzX6NLFtg5/YO9u8oEhjuT8mOnvWe/Jpz5V+HG
 mSpmw197ccLGlH/2xstVyfFnwoUjhQ4yjFopuvk56CSI1CgBaw2gohZIQ4mZfZFxreRUN1cZzyRO5
 hppxyjQarkxihsxZoBze/wowvRfPx32P6WL72RKLYh0PGfVBKb5UUJqWRmresNiUczMcklFlGLAg1
 PPAn9mLaHBZ/kQ4UqeZhVipTdiY+eCjG3ApsLHcx20vP5sDGNBOsfBjXMId9yKBTpNNO3s+bMYACZ
 97Yl/PfMxMtqgIr3YpMN02oWwOU1UvNdfeGQC6b+PNt2Nv0a0QstCAZEhfjqmV1AGlEVvXQphJGh0
 jp/FQucWmDmrkYz61oBHDqpQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kGrvm-0007MG-Km; Fri, 11 Sep 2020 22:54:11 +0000
Date: Fri, 11 Sep 2020 15:54:05 -0700
To: Isaac Boukris <iboukris@gmail.com>
Subject: Re: winbindd main process hangs on samba-dc
Message-ID: <20200911225405.GA1035745@jeremy-acer>
References: <CAC-fF8TWw1_JZaY_i9_n5U7vc96_+8XwfwzGoXZYQoxQAZwNjQ@mail.gmail.com>
 <CAC-fF8R4+mJ1LG1xK2+3hEws7=Pj6TYd-+FgHf6=eXEPn5pwyg@mail.gmail.com>
 <CAC-fF8RRAQbAgNA9R3kwKwt69DJY7fQwGvC3Yhz732Vmo_sh1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAC-fF8RRAQbAgNA9R3kwKwt69DJY7fQwGvC3Yhz732Vmo_sh1w@mail.gmail.com>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Sep 10, 2020 at 12:06:22PM +0200, Isaac Boukris via samba-technical wrote:
> I think there is no point trying to maintain domain->online per domain
> in the parent process, we should just ask the domain child (fork one
> if needed), and avoid ever trying to talk with a DC (sync) from the
> main process.

That certainly seems like the correct fix.

OK, I took a look at your change:

https://gitlab.com/samba-team/devel/samba/-/commit/5ee90438cc2aa26514f60c7d72a3e854adee0148

and I see what you're doing here. I think
there still may be some calls that can
be initiated by wbinfo that cause the
parent process to try and do domain
activity and don't go through a child
DC.

Can we work together to track these down
and make sure we invoke a child process
for them ?

Cheers,

	Jeremy.

