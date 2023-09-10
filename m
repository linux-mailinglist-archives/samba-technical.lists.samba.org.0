Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F4E799FCA
	for <lists+samba-technical@lfdr.de>; Sun, 10 Sep 2023 22:35:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=EFFpBUVhHLkxukUlET+1h23TeKi4ecwDi61rCBDeJbY=; b=I1UY14+8rNG6s8f3JpF/8nYeHd
	5c/9JspCv64GUd12PjoPvODdds0o97Frr1iG9p5wOovre5FxPa6mmmtgzkZY4Nj7QMGjsEeRiUPa6
	u7yt/IcsTruWYwsUv+pvMMPAt4mip9S4yTGTMhqSbVqimOlWkwaOOwZFUp8yKW+yL/HBNJcxSNBia
	7p3Ycf3YIE8FkY+R8lJVCwD8db1PNf/CiMLQ+K/3W/543i79yLVmRaUASwiXVCfU21E8tgOOiadco
	M1yHZ2WNgKBCP68zBHxvly/9o5+gTB1btI1PHQ79XfTJUGedHcLcNPxw9REQXAlGICzz7lffnT5FR
	w5KOm6PQ==;
Received: from ip6-localhost ([::1]:59532 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qfR9S-002kIH-Ha; Sun, 10 Sep 2023 20:35:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52602) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qfR9J-002kI8-Se
 for samba-technical@lists.samba.org; Sun, 10 Sep 2023 20:35:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=/Jt5IF9eGeTcnEdxe4DvqzAUl6v7DiU0IzX19NSEYwo=; b=XHgk/vDNijNdXrCsV/UOyAu3zU
 KfPq+01jpUyJzjjL05V/F4TUvxeLzBA5tDaX0m67o1qhCtnzs220iyjehKpQxM+5pyAWUEckjIyro
 awMH/sD5py44DYjaD2sZSGUGev7mMK+n+rmtCgTYLIAyhgzy/q6zIw9Cpyn7zX4bVzahra4+PbGOK
 3i4IaUAeEQtUVnHoDRBfYFh0/BEu1EYECtknANmM1d2SHFmwOsn0G3VZZMmNsfTN2nndZEC1jJygU
 +Oeo2Vf2+iWRGYgO7kZzeezm0drGcWvkzr+qMY5NXOcWJIqu+LmCShHCHVM3njmtIhLqvU+gvjJ3q
 prl9/30FatiXV0xmCf0pDDq1r/A5ZGGlWRtO5woXGmU5VPC7txZc7yJGvHZN5XqvFkFC9gtGcyqX7
 dtYEXkV4Tg8Y8+IJVmfi9LKEaiOHtlSJAG1mdh0IsuHwvjiHzu2+YItq1fSyc8XdYoh8rdCeJPC9V
 UUaPPGzSjoICPaGsPtQ/xv2C;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qfR9G-00Co58-1R; Sun, 10 Sep 2023 20:35:15 +0000
Message-ID: <e41305c4a67c1e85071174511b682230a5b19675.camel@samba.org>
Subject: Re: two kerberos impls are used by samba now
To: Michael Tokarev <mjt@tls.msk.ru>, samba-technical
 <samba-technical@lists.samba.org>
Date: Mon, 11 Sep 2023 08:35:11 +1200
In-Reply-To: <834e6dc0-1efb-958b-5a64-d27fc62e6e28@tls.msk.ru>
References: <41985a01-8374-8f1a-5762-ededced82831@tls.msk.ru>
 <fc386fdb62da5e1ff9f42b3a0d346a2dcdd1756d.camel@samba.org>
 <834e6dc0-1efb-958b-5a64-d27fc62e6e28@tls.msk.ru>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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

On Sun, 2023-09-10 at 23:12 +0300, Michael Tokarev wrote:
> 10.09.2023 22:48, Andrew Bartlett wrpte:
> > On Fri, 2023-09-08 at 22:04 +0300, Michael Tokarev via samba-
> > technical wrote:
> > > FWIW.
> > > Just noticed that all samba executables on debian (built
> > > withinternal heimdal) are linked with *two* sets of kerberos
> > > libs.
> > > This is due to libtirpc, which is a replacement for the formerin-
> > > glibc RPC code, which uses libgssapi-krb5.
> > > This should not be specific to debian but rather specific
> > > toglibc.
> > > Wonder how common symbols from two krb5 don't clash...
> > 
> > This is related to your other post, due to the symbol versions, as
> > I understand it :-)
> 
> Unfortunately it is not.  Only symbols from public libraries
> withstable ABI are versioned in samba.  Symbols in private
> libraries,including internal copy of heimdal, are not
> versioned.  This iswhy we had named crashing due to some dns function
> name clash.

I thought we were versioning them with the Samba version?  We should
be.
> And two krb5 implementations are using quite a lot of common
> symbols.It looks like no one come across a good crash yet because
> tirpc israrely used with nfs + kerberos together with samba.  I guess
> oncesomeone will try to use it with krb5+nfs, it will crash left
> andright.

Very likely.
Sofware is hard.
Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead                https://catalyst.net.nz/services/sambaCatalyst.Net Ltd
Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company
Samba Development and Support: https://catalyst.net.nz/services/samba
Catalyst IT - Expert Open Source Solutions
