Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C2B85534E
	for <lists+samba-technical@lfdr.de>; Wed, 14 Feb 2024 20:39:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=SiMg4JRq/lOUuJoACt9vHV7qJgbTiT/+ObYFVEDSdpU=; b=r5CBm2TaOFmSubV8oMWrl9x84P
	VpTuo9/vu2vaHf0TXvd/cDurUrzMpudNGBxgtSiQIXR6skHGzNXTboqql69AAtw2JfhaXX4D4p/eD
	jzJltkebnfUNJg0QzZ0zZ850SSJfDuD6jdU5xfhtIvy/YpaediOR9wyLLyXFXXsum1kUsUefSRa7Z
	KXo0yXznEYb7ySZPLb/iN4NSDQ4NhX0dA9QBPo4vmLO+a/J/kPNlmwmwtSVNVS6NauZimblS24N0V
	EajP0Uz2jXbXH6cJQaxmus62BpWU9JWhp/Z9fvuOzwf6WPdEotUlnT0SNlc17rMpwqM5oFEhZDPvN
	ixdzf0LA==;
Received: from ip6-localhost ([::1]:56688 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1raL6O-008UNS-QH; Wed, 14 Feb 2024 19:39:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52210) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1raL6J-008UN7-9d
 for samba-technical@lists.samba.org; Wed, 14 Feb 2024 19:39:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=SiMg4JRq/lOUuJoACt9vHV7qJgbTiT/+ObYFVEDSdpU=; b=Cy7Q0DxTY7TLwVz21ZTkvIhBF0
 fsc/cS5LaUhwMPjvR5P3Y5krxssaFGzLA5Z3b8QNQAHsayaDo6RyeNH1iIljbjpe8AkJZkrdSeGA5
 SywynqnL31EQDwXSflQJQCV2vq3u8qMtgp28B5rGJ4s+L2RAKFIvZcFrc+mnd2Vx6F4+1K8O/L5s0
 EdxwLFZeLdI7+RSvNAp4hRaS5yAznPWXnTdD3flArYMUrMkNteKvfCIinRrswSwicqn5lyxpta/75
 ayolTkLf7hKuQateEmZIY1u8M/Yf4F6U9MoLcvfpHjUBOsboGQt4cohWWK6BY6Ov8Gfl4DFokU6fl
 +nb0+rGy/icY+GcJ0qLmQVyXc34dSpoEgaLNCi3I3DP13tQHcJ+KMQ7CWMPZ4RMZVz2HvYaPJgPLz
 kwW0NC8Hg8PUYIyW7Ap19D4KseQsE8pQHLkKsg0DrfIgxMGYjw8qbtOqleD1f2L1iYQQSW1R63dTt
 Dvjl8DtYrSnC7LlBQzoBZxRs;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1raL6I-00D4wn-1f; Wed, 14 Feb 2024 19:39:22 +0000
Date: Wed, 14 Feb 2024 21:39:10 +0200
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Re: Looking to once again re-bundle LDB
Message-ID: <Zc0W3hMABO/gCdvC@toolbox>
References: <7fb8e63cdc9de2c284cffc792c458df3b017c392.camel@samba.org>
 <2272182.vFx2qVVIhK@magrathea>
 <28b2669c5d1834b15eddbfcda3c976a83def8b92.camel@samba.org>
 <16f5f6dd-cc2e-44e5-acb9-9308768a3e1d@tls.msk.ru>
 <C44D3455-ED69-4750-8E67-6B140B582934@samba.org>
 <372bd541-decd-4c1e-abf2-940833c4cfc9@tls.msk.ru>
 <Zcz2oHdkRyYgJK6E@toolbox>
 <dc921798-03f9-4045-957a-dadedc51993f@tls.msk.ru>
 <Zc0LAN08B3wPY8pr@toolbox>
 <20240214191249.727ce60d@devstation.samdom.example.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240214191249.727ce60d@devstation.samdom.example.com>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Срд, 14 лют 2024, Rowland Penny via samba-technical wrote:
> On Wed, 14 Feb 2024 20:48:32 +0200
> Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
> wrote:
> 
> > On Срд, 14 лют 2024, Michael Tokarev via samba-technical wrote:
> > > 14.02.2024 20:21, Alexander Bokovoy via samba-technical:
> > > > On Срд, 14 лют 2024, Michael Tokarev wrote:
> > > > > 14.02.2024 17:46, Alexander Bokovoy wrote:
> > > > > ..
> > > > > > We do rebuilds of the whole stack in Fedora if bots detect
> > > > > > samba ABI had changed. So for us it is not a problem.
> > > > > 
> > > > > It's easy to do with "current" Fedora release.  It's entirely
> > > > > different question when you want to provide current samba to a
> > > > > previous Fedora release.  And that's where the problem is, -
> > > > > providing "backports" of current samba to previous releases of
> > > > > distributions.
> > > > 
> > > > If you are building packages on top of RHEL by replacing existing
> > > > packages there, you are responsible in fixing all breakage that
> > > > new packages would introduce. It is maintenance work that one
> > > > needs to consider when providing alternative builds, regardless
> > > > of a distribution.
> > > 
> > > Exactly.  Ditto for debian. Even debian backports, while being part
> > > of official debian and using debian infrastructure, needs
> > > additional work. It is good if a new version does not introduce
> > > incompatibilities, - this way it can be provided at less work to
> > > previous releases.
> > > 
> > > ..
> > > > > Yeah, it would be best to build samba against mit krb5, if it
> > > > > were a supported way.
> > > > 
> > > > It is supported. It just provides a bit different set of features
> > > > compared to Heimdal-enabled Samba builds. See our talk at
> > > > SambaXP'23 for details.
> > > 
> > > I know it works, and it's kind of supported, with
> > > --enable-experimental-mitkrb5-kdc or something.
> > > 
> > > The thing is: personally I don't have resources to support it by my
> > > own in debian. Everything I do there, I do at my "free from work"
> > > time, I don't know how all this AD-DC thing work.  After all, my
> > > only intention when I come here was to fix a bug in samba form
> > > which I suffered in my work (had to restore lots of user profiles
> > > lost due to samba data corruption), and am still there because it
> > > was not "just flip this one bit and it all works" thing :)  So I
> > > entirely rely on upstream samba for almost all support work.  And
> > > there, MIT-Krb5 AD-DC is "not supported".  Hence that's what I mean
> > > above :)
> > 
> > I think that statement of 'not supported' added more damage than
> > helped. I hope we can move forward from that by acknowledging there
> > are different use cases for Samba AD that involve configurations
> > where one or the other Kerberos implementation is better suited. For
> > example, not everyone needs read-only domain controllers in all
> > environments. Or not everyone even need to use Windows (shocking,
> > right?) as domain members. ;)
> > 
> > There are still issues at how to present two separate builds in a
> > distribution but that's a different story, not an upstream problem. At
> > some point we have to bite a bullet and move forward.
> > 
> 
> Hi Alexander, I have nothing against using MIT on a Samba, in fact I
> would welcome it, but according to this wiki page:
> 
> https://wiki.samba.org/index.php/Roadmap_MIT_KDC
> 
> These are things that Heimdal does but MIT doesn't:
> 
> Add auth logging support
> Allow starting the MIT KDC with multiple worker processes
> Define API for a libkdc in MIT Kerberos
> Running as a Read only domain controller (RODC)
> Support for Claims
> 
> Now the page was last updated on the 18 July 2023, so some of the above
> may now work.

Audit logging is possible on MIT Kerberos side for years, it is not
implemented fully on Samba side. libkdc is needed for RODC support but
is unlikely to come without a serious investment from a party interested
in it. Support for claims needs a small fix on MIT side and a minor
effort on Samba side, it is in our plans.

Overall, it is better to define a focus for the specific use cases and
admit they are being covered by these different implementations.

Samba AD/MIT Kerberos combination is far from being 'unsupported' and
being 'experimental'. What was agressively enforced over mailing lists
as an unsupported claim made more damage than helped, in my opinion.


> It is my opinion that Samba has enough on its plate trying to get the
> Heimdal version to the full 2016 functional level without having to get
> the MIT version to the same level. 
> 
> If all the work is done to the MIT version and it comes up to the same
> level as the Heimdal version, will RHEL ship a version of Samba that
> can be provisioned as an AD DC ? (I think I know the answer to that
> one) If this answer is no, then what is the point of carrying out any
> work on the MIT version ?

In my opinion you are mixing completely different questions (and
possible answers) together for no good reason. This does not help at
all.

As an upstream contributor, I do not see a request for RHEL to ship (or
not) Samba AD as a definitive reason to make (or not) Samba AD/MIT
Kerberos 'supported' or 'unsupported' upstream. I am together with other
fellow developers providing this support already: we do support Samba
AD/MIT Kerberos in Fedora for years. As a major Linux distribution's
package maintainer, I do have enough data to consider a
distribution-wide context for this configuration being useful to be
supported.

Heimdal is missing quite a few other features that make MIT Kerberos
attractive for a distribution wide integration of Kerberos features in a
modern world as well. Granted, most of that is not used or cannot
currently be used directly by Windows and by extension of that might not
be interested for Samba AD consumers willing to integrated with Windows
systems directly. However, it does not mean Samba integration is not
important in a pure Linux world.

Hopefully, I'll be able to show something concrete this year's SambaXP
as well.

-- 
/ Alexander Bokovoy

