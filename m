Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A41CAB525
	for <lists+samba-technical@lfdr.de>; Fri,  6 Sep 2019 11:52:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=94vTuaE+FRqHha4Xz9lxMsCWZ5zBPsTzNw2TVMP1IsY=; b=5Lrb9sxExY53FJdOXgZbiftcd+
	cmnX/Py5Ws7jtKkucNhSMAaNB7MLQMH3p5O8iwSJEjWBOsTLJ78dBIopWiP+DbNANQplxHPfEbolF
	0g/zEMgjrnu0wByv3YoOZzHLjbpNVuX6+XURINTFXQNuu+kk5szLviz03ntVVEoAkMNDKX6+b7Vdk
	BiUQzxJGAL7d4y1cO6TjnIqbGLpn+aTS+oQFcdk3wXSqIk7osjbcFmJRG8wg8S8rimqpIX+3ENUVv
	gyjG8yU8P1dZm/30XwaqwZVKVfD8Nju4UIDHX39+DAarbN1SnPPxaCyhYanU8XeoI3qy0qCtGVYiu
	6du2Aq3w==;
Received: from localhost ([::1]:18692 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i6AuT-003wND-3y; Fri, 06 Sep 2019 09:52:05 +0000
Received: from mx2.suse.de ([195.135.220.15]:50606 helo=mx1.suse.de) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1i6AuP-003wN5-9c
 for samba-technical@lists.samba.org; Fri, 06 Sep 2019 09:52:03 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0B796AFCF;
 Fri,  6 Sep 2019 09:51:53 +0000 (UTC)
To: P Mairo <akoudanilo@gmail.com>,
 P Mairo via samba-technical <samba-technical@lists.samba.org>
Subject: Re: Insights for the future of smbcmp
In-Reply-To: <CAELK94eRurKj24RLm7Csd88ueJ5K+D8NhnZQ-j7Wt+dJhJLSVA@mail.gmail.com>
References: <CAELK94eRurKj24RLm7Csd88ueJ5K+D8NhnZQ-j7Wt+dJhJLSVA@mail.gmail.com>
Date: Fri, 06 Sep 2019 11:51:51 +0200
Message-ID: <87lfv17nwo.fsf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Warn: EHLO/HELO not verified: Remote host 195.135.220.15 (mx2.suse.de)
 incorrectly presented itself as mx1.suse.de
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
From: =?utf-8?q?Aur=C3=A9lien_Aptel_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?Q?Aur=C3=A9lien?= Aptel <aaptel@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

"P Mairo via samba-technical" <samba-technical@lists.samba.org> writes:
> Hello, I just added a new experimental feature to smbcmp GUI: the ability
> to browse the summaries with a search bar, it's not merged yet but you can
> try it on my branch[1].
> I would also like to know which features interest you in order to impleme=
nt
> it.

Good idea, but I think it is a bit confusing to use at the
moment.

- Hitting return doesn't do anything, I had to click on
  the magnifier to search which was not obvious.
- Once you hit the last result it doesn't loop back to the start.
- If you select something and then search it won't search starting from
  the selection.
- Highlighting the matched part of the summary in the results would be nice.

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, DE
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)

