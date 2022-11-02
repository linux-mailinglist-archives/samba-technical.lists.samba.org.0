Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2D9616EEB
	for <lists+samba-technical@lfdr.de>; Wed,  2 Nov 2022 21:41:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=fE2yGw/k7CZ4U1LxXp1joIED7kOJB/AO/sUClKHoI/0=; b=g0qJ1w2bMAPAnOn1GjDeVYD897
	LK1bU5VFNwYgu0EEcV4zHXIfWhIiaEXX9xZcyNR3uW7XYNw2vbybFEfGpirVJitDvihEn6CStoEX/
	qzhIYE0c/CEc9lThjyhYX/2KqV7tFld0nQ7kZ7MI/N0mRj5cnjBFO/GlveBMrt8NZZhtXSmTGrYiQ
	Qaz3VlML/2t39LPydqnoxJly9fMmTsHRhwMu9W5XMazGN5C0kH6mE+lLqNC2QxEFt5AuAT5JKjrbz
	Fp7vWnOb1p9rY8S1CAdBz24ETpklhbn8Wuhi/jNt8L5znJf9VZMKinq1NxUbWz47pxVsCi8VThbzz
	kUn3vTLA==;
Received: from ip6-localhost ([::1]:31340 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oqKY5-00AB7c-Gp; Wed, 02 Nov 2022 20:41:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54928) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oqKY0-00AB7S-EH
 for samba-technical@lists.samba.org; Wed, 02 Nov 2022 20:41:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=q87RRP6fC7KCt4L7rBImUKzefhvctlniICxqSSTylwY=; b=iyHN1z8G0Fv2ErJ+23NDHN4YUe
 QHbz8rt1R80cTgpDSqcZbBOnKbBHSPjaM7MpidqAtC/D0kHQFcgXCeThCabdHKS1yJxJRC4I3Ym3k
 Hf2Gn3Aw9IhVnMdbr1g8Qsl07MuoUesHGo7h8cOBptIxW8Lfe0BWi4meb0ZJXkX2wmGKlnkzSqL44
 xD8Uya6swsEcP4mSQ4jolSzwoHHuCBZ+7wFm/Hm8PYG2466vhNaFyl93znWvNY5pn9fgtgSY8iMOI
 W1pIQUbEZoUAe0rfFmp+uL7d8LJUAUzGhCBeEJlJGLOGGKxs+9IMBQa8YdbIiKr3TtTDCTXB03OJY
 066/3v0YUxUCBvAG22jHdlRoLmPf0zaums5wibvlz3O4Ib3ssVrKD51ecZWmwgG7H5/pDhva8dMVO
 KgJqdit2Q2E0zNL2T0zYCIyYJs7011aUrYmh/3EFT2OTDjiYdqA6449wsqXRbkXvOzr4cG76AyLec
 W+aRuSX7RqCC+9PS5mZu8hSP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oqKXy-006vII-K4; Wed, 02 Nov 2022 20:41:15 +0000
Message-ID: <0939d282f53194402d6615485a7fc97716fc3b7b.camel@samba.org>
Subject: Re: How to push to a non Samba Team member branch on gitlab ?
To: Jeremy Allison <jra@samba.org>, samba-technical@lists.samba.org, 
 metze@samba.org
Date: Thu, 03 Nov 2022 09:41:10 +1300
In-Reply-To: <Y2LR/7ytNMuNPxDV@jeremy-acer>
References: <Y2LRam/bPaaRWRjy@jeremy-acer> <Y2LR/7ytNMuNPxDV@jeremy-acer>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, 2022-11-02 at 13:24 -0700, Jeremy Allison wrote:
> On Wed, Nov 02, 2022 at 01:22:02PM -0700, Jeremy Allison wrote:
> > I'm working with a new contributor here:
> >=20
> > https://gitlab.com/samba-team/samba/-/merge_requests/2741
> >=20
> > and want to push a modified version of their patch
> > that corrects some things to help them work with
> > us here on the Team. Pushing to their branch
> > helps them see what I corrected so is a very
> > desirable thing to do.
> >=20
> > The gitlab page above shows their branch name as:
> >=20
> > vporpo/samba:master
> ...
> > git push gitlab +HEAD:vporpo/samba:master
> >=20
> > fails, as does:
> >=20
> > git push gitlab +HEAD:vporpo:master
>=20
> git push gitlab +HEAD:vporpo/master
>=20
> pushes, but not to MR 2741, so isn't
> desirable :-(.
>=20
> > I can't see any logic or patterns in this, or am I just
> > missing something about git (again).
> >=20
> > Jeremy.

Sadly there isn't a way to change which branch a MR is for, you can
however mention the old MR in the new MR which will trigger a
notification.

This is an unfortunate side-effect of the non-standard way we use
GitLab, as the typical approach is to push back to their branch, as as
it is typical the incantation is learnt earlier in the learning process
(I've given that on the MR).

Andrew Bartlett

--=20
Andrew Bartlett (he/him) https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Developer, Catalyst IT https://catalyst.net.nz/services/samba

