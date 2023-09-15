Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9879B7A246C
	for <lists+samba-technical@lfdr.de>; Fri, 15 Sep 2023 19:15:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=DKMDe/5ivlNYPKoYSnPtPhw9xsEBrqspW6svblAzyek=; b=hitr0XvHUeVhE0/Ax3l04AGthj
	kzeEBaWDTBAKvgRoNChIfzKcNnP57CdsGuwIOZUqeqskaKr+Yr2Cpk/G7gTF+JwFQVQCmAv4d+S2s
	WFaGFyq7Kt2YC0v6YIhJ8f7YEDPqq9faIJ9nbPS6GhlQ3vJXEJYIXgT2Q8Ww2m+1yk/SKMP7jOhI/
	I9OVKUboUnrtQsGjC4dtj9ERIW+Knm7SV1ksLMdwnmlzKHTpyDaQUf+pgUI1yimOnthlQe6AnfBlq
	kR2EtxvrshoZYBPnbIir8mdF/YYubTdEqIyJ5Y/w0/T3kaSn6bRN36+jFMooz+hWn6WLdmxqG5wxt
	cD028+yw==;
Received: from ip6-localhost ([::1]:39736 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qhCPj-004m2M-4S; Fri, 15 Sep 2023 17:15:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20236) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qhCPc-004m2D-6D
 for samba-technical@lists.samba.org; Fri, 15 Sep 2023 17:15:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=DKMDe/5ivlNYPKoYSnPtPhw9xsEBrqspW6svblAzyek=; b=uL+blLzvKSzuEBnBdYKETNrURg
 LAMR+6lEIDP7kbXg4OgDtv3Nm+cD+XO2eIHyayuElyVDjvwmJBTuDnUtjxBBMYTVJKwhuxmiXdOI8
 n2Ig9xoHt+TCw0ms9vVsulllbZFu9m7CpKvpYNnq6kyVzji1ybD6nv81UkAjGBhKuWLKgq5+SB5sq
 grDshBGYWX+EnYzbv1bGnNCf0JS1bTX0plglyEvVlS/ls5Ju+YKAoZJiGje009ZL8dSxr9+MSJ4tR
 42v58IGG5+lO7Z95AefzMMhzsA4cF05OM7z7/qWDASyJ8NIMMJT/EXqYwvI7L2VSohX52t+xOsqBz
 EVfQ5ecDlthTHSNZYP4iSscicoL0kAV7zAT0GX2LDLfx4SWimxAXv+LtH9JbiVJVsdgphw1Y9weHm
 7ILoeBTlR6LEH+A8G1A2rpm9/dn9s5z3lQLet63DkCjEEvkW9L74isjICt4fq3c5G0gJOJok7O+zF
 jBfA39/sF4BlfnBON3rhy/yB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qhCPT-00DiZl-1t; Fri, 15 Sep 2023 17:15:16 +0000
Date: Fri, 15 Sep 2023 10:15:11 -0700
To: Jeremy Allison <jra@samba.org>
Subject: Re: fstat on Linux in glibc is slow !
Message-ID: <ZQSRH/xUljONUnKJ@samba.org>
References: <ZQNVAogyt9Wfmje5@jeremy-HP-Z840-Workstation>
 <ZQR+SazJv95XzrdS@samba.org>
 <ZQSCFQcY/pdbml82@jeremy-HP-Z840-Workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZQSCFQcY/pdbml82@jeremy-HP-Z840-Workstation>
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Cc: metze@samba.org, vl@samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Sep 15, 2023 at 09:11:01AM -0700, Jeremy Allison via samba-technical wrote:
> On Fri, Sep 15, 2023 at 08:54:49AM -0700, Christof Schmitt wrote:
> > On Thu, Sep 14, 2023 at 11:46:26AM -0700, Jeremy Allison via samba-technical wrote:
> > > https://lwn.net/SubscriberLink/944214/ca0c0f366ada686a/
> > > 
> > > Maybe an easy performance win if we use a replacement
> > > for fstat until this gets into glibc ?
> > > 
> > > We use fstat a lot and assumed it was fast.
> > 
> > So just call syscall(SYS_fstat, ...) in sys_fstat? That would be an easy
> > change.  Demonstrating that this has a performance impact would be the
> > difficult part.
> 
> Yep, that seems to be the fix (for x86_64 at least).

That seems to work across Linux architectures (at least the x86_64,
ppc64le and s390x ones i could try).

Christof

