Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE418552FE
	for <lists+samba-technical@lfdr.de>; Wed, 14 Feb 2024 20:13:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=pU7D3Wt88ZV5AW1pMWHHmBZmUjzJ6pS3WxwYPxY2Pgs=; b=LWqR8jCdryiR0L4S/1j/PH7NaT
	YYoT/vWlbghY6j/lbcmVbk70ZFnh6+1HaNJfNtOwo3iTJTYflsPDxN0GVFw9x9VxnMW3QpB/nvMwy
	jUKh9ivj+nSQQ1gqACrz5o9fmMANjCcvAeJAfwxQjXSptlpjDBHinZsYrlTXVlOr2XYcFlchdrKxs
	Hx8AYSwrQeZcHHfhgFgBCTg6bc0tvo+qzXdBnk/A52pPY5ojIVUiUoW2VTNI6t2T+iDoEw1OGq5mk
	IMrFE5TyFYmmGKkDX2Fp/XXDQoQxAHEmX3kGVRHCff3SmZ9f0JnwvN6y8QZEaodQuhgROGWvGYXA4
	+SxoDUtw==;
Received: from ip6-localhost ([::1]:58378 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1raKgi-008U0R-LA; Wed, 14 Feb 2024 19:12:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19048) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1raKgd-008U0K-Tp
 for samba-technical@lists.samba.org; Wed, 14 Feb 2024 19:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=pU7D3Wt88ZV5AW1pMWHHmBZmUjzJ6pS3WxwYPxY2Pgs=; b=J0eY46g9XsmLYsN9t1R0+6vExZ
 ggubXU5fJXoseEtmOO6ps8GhwXtc9sYcRvdzJJzKKhZsLvDlyyhsFeafJCHm0kxrO81PLC4HYcaKS
 V2OECIkFj8dL6xk7bE4IEGCQN8o7+sPywhd/FeytvWSHdiuTwdbDmcH3JEXyfT1pnpZdYTXzWurEN
 3UgKyvBNfrPUdYP2+VtUiJr3T+I/XMVhWFqaslBJMfKTyb63rxrfuVJcR71EGTABmAjbGC2C85EPE
 uIK7koiF9MsptH4uM/h0pmvVuYfTM0XwNEkv7+vMWIB/IdZlpK1U0CZcUanF28X1vB/ySxlQQijmk
 42d7Y4TnzYfDA17TjmW+0O/Ly54sDOoifr37rSIg2CKtBEQ7TAM3NvOBwalqnjzs5+Hoswy52CXBA
 qrGHaRHykPMR8DPZ5SgkJNSI9q8bCzwzD96ck2F/DGYVjm1ONwJZJnliZ4JiJ3BbsIj2JvKPslwsl
 58wSg4ECPMAXN9g3izqnBmVP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1raKgd-00D4l0-15 for samba-technical@lists.samba.org;
 Wed, 14 Feb 2024 19:12:51 +0000
Date: Wed, 14 Feb 2024 19:12:49 +0000
To: samba-technical@lists.samba.org
Subject: Re: Looking to once again re-bundle LDB
Message-ID: <20240214191249.727ce60d@devstation.samdom.example.com>
In-Reply-To: <Zc0LAN08B3wPY8pr@toolbox>
References: <7fb8e63cdc9de2c284cffc792c458df3b017c392.camel@samba.org>
 <2272182.vFx2qVVIhK@magrathea>
 <28b2669c5d1834b15eddbfcda3c976a83def8b92.camel@samba.org>
 <16f5f6dd-cc2e-44e5-acb9-9308768a3e1d@tls.msk.ru>
 <C44D3455-ED69-4750-8E67-6B140B582934@samba.org>
 <372bd541-decd-4c1e-abf2-940833c4cfc9@tls.msk.ru>
 <Zcz2oHdkRyYgJK6E@toolbox>
 <dc921798-03f9-4045-957a-dadedc51993f@tls.msk.ru>
 <Zc0LAN08B3wPY8pr@toolbox>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 14 Feb 2024 20:48:32 +0200
Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
wrote:

> On =D0=A1=D1=80=D0=B4, 14 =D0=BB=D1=8E=D1=82 2024, Michael Tokarev via sa=
mba-technical wrote:
> > 14.02.2024 20:21, Alexander Bokovoy via samba-technical:
> > > On =D0=A1=D1=80=D0=B4, 14 =D0=BB=D1=8E=D1=82 2024, Michael Tokarev wr=
ote:
> > > > 14.02.2024 17:46, Alexander Bokovoy wrote:
> > > > ..
> > > > > We do rebuilds of the whole stack in Fedora if bots detect
> > > > > samba ABI had changed. So for us it is not a problem.
> > > >=20
> > > > It's easy to do with "current" Fedora release.  It's entirely
> > > > different question when you want to provide current samba to a
> > > > previous Fedora release.  And that's where the problem is, -
> > > > providing "backports" of current samba to previous releases of
> > > > distributions.
> > >=20
> > > If you are building packages on top of RHEL by replacing existing
> > > packages there, you are responsible in fixing all breakage that
> > > new packages would introduce. It is maintenance work that one
> > > needs to consider when providing alternative builds, regardless
> > > of a distribution.
> >=20
> > Exactly.  Ditto for debian. Even debian backports, while being part
> > of official debian and using debian infrastructure, needs
> > additional work. It is good if a new version does not introduce
> > incompatibilities, - this way it can be provided at less work to
> > previous releases.
> >=20
> > ..
> > > > Yeah, it would be best to build samba against mit krb5, if it
> > > > were a supported way.
> > >=20
> > > It is supported. It just provides a bit different set of features
> > > compared to Heimdal-enabled Samba builds. See our talk at
> > > SambaXP'23 for details.
> >=20
> > I know it works, and it's kind of supported, with
> > --enable-experimental-mitkrb5-kdc or something.
> >=20
> > The thing is: personally I don't have resources to support it by my
> > own in debian. Everything I do there, I do at my "free from work"
> > time, I don't know how all this AD-DC thing work.  After all, my
> > only intention when I come here was to fix a bug in samba form
> > which I suffered in my work (had to restore lots of user profiles
> > lost due to samba data corruption), and am still there because it
> > was not "just flip this one bit and it all works" thing :)  So I
> > entirely rely on upstream samba for almost all support work.  And
> > there, MIT-Krb5 AD-DC is "not supported".  Hence that's what I mean
> > above :)
>=20
> I think that statement of 'not supported' added more damage than
> helped. I hope we can move forward from that by acknowledging there
> are different use cases for Samba AD that involve configurations
> where one or the other Kerberos implementation is better suited. For
> example, not everyone needs read-only domain controllers in all
> environments. Or not everyone even need to use Windows (shocking,
> right?) as domain members. ;)
>=20
> There are still issues at how to present two separate builds in a
> distribution but that's a different story, not an upstream problem. At
> some point we have to bite a bullet and move forward.
>=20

Hi Alexander, I have nothing against using MIT on a Samba, in fact I
would welcome it, but according to this wiki page:

https://wiki.samba.org/index.php/Roadmap_MIT_KDC

These are things that Heimdal does but MIT doesn't:

Add auth logging support
Allow starting the MIT KDC with multiple worker processes
Define API for a libkdc in MIT Kerberos
Running as a Read only domain controller (RODC)
Support for Claims

Now the page was last updated on the 18 July 2023, so some of the above
may now work.

It is my opinion that Samba has enough on its plate trying to get the
Heimdal version to the full 2016 functional level without having to get
the MIT version to the same level.=20

If all the work is done to the MIT version and it comes up to the same
level as the Heimdal version, will RHEL ship a version of Samba that
can be provisioned as an AD DC ? (I think I know the answer to that
one) If this answer is no, then what is the point of carrying out any
work on the MIT version ?

Rowland

