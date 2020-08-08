Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A66F23F692
	for <lists+samba-technical@lfdr.de>; Sat,  8 Aug 2020 07:43:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=02yHXWhqU7AEPRlgVeqrxgM8kiDbbONNYxHO6z0jpWA=; b=WiNrTqFCRiowmg9TTOVuaxuqIR
	E4+dNtr0AlmQcKmGcdhHERyXBz18yVroAcA3BLFJQSDq/JZk5lJNvlV2GjlfSZR2mUtOM4vvWq6BA
	ZlC0Vy8C6M/1R1XE7JPPghAShKbS+ztkfxsFQwer3PwFBjHxhShiFFlBH+337opAhLqaWdY0296Ga
	TAOpFz8AsKujA3i7T7AKSdJaWn1eSf5TJ7clw+rpRr6yHLXS6Cm1i21V0g+1LFS8CIGrn7EjeJKPM
	DOW0Sz1KM5RnFKRs7iRO733FU6IIZX07yAgbzqFySciXOeW071VsOWwZjKqmIKzGsF64+nBl0aUYX
	T6uoXU1g==;
Received: from localhost ([::1]:45818 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k4Hd0-00CtFk-Uu; Sat, 08 Aug 2020 05:42:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20458) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k4Hct-00CtFd-7u
 for samba-technical@lists.samba.org; Sat, 08 Aug 2020 05:42:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=02yHXWhqU7AEPRlgVeqrxgM8kiDbbONNYxHO6z0jpWA=; b=mJE1XXz/vjkl95vMlfMRm75GCp
 Eph2nYOv2geSgCt4Fs1hUTvDn6nEdsxWGY1x0UBZOnm+vm4AkPemICkytpOUFTnvEXwvizKp3yZae
 /G6tc16x5FQk9DL2vor2wcWgjymTaSV+mVIhZWjPniL9ivSp+fTw3W14S9rnEfg5rzd152IEIIUDN
 pvKb2QhMnz91EiyrgQMSUYBCrPzfd8IVP3bU03e1nrOQRzjM1iVveDLcvX4IH9lr3aP9r1/a0hjOE
 sHt7s0ZAdYevIq8M3IzXfA6SN4rq94AkvNLfaLSJ88ez+aEL52zqqVO3TASuOGfHFXfOtM7EMIlTt
 B8JJap1svq9wN4UBFgzmN6ocPITHmYuO2iNAvVblSUMRbfVXEBZQJme1obtmIw+6gvA/RfIkbdEuz
 X94+eq0HXZ/+DidiYBgRBIaocwh90EkKsmtsUPR3jTy6JLkbmF4uhe0G4/Bk+h4WxvKCawsOxH72u
 5WJ88Tt5suVlDXPQURga4hAh;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k4Hcq-0002Vu-S6; Sat, 08 Aug 2020 05:42:37 +0000
Message-ID: <49aeda74316de6a95d6b27788c67b0735337162e.camel@samba.org>
Subject: Re: Deprecate SMBv1 options and NT4-like domains for Samba 4.13?
To: Andreas Schneider <asn@samba.org>, Jeremy Allison <jra@samba.org>, 
 samba-technical@lists.samba.org
Date: Sat, 08 Aug 2020 17:42:32 +1200
In-Reply-To: <11880659.O9o76ZdvQC@krikkit>
References: <efd53968d989fa5b909d5b23df58b171410970db.camel@samba.org>
 <20200729190254.GA10865@jeremy-acer>
 <b9b6de10f01ad24305ade2a88f3581acec937f8b.camel@samba.org>
 <11880659.O9o76ZdvQC@krikkit>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4 (3.36.4-1.fc32) 
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, 2020-08-08 at 07:19 +0200, Andreas Schneider wrote:
> On Saturday, 8 August 2020 00:42:38 CEST Andrew Bartlett via samba-technical 
> wrote:
> > On Wed, 2020-07-29 at 12:02 -0700, Jeremy Allison via samba-technical
> > 
> > wrote:
> > > On Wed, Jul 01, 2020 at 03:19:19PM +1200, Andrew Bartlett via samba-
> > > 
> > > technical wrote:
> > > > So I present to you this MR:
> > > > 
> > > > https://gitlab.com/samba-team/samba/-/merge_requests/1398
> > > > 
> > > > Parameter
> > > > Name                     Description                Default
> > > > --------------                     -----------                -----
> > > > -
> > > > domain logons                      Deprecated                 no
> > > > raw NTLMv2 auth                    Deprecated                 no
> > > > client plaintext auth              Deprecated                 no
> > > > client NTLMv2 auth                 Deprecated                 yes
> > > > client lanman auth                 Deprecated                 no
> > > > client use spnego                  Deprecated                 yes
> > > > 
> > > > If I get time I also hope to fold the only-used-by-attackers LMv2
> > > > into
> > > > "raw NTLMv2 auth", so we can remove both in 4.14.
> > > 
> > > Sorry for the delay, just catching up on old stuff
> > > in my inbox :-).
> > > 
> > > That looks good to me ! It's really good to start
> > > marking obsolete stuff as, well, obsolete :-).
> > > 
> > > Anyone else got comments ?
> > 
> > Can I get some further consensus here?  I would really like to merge my
> > branch once I add the last required test, but I don't want to blindside
> > anyone.
> 
> I'm fine with deprecating them. But we can't remove them in 4.14. We need more 
> time to communicate that in the Linux Enterprise world so that customers have 
> time to find a solution to migrate too.

Thanks,

Indeed this is deprecation only.

Andrew Bartlett
-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



