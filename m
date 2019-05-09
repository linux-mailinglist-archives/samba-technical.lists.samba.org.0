Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0271018969
	for <lists+samba-technical@lfdr.de>; Thu,  9 May 2019 14:01:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=udnYz41K5kucQ4FxOqZxiMlVp+YMyh7oQqHtodZOcsM=; b=I4mYmWNgrbR/iBEK7gkTLViV8X
	fk6QpcwWWU/epi/e0Qgq/UzVYiyH7q4u14wfujmM5L0SlKoHnErWhIcS0KMKeDVB5zvU2RnLL/ILj
	HvdVyyR/ryEnueGjzB+QcSWaYbzI+eyJnSke8GDoIQLsQuZfdYJCp7WdwjEEqbG7uoifOK9wurLJn
	CBGdjnnfkfWSjSQIVSbedD/+uE++YLCh9kpXaiju8iWsVIid0W07Rcbx6K0Q2dkaZQbvgG3avh8Yq
	I8726WhHStfy3EbuqLqZfff1ClzqtkXtYDpcIaSGa6OBY64agMnLsNH2DPMTmmX9aX7hyA45uSJ3K
	uq+QvApA==;
Received: from localhost ([::1]:47008 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hOhjj-0034ze-Te; Thu, 09 May 2019 12:01:20 +0000
Received: from mx2.suse.de ([195.135.220.15]:44656 helo=mx1.suse.de) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hOhjZ-0034yx-O6
 for samba-technical@lists.samba.org; Thu, 09 May 2019 12:01:14 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 69411AC38;
 Thu,  9 May 2019 12:01:02 +0000 (UTC)
To: David Disseldorp <ddiss@samba.org>,
 Samba Technical <samba-technical@lists.samba.org>
Subject: Re: GSoC 2019: welcome Mairo Rufus
In-Reply-To: <20190509131420.17d98c62@samba.org>
References: <20190509131420.17d98c62@samba.org>
Date: Thu, 09 May 2019 14:01:00 +0200
Message-ID: <87a7fvbzwj.fsf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: =?utf-8?Q?Aur=C3=A9lien?= Aptel via samba-technical
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?Q?Aur=C3=A9lien?= Aptel <aaptel@suse.com>
Cc: P Mairo <akoudanilo@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

David Disseldorp <ddiss@samba.org> writes:
> I'm very pleased to introduce Mairo Rufus, who joins us as a 2019
> Google Summer of Code student. Mairo is assigned the task of
> improving the smbcmp network capture diff utility[1], and will be
> mentored by Aur=C3=A9lien.
> Please make him feel welcome.

Welcome! :)

--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Linux GmbH, Maxfeldstra=C3=9Fe 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 21284 (AG N=C3=BCr=
nberg)

